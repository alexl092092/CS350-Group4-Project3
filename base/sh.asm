
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    return 1;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Initialize command history
  init_history();
      11:	e8 8a 01 00 00       	call   1a0 <init_history>

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      16:	eb 11                	jmp    29 <main+0x29>
      18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
      1f:	00 
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f fc 00 00 00    	jg     125 <main+0x125>
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 19 18 00 00       	push   $0x1819
      33:	e8 db 12 00 00       	call   1313 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
      3f:	90                   	nop
  printf(2, "$ ");
      40:	83 ec 08             	sub    $0x8,%esp
      43:	68 38 17 00 00       	push   $0x1738
      48:	6a 02                	push   $0x2
      4a:	e8 e1 13 00 00       	call   1430 <printf>
  memset(buf, 0, nbuf);
      4f:	83 c4 0c             	add    $0xc,%esp
      52:	6a 64                	push   $0x64
      54:	6a 00                	push   $0x0
      56:	68 80 23 00 00       	push   $0x2380
      5b:	e8 f0 10 00 00       	call   1150 <memset>
  gets(buf, nbuf);
      60:	58                   	pop    %eax
      61:	5a                   	pop    %edx
      62:	6a 64                	push   $0x64
      64:	68 80 23 00 00       	push   $0x2380
      69:	e8 42 11 00 00       	call   11b0 <gets>
  if(buf[0] == 0) // EOF
      6e:	0f b6 05 80 23 00 00 	movzbl 0x2380,%eax
      75:	83 c4 10             	add    $0x10,%esp
      78:	84 c0                	test   %al,%al
      7a:	0f 84 a0 00 00 00    	je     120 <main+0x120>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      80:	3c 63                	cmp    $0x63,%al
      82:	75 09                	jne    8d <main+0x8d>
      84:	80 3d 81 23 00 00 64 	cmpb   $0x64,0x2381
      8b:	74 43                	je     d0 <main+0xd0>
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    // Handle hist command
    if (handle_hist(buf))
      8d:	83 ec 0c             	sub    $0xc,%esp
      90:	68 80 23 00 00       	push   $0x2380
      95:	e8 76 0e 00 00       	call   f10 <handle_hist>
      9a:	83 c4 10             	add    $0x10,%esp
      9d:	85 c0                	test   %eax,%eax
      9f:	75 9f                	jne    40 <main+0x40>
      continue;
        
    // Add command to history before executing
    add_to_history(buf);
      a1:	83 ec 0c             	sub    $0xc,%esp
      a4:	68 80 23 00 00       	push   $0x2380
      a9:	e8 22 01 00 00       	call   1d0 <add_to_history>
int
fork1(void)
{
  int pid;

  pid = fork();
      ae:	e8 18 12 00 00       	call   12cb <fork>
  if(pid == -1)
      b3:	83 c4 10             	add    $0x10,%esp
      b6:	83 f8 ff             	cmp    $0xffffffff,%eax
      b9:	0f 84 8c 00 00 00    	je     14b <main+0x14b>
    if(fork1() == 0)
      bf:	85 c0                	test   %eax,%eax
      c1:	74 73                	je     136 <main+0x136>
    wait();
      c3:	e8 13 12 00 00       	call   12db <wait>
      c8:	e9 73 ff ff ff       	jmp    40 <main+0x40>
      cd:	8d 76 00             	lea    0x0(%esi),%esi
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      d0:	80 3d 82 23 00 00 20 	cmpb   $0x20,0x2382
      d7:	75 b4                	jne    8d <main+0x8d>
      buf[strlen(buf)-1] = 0;  // chop \n
      d9:	83 ec 0c             	sub    $0xc,%esp
      dc:	68 80 23 00 00       	push   $0x2380
      e1:	e8 3a 10 00 00       	call   1120 <strlen>
      if(chdir(buf+3) < 0)
      e6:	c7 04 24 83 23 00 00 	movl   $0x2383,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ed:	c6 80 7f 23 00 00 00 	movb   $0x0,0x237f(%eax)
      if(chdir(buf+3) < 0)
      f4:	e8 4a 12 00 00       	call   1343 <chdir>
      f9:	83 c4 10             	add    $0x10,%esp
      fc:	85 c0                	test   %eax,%eax
      fe:	0f 89 3c ff ff ff    	jns    40 <main+0x40>
        printf(2, "cannot cd %s\n", buf+3);
     104:	51                   	push   %ecx
     105:	68 83 23 00 00       	push   $0x2383
     10a:	68 21 18 00 00       	push   $0x1821
     10f:	6a 02                	push   $0x2
     111:	e8 1a 13 00 00       	call   1430 <printf>
     116:	83 c4 10             	add    $0x10,%esp
     119:	e9 22 ff ff ff       	jmp    40 <main+0x40>
     11e:	66 90                	xchg   %ax,%ax
  exit();
     120:	e8 ae 11 00 00       	call   12d3 <exit>
      close(fd);
     125:	83 ec 0c             	sub    $0xc,%esp
     128:	50                   	push   %eax
     129:	e8 cd 11 00 00       	call   12fb <close>
      break;
     12e:	83 c4 10             	add    $0x10,%esp
     131:	e9 0a ff ff ff       	jmp    40 <main+0x40>
      runcmd(parsecmd(buf));
     136:	83 ec 0c             	sub    $0xc,%esp
     139:	68 80 23 00 00       	push   $0x2380
     13e:	e8 5d 0d 00 00       	call   ea0 <parsecmd>
     143:	89 04 24             	mov    %eax,(%esp)
     146:	e8 f5 02 00 00       	call   440 <runcmd>
    panic("fork");
     14b:	83 ec 0c             	sub    $0xc,%esp
     14e:	68 5a 17 00 00       	push   $0x175a
     153:	e8 a8 02 00 00       	call   400 <panic>
     158:	66 90                	xchg   %ax,%ax
     15a:	66 90                	xchg   %ax,%ax
     15c:	66 90                	xchg   %ax,%ax
     15e:	66 90                	xchg   %ax,%ax

00000160 <getcmd>:
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	56                   	push   %esi
     164:	53                   	push   %ebx
     165:	8b 5d 08             	mov    0x8(%ebp),%ebx
     168:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     16b:	83 ec 08             	sub    $0x8,%esp
     16e:	68 38 17 00 00       	push   $0x1738
     173:	6a 02                	push   $0x2
     175:	e8 b6 12 00 00       	call   1430 <printf>
  memset(buf, 0, nbuf);
     17a:	83 c4 0c             	add    $0xc,%esp
     17d:	56                   	push   %esi
     17e:	6a 00                	push   $0x0
     180:	53                   	push   %ebx
     181:	e8 ca 0f 00 00       	call   1150 <memset>
  gets(buf, nbuf);
     186:	58                   	pop    %eax
     187:	5a                   	pop    %edx
     188:	56                   	push   %esi
     189:	53                   	push   %ebx
     18a:	e8 21 10 00 00       	call   11b0 <gets>
  if(buf[0] == 0) // EOF
     18f:	83 c4 10             	add    $0x10,%esp
     192:	80 3b 01             	cmpb   $0x1,(%ebx)
     195:	19 c0                	sbb    %eax,%eax
}
     197:	8d 65 f8             	lea    -0x8(%ebp),%esp
     19a:	5b                   	pop    %ebx
     19b:	5e                   	pop    %esi
     19c:	5d                   	pop    %ebp
     19d:	c3                   	ret
     19e:	66 90                	xchg   %ax,%ax

000001a0 <init_history>:
init_history() {
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	83 ec 0c             	sub    $0xc,%esp
  cmd_history.count = 0;
     1a6:	c7 05 68 23 00 00 00 	movl   $0x0,0x2368
     1ad:	00 00 00 
  memset(cmd_history.commands, 0, sizeof(cmd_history.commands));
     1b0:	68 e8 03 00 00       	push   $0x3e8
     1b5:	6a 00                	push   $0x0
     1b7:	68 80 1f 00 00       	push   $0x1f80
  cmd_history.start = 0;
     1bc:	c7 05 6c 23 00 00 00 	movl   $0x0,0x236c
     1c3:	00 00 00 
  memset(cmd_history.commands, 0, sizeof(cmd_history.commands));
     1c6:	e8 85 0f 00 00       	call   1150 <memset>
}
     1cb:	83 c4 10             	add    $0x10,%esp
     1ce:	c9                   	leave
     1cf:	c3                   	ret

