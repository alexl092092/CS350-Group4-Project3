// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "x86.h"

// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5

#define MAXARGS 10
#define HIST_SIZE 10
#define MAX_CMD_LEN 100

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

struct history {
    char commands[HIST_SIZE][MAX_CMD_LEN];
    int count;
    int start;
};

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    exec(ecmd->argv[0], ecmd->argv);
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;
  
  case REDIR:
    rcmd = (struct redircmd*)cmd;

    close(rcmd->fd);
    int fd = open(rcmd->file, rcmd->mode);
    if (fd < 0) {
        printf(2, "open %s failed\n", rcmd->file);
        exit();
    }

    runcmd(rcmd->cmd);
    break;
 
  case LIST:
    lcmd = (struct listcmd*)cmd;
    
    if(lcmd->left->type == LIST){
    	if(fork1() == 0){
    		runcmd(lcmd->left);
    	}
    	wait();
    }
    
    if(lcmd->left->type == EXEC){
      if(fork1() == 0){
		  struct execcmd *ecmd1 = (struct execcmd*)lcmd->left;
		  if(ecmd1->argv[0] == 0)
		  	exit();
		  exec(ecmd1->argv[0], ecmd1->argv);
		  printf(2, "exec %s failed\n", ecmd->argv[0]);
      }
      wait();
   }
    
    if(lcmd->right->type == LIST){
    	if(fork1() == 0){
    		runcmd(lcmd->right);
    	}
    	wait();
    }
 
    if(lcmd->right->type == EXEC){
	  struct execcmd *ecmd1 = (struct execcmd*)lcmd->right;
	  if(ecmd1->argv[0] == 0)
     	 exit();
      exec(ecmd1->argv[0], ecmd1->argv);
      printf(2, "exec %s failed\n", ecmd->argv[0]);
    }

    if (lcmd->left->type == PIPE) {
      runcmd(lcmd->left);
      runcmd(lcmd->right);
    }
    
    break;

  case PIPE:
  	pcmd = (struct pipecmd*)cmd;
	
	pipe(p);
	
	if(fork1() == 0){
		close(1);
		dup(p[1]);
		close(p[0]);
		close(p[1]);
		runcmd(pcmd->left);
	}
	if(fork1() == 0){
		close(0);
		dup(p[0]);
		close(p[0]);
		close(p[1]);
		runcmd(pcmd->right);
	}
	
	close(p[0]);
	close(p[1]);
	wait();
	wait();
	
	break;
  /*
    pcmd = (struct pipecmd*)cmd;
    int pds[2];
    int pipe_prev = -1;

    while (pcmd) {
      if (pipe(p) < 0) {
        printf(2, "Failed.\n");
        exit();
      }

      if (fork1() == 0) {
        if (pipe_prev != -1) {
          close(0);
          dup(pipe_prev);
          close(pipe_prev);
        }

        if (pcmd->right) {
          close(1);
          dup(pds[1]);
        }

        close(pds[0]);
        close(pds[1]);

        runcmd(pcmd->left);
      }

      close(pds[1]);
      pipe_prev = pds[0];

      pcmd = (struct pipecmd*)pcmd->right;

      while (pipe_prev != -1) {
        wait();
        pipe_prev = -1;
      }
    }
    */

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0){
        runcmd(bcmd->cmd);
    }
    break;
  }
  exit();
}

int
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

// History commands
struct history cmd_history;

void 
init_history() {
  cmd_history.count = 0;
  cmd_history.start = 0;
  memset(cmd_history.commands, 0, sizeof(cmd_history.commands));
}

void
add_to_history(char* cmd) {
    // Check if command starts with "hist "
    int is_hist = 1;
    char *hist_str = "hist ";
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
        if(cmd[i] != hist_str[i]) {
            is_hist = 0;
            break;
        }
    }
    
    if (strlen(cmd) == 0 || (is_hist && !strchr(cmd + 5, '|') && !strchr(cmd + 5, ';'))) {
        return;
    }
    
    char* newline = strchr(cmd, '\n');
    if (newline)
        *newline = 0;
    
    // Calculate position in circular buffer
    int pos = (cmd_history.start + (cmd_history.count % HIST_SIZE)) % HIST_SIZE;
    
    // Copy command to history buffer
    char *src = cmd;
    char *dst = cmd_history.commands[pos];
    int n = MAX_CMD_LEN - 1;
    while(n > 0 && *src) {
        *dst++ = *src++;
        n--;
    }
    *dst = 0;  // Null terminate
    
    // Update count and start index
    cmd_history.count++;
    if (cmd_history.count > HIST_SIZE) {
        cmd_history.start = (cmd_history.start + 1) % HIST_SIZE;
    }
}

// Print command history
void print_history() {
  int num_cmds = cmd_history.count < HIST_SIZE ? cmd_history.count : HIST_SIZE;
  for (int i = 0; i < num_cmds; i++) {
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
    printf(2, "Previous command %d: %s\n", i + 1, cmd_history.commands[pos]);
  }
}

// Get command by number
char* get_command(int n) {
  if (n < 1 || n > HIST_SIZE || n > cmd_history.count) {
    return 0;
  }
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
  return cmd_history.commands[pos];
}

int
handle_hist(char* cmd) {
    int is_hist = 1;
    char *hist_str = "hist ";
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
        if(cmd[i] != hist_str[i]) {
            is_hist = 0;
            break;
        }
    }
    
    if (!is_hist) {
        return 0;
    }
    
    cmd += 5;  // Skip past "hist "
    while (*cmd == ' ') cmd++;
    
    if (strcmp(cmd, "print\n") == 0) {
        print_history();
        return 1;
    }
    
    // Parse number
    int n = atoi(cmd);
    if (n > 0 && n <= HIST_SIZE) {
        char* hist_cmd = get_command(n);
        if (hist_cmd) {
            if (fork1() == 0) {
                runcmd(parsecmd(hist_cmd));
            }
            wait();
            return 1;
        }
    }
    
    printf(2, "Invalid hist command\n");
    return 1;
}

int
main(void)
{
  static char buf[100];
  int fd;

  // Initialize command history
  init_history();

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    // Handle hist command
    if (handle_hist(buf))
      continue;
        
    // Add command to history before executing
    add_to_history(buf);

    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
