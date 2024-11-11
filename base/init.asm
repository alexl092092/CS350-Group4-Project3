
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 98 07 00 00       	push   $0x798
  19:	e8 55 03 00 00       	call   373 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 78 03 00 00       	call   3ab <dup>
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 6c 03 00 00       	call   3ab <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 a0 07 00 00       	push   $0x7a0
  50:	6a 01                	push   $0x1
  52:	e8 39 04 00 00       	call   490 <printf>
  57:	e8 cf 02 00 00       	call   32b <fork>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	89 c3                	mov    %eax,%ebx
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
  65:	74 3d                	je     a4 <main+0xa4>
  67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6e:	00 
  6f:	90                   	nop
  70:	e8 c6 02 00 00       	call   33b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 df 07 00 00       	push   $0x7df
  85:	6a 01                	push   $0x1
  87:	e8 04 04 00 00       	call   490 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 b3 07 00 00       	push   $0x7b3
  98:	6a 01                	push   $0x1
  9a:	e8 f1 03 00 00       	call   490 <printf>
  9f:	e8 8f 02 00 00       	call   333 <exit>
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 e8 0a 00 00       	push   $0xae8
  ab:	68 c6 07 00 00       	push   $0x7c6
  b0:	e8 b6 02 00 00       	call   36b <exec>
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 c9 07 00 00       	push   $0x7c9
  bc:	6a 01                	push   $0x1
  be:	e8 cd 03 00 00       	call   490 <printf>
  c3:	e8 6b 02 00 00       	call   333 <exit>
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 98 07 00 00       	push   $0x798
  d2:	e8 a4 02 00 00       	call   37b <mknod>
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 98 07 00 00       	push   $0x798
  e0:	e8 8e 02 00 00       	call   373 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
  f0:	55                   	push   %ebp
  f1:	31 c0                	xor    %eax,%eax
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave
 114:	c3                   	ret
 115:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11c:	00 
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <strcmp>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
 146:	89 d9                	mov    %ebx,%ecx
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
 14f:	29 d8                	sub    %ebx,%eax
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave
 155:	c3                   	ret
 156:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15d:	00 
 15e:	66 90                	xchg   %ax,%ax
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave
 16c:	c3                   	ret
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17b:	00 
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <strlen>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret
 19f:	90                   	nop
 1a0:	31 c9                	xor    %ecx,%ecx
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret
 1a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ad:	00 
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <memset>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	31 c0                	xor    %eax,%eax
 202:	5d                   	pop    %ebp
 203:	c3                   	ret
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	8d 75 e7             	lea    -0x19(%ebp),%esi
 218:	53                   	push   %ebx
 219:	31 db                	xor    %ebx,%ebx
 21b:	83 ec 1c             	sub    $0x1c,%esp
 21e:	eb 27                	jmp    247 <gets+0x37>
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	56                   	push   %esi
 226:	6a 00                	push   $0x0
 228:	e8 1e 01 00 00       	call   34b <read>
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 10                	je     253 <gets+0x43>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 0c                	je     253 <gets+0x43>
 247:	89 df                	mov    %ebx,%edi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
 251:	89 fb                	mov    %edi,%ebx
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 25a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5f                   	pop    %edi
 260:	5d                   	pop    %ebp
 261:	c3                   	ret
 262:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 269:	00 
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <stat>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 f1 00 00 00       	call   373 <open>
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 f4 00 00 00       	call   38b <fstat>
 297:	89 1c 24             	mov    %ebx,(%esp)
 29a:	89 c6                	mov    %eax,%esi
 29c:	e8 ba 00 00 00       	call   35b <close>
 2a1:	83 c4 10             	add    $0x10,%esp
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2be:	00 
 2bf:	90                   	nop

000002c0 <atoi>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2de:	00 
 2df:	90                   	nop
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave
 2fb:	c3                   	ret
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
 314:	89 d7                	mov    %edx,%edi
 316:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31d:	00 
 31e:	66 90                	xchg   %ax,%ax
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret

0000032b <fork>:
 32b:	b8 01 00 00 00       	mov    $0x1,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <exit>:
 333:	b8 02 00 00 00       	mov    $0x2,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <wait>:
 33b:	b8 03 00 00 00       	mov    $0x3,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <pipe>:
 343:	b8 04 00 00 00       	mov    $0x4,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <read>:
 34b:	b8 05 00 00 00       	mov    $0x5,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <write>:
 353:	b8 10 00 00 00       	mov    $0x10,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <close>:
 35b:	b8 15 00 00 00       	mov    $0x15,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <kill>:
 363:	b8 06 00 00 00       	mov    $0x6,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <exec>:
 36b:	b8 07 00 00 00       	mov    $0x7,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <open>:
 373:	b8 0f 00 00 00       	mov    $0xf,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <mknod>:
 37b:	b8 11 00 00 00       	mov    $0x11,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <unlink>:
 383:	b8 12 00 00 00       	mov    $0x12,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <fstat>:
 38b:	b8 08 00 00 00       	mov    $0x8,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <link>:
 393:	b8 13 00 00 00       	mov    $0x13,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <mkdir>:
 39b:	b8 14 00 00 00       	mov    $0x14,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <chdir>:
 3a3:	b8 09 00 00 00       	mov    $0x9,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <dup>:
 3ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <getpid>:
 3b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <sbrk>:
 3bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <sleep>:
 3c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <uptime>:
 3cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <shutdown>:
 3d3:	b8 16 00 00 00       	mov    $0x16,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <cps>:
 3db:	b8 17 00 00 00       	mov    $0x17,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <chpr>:
 3e3:	b8 18 00 00 00       	mov    $0x18,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint>:
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	89 cb                	mov    %ecx,%ebx
 3f8:	89 d1                	mov    %edx,%ecx
 3fa:	83 ec 3c             	sub    $0x3c,%esp
 3fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
 400:	85 d2                	test   %edx,%edx
 402:	0f 89 80 00 00 00    	jns    488 <printint+0x98>
 408:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40c:	74 7a                	je     488 <printint+0x98>
 40e:	f7 d9                	neg    %ecx
 410:	b8 01 00 00 00       	mov    $0x1,%eax
 415:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 418:	31 f6                	xor    %esi,%esi
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 f7                	mov    %esi,%edi
 426:	f7 f3                	div    %ebx
 428:	8d 76 01             	lea    0x1(%esi),%esi
 42b:	0f b6 92 48 08 00 00 	movzbl 0x848(%edx),%edx
 432:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
 436:	89 ca                	mov    %ecx,%edx
 438:	89 c1                	mov    %eax,%ecx
 43a:	39 da                	cmp    %ebx,%edx
 43c:	73 e2                	jae    420 <printint+0x30>
 43e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 441:	85 c0                	test   %eax,%eax
 443:	74 07                	je     44c <printint+0x5c>
 445:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 44a:	89 f7                	mov    %esi,%edi
 44c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 44f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 452:	01 df                	add    %ebx,%edi
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 458:	0f b6 07             	movzbl (%edi),%eax
 45b:	83 ec 04             	sub    $0x4,%esp
 45e:	88 45 d7             	mov    %al,-0x29(%ebp)
 461:	8d 45 d7             	lea    -0x29(%ebp),%eax
 464:	6a 01                	push   $0x1
 466:	50                   	push   %eax
 467:	56                   	push   %esi
 468:	e8 e6 fe ff ff       	call   353 <write>
 46d:	89 f8                	mov    %edi,%eax
 46f:	83 c4 10             	add    $0x10,%esp
 472:	83 ef 01             	sub    $0x1,%edi
 475:	39 c3                	cmp    %eax,%ebx
 477:	75 df                	jne    458 <printint+0x68>
 479:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5f                   	pop    %edi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	31 c0                	xor    %eax,%eax
 48a:	eb 89                	jmp    415 <printint+0x25>
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <printf>:
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 2c             	sub    $0x2c,%esp
 499:	8b 75 0c             	mov    0xc(%ebp),%esi
 49c:	8b 7d 08             	mov    0x8(%ebp),%edi
 49f:	0f b6 1e             	movzbl (%esi),%ebx
 4a2:	83 c6 01             	add    $0x1,%esi
 4a5:	84 db                	test   %bl,%bl
 4a7:	74 67                	je     510 <printf+0x80>
 4a9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4ac:	31 d2                	xor    %edx,%edx
 4ae:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 4b1:	eb 34                	jmp    4e7 <printf+0x57>
 4b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 4b8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4bb:	ba 25 00 00 00       	mov    $0x25,%edx
 4c0:	83 f8 25             	cmp    $0x25,%eax
 4c3:	74 18                	je     4dd <printf+0x4d>
 4c5:	83 ec 04             	sub    $0x4,%esp
 4c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4cb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4ce:	6a 01                	push   $0x1
 4d0:	50                   	push   %eax
 4d1:	57                   	push   %edi
 4d2:	e8 7c fe ff ff       	call   353 <write>
 4d7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4da:	83 c4 10             	add    $0x10,%esp
 4dd:	0f b6 1e             	movzbl (%esi),%ebx
 4e0:	83 c6 01             	add    $0x1,%esi
 4e3:	84 db                	test   %bl,%bl
 4e5:	74 29                	je     510 <printf+0x80>
 4e7:	0f b6 c3             	movzbl %bl,%eax
 4ea:	85 d2                	test   %edx,%edx
 4ec:	74 ca                	je     4b8 <printf+0x28>
 4ee:	83 fa 25             	cmp    $0x25,%edx
 4f1:	75 ea                	jne    4dd <printf+0x4d>
 4f3:	83 f8 25             	cmp    $0x25,%eax
 4f6:	0f 84 04 01 00 00    	je     600 <printf+0x170>
 4fc:	83 e8 63             	sub    $0x63,%eax
 4ff:	83 f8 15             	cmp    $0x15,%eax
 502:	77 1c                	ja     520 <printf+0x90>
 504:	ff 24 85 f0 07 00 00 	jmp    *0x7f0(,%eax,4)
 50b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 510:	8d 65 f4             	lea    -0xc(%ebp),%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret
 518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 51f:	00 
 520:	83 ec 04             	sub    $0x4,%esp
 523:	8d 55 e7             	lea    -0x19(%ebp),%edx
 526:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52a:	6a 01                	push   $0x1
 52c:	52                   	push   %edx
 52d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 530:	57                   	push   %edi
 531:	e8 1d fe ff ff       	call   353 <write>
 536:	83 c4 0c             	add    $0xc,%esp
 539:	88 5d e7             	mov    %bl,-0x19(%ebp)
 53c:	6a 01                	push   $0x1
 53e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 541:	52                   	push   %edx
 542:	57                   	push   %edi
 543:	e8 0b fe ff ff       	call   353 <write>
 548:	83 c4 10             	add    $0x10,%esp
 54b:	31 d2                	xor    %edx,%edx
 54d:	eb 8e                	jmp    4dd <printf+0x4d>
 54f:	90                   	nop
 550:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 553:	83 ec 0c             	sub    $0xc,%esp
 556:	b9 10 00 00 00       	mov    $0x10,%ecx
 55b:	8b 13                	mov    (%ebx),%edx
 55d:	6a 00                	push   $0x0
 55f:	89 f8                	mov    %edi,%eax
 561:	83 c3 04             	add    $0x4,%ebx
 564:	e8 87 fe ff ff       	call   3f0 <printint>
 569:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 56c:	83 c4 10             	add    $0x10,%esp
 56f:	31 d2                	xor    %edx,%edx
 571:	e9 67 ff ff ff       	jmp    4dd <printf+0x4d>
 576:	8b 45 d0             	mov    -0x30(%ebp),%eax
 579:	8b 18                	mov    (%eax),%ebx
 57b:	83 c0 04             	add    $0x4,%eax
 57e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 581:	85 db                	test   %ebx,%ebx
 583:	0f 84 87 00 00 00    	je     610 <printf+0x180>
 589:	0f b6 03             	movzbl (%ebx),%eax
 58c:	31 d2                	xor    %edx,%edx
 58e:	84 c0                	test   %al,%al
 590:	0f 84 47 ff ff ff    	je     4dd <printf+0x4d>
 596:	8d 55 e7             	lea    -0x19(%ebp),%edx
 599:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 59c:	89 de                	mov    %ebx,%esi
 59e:	89 d3                	mov    %edx,%ebx
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 45 e7             	mov    %al,-0x19(%ebp)
 5a6:	83 c6 01             	add    $0x1,%esi
 5a9:	6a 01                	push   $0x1
 5ab:	53                   	push   %ebx
 5ac:	57                   	push   %edi
 5ad:	e8 a1 fd ff ff       	call   353 <write>
 5b2:	0f b6 06             	movzbl (%esi),%eax
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	84 c0                	test   %al,%al
 5ba:	75 e4                	jne    5a0 <printf+0x110>
 5bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5bf:	31 d2                	xor    %edx,%edx
 5c1:	e9 17 ff ff ff       	jmp    4dd <printf+0x4d>
 5c6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d1:	8b 13                	mov    (%ebx),%edx
 5d3:	6a 01                	push   $0x1
 5d5:	eb 88                	jmp    55f <printf+0xcf>
 5d7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5da:	83 ec 04             	sub    $0x4,%esp
 5dd:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5e0:	8b 03                	mov    (%ebx),%eax
 5e2:	83 c3 04             	add    $0x4,%ebx
 5e5:	88 45 e7             	mov    %al,-0x19(%ebp)
 5e8:	6a 01                	push   $0x1
 5ea:	52                   	push   %edx
 5eb:	57                   	push   %edi
 5ec:	e8 62 fd ff ff       	call   353 <write>
 5f1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5f4:	83 c4 10             	add    $0x10,%esp
 5f7:	31 d2                	xor    %edx,%edx
 5f9:	e9 df fe ff ff       	jmp    4dd <printf+0x4d>
 5fe:	66 90                	xchg   %ax,%ax
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e7             	mov    %bl,-0x19(%ebp)
 606:	8d 55 e7             	lea    -0x19(%ebp),%edx
 609:	6a 01                	push   $0x1
 60b:	e9 31 ff ff ff       	jmp    541 <printf+0xb1>
 610:	b8 28 00 00 00       	mov    $0x28,%eax
 615:	bb e8 07 00 00       	mov    $0x7e8,%ebx
 61a:	e9 77 ff ff ff       	jmp    596 <printf+0x106>
 61f:	90                   	nop