000001d0 <add_to_history>:
add_to_history(char* cmd) {
     1d0:	55                   	push   %ebp
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
     1d1:	31 c0                	xor    %eax,%eax
     1d3:	b9 68 00 00 00       	mov    $0x68,%ecx
add_to_history(char* cmd) {
     1d8:	89 e5                	mov    %esp,%ebp
     1da:	56                   	push   %esi
     1db:	53                   	push   %ebx
     1dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
     1df:	eb 1d                	jmp    1fe <add_to_history+0x2e>
     1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if(cmd[i] != hist_str[i]) {
     1e8:	38 ca                	cmp    %cl,%dl
     1ea:	0f 85 00 01 00 00    	jne    2f0 <add_to_history+0x120>
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
     1f0:	0f b6 88 3c 17 00 00 	movzbl 0x173c(%eax),%ecx
     1f7:	83 c0 01             	add    $0x1,%eax
     1fa:	84 c9                	test   %cl,%cl
     1fc:	74 08                	je     206 <add_to_history+0x36>
     1fe:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     202:	84 d2                	test   %dl,%dl
     204:	75 e2                	jne    1e8 <add_to_history+0x18>
    if (strlen(cmd) == 0 || (is_hist && !strchr(cmd + 5, '|') && !strchr(cmd + 5, ';'))) {
     206:	83 ec 0c             	sub    $0xc,%esp
     209:	53                   	push   %ebx
     20a:	e8 11 0f 00 00       	call   1120 <strlen>
     20f:	83 c4 10             	add    $0x10,%esp
     212:	85 c0                	test   %eax,%eax
     214:	0f 84 c5 00 00 00    	je     2df <add_to_history+0x10f>
     21a:	83 ec 08             	sub    $0x8,%esp
     21d:	8d 73 05             	lea    0x5(%ebx),%esi
     220:	6a 7c                	push   $0x7c
     222:	56                   	push   %esi
     223:	e8 48 0f 00 00       	call   1170 <strchr>
     228:	83 c4 10             	add    $0x10,%esp
     22b:	85 c0                	test   %eax,%eax
     22d:	0f 84 dd 00 00 00    	je     310 <add_to_history+0x140>
    char* newline = strchr(cmd, '\n');
     233:	83 ec 08             	sub    $0x8,%esp
     236:	6a 0a                	push   $0xa
     238:	53                   	push   %ebx
     239:	e8 32 0f 00 00       	call   1170 <strchr>
    if (newline)
     23e:	83 c4 10             	add    $0x10,%esp
     241:	85 c0                	test   %eax,%eax
     243:	74 03                	je     248 <add_to_history+0x78>
        *newline = 0;
     245:	c6 00 00             	movb   $0x0,(%eax)
    int pos = (cmd_history.start + (cmd_history.count % HIST_SIZE)) % HIST_SIZE;
     248:	8b 0d 68 23 00 00    	mov    0x2368,%ecx
     24e:	be 67 66 66 66       	mov    $0x66666667,%esi
     253:	89 c8                	mov    %ecx,%eax
     255:	f7 ee                	imul   %esi
     257:	89 c8                	mov    %ecx,%eax
     259:	c1 f8 1f             	sar    $0x1f,%eax
     25c:	c1 fa 02             	sar    $0x2,%edx
     25f:	29 c2                	sub    %eax,%edx
     261:	8d 04 92             	lea    (%edx,%edx,4),%eax
     264:	01 c0                	add    %eax,%eax
     266:	29 c1                	sub    %eax,%ecx
     268:	03 0d 6c 23 00 00    	add    0x236c,%ecx
     26e:	89 c8                	mov    %ecx,%eax
     270:	f7 ee                	imul   %esi
     272:	89 c8                	mov    %ecx,%eax
     274:	c1 f8 1f             	sar    $0x1f,%eax
     277:	c1 fa 02             	sar    $0x2,%edx
     27a:	29 c2                	sub    %eax,%edx
     27c:	8d 04 92             	lea    (%edx,%edx,4),%eax
     27f:	01 c0                	add    %eax,%eax
     281:	29 c1                	sub    %eax,%ecx
    char *dst = cmd_history.commands[pos];
     283:	6b c1 64             	imul   $0x64,%ecx,%eax
     286:	8d 4b 63             	lea    0x63(%ebx),%ecx
     289:	05 80 1f 00 00       	add    $0x1f80,%eax
    while(n > 0 && *src) {
     28e:	eb 0d                	jmp    29d <add_to_history+0xcd>
        *dst++ = *src++;
     290:	83 c3 01             	add    $0x1,%ebx
     293:	83 c0 01             	add    $0x1,%eax
     296:	88 50 ff             	mov    %dl,-0x1(%eax)
    while(n > 0 && *src) {
     299:	39 cb                	cmp    %ecx,%ebx
     29b:	74 07                	je     2a4 <add_to_history+0xd4>
     29d:	0f b6 13             	movzbl (%ebx),%edx
     2a0:	84 d2                	test   %dl,%dl
     2a2:	75 ec                	jne    290 <add_to_history+0xc0>
    *dst = 0;  // Null terminate
     2a4:	c6 00 00             	movb   $0x0,(%eax)
    cmd_history.count++;
     2a7:	a1 68 23 00 00       	mov    0x2368,%eax
     2ac:	83 c0 01             	add    $0x1,%eax
     2af:	a3 68 23 00 00       	mov    %eax,0x2368
    if (cmd_history.count > HIST_SIZE) {
     2b4:	83 f8 0a             	cmp    $0xa,%eax
     2b7:	7e 26                	jle    2df <add_to_history+0x10f>
        cmd_history.start = (cmd_history.start + 1) % HIST_SIZE;
     2b9:	a1 6c 23 00 00       	mov    0x236c,%eax
     2be:	8d 48 01             	lea    0x1(%eax),%ecx
     2c1:	b8 67 66 66 66       	mov    $0x66666667,%eax
     2c6:	f7 e9                	imul   %ecx
     2c8:	89 c8                	mov    %ecx,%eax
     2ca:	c1 f8 1f             	sar    $0x1f,%eax
     2cd:	c1 fa 02             	sar    $0x2,%edx
     2d0:	29 c2                	sub    %eax,%edx
     2d2:	8d 04 92             	lea    (%edx,%edx,4),%eax
     2d5:	01 c0                	add    %eax,%eax
     2d7:	29 c1                	sub    %eax,%ecx
     2d9:	89 0d 6c 23 00 00    	mov    %ecx,0x236c
}
     2df:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2e2:	5b                   	pop    %ebx
     2e3:	5e                   	pop    %esi
     2e4:	5d                   	pop    %ebp
     2e5:	c3                   	ret
     2e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2ed:	00 
     2ee:	66 90                	xchg   %ax,%ax
    if (strlen(cmd) == 0 || (is_hist && !strchr(cmd + 5, '|') && !strchr(cmd + 5, ';'))) {
     2f0:	83 ec 0c             	sub    $0xc,%esp
     2f3:	53                   	push   %ebx
     2f4:	e8 27 0e 00 00       	call   1120 <strlen>
     2f9:	83 c4 10             	add    $0x10,%esp
     2fc:	85 c0                	test   %eax,%eax
     2fe:	0f 85 2f ff ff ff    	jne    233 <add_to_history+0x63>
     304:	eb d9                	jmp    2df <add_to_history+0x10f>
     306:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     30d:	00 
     30e:	66 90                	xchg   %ax,%ax
     310:	83 ec 08             	sub    $0x8,%esp
     313:	6a 3b                	push   $0x3b
     315:	56                   	push   %esi
     316:	e8 55 0e 00 00       	call   1170 <strchr>
     31b:	83 c4 10             	add    $0x10,%esp
     31e:	85 c0                	test   %eax,%eax
     320:	0f 85 0d ff ff ff    	jne    233 <add_to_history+0x63>
     326:	eb b7                	jmp    2df <add_to_history+0x10f>
     328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     32f:	00 

00000330 <print_history>:
void print_history() {
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	57                   	push   %edi
  int num_cmds = cmd_history.count < HIST_SIZE ? cmd_history.count : HIST_SIZE;
     334:	bf 0a 00 00 00       	mov    $0xa,%edi
void print_history() {
     339:	56                   	push   %esi
     33a:	53                   	push   %ebx
     33b:	83 ec 0c             	sub    $0xc,%esp
  int num_cmds = cmd_history.count < HIST_SIZE ? cmd_history.count : HIST_SIZE;
     33e:	a1 68 23 00 00       	mov    0x2368,%eax
     343:	39 f8                	cmp    %edi,%eax
     345:	0f 4e f8             	cmovle %eax,%edi
  for (int i = 0; i < num_cmds; i++) {
     348:	85 c0                	test   %eax,%eax
     34a:	7e 4f                	jle    39b <print_history+0x6b>
     34c:	31 db                	xor    %ebx,%ebx
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
     34e:	be 67 66 66 66       	mov    $0x66666667,%esi
     353:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     358:	8b 0d 6c 23 00 00    	mov    0x236c,%ecx
     35e:	01 f9                	add    %edi,%ecx
     360:	29 d9                	sub    %ebx,%ecx
    printf(2, "Previous command %d: %s\n", i + 1, cmd_history.commands[pos]);
     362:	83 c3 01             	add    $0x1,%ebx
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
     365:	83 e9 01             	sub    $0x1,%ecx
     368:	89 c8                	mov    %ecx,%eax
     36a:	f7 ee                	imul   %esi
     36c:	89 c8                	mov    %ecx,%eax
     36e:	c1 f8 1f             	sar    $0x1f,%eax
     371:	c1 fa 02             	sar    $0x2,%edx
     374:	29 c2                	sub    %eax,%edx
     376:	8d 04 92             	lea    (%edx,%edx,4),%eax
     379:	01 c0                	add    %eax,%eax
     37b:	29 c1                	sub    %eax,%ecx
    printf(2, "Previous command %d: %s\n", i + 1, cmd_history.commands[pos]);
     37d:	6b c9 64             	imul   $0x64,%ecx,%ecx
     380:	81 c1 80 1f 00 00    	add    $0x1f80,%ecx
     386:	51                   	push   %ecx
     387:	53                   	push   %ebx
     388:	68 41 17 00 00       	push   $0x1741
     38d:	6a 02                	push   $0x2
     38f:	e8 9c 10 00 00       	call   1430 <printf>
  for (int i = 0; i < num_cmds; i++) {
     394:	83 c4 10             	add    $0x10,%esp
     397:	39 fb                	cmp    %edi,%ebx
     399:	7c bd                	jl     358 <print_history+0x28>
}
     39b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     39e:	5b                   	pop    %ebx
     39f:	5e                   	pop    %esi
     3a0:	5f                   	pop    %edi
     3a1:	5d                   	pop    %ebp
     3a2:	c3                   	ret
     3a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3aa:	00 
     3ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003b0 <get_command>:
char* get_command(int n) {
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	8b 45 08             	mov    0x8(%ebp),%eax
  if (n < 1 || n > HIST_SIZE || n > cmd_history.count) {
     3b6:	8d 50 ff             	lea    -0x1(%eax),%edx
     3b9:	83 fa 09             	cmp    $0x9,%edx
     3bc:	77 3a                	ja     3f8 <get_command+0x48>
     3be:	8b 0d 68 23 00 00    	mov    0x2368,%ecx
     3c4:	39 c1                	cmp    %eax,%ecx
     3c6:	7c 30                	jl     3f8 <get_command+0x48>
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
     3c8:	03 0d 6c 23 00 00    	add    0x236c,%ecx
}
     3ce:	5d                   	pop    %ebp
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
     3cf:	29 c1                	sub    %eax,%ecx
     3d1:	b8 67 66 66 66       	mov    $0x66666667,%eax
     3d6:	f7 e9                	imul   %ecx
     3d8:	89 c8                	mov    %ecx,%eax
     3da:	c1 f8 1f             	sar    $0x1f,%eax
     3dd:	c1 fa 02             	sar    $0x2,%edx
     3e0:	29 c2                	sub    %eax,%edx
     3e2:	8d 04 92             	lea    (%edx,%edx,4),%eax
     3e5:	01 c0                	add    %eax,%eax
     3e7:	29 c1                	sub    %eax,%ecx
  return cmd_history.commands[pos];
     3e9:	6b c1 64             	imul   $0x64,%ecx,%eax
     3ec:	05 80 1f 00 00       	add    $0x1f80,%eax
}
     3f1:	c3                   	ret
     3f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return 0;
     3f8:	31 c0                	xor    %eax,%eax
}
     3fa:	5d                   	pop    %ebp
     3fb:	c3                   	ret
     3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <panic>:
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     406:	ff 75 08             	push   0x8(%ebp)
     409:	68 56 17 00 00       	push   $0x1756
     40e:	6a 02                	push   $0x2
     410:	e8 1b 10 00 00       	call   1430 <printf>
  exit();
     415:	e8 b9 0e 00 00       	call   12d3 <exit>
     41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <fork1>:
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     426:	e8 a0 0e 00 00       	call   12cb <fork>
  if(pid == -1)
     42b:	83 f8 ff             	cmp    $0xffffffff,%eax
     42e:	74 02                	je     432 <fork1+0x12>
  return pid;
}
     430:	c9                   	leave
     431:	c3                   	ret
    panic("fork");
     432:	83 ec 0c             	sub    $0xc,%esp
     435:	68 5a 17 00 00       	push   $0x175a
     43a:	e8 c1 ff ff ff       	call   400 <panic>
     43f:	90                   	nop

00000440 <runcmd>:
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	56                   	push   %esi
     444:	53                   	push   %ebx
     445:	83 ec 10             	sub    $0x10,%esp
     448:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     44b:	85 db                	test   %ebx,%ebx
     44d:	74 41                	je     490 <runcmd+0x50>
  switch(cmd->type){
     44f:	83 3b 05             	cmpl   $0x5,(%ebx)
     452:	0f 87 35 01 00 00    	ja     58d <runcmd+0x14d>
     458:	8b 03                	mov    (%ebx),%eax
     45a:	ff 24 85 38 18 00 00 	jmp    *0x1838(,%eax,4)
    if(ecmd->argv[0] == 0)
     461:	8b 43 04             	mov    0x4(%ebx),%eax
     464:	85 c0                	test   %eax,%eax
     466:	74 28                	je     490 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     468:	8d 53 04             	lea    0x4(%ebx),%edx
     46b:	51                   	push   %ecx
     46c:	51                   	push   %ecx
     46d:	52                   	push   %edx
     46e:	50                   	push   %eax
     46f:	e8 97 0e 00 00       	call   130b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     474:	83 c4 0c             	add    $0xc,%esp
     477:	ff 73 04             	push   0x4(%ebx)
     47a:	68 66 17 00 00       	push   $0x1766
     47f:	6a 02                	push   $0x2
     481:	e8 aa 0f 00 00       	call   1430 <printf>
    break;
     486:	83 c4 10             	add    $0x10,%esp
     489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
     490:	e8 3e 0e 00 00       	call   12d3 <exit>
     495:	8d 75 f0             	lea    -0x10(%ebp),%esi
      if (pipe(p) < 0) {
     498:	83 ec 0c             	sub    $0xc,%esp
     49b:	56                   	push   %esi
     49c:	e8 42 0e 00 00       	call   12e3 <pipe>
     4a1:	83 c4 10             	add    $0x10,%esp
     4a4:	85 c0                	test   %eax,%eax
     4a6:	0f 88 ee 00 00 00    	js     59a <runcmd+0x15a>
      if (fork1() == 0) {
     4ac:	e8 6f ff ff ff       	call   420 <fork1>
     4b1:	85 c0                	test   %eax,%eax
     4b3:	0f 85 b2 00 00 00    	jne    56b <runcmd+0x12b>
        if (pcmd->right) {
     4b9:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
     4bd:	74 17                	je     4d6 <runcmd+0x96>
          close(1);
     4bf:	83 ec 0c             	sub    $0xc,%esp
     4c2:	6a 01                	push   $0x1
     4c4:	e8 32 0e 00 00       	call   12fb <close>
          dup(pds[1]);
     4c9:	31 c9                	xor    %ecx,%ecx
     4cb:	89 0c 24             	mov    %ecx,(%esp)
     4ce:	e8 78 0e 00 00       	call   134b <dup>
     4d3:	83 c4 10             	add    $0x10,%esp
        close(pds[0]);
     4d6:	83 ec 0c             	sub    $0xc,%esp
     4d9:	6a 00                	push   $0x0
     4db:	e8 1b 0e 00 00       	call   12fb <close>
        close(pds[1]);
     4e0:	31 c0                	xor    %eax,%eax
     4e2:	89 04 24             	mov    %eax,(%esp)
     4e5:	e8 11 0e 00 00       	call   12fb <close>
        runcmd(pcmd->left);
     4ea:	5a                   	pop    %edx
     4eb:	ff 73 04             	push   0x4(%ebx)
     4ee:	e8 4d ff ff ff       	call   440 <runcmd>
    if(lcmd->left->type == LIST){
     4f3:	8b 43 04             	mov    0x4(%ebx),%eax
     4f6:	83 38 04             	cmpl   $0x4,(%eax)
     4f9:	0f 84 3c 01 00 00    	je     63b <runcmd+0x1fb>
    if(lcmd->left->type == EXEC){
     4ff:	83 38 01             	cmpl   $0x1,(%eax)
     502:	0f 84 ee 00 00 00    	je     5f6 <runcmd+0x1b6>
    if(lcmd->right->type == LIST){
     508:	8b 43 08             	mov    0x8(%ebx),%eax
     50b:	83 38 04             	cmpl   $0x4,(%eax)
     50e:	0f 84 41 01 00 00    	je     655 <runcmd+0x215>
    if(lcmd->right->type == EXEC){
     514:	83 38 01             	cmpl   $0x1,(%eax)
     517:	0f 84 a5 00 00 00    	je     5c2 <runcmd+0x182>
    if (lcmd->left->type == PIPE) {
     51d:	8b 43 04             	mov    0x4(%ebx),%eax
     520:	83 38 03             	cmpl   $0x3,(%eax)
     523:	0f 85 67 ff ff ff    	jne    490 <runcmd+0x50>
      runcmd(lcmd->left);
     529:	83 ec 0c             	sub    $0xc,%esp
     52c:	50                   	push   %eax
     52d:	e8 0e ff ff ff       	call   440 <runcmd>
    if(fork1() == 0){
     532:	e8 e9 fe ff ff       	call   420 <fork1>
     537:	85 c0                	test   %eax,%eax
     539:	0f 85 51 ff ff ff    	jne    490 <runcmd+0x50>
     53f:	eb 1f                	jmp    560 <runcmd+0x120>
    close(rcmd->fd);
     541:	83 ec 0c             	sub    $0xc,%esp
     544:	ff 73 14             	push   0x14(%ebx)
     547:	e8 af 0d 00 00       	call   12fb <close>
    int fd = open(rcmd->file, rcmd->mode);
     54c:	58                   	pop    %eax
     54d:	5a                   	pop    %edx
     54e:	ff 73 10             	push   0x10(%ebx)
     551:	ff 73 08             	push   0x8(%ebx)
     554:	e8 ba 0d 00 00       	call   1313 <open>
    if (fd < 0) {
     559:	83 c4 10             	add    $0x10,%esp
     55c:	85 c0                	test   %eax,%eax
     55e:	78 4d                	js     5ad <runcmd+0x16d>
        runcmd(bcmd->cmd);
     560:	83 ec 0c             	sub    $0xc,%esp
     563:	ff 73 04             	push   0x4(%ebx)
     566:	e8 d5 fe ff ff       	call   440 <runcmd>
      close(pds[1]);
     56b:	83 ec 0c             	sub    $0xc,%esp
     56e:	6a 00                	push   $0x0
     570:	e8 86 0d 00 00       	call   12fb <close>
      pcmd = (struct pipecmd*)pcmd->right;
     575:	8b 5b 08             	mov    0x8(%ebx),%ebx
      while (pipe_prev != -1) {
     578:	83 c4 10             	add    $0x10,%esp
        wait();
     57b:	e8 5b 0d 00 00       	call   12db <wait>
    while (pcmd) {
     580:	85 db                	test   %ebx,%ebx
     582:	0f 85 10 ff ff ff    	jne    498 <runcmd+0x58>
     588:	e9 03 ff ff ff       	jmp    490 <runcmd+0x50>
    panic("runcmd");
     58d:	83 ec 0c             	sub    $0xc,%esp
     590:	68 5f 17 00 00       	push   $0x175f
     595:	e8 66 fe ff ff       	call   400 <panic>
        printf(2, "Failed.\n");
     59a:	53                   	push   %ebx
     59b:	53                   	push   %ebx
     59c:	68 86 17 00 00       	push   $0x1786
     5a1:	6a 02                	push   $0x2
     5a3:	e8 88 0e 00 00       	call   1430 <printf>
        exit();
     5a8:	e8 26 0d 00 00       	call   12d3 <exit>
        printf(2, "open %s failed\n", rcmd->file);
     5ad:	56                   	push   %esi
     5ae:	ff 73 08             	push   0x8(%ebx)
     5b1:	68 76 17 00 00       	push   $0x1776
     5b6:	6a 02                	push   $0x2
     5b8:	e8 73 0e 00 00       	call   1430 <printf>
        exit();
     5bd:	e8 11 0d 00 00       	call   12d3 <exit>
	  if(ecmd1->argv[0] == 0)
     5c2:	8b 50 04             	mov    0x4(%eax),%edx
     5c5:	85 d2                	test   %edx,%edx
     5c7:	0f 84 c3 fe ff ff    	je     490 <runcmd+0x50>
      exec(ecmd1->argv[0], ecmd1->argv);
     5cd:	83 c0 04             	add    $0x4,%eax
     5d0:	56                   	push   %esi
     5d1:	56                   	push   %esi
     5d2:	50                   	push   %eax
     5d3:	52                   	push   %edx
     5d4:	e8 32 0d 00 00       	call   130b <exec>
      printf(2, "exec %s failed\n", ecmd->argv[0]);
     5d9:	83 c4 0c             	add    $0xc,%esp
     5dc:	ff 35 04 00 00 00    	push   0x4
     5e2:	68 66 17 00 00       	push   $0x1766
     5e7:	6a 02                	push   $0x2
     5e9:	e8 42 0e 00 00       	call   1430 <printf>
     5ee:	83 c4 10             	add    $0x10,%esp
     5f1:	e9 27 ff ff ff       	jmp    51d <runcmd+0xdd>
      if(fork1() == 0){
     5f6:	e8 25 fe ff ff       	call   420 <fork1>
     5fb:	85 c0                	test   %eax,%eax
     5fd:	75 32                	jne    631 <runcmd+0x1f1>
		  struct execcmd *ecmd1 = (struct execcmd*)lcmd->left;
     5ff:	8b 43 04             	mov    0x4(%ebx),%eax
		  if(ecmd1->argv[0] == 0)
     602:	8b 50 04             	mov    0x4(%eax),%edx
     605:	85 d2                	test   %edx,%edx
     607:	0f 84 83 fe ff ff    	je     490 <runcmd+0x50>
		  exec(ecmd1->argv[0], ecmd1->argv);
     60d:	83 c0 04             	add    $0x4,%eax
     610:	51                   	push   %ecx
     611:	51                   	push   %ecx
     612:	50                   	push   %eax
     613:	52                   	push   %edx
     614:	e8 f2 0c 00 00       	call   130b <exec>
		  printf(2, "exec %s failed\n", ecmd->argv[0]);
     619:	83 c4 0c             	add    $0xc,%esp
     61c:	ff 35 04 00 00 00    	push   0x4
     622:	68 66 17 00 00       	push   $0x1766
     627:	6a 02                	push   $0x2
     629:	e8 02 0e 00 00       	call   1430 <printf>
     62e:	83 c4 10             	add    $0x10,%esp
      wait();
     631:	e8 a5 0c 00 00       	call   12db <wait>
     636:	e9 cd fe ff ff       	jmp    508 <runcmd+0xc8>
    	if(fork1() == 0){
     63b:	e8 e0 fd ff ff       	call   420 <fork1>
     640:	85 c0                	test   %eax,%eax
     642:	0f 84 18 ff ff ff    	je     560 <runcmd+0x120>
    	wait();
     648:	e8 8e 0c 00 00       	call   12db <wait>
     64d:	8b 43 04             	mov    0x4(%ebx),%eax
     650:	e9 aa fe ff ff       	jmp    4ff <runcmd+0xbf>
    	if(fork1() == 0){
     655:	e8 c6 fd ff ff       	call   420 <fork1>
     65a:	85 c0                	test   %eax,%eax
     65c:	74 0d                	je     66b <runcmd+0x22b>
    	wait();
     65e:	e8 78 0c 00 00       	call   12db <wait>
     663:	8b 43 08             	mov    0x8(%ebx),%eax
     666:	e9 a9 fe ff ff       	jmp    514 <runcmd+0xd4>
    		runcmd(lcmd->right);
     66b:	83 ec 0c             	sub    $0xc,%esp
     66e:	ff 73 08             	push   0x8(%ebx)
     671:	e8 ca fd ff ff       	call   440 <runcmd>
     676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     67d:	00 
     67e:	66 90                	xchg   %ax,%ax

00000680 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     680:	55                   	push   %ebp
     681:	89 e5                	mov    %esp,%ebp
     683:	53                   	push   %ebx
     684:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     687:	6a 54                	push   $0x54
     689:	e8 c2 0f 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     68e:	83 c4 0c             	add    $0xc,%esp
     691:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     693:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     695:	6a 00                	push   $0x0
     697:	50                   	push   %eax
     698:	e8 b3 0a 00 00       	call   1150 <memset>
  cmd->type = EXEC;
     69d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     6a3:	89 d8                	mov    %ebx,%eax
     6a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6a8:	c9                   	leave
     6a9:	c3                   	ret
     6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006b0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     6b0:	55                   	push   %ebp
     6b1:	89 e5                	mov    %esp,%ebp
     6b3:	53                   	push   %ebx
     6b4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6b7:	6a 18                	push   $0x18
     6b9:	e8 92 0f 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6be:	83 c4 0c             	add    $0xc,%esp
     6c1:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6c5:	6a 00                	push   $0x0
     6c7:	50                   	push   %eax
     6c8:	e8 83 0a 00 00       	call   1150 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     6cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     6d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     6d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     6d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     6dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     6df:	8b 45 10             	mov    0x10(%ebp),%eax
     6e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     6e5:	8b 45 14             	mov    0x14(%ebp),%eax
     6e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     6eb:	8b 45 18             	mov    0x18(%ebp),%eax
     6ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     6f1:	89 d8                	mov    %ebx,%eax
     6f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6f6:	c9                   	leave
     6f7:	c3                   	ret
     6f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     6ff:	00 

00000700 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     700:	55                   	push   %ebp
     701:	89 e5                	mov    %esp,%ebp
     703:	53                   	push   %ebx
     704:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     707:	6a 0c                	push   $0xc
     709:	e8 42 0f 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     70e:	83 c4 0c             	add    $0xc,%esp
     711:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     713:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     715:	6a 00                	push   $0x0
     717:	50                   	push   %eax
     718:	e8 33 0a 00 00       	call   1150 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     71d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     720:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     726:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     729:	8b 45 0c             	mov    0xc(%ebp),%eax
     72c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     72f:	89 d8                	mov    %ebx,%eax
     731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     734:	c9                   	leave
     735:	c3                   	ret
     736:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     73d:	00 
     73e:	66 90                	xchg   %ax,%ax

00000740 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	53                   	push   %ebx
     744:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     747:	6a 0c                	push   $0xc
     749:	e8 02 0f 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     74e:	83 c4 0c             	add    $0xc,%esp
     751:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     753:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     755:	6a 00                	push   $0x0
     757:	50                   	push   %eax
     758:	e8 f3 09 00 00       	call   1150 <memset>
  cmd->type = LIST;
  cmd->left = left;
     75d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     760:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     766:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     769:	8b 45 0c             	mov    0xc(%ebp),%eax
     76c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     76f:	89 d8                	mov    %ebx,%eax
     771:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     774:	c9                   	leave
     775:	c3                   	ret
     776:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     77d:	00 
     77e:	66 90                	xchg   %ax,%ax

00000780 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	53                   	push   %ebx
     784:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     787:	6a 08                	push   $0x8
     789:	e8 c2 0e 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     78e:	83 c4 0c             	add    $0xc,%esp
     791:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     793:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     795:	6a 00                	push   $0x0
     797:	50                   	push   %eax
     798:	e8 b3 09 00 00       	call   1150 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     79d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     7a0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     7a6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     7a9:	89 d8                	mov    %ebx,%eax
     7ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     7ae:	c9                   	leave
     7af:	c3                   	ret

000007b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     7b9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     7bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     7bf:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     7c2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     7c4:	39 df                	cmp    %ebx,%edi
     7c6:	72 0f                	jb     7d7 <gettoken+0x27>
     7c8:	eb 25                	jmp    7ef <gettoken+0x3f>
     7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     7d0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     7d3:	39 fb                	cmp    %edi,%ebx
     7d5:	74 18                	je     7ef <gettoken+0x3f>
     7d7:	0f be 07             	movsbl (%edi),%eax
     7da:	83 ec 08             	sub    $0x8,%esp
     7dd:	50                   	push   %eax
     7de:	68 78 1f 00 00       	push   $0x1f78
     7e3:	e8 88 09 00 00       	call   1170 <strchr>
     7e8:	83 c4 10             	add    $0x10,%esp
     7eb:	85 c0                	test   %eax,%eax
     7ed:	75 e1                	jne    7d0 <gettoken+0x20>
  if(q)
     7ef:	85 f6                	test   %esi,%esi
     7f1:	74 02                	je     7f5 <gettoken+0x45>
    *q = s;
     7f3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     7f5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     7f8:	3c 3c                	cmp    $0x3c,%al
     7fa:	0f 8f c8 00 00 00    	jg     8c8 <gettoken+0x118>
     800:	3c 3a                	cmp    $0x3a,%al
     802:	7f 5a                	jg     85e <gettoken+0xae>
     804:	84 c0                	test   %al,%al
     806:	75 48                	jne    850 <gettoken+0xa0>
     808:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     80a:	8b 4d 14             	mov    0x14(%ebp),%ecx
     80d:	85 c9                	test   %ecx,%ecx
     80f:	74 05                	je     816 <gettoken+0x66>
    *eq = s;
     811:	8b 45 14             	mov    0x14(%ebp),%eax
     814:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     816:	39 df                	cmp    %ebx,%edi
     818:	72 0d                	jb     827 <gettoken+0x77>
     81a:	eb 23                	jmp    83f <gettoken+0x8f>
     81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     820:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     823:	39 fb                	cmp    %edi,%ebx
     825:	74 18                	je     83f <gettoken+0x8f>
     827:	0f be 07             	movsbl (%edi),%eax
     82a:	83 ec 08             	sub    $0x8,%esp
     82d:	50                   	push   %eax
     82e:	68 78 1f 00 00       	push   $0x1f78
     833:	e8 38 09 00 00       	call   1170 <strchr>
     838:	83 c4 10             	add    $0x10,%esp
     83b:	85 c0                	test   %eax,%eax
     83d:	75 e1                	jne    820 <gettoken+0x70>
  *ps = s;
     83f:	8b 45 08             	mov    0x8(%ebp),%eax
     842:	89 38                	mov    %edi,(%eax)
  return ret;
}
     844:	8d 65 f4             	lea    -0xc(%ebp),%esp
     847:	89 f0                	mov    %esi,%eax
     849:	5b                   	pop    %ebx
     84a:	5e                   	pop    %esi
     84b:	5f                   	pop    %edi
     84c:	5d                   	pop    %ebp
     84d:	c3                   	ret
     84e:	66 90                	xchg   %ax,%ax
  switch(*s){
     850:	78 22                	js     874 <gettoken+0xc4>
     852:	3c 26                	cmp    $0x26,%al
     854:	74 08                	je     85e <gettoken+0xae>
     856:	8d 48 d8             	lea    -0x28(%eax),%ecx
     859:	80 f9 01             	cmp    $0x1,%cl
     85c:	77 16                	ja     874 <gettoken+0xc4>
  ret = *s;
     85e:	0f be f0             	movsbl %al,%esi
    s++;
     861:	83 c7 01             	add    $0x1,%edi
    break;
     864:	eb a4                	jmp    80a <gettoken+0x5a>
     866:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     86d:	00 
     86e:	66 90                	xchg   %ax,%ax
  switch(*s){
     870:	3c 7c                	cmp    $0x7c,%al
     872:	74 ea                	je     85e <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     874:	39 df                	cmp    %ebx,%edi
     876:	72 27                	jb     89f <gettoken+0xef>
     878:	e9 87 00 00 00       	jmp    904 <gettoken+0x154>
     87d:	8d 76 00             	lea    0x0(%esi),%esi
     880:	0f be 07             	movsbl (%edi),%eax
     883:	83 ec 08             	sub    $0x8,%esp
     886:	50                   	push   %eax
     887:	68 70 1f 00 00       	push   $0x1f70
     88c:	e8 df 08 00 00       	call   1170 <strchr>
     891:	83 c4 10             	add    $0x10,%esp
     894:	85 c0                	test   %eax,%eax
     896:	75 1f                	jne    8b7 <gettoken+0x107>
      s++;
     898:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     89b:	39 fb                	cmp    %edi,%ebx
     89d:	74 4d                	je     8ec <gettoken+0x13c>
     89f:	0f be 07             	movsbl (%edi),%eax
     8a2:	83 ec 08             	sub    $0x8,%esp
     8a5:	50                   	push   %eax
     8a6:	68 78 1f 00 00       	push   $0x1f78
     8ab:	e8 c0 08 00 00       	call   1170 <strchr>
     8b0:	83 c4 10             	add    $0x10,%esp
     8b3:	85 c0                	test   %eax,%eax
     8b5:	74 c9                	je     880 <gettoken+0xd0>
    ret = 'a';
     8b7:	be 61 00 00 00       	mov    $0x61,%esi
     8bc:	e9 49 ff ff ff       	jmp    80a <gettoken+0x5a>
     8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     8c8:	3c 3e                	cmp    $0x3e,%al
     8ca:	75 a4                	jne    870 <gettoken+0xc0>
    if(*s == '>'){
     8cc:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     8d0:	74 0d                	je     8df <gettoken+0x12f>
    s++;
     8d2:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     8d5:	be 3e 00 00 00       	mov    $0x3e,%esi
     8da:	e9 2b ff ff ff       	jmp    80a <gettoken+0x5a>
      s++;
     8df:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     8e2:	be 2b 00 00 00       	mov    $0x2b,%esi
     8e7:	e9 1e ff ff ff       	jmp    80a <gettoken+0x5a>
  if(eq)
     8ec:	8b 45 14             	mov    0x14(%ebp),%eax
     8ef:	85 c0                	test   %eax,%eax
     8f1:	74 05                	je     8f8 <gettoken+0x148>
    *eq = s;
     8f3:	8b 45 14             	mov    0x14(%ebp),%eax
     8f6:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     8f8:	89 df                	mov    %ebx,%edi
    ret = 'a';
     8fa:	be 61 00 00 00       	mov    $0x61,%esi
     8ff:	e9 3b ff ff ff       	jmp    83f <gettoken+0x8f>
  if(eq)
     904:	8b 55 14             	mov    0x14(%ebp),%edx
     907:	85 d2                	test   %edx,%edx
     909:	74 ef                	je     8fa <gettoken+0x14a>
    *eq = s;
     90b:	8b 45 14             	mov    0x14(%ebp),%eax
     90e:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     910:	eb e8                	jmp    8fa <gettoken+0x14a>
     912:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     919:	00 
     91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000920 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	57                   	push   %edi
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	83 ec 0c             	sub    $0xc,%esp
     929:	8b 7d 08             	mov    0x8(%ebp),%edi
     92c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     92f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     931:	39 f3                	cmp    %esi,%ebx
     933:	72 12                	jb     947 <peek+0x27>
     935:	eb 28                	jmp    95f <peek+0x3f>
     937:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     93e:	00 
     93f:	90                   	nop
    s++;
     940:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     943:	39 de                	cmp    %ebx,%esi
     945:	74 18                	je     95f <peek+0x3f>
     947:	0f be 03             	movsbl (%ebx),%eax
     94a:	83 ec 08             	sub    $0x8,%esp
     94d:	50                   	push   %eax
     94e:	68 78 1f 00 00       	push   $0x1f78
     953:	e8 18 08 00 00       	call   1170 <strchr>
     958:	83 c4 10             	add    $0x10,%esp
     95b:	85 c0                	test   %eax,%eax
     95d:	75 e1                	jne    940 <peek+0x20>
  *ps = s;
     95f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     961:	0f be 03             	movsbl (%ebx),%eax
     964:	31 d2                	xor    %edx,%edx
     966:	84 c0                	test   %al,%al
     968:	75 0e                	jne    978 <peek+0x58>
}
     96a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     96d:	89 d0                	mov    %edx,%eax
     96f:	5b                   	pop    %ebx
     970:	5e                   	pop    %esi
     971:	5f                   	pop    %edi
     972:	5d                   	pop    %ebp
     973:	c3                   	ret
     974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     978:	83 ec 08             	sub    $0x8,%esp
     97b:	50                   	push   %eax
     97c:	ff 75 10             	push   0x10(%ebp)
     97f:	e8 ec 07 00 00       	call   1170 <strchr>
     984:	83 c4 10             	add    $0x10,%esp
     987:	31 d2                	xor    %edx,%edx
     989:	85 c0                	test   %eax,%eax
     98b:	0f 95 c2             	setne  %dl
}
     98e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     991:	5b                   	pop    %ebx
     992:	89 d0                	mov    %edx,%eax
     994:	5e                   	pop    %esi
     995:	5f                   	pop    %edi
     996:	5d                   	pop    %ebp
     997:	c3                   	ret
     998:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     99f:	00 

000009a0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	57                   	push   %edi
     9a4:	56                   	push   %esi
     9a5:	53                   	push   %ebx
     9a6:	83 ec 2c             	sub    $0x2c,%esp
     9a9:	8b 75 0c             	mov    0xc(%ebp),%esi
     9ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     9af:	90                   	nop
     9b0:	83 ec 04             	sub    $0x4,%esp
     9b3:	68 ac 17 00 00       	push   $0x17ac
     9b8:	53                   	push   %ebx
     9b9:	56                   	push   %esi
     9ba:	e8 61 ff ff ff       	call   920 <peek>
     9bf:	83 c4 10             	add    $0x10,%esp
     9c2:	85 c0                	test   %eax,%eax
     9c4:	0f 84 f6 00 00 00    	je     ac0 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     9ca:	6a 00                	push   $0x0
     9cc:	6a 00                	push   $0x0
     9ce:	53                   	push   %ebx
     9cf:	56                   	push   %esi
     9d0:	e8 db fd ff ff       	call   7b0 <gettoken>
     9d5:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     9d7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     9da:	50                   	push   %eax
     9db:	8d 45 e0             	lea    -0x20(%ebp),%eax
     9de:	50                   	push   %eax
     9df:	53                   	push   %ebx
     9e0:	56                   	push   %esi
     9e1:	e8 ca fd ff ff       	call   7b0 <gettoken>
     9e6:	83 c4 20             	add    $0x20,%esp
     9e9:	83 f8 61             	cmp    $0x61,%eax
     9ec:	0f 85 d9 00 00 00    	jne    acb <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     9f2:	83 ff 3c             	cmp    $0x3c,%edi
     9f5:	74 69                	je     a60 <parseredirs+0xc0>
     9f7:	83 ff 3e             	cmp    $0x3e,%edi
     9fa:	74 05                	je     a01 <parseredirs+0x61>
     9fc:	83 ff 2b             	cmp    $0x2b,%edi
     9ff:	75 af                	jne    9b0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     a01:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     a04:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     a07:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     a0a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     a0d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     a10:	6a 18                	push   $0x18
     a12:	e8 39 0c 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a17:	83 c4 0c             	add    $0xc,%esp
     a1a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     a1c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     a1e:	6a 00                	push   $0x0
     a20:	50                   	push   %eax
     a21:	e8 2a 07 00 00       	call   1150 <memset>
  cmd->type = REDIR;
     a26:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     a2c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     a2f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     a32:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     a35:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     a38:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     a3b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     a3e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     a45:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     a48:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     a4f:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     a52:	e9 59 ff ff ff       	jmp    9b0 <parseredirs+0x10>
     a57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a5e:	00 
     a5f:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     a60:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     a63:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     a66:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     a69:	89 55 d0             	mov    %edx,-0x30(%ebp)
     a6c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     a6f:	6a 18                	push   $0x18
     a71:	e8 da 0b 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a76:	83 c4 0c             	add    $0xc,%esp
     a79:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     a7b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     a7d:	6a 00                	push   $0x0
     a7f:	50                   	push   %eax
     a80:	e8 cb 06 00 00       	call   1150 <memset>
  cmd->cmd = subcmd;
     a85:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     a88:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     a8b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     a8e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     a91:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     a97:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     a9a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     a9d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     aa0:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     aa3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     aaa:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     ab1:	e9 fa fe ff ff       	jmp    9b0 <parseredirs+0x10>
     ab6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     abd:	00 
     abe:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     ac0:	8b 45 08             	mov    0x8(%ebp),%eax
     ac3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ac6:	5b                   	pop    %ebx
     ac7:	5e                   	pop    %esi
     ac8:	5f                   	pop    %edi
     ac9:	5d                   	pop    %ebp
     aca:	c3                   	ret
      panic("missing file for redirection");
     acb:	83 ec 0c             	sub    $0xc,%esp
     ace:	68 8f 17 00 00       	push   $0x178f
     ad3:	e8 28 f9 ff ff       	call   400 <panic>
     ad8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     adf:	00 

00000ae0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	57                   	push   %edi
     ae4:	56                   	push   %esi
     ae5:	53                   	push   %ebx
     ae6:	83 ec 30             	sub    $0x30,%esp
     ae9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     aef:	68 af 17 00 00       	push   $0x17af
     af4:	56                   	push   %esi
     af5:	53                   	push   %ebx
     af6:	e8 25 fe ff ff       	call   920 <peek>
     afb:	83 c4 10             	add    $0x10,%esp
     afe:	85 c0                	test   %eax,%eax
     b00:	0f 85 aa 00 00 00    	jne    bb0 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     b06:	83 ec 0c             	sub    $0xc,%esp
     b09:	89 c7                	mov    %eax,%edi
     b0b:	6a 54                	push   $0x54
     b0d:	e8 3e 0b 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     b12:	83 c4 0c             	add    $0xc,%esp
     b15:	6a 54                	push   $0x54
     b17:	6a 00                	push   $0x0
     b19:	89 45 d0             	mov    %eax,-0x30(%ebp)
     b1c:	50                   	push   %eax
     b1d:	e8 2e 06 00 00       	call   1150 <memset>
  cmd->type = EXEC;
     b22:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     b25:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     b28:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     b2e:	56                   	push   %esi
     b2f:	53                   	push   %ebx
     b30:	50                   	push   %eax
     b31:	e8 6a fe ff ff       	call   9a0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     b36:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     b39:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     b3c:	eb 15                	jmp    b53 <parseexec+0x73>
     b3e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     b40:	83 ec 04             	sub    $0x4,%esp
     b43:	56                   	push   %esi
     b44:	53                   	push   %ebx
     b45:	ff 75 d4             	push   -0x2c(%ebp)
     b48:	e8 53 fe ff ff       	call   9a0 <parseredirs>
     b4d:	83 c4 10             	add    $0x10,%esp
     b50:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     b53:	83 ec 04             	sub    $0x4,%esp
     b56:	68 c6 17 00 00       	push   $0x17c6
     b5b:	56                   	push   %esi
     b5c:	53                   	push   %ebx
     b5d:	e8 be fd ff ff       	call   920 <peek>
     b62:	83 c4 10             	add    $0x10,%esp
     b65:	85 c0                	test   %eax,%eax
     b67:	75 5f                	jne    bc8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b69:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b6c:	50                   	push   %eax
     b6d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b70:	50                   	push   %eax
     b71:	56                   	push   %esi
     b72:	53                   	push   %ebx
     b73:	e8 38 fc ff ff       	call   7b0 <gettoken>
     b78:	83 c4 10             	add    $0x10,%esp
     b7b:	85 c0                	test   %eax,%eax
     b7d:	74 49                	je     bc8 <parseexec+0xe8>
    if(tok != 'a')
     b7f:	83 f8 61             	cmp    $0x61,%eax
     b82:	75 62                	jne    be6 <parseexec+0x106>
    cmd->argv[argc] = q;
     b84:	8b 45 e0             	mov    -0x20(%ebp),%eax
     b87:	8b 55 d0             	mov    -0x30(%ebp),%edx
     b8a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     b8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b91:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     b95:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     b98:	83 ff 0a             	cmp    $0xa,%edi
     b9b:	75 a3                	jne    b40 <parseexec+0x60>
      panic("too many args");
     b9d:	83 ec 0c             	sub    $0xc,%esp
     ba0:	68 b8 17 00 00       	push   $0x17b8
     ba5:	e8 56 f8 ff ff       	call   400 <panic>
     baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     bb0:	89 75 0c             	mov    %esi,0xc(%ebp)
     bb3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     bb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bb9:	5b                   	pop    %ebx
     bba:	5e                   	pop    %esi
     bbb:	5f                   	pop    %edi
     bbc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     bbd:	e9 ae 01 00 00       	jmp    d70 <parseblock>
     bc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     bc8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     bcb:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     bd2:	00 
  cmd->eargv[argc] = 0;
     bd3:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     bda:	00 
}
     bdb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     bde:	8d 65 f4             	lea    -0xc(%ebp),%esp
     be1:	5b                   	pop    %ebx
     be2:	5e                   	pop    %esi
     be3:	5f                   	pop    %edi
     be4:	5d                   	pop    %ebp
     be5:	c3                   	ret
      panic("syntax");
     be6:	83 ec 0c             	sub    $0xc,%esp
     be9:	68 b1 17 00 00       	push   $0x17b1
     bee:	e8 0d f8 ff ff       	call   400 <panic>
     bf3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     bfa:	00 
     bfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000c00 <parsepipe>:
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	57                   	push   %edi
     c04:	56                   	push   %esi
     c05:	53                   	push   %ebx
     c06:	83 ec 14             	sub    $0x14,%esp
     c09:	8b 75 08             	mov    0x8(%ebp),%esi
     c0c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     c0f:	57                   	push   %edi
     c10:	56                   	push   %esi
     c11:	e8 ca fe ff ff       	call   ae0 <parseexec>
  if(peek(ps, es, "|")){
     c16:	83 c4 0c             	add    $0xc,%esp
     c19:	68 cb 17 00 00       	push   $0x17cb
  cmd = parseexec(ps, es);
     c1e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     c20:	57                   	push   %edi
     c21:	56                   	push   %esi
     c22:	e8 f9 fc ff ff       	call   920 <peek>
     c27:	83 c4 10             	add    $0x10,%esp
     c2a:	85 c0                	test   %eax,%eax
     c2c:	75 12                	jne    c40 <parsepipe+0x40>
}
     c2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c31:	89 d8                	mov    %ebx,%eax
     c33:	5b                   	pop    %ebx
     c34:	5e                   	pop    %esi
     c35:	5f                   	pop    %edi
     c36:	5d                   	pop    %ebp
     c37:	c3                   	ret
     c38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c3f:	00 
    gettoken(ps, es, 0, 0);
     c40:	6a 00                	push   $0x0
     c42:	6a 00                	push   $0x0
     c44:	57                   	push   %edi
     c45:	56                   	push   %esi
     c46:	e8 65 fb ff ff       	call   7b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     c4b:	58                   	pop    %eax
     c4c:	5a                   	pop    %edx
     c4d:	57                   	push   %edi
     c4e:	56                   	push   %esi
     c4f:	e8 ac ff ff ff       	call   c00 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     c54:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     c5b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     c5d:	e8 ee 09 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     c62:	83 c4 0c             	add    $0xc,%esp
     c65:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     c67:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     c69:	6a 00                	push   $0x0
     c6b:	50                   	push   %eax
     c6c:	e8 df 04 00 00       	call   1150 <memset>
  cmd->left = left;
     c71:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     c74:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     c77:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     c79:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     c7f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     c81:	89 7e 08             	mov    %edi,0x8(%esi)
}
     c84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c87:	5b                   	pop    %ebx
     c88:	5e                   	pop    %esi
     c89:	5f                   	pop    %edi
     c8a:	5d                   	pop    %ebp
     c8b:	c3                   	ret
     c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c90 <parseline>:
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	56                   	push   %esi
     c95:	53                   	push   %ebx
     c96:	83 ec 24             	sub    $0x24,%esp
     c99:	8b 75 08             	mov    0x8(%ebp),%esi
     c9c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     c9f:	57                   	push   %edi
     ca0:	56                   	push   %esi
     ca1:	e8 5a ff ff ff       	call   c00 <parsepipe>
  while(peek(ps, es, "&")){
     ca6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     ca9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     cab:	eb 3b                	jmp    ce8 <parseline+0x58>
     cad:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     cb0:	6a 00                	push   $0x0
     cb2:	6a 00                	push   $0x0
     cb4:	57                   	push   %edi
     cb5:	56                   	push   %esi
     cb6:	e8 f5 fa ff ff       	call   7b0 <gettoken>
  cmd = malloc(sizeof(*cmd));
     cbb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     cc2:	e8 89 09 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     cc7:	83 c4 0c             	add    $0xc,%esp
     cca:	6a 08                	push   $0x8
     ccc:	6a 00                	push   $0x0
     cce:	50                   	push   %eax
     ccf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     cd2:	e8 79 04 00 00       	call   1150 <memset>
  cmd->type = BACK;
     cd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     cda:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     cdd:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     ce3:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     ce6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     ce8:	83 ec 04             	sub    $0x4,%esp
     ceb:	68 cd 17 00 00       	push   $0x17cd
     cf0:	57                   	push   %edi
     cf1:	56                   	push   %esi
     cf2:	e8 29 fc ff ff       	call   920 <peek>
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	85 c0                	test   %eax,%eax
     cfc:	75 b2                	jne    cb0 <parseline+0x20>
  if(peek(ps, es, ";")){
     cfe:	83 ec 04             	sub    $0x4,%esp
     d01:	68 c9 17 00 00       	push   $0x17c9
     d06:	57                   	push   %edi
     d07:	56                   	push   %esi
     d08:	e8 13 fc ff ff       	call   920 <peek>
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	85 c0                	test   %eax,%eax
     d12:	75 0c                	jne    d20 <parseline+0x90>
}
     d14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d17:	89 d8                	mov    %ebx,%eax
     d19:	5b                   	pop    %ebx
     d1a:	5e                   	pop    %esi
     d1b:	5f                   	pop    %edi
     d1c:	5d                   	pop    %ebp
     d1d:	c3                   	ret
     d1e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     d20:	6a 00                	push   $0x0
     d22:	6a 00                	push   $0x0
     d24:	57                   	push   %edi
     d25:	56                   	push   %esi
     d26:	e8 85 fa ff ff       	call   7b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     d2b:	58                   	pop    %eax
     d2c:	5a                   	pop    %edx
     d2d:	57                   	push   %edi
     d2e:	56                   	push   %esi
     d2f:	e8 5c ff ff ff       	call   c90 <parseline>
  cmd = malloc(sizeof(*cmd));
     d34:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     d3b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     d3d:	e8 0e 09 00 00       	call   1650 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     d42:	83 c4 0c             	add    $0xc,%esp
     d45:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     d47:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     d49:	6a 00                	push   $0x0
     d4b:	50                   	push   %eax
     d4c:	e8 ff 03 00 00       	call   1150 <memset>
  cmd->left = left;
     d51:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     d54:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     d57:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     d59:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     d5f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     d61:	89 7e 08             	mov    %edi,0x8(%esi)
}
     d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d67:	5b                   	pop    %ebx
     d68:	5e                   	pop    %esi
     d69:	5f                   	pop    %edi
     d6a:	5d                   	pop    %ebp
     d6b:	c3                   	ret
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d70 <parseblock>:
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 10             	sub    $0x10,%esp
     d79:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d7c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     d7f:	68 af 17 00 00       	push   $0x17af
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	e8 95 fb ff ff       	call   920 <peek>
     d8b:	83 c4 10             	add    $0x10,%esp
     d8e:	85 c0                	test   %eax,%eax
     d90:	74 4a                	je     ddc <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     d92:	6a 00                	push   $0x0
     d94:	6a 00                	push   $0x0
     d96:	56                   	push   %esi
     d97:	53                   	push   %ebx
     d98:	e8 13 fa ff ff       	call   7b0 <gettoken>
  cmd = parseline(ps, es);
     d9d:	58                   	pop    %eax
     d9e:	5a                   	pop    %edx
     d9f:	56                   	push   %esi
     da0:	53                   	push   %ebx
     da1:	e8 ea fe ff ff       	call   c90 <parseline>
  if(!peek(ps, es, ")"))
     da6:	83 c4 0c             	add    $0xc,%esp
     da9:	68 eb 17 00 00       	push   $0x17eb
  cmd = parseline(ps, es);
     dae:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     db0:	56                   	push   %esi
     db1:	53                   	push   %ebx
     db2:	e8 69 fb ff ff       	call   920 <peek>
     db7:	83 c4 10             	add    $0x10,%esp
     dba:	85 c0                	test   %eax,%eax
     dbc:	74 2b                	je     de9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     dbe:	6a 00                	push   $0x0
     dc0:	6a 00                	push   $0x0
     dc2:	56                   	push   %esi
     dc3:	53                   	push   %ebx
     dc4:	e8 e7 f9 ff ff       	call   7b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     dc9:	83 c4 0c             	add    $0xc,%esp
     dcc:	56                   	push   %esi
     dcd:	53                   	push   %ebx
     dce:	57                   	push   %edi
     dcf:	e8 cc fb ff ff       	call   9a0 <parseredirs>
}
     dd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dd7:	5b                   	pop    %ebx
     dd8:	5e                   	pop    %esi
     dd9:	5f                   	pop    %edi
     dda:	5d                   	pop    %ebp
     ddb:	c3                   	ret
    panic("parseblock");
     ddc:	83 ec 0c             	sub    $0xc,%esp
     ddf:	68 cf 17 00 00       	push   $0x17cf
     de4:	e8 17 f6 ff ff       	call   400 <panic>
    panic("syntax - missing )");
     de9:	83 ec 0c             	sub    $0xc,%esp
     dec:	68 da 17 00 00       	push   $0x17da
     df1:	e8 0a f6 ff ff       	call   400 <panic>
     df6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dfd:	00 
     dfe:	66 90                	xchg   %ax,%ax

00000e00 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	53                   	push   %ebx
     e04:	83 ec 04             	sub    $0x4,%esp
     e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e0a:	85 db                	test   %ebx,%ebx
     e0c:	74 29                	je     e37 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     e0e:	83 3b 05             	cmpl   $0x5,(%ebx)
     e11:	77 24                	ja     e37 <nulterminate+0x37>
     e13:	8b 03                	mov    (%ebx),%eax
     e15:	ff 24 85 50 18 00 00 	jmp    *0x1850(,%eax,4)
     e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     e20:	83 ec 0c             	sub    $0xc,%esp
     e23:	ff 73 04             	push   0x4(%ebx)
     e26:	e8 d5 ff ff ff       	call   e00 <nulterminate>
    nulterminate(lcmd->right);
     e2b:	58                   	pop    %eax
     e2c:	ff 73 08             	push   0x8(%ebx)
     e2f:	e8 cc ff ff ff       	call   e00 <nulterminate>
    break;
     e34:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     e37:	89 d8                	mov    %ebx,%eax
     e39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e3c:	c9                   	leave
     e3d:	c3                   	ret
     e3e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     e40:	83 ec 0c             	sub    $0xc,%esp
     e43:	ff 73 04             	push   0x4(%ebx)
     e46:	e8 b5 ff ff ff       	call   e00 <nulterminate>
}
     e4b:	89 d8                	mov    %ebx,%eax
    break;
     e4d:	83 c4 10             	add    $0x10,%esp
}
     e50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e53:	c9                   	leave
     e54:	c3                   	ret
     e55:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     e58:	8b 4b 04             	mov    0x4(%ebx),%ecx
     e5b:	85 c9                	test   %ecx,%ecx
     e5d:	74 d8                	je     e37 <nulterminate+0x37>
     e5f:	8d 43 08             	lea    0x8(%ebx),%eax
     e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     e68:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     e6b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     e6e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     e71:	8b 50 fc             	mov    -0x4(%eax),%edx
     e74:	85 d2                	test   %edx,%edx
     e76:	75 f0                	jne    e68 <nulterminate+0x68>
}
     e78:	89 d8                	mov    %ebx,%eax
     e7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e7d:	c9                   	leave
     e7e:	c3                   	ret
     e7f:	90                   	nop
    nulterminate(rcmd->cmd);
     e80:	83 ec 0c             	sub    $0xc,%esp
     e83:	ff 73 04             	push   0x4(%ebx)
     e86:	e8 75 ff ff ff       	call   e00 <nulterminate>
    *rcmd->efile = 0;
     e8b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     e8e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     e91:	c6 00 00             	movb   $0x0,(%eax)
}
     e94:	89 d8                	mov    %ebx,%eax
     e96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e99:	c9                   	leave
     e9a:	c3                   	ret
     e9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000ea0 <parsecmd>:
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	56                   	push   %esi
  cmd = parseline(&s, es);
     ea5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     ea8:	53                   	push   %ebx
     ea9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     eac:	8b 5d 08             	mov    0x8(%ebp),%ebx
     eaf:	53                   	push   %ebx
     eb0:	e8 6b 02 00 00       	call   1120 <strlen>
  cmd = parseline(&s, es);
     eb5:	59                   	pop    %ecx
     eb6:	5e                   	pop    %esi
  es = s + strlen(s);
     eb7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     eb9:	53                   	push   %ebx
     eba:	57                   	push   %edi
     ebb:	e8 d0 fd ff ff       	call   c90 <parseline>
  peek(&s, es, "");
     ec0:	83 c4 0c             	add    $0xc,%esp
     ec3:	68 8e 17 00 00       	push   $0x178e
  cmd = parseline(&s, es);
     ec8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     eca:	53                   	push   %ebx
     ecb:	57                   	push   %edi
     ecc:	e8 4f fa ff ff       	call   920 <peek>
  if(s != es){
     ed1:	8b 45 08             	mov    0x8(%ebp),%eax
     ed4:	83 c4 10             	add    $0x10,%esp
     ed7:	39 d8                	cmp    %ebx,%eax
     ed9:	75 13                	jne    eee <parsecmd+0x4e>
  nulterminate(cmd);
     edb:	83 ec 0c             	sub    $0xc,%esp
     ede:	56                   	push   %esi
     edf:	e8 1c ff ff ff       	call   e00 <nulterminate>
}
     ee4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ee7:	89 f0                	mov    %esi,%eax
     ee9:	5b                   	pop    %ebx
     eea:	5e                   	pop    %esi
     eeb:	5f                   	pop    %edi
     eec:	5d                   	pop    %ebp
     eed:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     eee:	52                   	push   %edx
     eef:	50                   	push   %eax
     ef0:	68 ed 17 00 00       	push   $0x17ed
     ef5:	6a 02                	push   $0x2
     ef7:	e8 34 05 00 00       	call   1430 <printf>
    panic("syntax");
     efc:	c7 04 24 b1 17 00 00 	movl   $0x17b1,(%esp)
     f03:	e8 f8 f4 ff ff       	call   400 <panic>
     f08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f0f:	00 

00000f10 <handle_hist>:
handle_hist(char* cmd) {
     f10:	55                   	push   %ebp
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
     f11:	31 c0                	xor    %eax,%eax
     f13:	b9 68 00 00 00       	mov    $0x68,%ecx
handle_hist(char* cmd) {
     f18:	89 e5                	mov    %esp,%ebp
     f1a:	57                   	push   %edi
     f1b:	56                   	push   %esi
     f1c:	53                   	push   %ebx
     f1d:	83 ec 0c             	sub    $0xc,%esp
     f20:	8b 75 08             	mov    0x8(%ebp),%esi
     f23:	eb 19                	jmp    f3e <handle_hist+0x2e>
     f25:	8d 76 00             	lea    0x0(%esi),%esi
        if(cmd[i] != hist_str[i]) {
     f28:	38 ca                	cmp    %cl,%dl
     f2a:	0f 85 18 01 00 00    	jne    1048 <handle_hist+0x138>
    for(int i = 0; hist_str[i] != '\0' && cmd[i] != '\0'; i++) {
     f30:	0f b6 88 3c 17 00 00 	movzbl 0x173c(%eax),%ecx
     f37:	83 c0 01             	add    $0x1,%eax
     f3a:	84 c9                	test   %cl,%cl
     f3c:	74 08                	je     f46 <handle_hist+0x36>
     f3e:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
     f42:	84 d2                	test   %dl,%dl
     f44:	75 e2                	jne    f28 <handle_hist+0x18>
    while (*cmd == ' ') cmd++;
     f46:	80 7e 05 20          	cmpb   $0x20,0x5(%esi)
    cmd += 5;  // Skip past "hist "
     f4a:	8d 5e 05             	lea    0x5(%esi),%ebx
    while (*cmd == ' ') cmd++;
     f4d:	75 09                	jne    f58 <handle_hist+0x48>
     f4f:	90                   	nop
     f50:	83 c3 01             	add    $0x1,%ebx
     f53:	80 3b 20             	cmpb   $0x20,(%ebx)
     f56:	74 f8                	je     f50 <handle_hist+0x40>
    if (strcmp(cmd, "print\n") == 0) {
     f58:	83 ec 08             	sub    $0x8,%esp
     f5b:	68 fc 17 00 00       	push   $0x17fc
     f60:	53                   	push   %ebx
     f61:	e8 5a 01 00 00       	call   10c0 <strcmp>
     f66:	83 c4 10             	add    $0x10,%esp
     f69:	89 c7                	mov    %eax,%edi
     f6b:	85 c0                	test   %eax,%eax
     f6d:	74 59                	je     fc8 <handle_hist+0xb8>
    int n = atoi(cmd);
     f6f:	83 ec 0c             	sub    $0xc,%esp
     f72:	53                   	push   %ebx
     f73:	e8 e8 02 00 00       	call   1260 <atoi>
    if (n > 0 && n <= HIST_SIZE) {
     f78:	83 c4 10             	add    $0x10,%esp
    int n = atoi(cmd);
     f7b:	89 c3                	mov    %eax,%ebx
    if (n > 0 && n <= HIST_SIZE) {
     f7d:	8d 40 ff             	lea    -0x1(%eax),%eax
     f80:	83 f8 09             	cmp    $0x9,%eax
     f83:	0f 87 9f 00 00 00    	ja     1028 <handle_hist+0x118>
  if (n < 1 || n > HIST_SIZE || n > cmd_history.count) {
     f89:	8b 3d 68 23 00 00    	mov    0x2368,%edi
     f8f:	39 fb                	cmp    %edi,%ebx
     f91:	0f 8f 91 00 00 00    	jg     1028 <handle_hist+0x118>
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
     f97:	8b 35 6c 23 00 00    	mov    0x236c,%esi
  pid = fork();
     f9d:	e8 29 03 00 00       	call   12cb <fork>
  if(pid == -1)
     fa2:	83 f8 ff             	cmp    $0xffffffff,%eax
     fa5:	0f 84 a7 00 00 00    	je     1052 <handle_hist+0x142>
            if (fork1() == 0) {
     fab:	85 c0                	test   %eax,%eax
     fad:	0f 84 ac 00 00 00    	je     105f <handle_hist+0x14f>
            wait();
     fb3:	e8 23 03 00 00       	call   12db <wait>
        return 0;
     fb8:	b8 01 00 00 00       	mov    $0x1,%eax
}
     fbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc0:	5b                   	pop    %ebx
     fc1:	5e                   	pop    %esi
     fc2:	5f                   	pop    %edi
     fc3:	5d                   	pop    %ebp
     fc4:	c3                   	ret
     fc5:	8d 76 00             	lea    0x0(%esi),%esi
  int num_cmds = cmd_history.count < HIST_SIZE ? cmd_history.count : HIST_SIZE;
     fc8:	a1 68 23 00 00       	mov    0x2368,%eax
     fcd:	bb 0a 00 00 00       	mov    $0xa,%ebx
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
     fd2:	be 67 66 66 66       	mov    $0x66666667,%esi
  int num_cmds = cmd_history.count < HIST_SIZE ? cmd_history.count : HIST_SIZE;
     fd7:	39 d8                	cmp    %ebx,%eax
     fd9:	0f 4e d8             	cmovle %eax,%ebx
  for (int i = 0; i < num_cmds; i++) {
     fdc:	85 c0                	test   %eax,%eax
     fde:	7e 5a                	jle    103a <handle_hist+0x12a>
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
     fe0:	8b 0d 6c 23 00 00    	mov    0x236c,%ecx
     fe6:	01 d9                	add    %ebx,%ecx
     fe8:	29 f9                	sub    %edi,%ecx
    printf(2, "Previous command %d: %s\n", i + 1, cmd_history.commands[pos]);
     fea:	83 c7 01             	add    $0x1,%edi
    int pos = (cmd_history.start + num_cmds - i - 1) % HIST_SIZE;
     fed:	83 e9 01             	sub    $0x1,%ecx
     ff0:	89 c8                	mov    %ecx,%eax
     ff2:	f7 ee                	imul   %esi
     ff4:	89 c8                	mov    %ecx,%eax
     ff6:	c1 f8 1f             	sar    $0x1f,%eax
     ff9:	c1 fa 02             	sar    $0x2,%edx
     ffc:	29 c2                	sub    %eax,%edx
     ffe:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1001:	01 c0                	add    %eax,%eax
    1003:	29 c1                	sub    %eax,%ecx
    printf(2, "Previous command %d: %s\n", i + 1, cmd_history.commands[pos]);
    1005:	6b c9 64             	imul   $0x64,%ecx,%ecx
    1008:	81 c1 80 1f 00 00    	add    $0x1f80,%ecx
    100e:	51                   	push   %ecx
    100f:	57                   	push   %edi
    1010:	68 41 17 00 00       	push   $0x1741
    1015:	6a 02                	push   $0x2
    1017:	e8 14 04 00 00       	call   1430 <printf>
  for (int i = 0; i < num_cmds; i++) {
    101c:	83 c4 10             	add    $0x10,%esp
    101f:	39 fb                	cmp    %edi,%ebx
    1021:	7f bd                	jg     fe0 <handle_hist+0xd0>
    1023:	eb 15                	jmp    103a <handle_hist+0x12a>
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Invalid hist command\n");
    1028:	83 ec 08             	sub    $0x8,%esp
    102b:	68 03 18 00 00       	push   $0x1803
    1030:	6a 02                	push   $0x2
    1032:	e8 f9 03 00 00       	call   1430 <printf>
    return 1;
    1037:	83 c4 10             	add    $0x10,%esp
        return 0;
    103a:	b8 01 00 00 00       	mov    $0x1,%eax
    103f:	e9 79 ff ff ff       	jmp    fbd <handle_hist+0xad>
    1044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    1048:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    104b:	31 c0                	xor    %eax,%eax
}
    104d:	5b                   	pop    %ebx
    104e:	5e                   	pop    %esi
    104f:	5f                   	pop    %edi
    1050:	5d                   	pop    %ebp
    1051:	c3                   	ret
    panic("fork");
    1052:	83 ec 0c             	sub    $0xc,%esp
    1055:	68 5a 17 00 00       	push   $0x175a
    105a:	e8 a1 f3 ff ff       	call   400 <panic>
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
    105f:	8d 04 37             	lea    (%edi,%esi,1),%eax
    1062:	b9 0a 00 00 00       	mov    $0xa,%ecx
                runcmd(parsecmd(hist_cmd));
    1067:	83 ec 0c             	sub    $0xc,%esp
  int pos = (cmd_history.start + cmd_history.count - n) % HIST_SIZE;
    106a:	29 d8                	sub    %ebx,%eax
    106c:	99                   	cltd
    106d:	f7 f9                	idiv   %ecx
  return cmd_history.commands[pos];
    106f:	6b c2 64             	imul   $0x64,%edx,%eax
    1072:	05 80 1f 00 00       	add    $0x1f80,%eax
                runcmd(parsecmd(hist_cmd));
    1077:	50                   	push   %eax
    1078:	e8 23 fe ff ff       	call   ea0 <parsecmd>
    107d:	89 04 24             	mov    %eax,(%esp)
    1080:	e8 bb f3 ff ff       	call   440 <runcmd>
    1085:	66 90                	xchg   %ax,%ax
    1087:	66 90                	xchg   %ax,%ax
    1089:	66 90                	xchg   %ax,%ax
    108b:	66 90                	xchg   %ax,%ax
    108d:	66 90                	xchg   %ax,%ax
    108f:	90                   	nop

00001090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1090:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1091:	31 c0                	xor    %eax,%eax
{
    1093:	89 e5                	mov    %esp,%ebp
    1095:	53                   	push   %ebx
    1096:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1099:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    10a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    10a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    10a7:	83 c0 01             	add    $0x1,%eax
    10aa:	84 d2                	test   %dl,%dl
    10ac:	75 f2                	jne    10a0 <strcpy+0x10>
    ;
  return os;
}
    10ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10b1:	89 c8                	mov    %ecx,%eax
    10b3:	c9                   	leave
    10b4:	c3                   	ret
    10b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10bc:	00 
    10bd:	8d 76 00             	lea    0x0(%esi),%esi

000010c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	53                   	push   %ebx
    10c4:	8b 55 08             	mov    0x8(%ebp),%edx
    10c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ca:	0f b6 02             	movzbl (%edx),%eax
    10cd:	84 c0                	test   %al,%al
    10cf:	75 17                	jne    10e8 <strcmp+0x28>
    10d1:	eb 3a                	jmp    110d <strcmp+0x4d>
    10d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    10d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10dc:	83 c2 01             	add    $0x1,%edx
    10df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10e2:	84 c0                	test   %al,%al
    10e4:	74 1a                	je     1100 <strcmp+0x40>
    10e6:	89 d9                	mov    %ebx,%ecx
    10e8:	0f b6 19             	movzbl (%ecx),%ebx
    10eb:	38 c3                	cmp    %al,%bl
    10ed:	74 e9                	je     10d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10ef:	29 d8                	sub    %ebx,%eax
}
    10f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10f4:	c9                   	leave
    10f5:	c3                   	ret
    10f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10fd:	00 
    10fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
    1100:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1104:	31 c0                	xor    %eax,%eax
    1106:	29 d8                	sub    %ebx,%eax
}
    1108:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    110b:	c9                   	leave
    110c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
    110d:	0f b6 19             	movzbl (%ecx),%ebx
    1110:	31 c0                	xor    %eax,%eax
    1112:	eb db                	jmp    10ef <strcmp+0x2f>
    1114:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    111b:	00 
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001120 <strlen>:

uint
strlen(char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 3a 00             	cmpb   $0x0,(%edx)
    1129:	74 15                	je     1140 <strlen+0x20>
    112b:	31 c0                	xor    %eax,%eax
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c0 01             	add    $0x1,%eax
    1133:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1137:	89 c1                	mov    %eax,%ecx
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	89 c8                	mov    %ecx,%eax
    113d:	5d                   	pop    %ebp
    113e:	c3                   	ret
    113f:	90                   	nop
  for(n = 0; s[n]; n++)
    1140:	31 c9                	xor    %ecx,%ecx
}
    1142:	5d                   	pop    %ebp
    1143:	89 c8                	mov    %ecx,%eax
    1145:	c3                   	ret
    1146:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    114d:	00 
    114e:	66 90                	xchg   %ax,%ax

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1165:	89 d0                	mov    %edx,%eax
    1167:	c9                   	leave
    1168:	c3                   	ret
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
    1176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    117a:	0f b6 10             	movzbl (%eax),%edx
    117d:	84 d2                	test   %dl,%dl
    117f:	75 12                	jne    1193 <strchr+0x23>
    1181:	eb 1d                	jmp    11a0 <strchr+0x30>
    1183:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1188:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    118c:	83 c0 01             	add    $0x1,%eax
    118f:	84 d2                	test   %dl,%dl
    1191:	74 0d                	je     11a0 <strchr+0x30>
    if(*s == c)
    1193:	38 d1                	cmp    %dl,%cl
    1195:	75 f1                	jne    1188 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1197:	5d                   	pop    %ebp
    1198:	c3                   	ret
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    11a0:	31 c0                	xor    %eax,%eax
}
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret
    11a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    11ab:	00 
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
    11b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11b9:	31 db                	xor    %ebx,%ebx
{
    11bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11be:	eb 27                	jmp    11e7 <gets+0x37>
    cc = read(0, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	6a 01                	push   $0x1
    11c5:	56                   	push   %esi
    11c6:	6a 00                	push   $0x0
    11c8:	e8 1e 01 00 00       	call   12eb <read>
    if(cc < 1)
    11cd:	83 c4 10             	add    $0x10,%esp
    11d0:	85 c0                	test   %eax,%eax
    11d2:	7e 1d                	jle    11f1 <gets+0x41>
      break;
    buf[i++] = c;
    11d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11d8:	8b 55 08             	mov    0x8(%ebp),%edx
    11db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11df:	3c 0a                	cmp    $0xa,%al
    11e1:	74 10                	je     11f3 <gets+0x43>
    11e3:	3c 0d                	cmp    $0xd,%al
    11e5:	74 0c                	je     11f3 <gets+0x43>
  for(i=0; i+1 < max; ){
    11e7:	89 df                	mov    %ebx,%edi
    11e9:	83 c3 01             	add    $0x1,%ebx
    11ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11ef:	7c cf                	jl     11c0 <gets+0x10>
    11f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    11fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fd:	5b                   	pop    %ebx
    11fe:	5e                   	pop    %esi
    11ff:	5f                   	pop    %edi
    1200:	5d                   	pop    %ebp
    1201:	c3                   	ret
    1202:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1209:	00 
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001210 <stat>:

int
stat(char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	push   0x8(%ebp)
    121d:	e8 f1 00 00 00       	call   1313 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	push   0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f4 00 00 00       	call   132b <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 ba 00 00 00       	call   12fb <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    125e:	00 
    125f:	90                   	nop

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 02             	movsbl (%edx),%eax
    126a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    126d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1275:	77 1e                	ja     1295 <atoi+0x35>
    1277:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    127e:	00 
    127f:	90                   	nop
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1298:	89 c8                	mov    %ecx,%eax
    129a:	c9                   	leave
    129b:	c3                   	ret
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	8b 45 10             	mov    0x10(%ebp),%eax
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
    12aa:	56                   	push   %esi
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	7e 13                	jle    12c5 <memmove+0x25>
    12b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b4:	89 d7                	mov    %edx,%edi
    12b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12bd:	00 
    12be:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret

000012cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cb:	b8 01 00 00 00       	mov    $0x1,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret

000012d3 <exit>:
SYSCALL(exit)
    12d3:	b8 02 00 00 00       	mov    $0x2,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret

000012db <wait>:
SYSCALL(wait)
    12db:	b8 03 00 00 00       	mov    $0x3,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret

000012e3 <pipe>:
SYSCALL(pipe)
    12e3:	b8 04 00 00 00       	mov    $0x4,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret

000012eb <read>:
SYSCALL(read)
    12eb:	b8 05 00 00 00       	mov    $0x5,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret

000012f3 <write>:
SYSCALL(write)
    12f3:	b8 10 00 00 00       	mov    $0x10,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret

000012fb <close>:
SYSCALL(close)
    12fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret

00001303 <kill>:
SYSCALL(kill)
    1303:	b8 06 00 00 00       	mov    $0x6,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret

0000130b <exec>:
SYSCALL(exec)
    130b:	b8 07 00 00 00       	mov    $0x7,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret

00001313 <open>:
SYSCALL(open)
    1313:	b8 0f 00 00 00       	mov    $0xf,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret

0000131b <mknod>:
SYSCALL(mknod)
    131b:	b8 11 00 00 00       	mov    $0x11,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret

00001323 <unlink>:
SYSCALL(unlink)
    1323:	b8 12 00 00 00       	mov    $0x12,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret

0000132b <fstat>:
SYSCALL(fstat)
    132b:	b8 08 00 00 00       	mov    $0x8,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret

00001333 <link>:
SYSCALL(link)
    1333:	b8 13 00 00 00       	mov    $0x13,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret

0000133b <mkdir>:
SYSCALL(mkdir)
    133b:	b8 14 00 00 00       	mov    $0x14,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret

00001343 <chdir>:
SYSCALL(chdir)
    1343:	b8 09 00 00 00       	mov    $0x9,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret

0000134b <dup>:
SYSCALL(dup)
    134b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret

00001353 <getpid>:
SYSCALL(getpid)
    1353:	b8 0b 00 00 00       	mov    $0xb,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret

0000135b <sbrk>:
SYSCALL(sbrk)
    135b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret

00001363 <sleep>:
SYSCALL(sleep)
    1363:	b8 0d 00 00 00       	mov    $0xd,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret

0000136b <uptime>:
SYSCALL(uptime)
    136b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret

00001373 <shutdown>:
SYSCALL(shutdown)
    1373:	b8 16 00 00 00       	mov    $0x16,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret

0000137b <cps>:
SYSCALL(cps)
    137b:	b8 17 00 00 00       	mov    $0x17,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret

00001383 <chpr>:
SYSCALL(chpr)
    1383:	b8 18 00 00 00       	mov    $0x18,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1398:	89 d1                	mov    %edx,%ecx
{
    139a:	83 ec 3c             	sub    $0x3c,%esp
    139d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    13a0:	85 d2                	test   %edx,%edx
    13a2:	0f 89 80 00 00 00    	jns    1428 <printint+0x98>
    13a8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13ac:	74 7a                	je     1428 <printint+0x98>
    x = -xx;
    13ae:	f7 d9                	neg    %ecx
    neg = 1;
    13b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    13b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    13b8:	31 f6                	xor    %esi,%esi
    13ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13c0:	89 c8                	mov    %ecx,%eax
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	89 f7                	mov    %esi,%edi
    13c6:	f7 f3                	div    %ebx
    13c8:	8d 76 01             	lea    0x1(%esi),%esi
    13cb:	0f b6 92 c0 18 00 00 	movzbl 0x18c0(%edx),%edx
    13d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    13d6:	89 ca                	mov    %ecx,%edx
    13d8:	89 c1                	mov    %eax,%ecx
    13da:	39 da                	cmp    %ebx,%edx
    13dc:	73 e2                	jae    13c0 <printint+0x30>
  if(neg)
    13de:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13e1:	85 c0                	test   %eax,%eax
    13e3:	74 07                	je     13ec <printint+0x5c>
    buf[i++] = '-';
    13e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    13ea:	89 f7                	mov    %esi,%edi
    13ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    13ef:	8b 75 c0             	mov    -0x40(%ebp),%esi
    13f2:	01 df                	add    %ebx,%edi
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    13f8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    13fb:	83 ec 04             	sub    $0x4,%esp
    13fe:	88 45 d7             	mov    %al,-0x29(%ebp)
    1401:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1404:	6a 01                	push   $0x1
    1406:	50                   	push   %eax
    1407:	56                   	push   %esi
    1408:	e8 e6 fe ff ff       	call   12f3 <write>
  while(--i >= 0)
    140d:	89 f8                	mov    %edi,%eax
    140f:	83 c4 10             	add    $0x10,%esp
    1412:	83 ef 01             	sub    $0x1,%edi
    1415:	39 c3                	cmp    %eax,%ebx
    1417:	75 df                	jne    13f8 <printint+0x68>
}
    1419:	8d 65 f4             	lea    -0xc(%ebp),%esp
    141c:	5b                   	pop    %ebx
    141d:	5e                   	pop    %esi
    141e:	5f                   	pop    %edi
    141f:	5d                   	pop    %ebp
    1420:	c3                   	ret
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1428:	31 c0                	xor    %eax,%eax
    142a:	eb 89                	jmp    13b5 <printint+0x25>
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1439:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    143c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    143f:	0f b6 1e             	movzbl (%esi),%ebx
    1442:	83 c6 01             	add    $0x1,%esi
    1445:	84 db                	test   %bl,%bl
    1447:	74 67                	je     14b0 <printf+0x80>
    1449:	8d 4d 10             	lea    0x10(%ebp),%ecx
    144c:	31 d2                	xor    %edx,%edx
    144e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1451:	eb 34                	jmp    1487 <printf+0x57>
    1453:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1458:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    145b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1460:	83 f8 25             	cmp    $0x25,%eax
    1463:	74 18                	je     147d <printf+0x4d>
  write(fd, &c, 1);
    1465:	83 ec 04             	sub    $0x4,%esp
    1468:	8d 45 e7             	lea    -0x19(%ebp),%eax
    146b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    146e:	6a 01                	push   $0x1
    1470:	50                   	push   %eax
    1471:	57                   	push   %edi
    1472:	e8 7c fe ff ff       	call   12f3 <write>
    1477:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    147a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    147d:	0f b6 1e             	movzbl (%esi),%ebx
    1480:	83 c6 01             	add    $0x1,%esi
    1483:	84 db                	test   %bl,%bl
    1485:	74 29                	je     14b0 <printf+0x80>
    c = fmt[i] & 0xff;
    1487:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    148a:	85 d2                	test   %edx,%edx
    148c:	74 ca                	je     1458 <printf+0x28>
      }
    } else if(state == '%'){
    148e:	83 fa 25             	cmp    $0x25,%edx
    1491:	75 ea                	jne    147d <printf+0x4d>
      if(c == 'd'){
    1493:	83 f8 25             	cmp    $0x25,%eax
    1496:	0f 84 04 01 00 00    	je     15a0 <printf+0x170>
    149c:	83 e8 63             	sub    $0x63,%eax
    149f:	83 f8 15             	cmp    $0x15,%eax
    14a2:	77 1c                	ja     14c0 <printf+0x90>
    14a4:	ff 24 85 68 18 00 00 	jmp    *0x1868(,%eax,4)
    14ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b3:	5b                   	pop    %ebx
    14b4:	5e                   	pop    %esi
    14b5:	5f                   	pop    %edi
    14b6:	5d                   	pop    %ebp
    14b7:	c3                   	ret
    14b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    14bf:	00 
  write(fd, &c, 1);
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    14c6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14ca:	6a 01                	push   $0x1
    14cc:	52                   	push   %edx
    14cd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    14d0:	57                   	push   %edi
    14d1:	e8 1d fe ff ff       	call   12f3 <write>
    14d6:	83 c4 0c             	add    $0xc,%esp
    14d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    14dc:	6a 01                	push   $0x1
    14de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14e1:	52                   	push   %edx
    14e2:	57                   	push   %edi
    14e3:	e8 0b fe ff ff       	call   12f3 <write>
        putc(fd, c);
    14e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14eb:	31 d2                	xor    %edx,%edx
    14ed:	eb 8e                	jmp    147d <printf+0x4d>
    14ef:	90                   	nop
        printint(fd, *ap, 16, 0);
    14f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14f3:	83 ec 0c             	sub    $0xc,%esp
    14f6:	b9 10 00 00 00       	mov    $0x10,%ecx
    14fb:	8b 13                	mov    (%ebx),%edx
    14fd:	6a 00                	push   $0x0
    14ff:	89 f8                	mov    %edi,%eax
        ap++;
    1501:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1504:	e8 87 fe ff ff       	call   1390 <printint>
        ap++;
    1509:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    150c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    150f:	31 d2                	xor    %edx,%edx
    1511:	e9 67 ff ff ff       	jmp    147d <printf+0x4d>
        s = (char*)*ap;
    1516:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1519:	8b 18                	mov    (%eax),%ebx
        ap++;
    151b:	83 c0 04             	add    $0x4,%eax
    151e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1521:	85 db                	test   %ebx,%ebx
    1523:	0f 84 87 00 00 00    	je     15b0 <printf+0x180>
        while(*s != 0){
    1529:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    152c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    152e:	84 c0                	test   %al,%al
    1530:	0f 84 47 ff ff ff    	je     147d <printf+0x4d>
    1536:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1539:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    153c:	89 de                	mov    %ebx,%esi
    153e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    1540:	83 ec 04             	sub    $0x4,%esp
    1543:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1546:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1549:	6a 01                	push   $0x1
    154b:	53                   	push   %ebx
    154c:	57                   	push   %edi
    154d:	e8 a1 fd ff ff       	call   12f3 <write>
        while(*s != 0){
    1552:	0f b6 06             	movzbl (%esi),%eax
    1555:	83 c4 10             	add    $0x10,%esp
    1558:	84 c0                	test   %al,%al
    155a:	75 e4                	jne    1540 <printf+0x110>
      state = 0;
    155c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    155f:	31 d2                	xor    %edx,%edx
    1561:	e9 17 ff ff ff       	jmp    147d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1566:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1569:	83 ec 0c             	sub    $0xc,%esp
    156c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1571:	8b 13                	mov    (%ebx),%edx
    1573:	6a 01                	push   $0x1
    1575:	eb 88                	jmp    14ff <printf+0xcf>
        putc(fd, *ap);
    1577:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    157a:	83 ec 04             	sub    $0x4,%esp
    157d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1580:	8b 03                	mov    (%ebx),%eax
        ap++;
    1582:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1585:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1588:	6a 01                	push   $0x1
    158a:	52                   	push   %edx
    158b:	57                   	push   %edi
    158c:	e8 62 fd ff ff       	call   12f3 <write>
        ap++;
    1591:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1594:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1597:	31 d2                	xor    %edx,%edx
    1599:	e9 df fe ff ff       	jmp    147d <printf+0x4d>
    159e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    15a0:	83 ec 04             	sub    $0x4,%esp
    15a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    15a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    15a9:	6a 01                	push   $0x1
    15ab:	e9 31 ff ff ff       	jmp    14e1 <printf+0xb1>
    15b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    15b5:	bb 2f 18 00 00       	mov    $0x182f,%ebx
    15ba:	e9 77 ff ff ff       	jmp    1536 <printf+0x106>
    15bf:	90                   	nop

000015c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c1:	a1 e4 23 00 00       	mov    0x23e4,%eax
{
    15c6:	89 e5                	mov    %esp,%ebp
    15c8:	57                   	push   %edi
    15c9:	56                   	push   %esi
    15ca:	53                   	push   %ebx
    15cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15d8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15da:	39 c8                	cmp    %ecx,%eax
    15dc:	73 32                	jae    1610 <free+0x50>
    15de:	39 d1                	cmp    %edx,%ecx
    15e0:	72 04                	jb     15e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e2:	39 d0                	cmp    %edx,%eax
    15e4:	72 32                	jb     1618 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ec:	39 fa                	cmp    %edi,%edx
    15ee:	74 30                	je     1620 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    15f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15f3:	8b 50 04             	mov    0x4(%eax),%edx
    15f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15f9:	39 f1                	cmp    %esi,%ecx
    15fb:	74 3a                	je     1637 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    15fd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15ff:	5b                   	pop    %ebx
  freep = p;
    1600:	a3 e4 23 00 00       	mov    %eax,0x23e4
}
    1605:	5e                   	pop    %esi
    1606:	5f                   	pop    %edi
    1607:	5d                   	pop    %ebp
    1608:	c3                   	ret
    1609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1610:	39 d0                	cmp    %edx,%eax
    1612:	72 04                	jb     1618 <free+0x58>
    1614:	39 d1                	cmp    %edx,%ecx
    1616:	72 ce                	jb     15e6 <free+0x26>
{
    1618:	89 d0                	mov    %edx,%eax
    161a:	eb bc                	jmp    15d8 <free+0x18>
    161c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1620:	03 72 04             	add    0x4(%edx),%esi
    1623:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1626:	8b 10                	mov    (%eax),%edx
    1628:	8b 12                	mov    (%edx),%edx
    162a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    162d:	8b 50 04             	mov    0x4(%eax),%edx
    1630:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1633:	39 f1                	cmp    %esi,%ecx
    1635:	75 c6                	jne    15fd <free+0x3d>
    p->s.size += bp->s.size;
    1637:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    163a:	a3 e4 23 00 00       	mov    %eax,0x23e4
    p->s.size += bp->s.size;
    163f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1642:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1645:	89 08                	mov    %ecx,(%eax)
}
    1647:	5b                   	pop    %ebx
    1648:	5e                   	pop    %esi
    1649:	5f                   	pop    %edi
    164a:	5d                   	pop    %ebp
    164b:	c3                   	ret
    164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    165c:	8b 15 e4 23 00 00    	mov    0x23e4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1662:	8d 78 07             	lea    0x7(%eax),%edi
    1665:	c1 ef 03             	shr    $0x3,%edi
    1668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    166b:	85 d2                	test   %edx,%edx
    166d:	0f 84 8d 00 00 00    	je     1700 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1673:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1675:	8b 48 04             	mov    0x4(%eax),%ecx
    1678:	39 f9                	cmp    %edi,%ecx
    167a:	73 64                	jae    16e0 <malloc+0x90>
  if(nu < 4096)
    167c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1681:	39 df                	cmp    %ebx,%edi
    1683:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1686:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    168d:	eb 0a                	jmp    1699 <malloc+0x49>
    168f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1690:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1692:	8b 48 04             	mov    0x4(%eax),%ecx
    1695:	39 f9                	cmp    %edi,%ecx
    1697:	73 47                	jae    16e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1699:	89 c2                	mov    %eax,%edx
    169b:	3b 05 e4 23 00 00    	cmp    0x23e4,%eax
    16a1:	75 ed                	jne    1690 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    16a3:	83 ec 0c             	sub    $0xc,%esp
    16a6:	56                   	push   %esi
    16a7:	e8 af fc ff ff       	call   135b <sbrk>
  if(p == (char*)-1)
    16ac:	83 c4 10             	add    $0x10,%esp
    16af:	83 f8 ff             	cmp    $0xffffffff,%eax
    16b2:	74 1c                	je     16d0 <malloc+0x80>
  hp->s.size = nu;
    16b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16b7:	83 ec 0c             	sub    $0xc,%esp
    16ba:	83 c0 08             	add    $0x8,%eax
    16bd:	50                   	push   %eax
    16be:	e8 fd fe ff ff       	call   15c0 <free>
  return freep;
    16c3:	8b 15 e4 23 00 00    	mov    0x23e4,%edx
      if((p = morecore(nunits)) == 0)
    16c9:	83 c4 10             	add    $0x10,%esp
    16cc:	85 d2                	test   %edx,%edx
    16ce:	75 c0                	jne    1690 <malloc+0x40>
        return 0;
  }
}
    16d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16d3:	31 c0                	xor    %eax,%eax
}
    16d5:	5b                   	pop    %ebx
    16d6:	5e                   	pop    %esi
    16d7:	5f                   	pop    %edi
    16d8:	5d                   	pop    %ebp
    16d9:	c3                   	ret
    16da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    16e0:	39 cf                	cmp    %ecx,%edi
    16e2:	74 4c                	je     1730 <malloc+0xe0>
        p->s.size -= nunits;
    16e4:	29 f9                	sub    %edi,%ecx
    16e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    16ef:	89 15 e4 23 00 00    	mov    %edx,0x23e4
}
    16f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16f8:	83 c0 08             	add    $0x8,%eax
}
    16fb:	5b                   	pop    %ebx
    16fc:	5e                   	pop    %esi
    16fd:	5f                   	pop    %edi
    16fe:	5d                   	pop    %ebp
    16ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1700:	c7 05 e4 23 00 00 e8 	movl   $0x23e8,0x23e4
    1707:	23 00 00 
    base.s.size = 0;
    170a:	b8 e8 23 00 00       	mov    $0x23e8,%eax
    base.s.ptr = freep = prevp = &base;
    170f:	c7 05 e8 23 00 00 e8 	movl   $0x23e8,0x23e8
    1716:	23 00 00 
    base.s.size = 0;
    1719:	c7 05 ec 23 00 00 00 	movl   $0x0,0x23ec
    1720:	00 00 00 
    if(p->s.size >= nunits){
    1723:	e9 54 ff ff ff       	jmp    167c <malloc+0x2c>
    1728:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    172f:	00 
        prevp->s.ptr = p->s.ptr;
    1730:	8b 08                	mov    (%eax),%ecx
    1732:	89 0a                	mov    %ecx,(%edx)
    1734:	eb b9                	jmp    16ef <malloc+0x9f>