00000620 <free>:
 620:	55                   	push   %ebp
 621:	a1 f0 0a 00 00       	mov    0xaf0,%eax
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 62e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8b 10                	mov    (%eax),%edx
 63a:	39 c8                	cmp    %ecx,%eax
 63c:	73 32                	jae    670 <free+0x50>
 63e:	39 d1                	cmp    %edx,%ecx
 640:	72 04                	jb     646 <free+0x26>
 642:	39 d0                	cmp    %edx,%eax
 644:	72 32                	jb     678 <free+0x58>
 646:	8b 73 fc             	mov    -0x4(%ebx),%esi
 649:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64c:	39 fa                	cmp    %edi,%edx
 64e:	74 30                	je     680 <free+0x60>
 650:	89 53 f8             	mov    %edx,-0x8(%ebx)
 653:	8b 50 04             	mov    0x4(%eax),%edx
 656:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 659:	39 f1                	cmp    %esi,%ecx
 65b:	74 3a                	je     697 <free+0x77>
 65d:	89 08                	mov    %ecx,(%eax)
 65f:	5b                   	pop    %ebx
 660:	a3 f0 0a 00 00       	mov    %eax,0xaf0
 665:	5e                   	pop    %esi
 666:	5f                   	pop    %edi
 667:	5d                   	pop    %ebp
 668:	c3                   	ret
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 670:	39 d0                	cmp    %edx,%eax
 672:	72 04                	jb     678 <free+0x58>
 674:	39 d1                	cmp    %edx,%ecx
 676:	72 ce                	jb     646 <free+0x26>
 678:	89 d0                	mov    %edx,%eax
 67a:	eb bc                	jmp    638 <free+0x18>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 680:	03 72 04             	add    0x4(%edx),%esi
 683:	89 73 fc             	mov    %esi,-0x4(%ebx)
 686:	8b 10                	mov    (%eax),%edx
 688:	8b 12                	mov    (%edx),%edx
 68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	75 c6                	jne    65d <free+0x3d>
 697:	03 53 fc             	add    -0x4(%ebx),%edx
 69a:	a3 f0 0a 00 00       	mov    %eax,0xaf0
 69f:	89 50 04             	mov    %edx,0x4(%eax)
 6a2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6a5:	89 08                	mov    %ecx,(%eax)
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <malloc>:
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 0c             	sub    $0xc,%esp
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	8b 15 f0 0a 00 00    	mov    0xaf0,%edx
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	83 c7 01             	add    $0x1,%edi
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 8d 00 00 00    	je     760 <malloc+0xb0>
 6d3:	8b 02                	mov    (%edx),%eax
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
 6d8:	39 f9                	cmp    %edi,%ecx
 6da:	73 64                	jae    740 <malloc+0x90>
 6dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e1:	39 df                	cmp    %ebx,%edi
 6e3:	0f 43 df             	cmovae %edi,%ebx
 6e6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6ed:	eb 0a                	jmp    6f9 <malloc+0x49>
 6ef:	90                   	nop
 6f0:	8b 02                	mov    (%edx),%eax
 6f2:	8b 48 04             	mov    0x4(%eax),%ecx
 6f5:	39 f9                	cmp    %edi,%ecx
 6f7:	73 47                	jae    740 <malloc+0x90>
 6f9:	89 c2                	mov    %eax,%edx
 6fb:	3b 05 f0 0a 00 00    	cmp    0xaf0,%eax
 701:	75 ed                	jne    6f0 <malloc+0x40>
 703:	83 ec 0c             	sub    $0xc,%esp
 706:	56                   	push   %esi
 707:	e8 af fc ff ff       	call   3bb <sbrk>
 70c:	83 c4 10             	add    $0x10,%esp
 70f:	83 f8 ff             	cmp    $0xffffffff,%eax
 712:	74 1c                	je     730 <malloc+0x80>
 714:	89 58 04             	mov    %ebx,0x4(%eax)
 717:	83 ec 0c             	sub    $0xc,%esp
 71a:	83 c0 08             	add    $0x8,%eax
 71d:	50                   	push   %eax
 71e:	e8 fd fe ff ff       	call   620 <free>
 723:	8b 15 f0 0a 00 00    	mov    0xaf0,%edx
 729:	83 c4 10             	add    $0x10,%esp
 72c:	85 d2                	test   %edx,%edx
 72e:	75 c0                	jne    6f0 <malloc+0x40>
 730:	8d 65 f4             	lea    -0xc(%ebp),%esp
 733:	31 c0                	xor    %eax,%eax
 735:	5b                   	pop    %ebx
 736:	5e                   	pop    %esi
 737:	5f                   	pop    %edi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 740:	39 cf                	cmp    %ecx,%edi
 742:	74 4c                	je     790 <malloc+0xe0>
 744:	29 f9                	sub    %edi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 74c:	89 78 04             	mov    %edi,0x4(%eax)
 74f:	89 15 f0 0a 00 00    	mov    %edx,0xaf0
 755:	8d 65 f4             	lea    -0xc(%ebp),%esp
 758:	83 c0 08             	add    $0x8,%eax
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret
 760:	c7 05 f0 0a 00 00 f4 	movl   $0xaf4,0xaf0
 767:	0a 00 00 
 76a:	b8 f4 0a 00 00       	mov    $0xaf4,%eax
 76f:	c7 05 f4 0a 00 00 f4 	movl   $0xaf4,0xaf4
 776:	0a 00 00 
 779:	c7 05 f8 0a 00 00 00 	movl   $0x0,0xaf8
 780:	00 00 00 
 783:	e9 54 ff ff ff       	jmp    6dc <malloc+0x2c>
 788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 78f:	00 
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b9                	jmp    74f <malloc+0x9f>
