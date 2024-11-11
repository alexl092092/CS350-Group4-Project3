
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 80 10 00       	mov    $0x108000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc b0 ff 11 80       	mov    $0x8011ffb0,%esp
8010002d:	b8 80 2f 10 80       	mov    $0x80102f80,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 54 95 10 80       	mov    $0x80109554,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 20 72 10 80       	push   $0x80107220
80100051:	68 20 95 10 80       	push   $0x80109520
80100056:	e8 b5 43 00 00       	call   80104410 <initlock>
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	b8 1c 90 11 80       	mov    $0x8011901c,%eax
80100063:	c7 05 6c 90 11 80 1c 	movl   $0x8011901c,0x8011906c
8010006a:	90 11 80 
8010006d:	c7 05 70 90 11 80 1c 	movl   $0x8011901c,0x80119070
80100074:	90 11 80 
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 d3                	mov    %edx,%ebx
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
8010008b:	c7 43 50 1c 90 11 80 	movl   $0x8011901c,0x50(%ebx)
80100092:	68 27 72 10 80       	push   $0x80107227
80100097:	50                   	push   %eax
80100098:	e8 63 42 00 00       	call   80104300 <initsleeplock>
8010009d:	a1 70 90 11 80       	mov    0x80119070,%eax
801000a2:	8d 93 5c 08 00 00    	lea    0x85c(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d 70 90 11 80    	mov    %ebx,0x80119070
801000b6:	81 fb c0 87 11 80    	cmp    $0x801187c0,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave
801000c2:	c3                   	ret
801000c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801000ca:	00 
801000cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 20 95 10 80       	push   $0x80109520
801000e4:	e8 57 44 00 00       	call   80104540 <acquire>
801000e9:	8b 1d 70 90 11 80    	mov    0x80119070,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 1c 90 11 80    	cmp    $0x8011901c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 1c 90 11 80    	cmp    $0x8011901c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 6c 90 11 80    	mov    0x8011906c,%ebx
80100126:	81 fb 1c 90 11 80    	cmp    $0x8011901c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 6e                	jmp    8010019e <bread+0xce>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 1c 90 11 80    	cmp    $0x8011901c,%ebx
80100139:	74 63                	je     8010019e <bread+0xce>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 95 10 80       	push   $0x80109520
80100162:	e8 39 45 00 00       	call   801046a0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ce 41 00 00       	call   80104340 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 5f 21 00 00       	call   801022f0 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret
8010019e:	83 ec 0c             	sub    $0xc,%esp
801001a1:	68 2e 72 10 80       	push   $0x8010722e
801001a6:	e8 d5 01 00 00       	call   80100380 <panic>
801001ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801001b0 <bwrite>:
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 1d 42 00 00       	call   801043e0 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave
801001d4:	e9 17 21 00 00       	jmp    801022f0 <iderw>
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 3f 72 10 80       	push   $0x8010723f
801001e1:	e8 9a 01 00 00       	call   80100380 <panic>
801001e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801001ed:	00 
801001ee:	66 90                	xchg   %ax,%ax

801001f0 <brelse>:
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 dc 41 00 00       	call   801043e0 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 63                	je     8010026e <brelse+0x7e>
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 8c 41 00 00       	call   801043a0 <releasesleep>
80100214:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
8010021b:	e8 20 43 00 00       	call   80104540 <acquire>
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100223:	83 c4 10             	add    $0x10,%esp
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2c                	jne    8010025c <brelse+0x6c>
80100230:	8b 53 54             	mov    0x54(%ebx),%edx
80100233:	8b 43 50             	mov    0x50(%ebx),%eax
80100236:	89 42 50             	mov    %eax,0x50(%edx)
80100239:	8b 53 54             	mov    0x54(%ebx),%edx
8010023c:	89 50 54             	mov    %edx,0x54(%eax)
8010023f:	a1 70 90 11 80       	mov    0x80119070,%eax
80100244:	c7 43 50 1c 90 11 80 	movl   $0x8011901c,0x50(%ebx)
8010024b:	89 43 54             	mov    %eax,0x54(%ebx)
8010024e:	a1 70 90 11 80       	mov    0x80119070,%eax
80100253:	89 58 50             	mov    %ebx,0x50(%eax)
80100256:	89 1d 70 90 11 80    	mov    %ebx,0x80119070
8010025c:	c7 45 08 20 95 10 80 	movl   $0x80109520,0x8(%ebp)
80100263:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100266:	5b                   	pop    %ebx
80100267:	5e                   	pop    %esi
80100268:	5d                   	pop    %ebp
80100269:	e9 32 44 00 00       	jmp    801046a0 <release>
8010026e:	83 ec 0c             	sub    $0xc,%esp
80100271:	68 46 72 10 80       	push   $0x80107246
80100276:	e8 05 01 00 00       	call   80100380 <panic>
8010027b:	66 90                	xchg   %ax,%ax
8010027d:	66 90                	xchg   %ax,%ax
8010027f:	90                   	nop

80100280 <consoleread>:
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 18             	sub    $0x18,%esp
80100289:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010028c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010028f:	ff 75 08             	push   0x8(%ebp)
80100292:	89 df                	mov    %ebx,%edi
80100294:	e8 07 16 00 00       	call   801018a0 <iunlock>
80100299:	c7 04 24 20 99 11 80 	movl   $0x80119920,(%esp)
801002a0:	e8 9b 42 00 00       	call   80104540 <acquire>
801002a5:	83 c4 10             	add    $0x10,%esp
801002a8:	85 db                	test   %ebx,%ebx
801002aa:	0f 8e 94 00 00 00    	jle    80100344 <consoleread+0xc4>
801002b0:	a1 00 99 11 80       	mov    0x80119900,%eax
801002b5:	39 05 04 99 11 80    	cmp    %eax,0x80119904
801002bb:	74 25                	je     801002e2 <consoleread+0x62>
801002bd:	eb 59                	jmp    80100318 <consoleread+0x98>
801002bf:	90                   	nop
801002c0:	83 ec 08             	sub    $0x8,%esp
801002c3:	68 20 99 11 80       	push   $0x80119920
801002c8:	68 00 99 11 80       	push   $0x80119900
801002cd:	e8 be 3c 00 00       	call   80103f90 <sleep>
801002d2:	a1 00 99 11 80       	mov    0x80119900,%eax
801002d7:	83 c4 10             	add    $0x10,%esp
801002da:	3b 05 04 99 11 80    	cmp    0x80119904,%eax
801002e0:	75 36                	jne    80100318 <consoleread+0x98>
801002e2:	e8 d9 35 00 00       	call   801038c0 <myproc>
801002e7:	8b 48 24             	mov    0x24(%eax),%ecx
801002ea:	85 c9                	test   %ecx,%ecx
801002ec:	74 d2                	je     801002c0 <consoleread+0x40>
801002ee:	83 ec 0c             	sub    $0xc,%esp
801002f1:	68 20 99 11 80       	push   $0x80119920
801002f6:	e8 a5 43 00 00       	call   801046a0 <release>
801002fb:	5a                   	pop    %edx
801002fc:	ff 75 08             	push   0x8(%ebp)
801002ff:	e8 bc 14 00 00       	call   801017c0 <ilock>
80100304:	83 c4 10             	add    $0x10,%esp
80100307:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010030a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010030f:	5b                   	pop    %ebx
80100310:	5e                   	pop    %esi
80100311:	5f                   	pop    %edi
80100312:	5d                   	pop    %ebp
80100313:	c3                   	ret
80100314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100318:	8d 50 01             	lea    0x1(%eax),%edx
8010031b:	89 15 00 99 11 80    	mov    %edx,0x80119900
80100321:	89 c2                	mov    %eax,%edx
80100323:	83 e2 7f             	and    $0x7f,%edx
80100326:	0f be 8a 80 98 11 80 	movsbl -0x7fee6780(%edx),%ecx
8010032d:	80 f9 04             	cmp    $0x4,%cl
80100330:	74 37                	je     80100369 <consoleread+0xe9>
80100332:	83 c6 01             	add    $0x1,%esi
80100335:	83 eb 01             	sub    $0x1,%ebx
80100338:	88 4e ff             	mov    %cl,-0x1(%esi)
8010033b:	83 f9 0a             	cmp    $0xa,%ecx
8010033e:	0f 85 64 ff ff ff    	jne    801002a8 <consoleread+0x28>
80100344:	83 ec 0c             	sub    $0xc,%esp
80100347:	68 20 99 11 80       	push   $0x80119920
8010034c:	e8 4f 43 00 00       	call   801046a0 <release>
80100351:	58                   	pop    %eax
80100352:	ff 75 08             	push   0x8(%ebp)
80100355:	e8 66 14 00 00       	call   801017c0 <ilock>
8010035a:	89 f8                	mov    %edi,%eax
8010035c:	83 c4 10             	add    $0x10,%esp
8010035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100362:	29 d8                	sub    %ebx,%eax
80100364:	5b                   	pop    %ebx
80100365:	5e                   	pop    %esi
80100366:	5f                   	pop    %edi
80100367:	5d                   	pop    %ebp
80100368:	c3                   	ret
80100369:	39 fb                	cmp    %edi,%ebx
8010036b:	73 d7                	jae    80100344 <consoleread+0xc4>
8010036d:	a3 00 99 11 80       	mov    %eax,0x80119900
80100372:	eb d0                	jmp    80100344 <consoleread+0xc4>
80100374:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010037b:	00 
8010037c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100380 <panic>:
80100380:	55                   	push   %ebp
80100381:	89 e5                	mov    %esp,%ebp
80100383:	56                   	push   %esi
80100384:	53                   	push   %ebx
80100385:	83 ec 30             	sub    $0x30,%esp
80100388:	fa                   	cli
80100389:	c7 05 54 99 11 80 00 	movl   $0x0,0x80119954
80100390:	00 00 00 
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100399:	e8 82 24 00 00       	call   80102820 <lapicid>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	50                   	push   %eax
801003a2:	68 4d 72 10 80       	push   $0x8010724d
801003a7:	e8 04 03 00 00       	call   801006b0 <cprintf>
801003ac:	58                   	pop    %eax
801003ad:	ff 75 08             	push   0x8(%ebp)
801003b0:	e8 fb 02 00 00       	call   801006b0 <cprintf>
801003b5:	c7 04 24 c3 79 10 80 	movl   $0x801079c3,(%esp)
801003bc:	e8 ef 02 00 00       	call   801006b0 <cprintf>
801003c1:	8d 45 08             	lea    0x8(%ebp),%eax
801003c4:	5a                   	pop    %edx
801003c5:	59                   	pop    %ecx
801003c6:	53                   	push   %ebx
801003c7:	50                   	push   %eax
801003c8:	e8 63 40 00 00       	call   80104430 <getcallerpcs>
801003cd:	83 c4 10             	add    $0x10,%esp
801003d0:	83 ec 08             	sub    $0x8,%esp
801003d3:	ff 33                	push   (%ebx)
801003d5:	83 c3 04             	add    $0x4,%ebx
801003d8:	68 61 72 10 80       	push   $0x80107261
801003dd:	e8 ce 02 00 00       	call   801006b0 <cprintf>
801003e2:	83 c4 10             	add    $0x10,%esp
801003e5:	39 f3                	cmp    %esi,%ebx
801003e7:	75 e7                	jne    801003d0 <panic+0x50>
801003e9:	c7 05 58 99 11 80 01 	movl   $0x1,0x80119958
801003f0:	00 00 00 
801003f3:	eb fe                	jmp    801003f3 <panic+0x73>
801003f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801003fc:	00 
801003fd:	8d 76 00             	lea    0x0(%esi),%esi

80100400 <consputc.part.0>:
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	83 ec 1c             	sub    $0x1c,%esp
80100409:	3d 00 01 00 00       	cmp    $0x100,%eax
8010040e:	0f 84 cc 00 00 00    	je     801004e0 <consputc.part.0+0xe0>
80100414:	83 ec 0c             	sub    $0xc,%esp
80100417:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010041c:	89 c3                	mov    %eax,%ebx
8010041e:	50                   	push   %eax
8010041f:	e8 5c 59 00 00       	call   80105d80 <uartputc>
80100424:	b8 0e 00 00 00       	mov    $0xe,%eax
80100429:	89 fa                	mov    %edi,%edx
8010042b:	ee                   	out    %al,(%dx)
8010042c:	be d5 03 00 00       	mov    $0x3d5,%esi
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
80100434:	0f b6 c8             	movzbl %al,%ecx
80100437:	89 fa                	mov    %edi,%edx
80100439:	b8 0f 00 00 00       	mov    $0xf,%eax
8010043e:	c1 e1 08             	shl    $0x8,%ecx
80100441:	ee                   	out    %al,(%dx)
80100442:	89 f2                	mov    %esi,%edx
80100444:	ec                   	in     (%dx),%al
80100445:	0f b6 c0             	movzbl %al,%eax
80100448:	83 c4 10             	add    $0x10,%esp
8010044b:	09 c8                	or     %ecx,%eax
8010044d:	83 fb 0a             	cmp    $0xa,%ebx
80100450:	75 76                	jne    801004c8 <consputc.part.0+0xc8>
80100452:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
80100457:	f7 e2                	mul    %edx
80100459:	c1 ea 06             	shr    $0x6,%edx
8010045c:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010045f:	c1 e0 04             	shl    $0x4,%eax
80100462:	8d 70 50             	lea    0x50(%eax),%esi
80100465:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
8010046b:	0f 8f 2f 01 00 00    	jg     801005a0 <consputc.part.0+0x1a0>
80100471:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100477:	0f 8f c3 00 00 00    	jg     80100540 <consputc.part.0+0x140>
8010047d:	89 f0                	mov    %esi,%eax
8010047f:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
80100486:	88 45 e7             	mov    %al,-0x19(%ebp)
80100489:	0f b6 fc             	movzbl %ah,%edi
8010048c:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100491:	b8 0e 00 00 00       	mov    $0xe,%eax
80100496:	89 da                	mov    %ebx,%edx
80100498:	ee                   	out    %al,(%dx)
80100499:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
8010049e:	89 f8                	mov    %edi,%eax
801004a0:	89 ca                	mov    %ecx,%edx
801004a2:	ee                   	out    %al,(%dx)
801004a3:	b8 0f 00 00 00       	mov    $0xf,%eax
801004a8:	89 da                	mov    %ebx,%edx
801004aa:	ee                   	out    %al,(%dx)
801004ab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004af:	89 ca                	mov    %ecx,%edx
801004b1:	ee                   	out    %al,(%dx)
801004b2:	b8 20 07 00 00       	mov    $0x720,%eax
801004b7:	66 89 06             	mov    %ax,(%esi)
801004ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004bd:	5b                   	pop    %ebx
801004be:	5e                   	pop    %esi
801004bf:	5f                   	pop    %edi
801004c0:	5d                   	pop    %ebp
801004c1:	c3                   	ret
801004c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801004c8:	83 fb 41             	cmp    $0x41,%ebx
801004cb:	74 ed                	je     801004ba <consputc.part.0+0xba>
801004cd:	0f b6 db             	movzbl %bl,%ebx
801004d0:	8d 70 01             	lea    0x1(%eax),%esi
801004d3:	80 cf 07             	or     $0x7,%bh
801004d6:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
801004dd:	80 
801004de:	eb 85                	jmp    80100465 <consputc.part.0+0x65>
801004e0:	83 ec 0c             	sub    $0xc,%esp
801004e3:	be d4 03 00 00       	mov    $0x3d4,%esi
801004e8:	6a 08                	push   $0x8
801004ea:	e8 91 58 00 00       	call   80105d80 <uartputc>
801004ef:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f6:	e8 85 58 00 00       	call   80105d80 <uartputc>
801004fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100502:	e8 79 58 00 00       	call   80105d80 <uartputc>
80100507:	b8 0e 00 00 00       	mov    $0xe,%eax
8010050c:	89 f2                	mov    %esi,%edx
8010050e:	ee                   	out    %al,(%dx)
8010050f:	bb d5 03 00 00       	mov    $0x3d5,%ebx
80100514:	89 da                	mov    %ebx,%edx
80100516:	ec                   	in     (%dx),%al
80100517:	0f b6 c8             	movzbl %al,%ecx
8010051a:	89 f2                	mov    %esi,%edx
8010051c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100521:	c1 e1 08             	shl    $0x8,%ecx
80100524:	ee                   	out    %al,(%dx)
80100525:	89 da                	mov    %ebx,%edx
80100527:	ec                   	in     (%dx),%al
80100528:	0f b6 f0             	movzbl %al,%esi
8010052b:	83 c4 10             	add    $0x10,%esp
8010052e:	09 ce                	or     %ecx,%esi
80100530:	74 5e                	je     80100590 <consputc.part.0+0x190>
80100532:	83 ee 01             	sub    $0x1,%esi
80100535:	e9 2b ff ff ff       	jmp    80100465 <consputc.part.0+0x65>
8010053a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100540:	83 ec 04             	sub    $0x4,%esp
80100543:	8d 5e b0             	lea    -0x50(%esi),%ebx
80100546:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
8010054d:	bf 07 00 00 00       	mov    $0x7,%edi
80100552:	68 60 0e 00 00       	push   $0xe60
80100557:	68 a0 80 0b 80       	push   $0x800b80a0
8010055c:	68 00 80 0b 80       	push   $0x800b8000
80100561:	e8 1a 42 00 00       	call   80104780 <memmove>
80100566:	b8 80 07 00 00       	mov    $0x780,%eax
8010056b:	83 c4 0c             	add    $0xc,%esp
8010056e:	29 d8                	sub    %ebx,%eax
80100570:	01 c0                	add    %eax,%eax
80100572:	50                   	push   %eax
80100573:	6a 00                	push   $0x0
80100575:	56                   	push   %esi
80100576:	e8 75 41 00 00       	call   801046f0 <memset>
8010057b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010057e:	83 c4 10             	add    $0x10,%esp
80100581:	e9 06 ff ff ff       	jmp    8010048c <consputc.part.0+0x8c>
80100586:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010058d:	00 
8010058e:	66 90                	xchg   %ax,%ax
80100590:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
80100594:	be 00 80 0b 80       	mov    $0x800b8000,%esi
80100599:	31 ff                	xor    %edi,%edi
8010059b:	e9 ec fe ff ff       	jmp    8010048c <consputc.part.0+0x8c>
801005a0:	83 ec 0c             	sub    $0xc,%esp
801005a3:	68 65 72 10 80       	push   $0x80107265
801005a8:	e8 d3 fd ff ff       	call   80100380 <panic>
801005ad:	8d 76 00             	lea    0x0(%esi),%esi

801005b0 <consolewrite>:
801005b0:	55                   	push   %ebp
801005b1:	89 e5                	mov    %esp,%ebp
801005b3:	57                   	push   %edi
801005b4:	56                   	push   %esi
801005b5:	53                   	push   %ebx
801005b6:	83 ec 18             	sub    $0x18,%esp
801005b9:	8b 75 10             	mov    0x10(%ebp),%esi
801005bc:	ff 75 08             	push   0x8(%ebp)
801005bf:	e8 dc 12 00 00       	call   801018a0 <iunlock>
801005c4:	c7 04 24 20 99 11 80 	movl   $0x80119920,(%esp)
801005cb:	e8 70 3f 00 00       	call   80104540 <acquire>
801005d0:	83 c4 10             	add    $0x10,%esp
801005d3:	85 f6                	test   %esi,%esi
801005d5:	7e 25                	jle    801005fc <consolewrite+0x4c>
801005d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801005da:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
801005dd:	8b 15 58 99 11 80    	mov    0x80119958,%edx
801005e3:	0f b6 03             	movzbl (%ebx),%eax
801005e6:	85 d2                	test   %edx,%edx
801005e8:	74 06                	je     801005f0 <consolewrite+0x40>
801005ea:	fa                   	cli
801005eb:	eb fe                	jmp    801005eb <consolewrite+0x3b>
801005ed:	8d 76 00             	lea    0x0(%esi),%esi
801005f0:	e8 0b fe ff ff       	call   80100400 <consputc.part.0>
801005f5:	83 c3 01             	add    $0x1,%ebx
801005f8:	39 fb                	cmp    %edi,%ebx
801005fa:	75 e1                	jne    801005dd <consolewrite+0x2d>
801005fc:	83 ec 0c             	sub    $0xc,%esp
801005ff:	68 20 99 11 80       	push   $0x80119920
80100604:	e8 97 40 00 00       	call   801046a0 <release>
80100609:	58                   	pop    %eax
8010060a:	ff 75 08             	push   0x8(%ebp)
8010060d:	e8 ae 11 00 00       	call   801017c0 <ilock>
80100612:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100615:	89 f0                	mov    %esi,%eax
80100617:	5b                   	pop    %ebx
80100618:	5e                   	pop    %esi
80100619:	5f                   	pop    %edi
8010061a:	5d                   	pop    %ebp
8010061b:	c3                   	ret
8010061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100620 <printint>:
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	57                   	push   %edi
80100624:	56                   	push   %esi
80100625:	53                   	push   %ebx
80100626:	89 d3                	mov    %edx,%ebx
80100628:	83 ec 2c             	sub    $0x2c,%esp
8010062b:	85 c0                	test   %eax,%eax
8010062d:	79 05                	jns    80100634 <printint+0x14>
8010062f:	83 e1 01             	and    $0x1,%ecx
80100632:	75 64                	jne    80100698 <printint+0x78>
80100634:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010063b:	89 c1                	mov    %eax,%ecx
8010063d:	31 f6                	xor    %esi,%esi
8010063f:	90                   	nop
80100640:	89 c8                	mov    %ecx,%eax
80100642:	31 d2                	xor    %edx,%edx
80100644:	89 f7                	mov    %esi,%edi
80100646:	f7 f3                	div    %ebx
80100648:	8d 76 01             	lea    0x1(%esi),%esi
8010064b:	0f b6 92 90 72 10 80 	movzbl -0x7fef8d70(%edx),%edx
80100652:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
80100656:	89 ca                	mov    %ecx,%edx
80100658:	89 c1                	mov    %eax,%ecx
8010065a:	39 da                	cmp    %ebx,%edx
8010065c:	73 e2                	jae    80100640 <printint+0x20>
8010065e:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
80100661:	85 c9                	test   %ecx,%ecx
80100663:	74 07                	je     8010066c <printint+0x4c>
80100665:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
8010066a:	89 f7                	mov    %esi,%edi
8010066c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
8010066f:	01 df                	add    %ebx,%edi
80100671:	8b 15 58 99 11 80    	mov    0x80119958,%edx
80100677:	0f be 07             	movsbl (%edi),%eax
8010067a:	85 d2                	test   %edx,%edx
8010067c:	74 0a                	je     80100688 <printint+0x68>
8010067e:	fa                   	cli
8010067f:	eb fe                	jmp    8010067f <printint+0x5f>
80100681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100688:	e8 73 fd ff ff       	call   80100400 <consputc.part.0>
8010068d:	8d 47 ff             	lea    -0x1(%edi),%eax
80100690:	39 df                	cmp    %ebx,%edi
80100692:	74 11                	je     801006a5 <printint+0x85>
80100694:	89 c7                	mov    %eax,%edi
80100696:	eb d9                	jmp    80100671 <printint+0x51>
80100698:	f7 d8                	neg    %eax
8010069a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
801006a1:	89 c1                	mov    %eax,%ecx
801006a3:	eb 98                	jmp    8010063d <printint+0x1d>
801006a5:	83 c4 2c             	add    $0x2c,%esp
801006a8:	5b                   	pop    %ebx
801006a9:	5e                   	pop    %esi
801006aa:	5f                   	pop    %edi
801006ab:	5d                   	pop    %ebp
801006ac:	c3                   	ret
801006ad:	8d 76 00             	lea    0x0(%esi),%esi

801006b0 <cprintf>:
801006b0:	55                   	push   %ebp
801006b1:	89 e5                	mov    %esp,%ebp
801006b3:	57                   	push   %edi
801006b4:	56                   	push   %esi
801006b5:	53                   	push   %ebx
801006b6:	83 ec 1c             	sub    $0x1c,%esp
801006b9:	8b 3d 54 99 11 80    	mov    0x80119954,%edi
801006bf:	8b 75 08             	mov    0x8(%ebp),%esi
801006c2:	85 ff                	test   %edi,%edi
801006c4:	0f 85 06 01 00 00    	jne    801007d0 <cprintf+0x120>
801006ca:	85 f6                	test   %esi,%esi
801006cc:	0f 84 b7 01 00 00    	je     80100889 <cprintf+0x1d9>
801006d2:	0f b6 06             	movzbl (%esi),%eax
801006d5:	85 c0                	test   %eax,%eax
801006d7:	74 5f                	je     80100738 <cprintf+0x88>
801006d9:	8d 55 0c             	lea    0xc(%ebp),%edx
801006dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801006df:	31 db                	xor    %ebx,%ebx
801006e1:	89 d7                	mov    %edx,%edi
801006e3:	83 f8 25             	cmp    $0x25,%eax
801006e6:	75 58                	jne    80100740 <cprintf+0x90>
801006e8:	83 c3 01             	add    $0x1,%ebx
801006eb:	0f b6 0c 1e          	movzbl (%esi,%ebx,1),%ecx
801006ef:	85 c9                	test   %ecx,%ecx
801006f1:	74 3a                	je     8010072d <cprintf+0x7d>
801006f3:	83 f9 70             	cmp    $0x70,%ecx
801006f6:	0f 84 b4 00 00 00    	je     801007b0 <cprintf+0x100>
801006fc:	7f 72                	jg     80100770 <cprintf+0xc0>
801006fe:	83 f9 25             	cmp    $0x25,%ecx
80100701:	74 4d                	je     80100750 <cprintf+0xa0>
80100703:	83 f9 64             	cmp    $0x64,%ecx
80100706:	75 76                	jne    8010077e <cprintf+0xce>
80100708:	8d 47 04             	lea    0x4(%edi),%eax
8010070b:	b9 01 00 00 00       	mov    $0x1,%ecx
80100710:	ba 0a 00 00 00       	mov    $0xa,%edx
80100715:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100718:	8b 07                	mov    (%edi),%eax
8010071a:	e8 01 ff ff ff       	call   80100620 <printint>
8010071f:	8b 7d e0             	mov    -0x20(%ebp),%edi
80100722:	83 c3 01             	add    $0x1,%ebx
80100725:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100729:	85 c0                	test   %eax,%eax
8010072b:	75 b6                	jne    801006e3 <cprintf+0x33>
8010072d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100730:	85 ff                	test   %edi,%edi
80100732:	0f 85 bb 00 00 00    	jne    801007f3 <cprintf+0x143>
80100738:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010073b:	5b                   	pop    %ebx
8010073c:	5e                   	pop    %esi
8010073d:	5f                   	pop    %edi
8010073e:	5d                   	pop    %ebp
8010073f:	c3                   	ret
80100740:	8b 0d 58 99 11 80    	mov    0x80119958,%ecx
80100746:	85 c9                	test   %ecx,%ecx
80100748:	74 19                	je     80100763 <cprintf+0xb3>
8010074a:	fa                   	cli
8010074b:	eb fe                	jmp    8010074b <cprintf+0x9b>
8010074d:	8d 76 00             	lea    0x0(%esi),%esi
80100750:	8b 0d 58 99 11 80    	mov    0x80119958,%ecx
80100756:	85 c9                	test   %ecx,%ecx
80100758:	0f 85 f2 00 00 00    	jne    80100850 <cprintf+0x1a0>
8010075e:	b8 25 00 00 00       	mov    $0x25,%eax
80100763:	e8 98 fc ff ff       	call   80100400 <consputc.part.0>
80100768:	eb b8                	jmp    80100722 <cprintf+0x72>
8010076a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100770:	83 f9 73             	cmp    $0x73,%ecx
80100773:	0f 84 8f 00 00 00    	je     80100808 <cprintf+0x158>
80100779:	83 f9 78             	cmp    $0x78,%ecx
8010077c:	74 32                	je     801007b0 <cprintf+0x100>
8010077e:	8b 15 58 99 11 80    	mov    0x80119958,%edx
80100784:	85 d2                	test   %edx,%edx
80100786:	0f 85 b8 00 00 00    	jne    80100844 <cprintf+0x194>
8010078c:	b8 25 00 00 00       	mov    $0x25,%eax
80100791:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100794:	e8 67 fc ff ff       	call   80100400 <consputc.part.0>
80100799:	a1 58 99 11 80       	mov    0x80119958,%eax
8010079e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801007a1:	85 c0                	test   %eax,%eax
801007a3:	0f 84 cd 00 00 00    	je     80100876 <cprintf+0x1c6>
801007a9:	fa                   	cli
801007aa:	eb fe                	jmp    801007aa <cprintf+0xfa>
801007ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801007b0:	8d 47 04             	lea    0x4(%edi),%eax
801007b3:	31 c9                	xor    %ecx,%ecx
801007b5:	ba 10 00 00 00       	mov    $0x10,%edx
801007ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
801007bd:	8b 07                	mov    (%edi),%eax
801007bf:	e8 5c fe ff ff       	call   80100620 <printint>
801007c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801007c7:	e9 56 ff ff ff       	jmp    80100722 <cprintf+0x72>
801007cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801007d0:	83 ec 0c             	sub    $0xc,%esp
801007d3:	68 20 99 11 80       	push   $0x80119920
801007d8:	e8 63 3d 00 00       	call   80104540 <acquire>
801007dd:	83 c4 10             	add    $0x10,%esp
801007e0:	85 f6                	test   %esi,%esi
801007e2:	0f 84 a1 00 00 00    	je     80100889 <cprintf+0x1d9>
801007e8:	0f b6 06             	movzbl (%esi),%eax
801007eb:	85 c0                	test   %eax,%eax
801007ed:	0f 85 e6 fe ff ff    	jne    801006d9 <cprintf+0x29>
801007f3:	83 ec 0c             	sub    $0xc,%esp
801007f6:	68 20 99 11 80       	push   $0x80119920
801007fb:	e8 a0 3e 00 00       	call   801046a0 <release>
80100800:	83 c4 10             	add    $0x10,%esp
80100803:	e9 30 ff ff ff       	jmp    80100738 <cprintf+0x88>
80100808:	8b 17                	mov    (%edi),%edx
8010080a:	8d 47 04             	lea    0x4(%edi),%eax
8010080d:	85 d2                	test   %edx,%edx
8010080f:	74 27                	je     80100838 <cprintf+0x188>
80100811:	0f b6 0a             	movzbl (%edx),%ecx
80100814:	89 d7                	mov    %edx,%edi
80100816:	84 c9                	test   %cl,%cl
80100818:	74 68                	je     80100882 <cprintf+0x1d2>
8010081a:	89 5d e0             	mov    %ebx,-0x20(%ebp)
8010081d:	89 fb                	mov    %edi,%ebx
8010081f:	89 f7                	mov    %esi,%edi
80100821:	89 c6                	mov    %eax,%esi
80100823:	0f be c1             	movsbl %cl,%eax
80100826:	8b 15 58 99 11 80    	mov    0x80119958,%edx
8010082c:	85 d2                	test   %edx,%edx
8010082e:	74 28                	je     80100858 <cprintf+0x1a8>
80100830:	fa                   	cli
80100831:	eb fe                	jmp    80100831 <cprintf+0x181>
80100833:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100838:	b9 28 00 00 00       	mov    $0x28,%ecx
8010083d:	bf 78 72 10 80       	mov    $0x80107278,%edi
80100842:	eb d6                	jmp    8010081a <cprintf+0x16a>
80100844:	fa                   	cli
80100845:	eb fe                	jmp    80100845 <cprintf+0x195>
80100847:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010084e:	00 
8010084f:	90                   	nop
80100850:	fa                   	cli
80100851:	eb fe                	jmp    80100851 <cprintf+0x1a1>
80100853:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100858:	e8 a3 fb ff ff       	call   80100400 <consputc.part.0>
8010085d:	0f be 43 01          	movsbl 0x1(%ebx),%eax
80100861:	83 c3 01             	add    $0x1,%ebx
80100864:	84 c0                	test   %al,%al
80100866:	75 be                	jne    80100826 <cprintf+0x176>
80100868:	89 f0                	mov    %esi,%eax
8010086a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
8010086d:	89 fe                	mov    %edi,%esi
8010086f:	89 c7                	mov    %eax,%edi
80100871:	e9 ac fe ff ff       	jmp    80100722 <cprintf+0x72>
80100876:	89 c8                	mov    %ecx,%eax
80100878:	e8 83 fb ff ff       	call   80100400 <consputc.part.0>
8010087d:	e9 a0 fe ff ff       	jmp    80100722 <cprintf+0x72>
80100882:	89 c7                	mov    %eax,%edi
80100884:	e9 99 fe ff ff       	jmp    80100722 <cprintf+0x72>
80100889:	83 ec 0c             	sub    $0xc,%esp
8010088c:	68 7f 72 10 80       	push   $0x8010727f
80100891:	e8 ea fa ff ff       	call   80100380 <panic>
80100896:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010089d:	00 
8010089e:	66 90                	xchg   %ax,%ax

801008a0 <consoleintr>:
801008a0:	55                   	push   %ebp
801008a1:	89 e5                	mov    %esp,%ebp
801008a3:	57                   	push   %edi
801008a4:	31 ff                	xor    %edi,%edi
801008a6:	56                   	push   %esi
801008a7:	53                   	push   %ebx
801008a8:	83 ec 18             	sub    $0x18,%esp
801008ab:	8b 75 08             	mov    0x8(%ebp),%esi
801008ae:	68 20 99 11 80       	push   $0x80119920
801008b3:	e8 88 3c 00 00       	call   80104540 <acquire>
801008b8:	83 c4 10             	add    $0x10,%esp
801008bb:	ff d6                	call   *%esi
801008bd:	89 c3                	mov    %eax,%ebx
801008bf:	85 c0                	test   %eax,%eax
801008c1:	78 22                	js     801008e5 <consoleintr+0x45>
801008c3:	83 fb 15             	cmp    $0x15,%ebx
801008c6:	74 47                	je     8010090f <consoleintr+0x6f>
801008c8:	7f 76                	jg     80100940 <consoleintr+0xa0>
801008ca:	83 fb 08             	cmp    $0x8,%ebx
801008cd:	74 76                	je     80100945 <consoleintr+0xa5>
801008cf:	83 fb 10             	cmp    $0x10,%ebx
801008d2:	0f 85 f8 00 00 00    	jne    801009d0 <consoleintr+0x130>
801008d8:	ff d6                	call   *%esi
801008da:	bf 01 00 00 00       	mov    $0x1,%edi
801008df:	89 c3                	mov    %eax,%ebx
801008e1:	85 c0                	test   %eax,%eax
801008e3:	79 de                	jns    801008c3 <consoleintr+0x23>
801008e5:	83 ec 0c             	sub    $0xc,%esp
801008e8:	68 20 99 11 80       	push   $0x80119920
801008ed:	e8 ae 3d 00 00       	call   801046a0 <release>
801008f2:	83 c4 10             	add    $0x10,%esp
801008f5:	85 ff                	test   %edi,%edi
801008f7:	0f 85 4b 01 00 00    	jne    80100a48 <consoleintr+0x1a8>
801008fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100900:	5b                   	pop    %ebx
80100901:	5e                   	pop    %esi
80100902:	5f                   	pop    %edi
80100903:	5d                   	pop    %ebp
80100904:	c3                   	ret
80100905:	b8 00 01 00 00       	mov    $0x100,%eax
8010090a:	e8 f1 fa ff ff       	call   80100400 <consputc.part.0>
8010090f:	a1 08 99 11 80       	mov    0x80119908,%eax
80100914:	3b 05 04 99 11 80    	cmp    0x80119904,%eax
8010091a:	74 9f                	je     801008bb <consoleintr+0x1b>
8010091c:	83 e8 01             	sub    $0x1,%eax
8010091f:	89 c2                	mov    %eax,%edx
80100921:	83 e2 7f             	and    $0x7f,%edx
80100924:	80 ba 80 98 11 80 0a 	cmpb   $0xa,-0x7fee6780(%edx)
8010092b:	74 8e                	je     801008bb <consoleintr+0x1b>
8010092d:	8b 15 58 99 11 80    	mov    0x80119958,%edx
80100933:	a3 08 99 11 80       	mov    %eax,0x80119908
80100938:	85 d2                	test   %edx,%edx
8010093a:	74 c9                	je     80100905 <consoleintr+0x65>
8010093c:	fa                   	cli
8010093d:	eb fe                	jmp    8010093d <consoleintr+0x9d>
8010093f:	90                   	nop
80100940:	83 fb 7f             	cmp    $0x7f,%ebx
80100943:	75 2b                	jne    80100970 <consoleintr+0xd0>
80100945:	a1 08 99 11 80       	mov    0x80119908,%eax
8010094a:	3b 05 04 99 11 80    	cmp    0x80119904,%eax
80100950:	0f 84 65 ff ff ff    	je     801008bb <consoleintr+0x1b>
80100956:	83 e8 01             	sub    $0x1,%eax
80100959:	a3 08 99 11 80       	mov    %eax,0x80119908
8010095e:	a1 58 99 11 80       	mov    0x80119958,%eax
80100963:	85 c0                	test   %eax,%eax
80100965:	0f 84 ce 00 00 00    	je     80100a39 <consoleintr+0x199>
8010096b:	fa                   	cli
8010096c:	eb fe                	jmp    8010096c <consoleintr+0xcc>
8010096e:	66 90                	xchg   %ax,%ax
80100970:	a1 08 99 11 80       	mov    0x80119908,%eax
80100975:	89 c2                	mov    %eax,%edx
80100977:	2b 15 00 99 11 80    	sub    0x80119900,%edx
8010097d:	83 fa 7f             	cmp    $0x7f,%edx
80100980:	0f 87 35 ff ff ff    	ja     801008bb <consoleintr+0x1b>
80100986:	8b 0d 58 99 11 80    	mov    0x80119958,%ecx
8010098c:	8d 50 01             	lea    0x1(%eax),%edx
8010098f:	83 e0 7f             	and    $0x7f,%eax
80100992:	89 15 08 99 11 80    	mov    %edx,0x80119908
80100998:	88 98 80 98 11 80    	mov    %bl,-0x7fee6780(%eax)
8010099e:	85 c9                	test   %ecx,%ecx
801009a0:	0f 85 ae 00 00 00    	jne    80100a54 <consoleintr+0x1b4>
801009a6:	89 d8                	mov    %ebx,%eax
801009a8:	e8 53 fa ff ff       	call   80100400 <consputc.part.0>
801009ad:	83 fb 0a             	cmp    $0xa,%ebx
801009b0:	74 68                	je     80100a1a <consoleintr+0x17a>
801009b2:	83 fb 04             	cmp    $0x4,%ebx
801009b5:	74 63                	je     80100a1a <consoleintr+0x17a>
801009b7:	a1 00 99 11 80       	mov    0x80119900,%eax
801009bc:	83 e8 80             	sub    $0xffffff80,%eax
801009bf:	39 05 08 99 11 80    	cmp    %eax,0x80119908
801009c5:	0f 85 f0 fe ff ff    	jne    801008bb <consoleintr+0x1b>
801009cb:	eb 52                	jmp    80100a1f <consoleintr+0x17f>
801009cd:	8d 76 00             	lea    0x0(%esi),%esi
801009d0:	85 db                	test   %ebx,%ebx
801009d2:	0f 84 e3 fe ff ff    	je     801008bb <consoleintr+0x1b>
801009d8:	a1 08 99 11 80       	mov    0x80119908,%eax
801009dd:	89 c2                	mov    %eax,%edx
801009df:	2b 15 00 99 11 80    	sub    0x80119900,%edx
801009e5:	83 fa 7f             	cmp    $0x7f,%edx
801009e8:	0f 87 cd fe ff ff    	ja     801008bb <consoleintr+0x1b>
801009ee:	8d 50 01             	lea    0x1(%eax),%edx
801009f1:	8b 0d 58 99 11 80    	mov    0x80119958,%ecx
801009f7:	83 e0 7f             	and    $0x7f,%eax
801009fa:	83 fb 0d             	cmp    $0xd,%ebx
801009fd:	75 93                	jne    80100992 <consoleintr+0xf2>
801009ff:	89 15 08 99 11 80    	mov    %edx,0x80119908
80100a05:	c6 80 80 98 11 80 0a 	movb   $0xa,-0x7fee6780(%eax)
80100a0c:	85 c9                	test   %ecx,%ecx
80100a0e:	75 44                	jne    80100a54 <consoleintr+0x1b4>
80100a10:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a15:	e8 e6 f9 ff ff       	call   80100400 <consputc.part.0>
80100a1a:	a1 08 99 11 80       	mov    0x80119908,%eax
80100a1f:	83 ec 0c             	sub    $0xc,%esp
80100a22:	a3 04 99 11 80       	mov    %eax,0x80119904
80100a27:	68 00 99 11 80       	push   $0x80119900
80100a2c:	e8 1f 36 00 00       	call   80104050 <wakeup>
80100a31:	83 c4 10             	add    $0x10,%esp
80100a34:	e9 82 fe ff ff       	jmp    801008bb <consoleintr+0x1b>
80100a39:	b8 00 01 00 00       	mov    $0x100,%eax
80100a3e:	e8 bd f9 ff ff       	call   80100400 <consputc.part.0>
80100a43:	e9 73 fe ff ff       	jmp    801008bb <consoleintr+0x1b>
80100a48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a4b:	5b                   	pop    %ebx
80100a4c:	5e                   	pop    %esi
80100a4d:	5f                   	pop    %edi
80100a4e:	5d                   	pop    %ebp
80100a4f:	e9 dc 36 00 00       	jmp    80104130 <procdump>
80100a54:	fa                   	cli
80100a55:	eb fe                	jmp    80100a55 <consoleintr+0x1b5>
80100a57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100a5e:	00 
80100a5f:	90                   	nop

80100a60 <consoleinit>:
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
80100a66:	68 88 72 10 80       	push   $0x80107288
80100a6b:	68 20 99 11 80       	push   $0x80119920
80100a70:	e8 9b 39 00 00       	call   80104410 <initlock>
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
80100a7b:	c7 05 0c a3 11 80 b0 	movl   $0x801005b0,0x8011a30c
80100a82:	05 10 80 
80100a85:	c7 05 08 a3 11 80 80 	movl   $0x80100280,0x8011a308
80100a8c:	02 10 80 
80100a8f:	c7 05 54 99 11 80 01 	movl   $0x1,0x80119954
80100a96:	00 00 00 
80100a99:	e8 e2 19 00 00       	call   80102480 <ioapicenable>
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave
80100aa2:	c3                   	ret
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100abc:	e8 ff 2d 00 00       	call   801038c0 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ac7:	e8 c4 21 00 00       	call   80102c90 <begin_op>
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	push   0x8(%ebp)
80100ad2:	e8 c9 15 00 00       	call   801020a0 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 30 03 00 00    	je     80100e12 <exec+0x362>
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c7                	mov    %eax,%edi
80100ae7:	50                   	push   %eax
80100ae8:	e8 d3 0c 00 00       	call   801017c0 <ilock>
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	57                   	push   %edi
80100af9:	e8 d2 0f 00 00       	call   80101ad0 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	0f 85 01 01 00 00    	jne    80100c0b <exec+0x15b>
80100b0a:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b11:	45 4c 46 
80100b14:	0f 85 f1 00 00 00    	jne    80100c0b <exec+0x15b>
80100b1a:	e8 d1 63 00 00       	call   80106ef0 <setupkvm>
80100b1f:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b25:	85 c0                	test   %eax,%eax
80100b27:	0f 84 de 00 00 00    	je     80100c0b <exec+0x15b>
80100b2d:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b34:	00 
80100b35:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b3b:	0f 84 a1 02 00 00    	je     80100de2 <exec+0x332>
80100b41:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b48:	00 00 00 
80100b4b:	31 db                	xor    %ebx,%ebx
80100b4d:	e9 8c 00 00 00       	jmp    80100bde <exec+0x12e>
80100b52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b58:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b5f:	75 6c                	jne    80100bcd <exec+0x11d>
80100b61:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b67:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b6d:	0f 82 87 00 00 00    	jb     80100bfa <exec+0x14a>
80100b73:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b79:	72 7f                	jb     80100bfa <exec+0x14a>
80100b7b:	83 ec 04             	sub    $0x4,%esp
80100b7e:	50                   	push   %eax
80100b7f:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100b85:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100b8b:	e8 90 61 00 00       	call   80106d20 <allocuvm>
80100b90:	83 c4 10             	add    $0x10,%esp
80100b93:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b99:	85 c0                	test   %eax,%eax
80100b9b:	74 5d                	je     80100bfa <exec+0x14a>
80100b9d:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100ba3:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100ba8:	75 50                	jne    80100bfa <exec+0x14a>
80100baa:	83 ec 0c             	sub    $0xc,%esp
80100bad:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100bb3:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100bb9:	57                   	push   %edi
80100bba:	50                   	push   %eax
80100bbb:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100bc1:	e8 8a 60 00 00       	call   80106c50 <loaduvm>
80100bc6:	83 c4 20             	add    $0x20,%esp
80100bc9:	85 c0                	test   %eax,%eax
80100bcb:	78 2d                	js     80100bfa <exec+0x14a>
80100bcd:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bd4:	83 c3 01             	add    $0x1,%ebx
80100bd7:	83 c6 20             	add    $0x20,%esi
80100bda:	39 d8                	cmp    %ebx,%eax
80100bdc:	7e 52                	jle    80100c30 <exec+0x180>
80100bde:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100be4:	6a 20                	push   $0x20
80100be6:	56                   	push   %esi
80100be7:	50                   	push   %eax
80100be8:	57                   	push   %edi
80100be9:	e8 e2 0e 00 00       	call   80101ad0 <readi>
80100bee:	83 c4 10             	add    $0x10,%esp
80100bf1:	83 f8 20             	cmp    $0x20,%eax
80100bf4:	0f 84 5e ff ff ff    	je     80100b58 <exec+0xa8>
80100bfa:	83 ec 0c             	sub    $0xc,%esp
80100bfd:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100c03:	e8 68 62 00 00       	call   80106e70 <freevm>
80100c08:	83 c4 10             	add    $0x10,%esp
80100c0b:	83 ec 0c             	sub    $0xc,%esp
80100c0e:	57                   	push   %edi
80100c0f:	e8 3c 0e 00 00       	call   80101a50 <iunlockput>
80100c14:	e8 e7 20 00 00       	call   80102d00 <end_op>
80100c19:	83 c4 10             	add    $0x10,%esp
80100c1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100c24:	5b                   	pop    %ebx
80100c25:	5e                   	pop    %esi
80100c26:	5f                   	pop    %edi
80100c27:	5d                   	pop    %ebp
80100c28:	c3                   	ret
80100c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100c30:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c36:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100c3c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100c42:	8d 9e 00 20 00 00    	lea    0x2000(%esi),%ebx
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	57                   	push   %edi
80100c4c:	e8 ff 0d 00 00       	call   80101a50 <iunlockput>
80100c51:	e8 aa 20 00 00       	call   80102d00 <end_op>
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	53                   	push   %ebx
80100c5a:	56                   	push   %esi
80100c5b:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c61:	56                   	push   %esi
80100c62:	e8 b9 60 00 00       	call   80106d20 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c7                	mov    %eax,%edi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 86 00 00 00    	je     80100cfa <exec+0x24a>
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c7d:	89 fb                	mov    %edi,%ebx
80100c7f:	50                   	push   %eax
80100c80:	56                   	push   %esi
80100c81:	31 f6                	xor    %esi,%esi
80100c83:	e8 08 63 00 00       	call   80106f90 <clearpteu>
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8b 10                	mov    (%eax),%edx
80100c90:	85 d2                	test   %edx,%edx
80100c92:	0f 84 56 01 00 00    	je     80100dee <exec+0x33e>
80100c98:	89 bd f0 fe ff ff    	mov    %edi,-0x110(%ebp)
80100c9e:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100ca1:	eb 23                	jmp    80100cc6 <exec+0x216>
80100ca3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100ca8:	8d 46 01             	lea    0x1(%esi),%eax
80100cab:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
80100cb2:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100cb8:	8b 14 87             	mov    (%edi,%eax,4),%edx
80100cbb:	85 d2                	test   %edx,%edx
80100cbd:	74 51                	je     80100d10 <exec+0x260>
80100cbf:	83 f8 20             	cmp    $0x20,%eax
80100cc2:	74 36                	je     80100cfa <exec+0x24a>
80100cc4:	89 c6                	mov    %eax,%esi
80100cc6:	83 ec 0c             	sub    $0xc,%esp
80100cc9:	52                   	push   %edx
80100cca:	e8 11 3c 00 00       	call   801048e0 <strlen>
80100ccf:	29 c3                	sub    %eax,%ebx
80100cd1:	58                   	pop    %eax
80100cd2:	ff 34 b7             	push   (%edi,%esi,4)
80100cd5:	83 eb 01             	sub    $0x1,%ebx
80100cd8:	83 e3 fc             	and    $0xfffffffc,%ebx
80100cdb:	e8 00 3c 00 00       	call   801048e0 <strlen>
80100ce0:	83 c0 01             	add    $0x1,%eax
80100ce3:	50                   	push   %eax
80100ce4:	ff 34 b7             	push   (%edi,%esi,4)
80100ce7:	53                   	push   %ebx
80100ce8:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100cee:	e8 5d 64 00 00       	call   80107150 <copyout>
80100cf3:	83 c4 20             	add    $0x20,%esp
80100cf6:	85 c0                	test   %eax,%eax
80100cf8:	79 ae                	jns    80100ca8 <exec+0x1f8>
80100cfa:	83 ec 0c             	sub    $0xc,%esp
80100cfd:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d03:	e8 68 61 00 00       	call   80106e70 <freevm>
80100d08:	83 c4 10             	add    $0x10,%esp
80100d0b:	e9 0c ff ff ff       	jmp    80100c1c <exec+0x16c>
80100d10:	8d 14 b5 08 00 00 00 	lea    0x8(,%esi,4),%edx
80100d17:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100d1d:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100d23:	8d 46 04             	lea    0x4(%esi),%eax
80100d26:	8d 72 0c             	lea    0xc(%edx),%esi
80100d29:	c7 84 85 58 ff ff ff 	movl   $0x0,-0xa8(%ebp,%eax,4)
80100d30:	00 00 00 00 
80100d34:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100d3a:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d41:	ff ff ff 
80100d44:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
80100d4a:	89 d8                	mov    %ebx,%eax
80100d4c:	29 f3                	sub    %esi,%ebx
80100d4e:	29 d0                	sub    %edx,%eax
80100d50:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
80100d56:	56                   	push   %esi
80100d57:	51                   	push   %ecx
80100d58:	53                   	push   %ebx
80100d59:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d5f:	e8 ec 63 00 00       	call   80107150 <copyout>
80100d64:	83 c4 10             	add    $0x10,%esp
80100d67:	85 c0                	test   %eax,%eax
80100d69:	78 8f                	js     80100cfa <exec+0x24a>
80100d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80100d6e:	8b 55 08             	mov    0x8(%ebp),%edx
80100d71:	0f b6 00             	movzbl (%eax),%eax
80100d74:	84 c0                	test   %al,%al
80100d76:	74 17                	je     80100d8f <exec+0x2df>
80100d78:	89 d1                	mov    %edx,%ecx
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
80100d85:	0f b6 01             	movzbl (%ecx),%eax
80100d88:	0f 44 d1             	cmove  %ecx,%edx
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
80100d8f:	83 ec 04             	sub    $0x4,%esp
80100d92:	6a 10                	push   $0x10
80100d94:	52                   	push   %edx
80100d95:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100d9b:	8d 46 6c             	lea    0x6c(%esi),%eax
80100d9e:	50                   	push   %eax
80100d9f:	e8 fc 3a 00 00       	call   801048a0 <safestrcpy>
80100da4:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100daa:	89 f0                	mov    %esi,%eax
80100dac:	8b 76 04             	mov    0x4(%esi),%esi
80100daf:	89 38                	mov    %edi,(%eax)
80100db1:	89 48 04             	mov    %ecx,0x4(%eax)
80100db4:	89 c1                	mov    %eax,%ecx
80100db6:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbc:	8b 40 18             	mov    0x18(%eax),%eax
80100dbf:	89 50 38             	mov    %edx,0x38(%eax)
80100dc2:	8b 41 18             	mov    0x18(%ecx),%eax
80100dc5:	89 58 44             	mov    %ebx,0x44(%eax)
80100dc8:	89 0c 24             	mov    %ecx,(%esp)
80100dcb:	e8 f0 5c 00 00       	call   80106ac0 <switchuvm>
80100dd0:	89 34 24             	mov    %esi,(%esp)
80100dd3:	e8 98 60 00 00       	call   80106e70 <freevm>
80100dd8:	83 c4 10             	add    $0x10,%esp
80100ddb:	31 c0                	xor    %eax,%eax
80100ddd:	e9 3f fe ff ff       	jmp    80100c21 <exec+0x171>
80100de2:	bb 00 20 00 00       	mov    $0x2000,%ebx
80100de7:	31 f6                	xor    %esi,%esi
80100de9:	e9 5a fe ff ff       	jmp    80100c48 <exec+0x198>
80100dee:	be 10 00 00 00       	mov    $0x10,%esi
80100df3:	ba 04 00 00 00       	mov    $0x4,%edx
80100df8:	b8 03 00 00 00       	mov    $0x3,%eax
80100dfd:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100e04:	00 00 00 
80100e07:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100e0d:	e9 17 ff ff ff       	jmp    80100d29 <exec+0x279>
80100e12:	e8 e9 1e 00 00       	call   80102d00 <end_op>
80100e17:	83 ec 0c             	sub    $0xc,%esp
80100e1a:	68 a1 72 10 80       	push   $0x801072a1
80100e1f:	e8 8c f8 ff ff       	call   801006b0 <cprintf>
80100e24:	83 c4 10             	add    $0x10,%esp
80100e27:	e9 f0 fd ff ff       	jmp    80100c1c <exec+0x16c>
80100e2c:	66 90                	xchg   %ax,%ax
80100e2e:	66 90                	xchg   %ax,%ax

80100e30 <fileinit>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	83 ec 10             	sub    $0x10,%esp
80100e36:	68 ad 72 10 80       	push   $0x801072ad
80100e3b:	68 60 99 11 80       	push   $0x80119960
80100e40:	e8 cb 35 00 00       	call   80104410 <initlock>
80100e45:	83 c4 10             	add    $0x10,%esp
80100e48:	c9                   	leave
80100e49:	c3                   	ret
80100e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e50 <filealloc>:
80100e50:	55                   	push   %ebp
80100e51:	89 e5                	mov    %esp,%ebp
80100e53:	53                   	push   %ebx
80100e54:	bb 94 99 11 80       	mov    $0x80119994,%ebx
80100e59:	83 ec 10             	sub    $0x10,%esp
80100e5c:	68 60 99 11 80       	push   $0x80119960
80100e61:	e8 da 36 00 00       	call   80104540 <acquire>
80100e66:	83 c4 10             	add    $0x10,%esp
80100e69:	eb 10                	jmp    80100e7b <filealloc+0x2b>
80100e6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100e70:	83 c3 18             	add    $0x18,%ebx
80100e73:	81 fb f4 a2 11 80    	cmp    $0x8011a2f4,%ebx
80100e79:	74 25                	je     80100ea0 <filealloc+0x50>
80100e7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e7e:	85 c0                	test   %eax,%eax
80100e80:	75 ee                	jne    80100e70 <filealloc+0x20>
80100e82:	83 ec 0c             	sub    $0xc,%esp
80100e85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100e8c:	68 60 99 11 80       	push   $0x80119960
80100e91:	e8 0a 38 00 00       	call   801046a0 <release>
80100e96:	89 d8                	mov    %ebx,%eax
80100e98:	83 c4 10             	add    $0x10,%esp
80100e9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e9e:	c9                   	leave
80100e9f:	c3                   	ret
80100ea0:	83 ec 0c             	sub    $0xc,%esp
80100ea3:	31 db                	xor    %ebx,%ebx
80100ea5:	68 60 99 11 80       	push   $0x80119960
80100eaa:	e8 f1 37 00 00       	call   801046a0 <release>
80100eaf:	89 d8                	mov    %ebx,%eax
80100eb1:	83 c4 10             	add    $0x10,%esp
80100eb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100eb7:	c9                   	leave
80100eb8:	c3                   	ret
80100eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ec0 <filedup>:
80100ec0:	55                   	push   %ebp
80100ec1:	89 e5                	mov    %esp,%ebp
80100ec3:	53                   	push   %ebx
80100ec4:	83 ec 10             	sub    $0x10,%esp
80100ec7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eca:	68 60 99 11 80       	push   $0x80119960
80100ecf:	e8 6c 36 00 00       	call   80104540 <acquire>
80100ed4:	8b 43 04             	mov    0x4(%ebx),%eax
80100ed7:	83 c4 10             	add    $0x10,%esp
80100eda:	85 c0                	test   %eax,%eax
80100edc:	7e 1a                	jle    80100ef8 <filedup+0x38>
80100ede:	83 c0 01             	add    $0x1,%eax
80100ee1:	83 ec 0c             	sub    $0xc,%esp
80100ee4:	89 43 04             	mov    %eax,0x4(%ebx)
80100ee7:	68 60 99 11 80       	push   $0x80119960
80100eec:	e8 af 37 00 00       	call   801046a0 <release>
80100ef1:	89 d8                	mov    %ebx,%eax
80100ef3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ef6:	c9                   	leave
80100ef7:	c3                   	ret
80100ef8:	83 ec 0c             	sub    $0xc,%esp
80100efb:	68 b4 72 10 80       	push   $0x801072b4
80100f00:	e8 7b f4 ff ff       	call   80100380 <panic>
80100f05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100f0c:	00 
80100f0d:	8d 76 00             	lea    0x0(%esi),%esi

80100f10 <fileclose>:
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	57                   	push   %edi
80100f14:	56                   	push   %esi
80100f15:	53                   	push   %ebx
80100f16:	83 ec 28             	sub    $0x28,%esp
80100f19:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f1c:	68 60 99 11 80       	push   $0x80119960
80100f21:	e8 1a 36 00 00       	call   80104540 <acquire>
80100f26:	8b 53 04             	mov    0x4(%ebx),%edx
80100f29:	83 c4 10             	add    $0x10,%esp
80100f2c:	85 d2                	test   %edx,%edx
80100f2e:	0f 8e a5 00 00 00    	jle    80100fd9 <fileclose+0xc9>
80100f34:	83 ea 01             	sub    $0x1,%edx
80100f37:	89 53 04             	mov    %edx,0x4(%ebx)
80100f3a:	75 44                	jne    80100f80 <fileclose+0x70>
80100f3c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100f40:	83 ec 0c             	sub    $0xc,%esp
80100f43:	8b 3b                	mov    (%ebx),%edi
80100f45:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100f4b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f4e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f51:	8b 43 10             	mov    0x10(%ebx),%eax
80100f54:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f57:	68 60 99 11 80       	push   $0x80119960
80100f5c:	e8 3f 37 00 00       	call   801046a0 <release>
80100f61:	83 c4 10             	add    $0x10,%esp
80100f64:	83 ff 01             	cmp    $0x1,%edi
80100f67:	74 57                	je     80100fc0 <fileclose+0xb0>
80100f69:	83 ff 02             	cmp    $0x2,%edi
80100f6c:	74 2a                	je     80100f98 <fileclose+0x88>
80100f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f71:	5b                   	pop    %ebx
80100f72:	5e                   	pop    %esi
80100f73:	5f                   	pop    %edi
80100f74:	5d                   	pop    %ebp
80100f75:	c3                   	ret
80100f76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100f7d:	00 
80100f7e:	66 90                	xchg   %ax,%ax
80100f80:	c7 45 08 60 99 11 80 	movl   $0x80119960,0x8(%ebp)
80100f87:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8a:	5b                   	pop    %ebx
80100f8b:	5e                   	pop    %esi
80100f8c:	5f                   	pop    %edi
80100f8d:	5d                   	pop    %ebp
80100f8e:	e9 0d 37 00 00       	jmp    801046a0 <release>
80100f93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100f98:	e8 f3 1c 00 00       	call   80102c90 <begin_op>
80100f9d:	83 ec 0c             	sub    $0xc,%esp
80100fa0:	ff 75 e0             	push   -0x20(%ebp)
80100fa3:	e8 48 09 00 00       	call   801018f0 <iput>
80100fa8:	83 c4 10             	add    $0x10,%esp
80100fab:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fae:	5b                   	pop    %ebx
80100faf:	5e                   	pop    %esi
80100fb0:	5f                   	pop    %edi
80100fb1:	5d                   	pop    %ebp
80100fb2:	e9 49 1d 00 00       	jmp    80102d00 <end_op>
80100fb7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100fbe:	00 
80100fbf:	90                   	nop
80100fc0:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100fc4:	83 ec 08             	sub    $0x8,%esp
80100fc7:	53                   	push   %ebx
80100fc8:	56                   	push   %esi
80100fc9:	e8 82 24 00 00       	call   80103450 <pipeclose>
80100fce:	83 c4 10             	add    $0x10,%esp
80100fd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fd4:	5b                   	pop    %ebx
80100fd5:	5e                   	pop    %esi
80100fd6:	5f                   	pop    %edi
80100fd7:	5d                   	pop    %ebp
80100fd8:	c3                   	ret
80100fd9:	83 ec 0c             	sub    $0xc,%esp
80100fdc:	68 bc 72 10 80       	push   $0x801072bc
80100fe1:	e8 9a f3 ff ff       	call   80100380 <panic>
80100fe6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100fed:	00 
80100fee:	66 90                	xchg   %ax,%ax

80100ff0 <filestat>:
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	53                   	push   %ebx
80100ff4:	83 ec 04             	sub    $0x4,%esp
80100ff7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100ffa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100ffd:	75 31                	jne    80101030 <filestat+0x40>
80100fff:	83 ec 0c             	sub    $0xc,%esp
80101002:	ff 73 10             	push   0x10(%ebx)
80101005:	e8 b6 07 00 00       	call   801017c0 <ilock>
8010100a:	58                   	pop    %eax
8010100b:	5a                   	pop    %edx
8010100c:	ff 75 0c             	push   0xc(%ebp)
8010100f:	ff 73 10             	push   0x10(%ebx)
80101012:	e8 89 0a 00 00       	call   80101aa0 <stati>
80101017:	59                   	pop    %ecx
80101018:	ff 73 10             	push   0x10(%ebx)
8010101b:	e8 80 08 00 00       	call   801018a0 <iunlock>
80101020:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101023:	83 c4 10             	add    $0x10,%esp
80101026:	31 c0                	xor    %eax,%eax
80101028:	c9                   	leave
80101029:	c3                   	ret
8010102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101030:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101033:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101038:	c9                   	leave
80101039:	c3                   	ret
8010103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101040 <fileread>:
80101040:	55                   	push   %ebp
80101041:	89 e5                	mov    %esp,%ebp
80101043:	57                   	push   %edi
80101044:	56                   	push   %esi
80101045:	53                   	push   %ebx
80101046:	83 ec 0c             	sub    $0xc,%esp
80101049:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010104c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010104f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101052:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101056:	74 60                	je     801010b8 <fileread+0x78>
80101058:	8b 03                	mov    (%ebx),%eax
8010105a:	83 f8 01             	cmp    $0x1,%eax
8010105d:	74 41                	je     801010a0 <fileread+0x60>
8010105f:	83 f8 02             	cmp    $0x2,%eax
80101062:	75 5b                	jne    801010bf <fileread+0x7f>
80101064:	83 ec 0c             	sub    $0xc,%esp
80101067:	ff 73 10             	push   0x10(%ebx)
8010106a:	e8 51 07 00 00       	call   801017c0 <ilock>
8010106f:	57                   	push   %edi
80101070:	ff 73 14             	push   0x14(%ebx)
80101073:	56                   	push   %esi
80101074:	ff 73 10             	push   0x10(%ebx)
80101077:	e8 54 0a 00 00       	call   80101ad0 <readi>
8010107c:	83 c4 20             	add    $0x20,%esp
8010107f:	89 c6                	mov    %eax,%esi
80101081:	85 c0                	test   %eax,%eax
80101083:	7e 03                	jle    80101088 <fileread+0x48>
80101085:	01 43 14             	add    %eax,0x14(%ebx)
80101088:	83 ec 0c             	sub    $0xc,%esp
8010108b:	ff 73 10             	push   0x10(%ebx)
8010108e:	e8 0d 08 00 00       	call   801018a0 <iunlock>
80101093:	83 c4 10             	add    $0x10,%esp
80101096:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101099:	89 f0                	mov    %esi,%eax
8010109b:	5b                   	pop    %ebx
8010109c:	5e                   	pop    %esi
8010109d:	5f                   	pop    %edi
8010109e:	5d                   	pop    %ebp
8010109f:	c3                   	ret
801010a0:	8b 43 0c             	mov    0xc(%ebx),%eax
801010a3:	89 45 08             	mov    %eax,0x8(%ebp)
801010a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a9:	5b                   	pop    %ebx
801010aa:	5e                   	pop    %esi
801010ab:	5f                   	pop    %edi
801010ac:	5d                   	pop    %ebp
801010ad:	e9 5e 25 00 00       	jmp    80103610 <piperead>
801010b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801010b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
801010bd:	eb d7                	jmp    80101096 <fileread+0x56>
801010bf:	83 ec 0c             	sub    $0xc,%esp
801010c2:	68 c6 72 10 80       	push   $0x801072c6
801010c7:	e8 b4 f2 ff ff       	call   80100380 <panic>
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010d0 <filewrite>:
801010d0:	55                   	push   %ebp
801010d1:	89 e5                	mov    %esp,%ebp
801010d3:	57                   	push   %edi
801010d4:	56                   	push   %esi
801010d5:	53                   	push   %ebx
801010d6:	83 ec 1c             	sub    $0x1c,%esp
801010d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801010df:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010e2:	8b 45 10             	mov    0x10(%ebp),%eax
801010e5:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
801010e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801010ec:	0f 84 bb 00 00 00    	je     801011ad <filewrite+0xdd>
801010f2:	8b 03                	mov    (%ebx),%eax
801010f4:	83 f8 01             	cmp    $0x1,%eax
801010f7:	0f 84 bf 00 00 00    	je     801011bc <filewrite+0xec>
801010fd:	83 f8 02             	cmp    $0x2,%eax
80101100:	0f 85 c8 00 00 00    	jne    801011ce <filewrite+0xfe>
80101106:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101109:	31 f6                	xor    %esi,%esi
8010110b:	85 c0                	test   %eax,%eax
8010110d:	7f 30                	jg     8010113f <filewrite+0x6f>
8010110f:	e9 94 00 00 00       	jmp    801011a8 <filewrite+0xd8>
80101114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101118:	01 43 14             	add    %eax,0x14(%ebx)
8010111b:	83 ec 0c             	sub    $0xc,%esp
8010111e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101121:	ff 73 10             	push   0x10(%ebx)
80101124:	e8 77 07 00 00       	call   801018a0 <iunlock>
80101129:	e8 d2 1b 00 00       	call   80102d00 <end_op>
8010112e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101131:	83 c4 10             	add    $0x10,%esp
80101134:	39 c7                	cmp    %eax,%edi
80101136:	75 5c                	jne    80101194 <filewrite+0xc4>
80101138:	01 fe                	add    %edi,%esi
8010113a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010113d:	7e 69                	jle    801011a8 <filewrite+0xd8>
8010113f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101142:	b8 00 06 00 00       	mov    $0x600,%eax
80101147:	29 f7                	sub    %esi,%edi
80101149:	39 c7                	cmp    %eax,%edi
8010114b:	0f 4f f8             	cmovg  %eax,%edi
8010114e:	e8 3d 1b 00 00       	call   80102c90 <begin_op>
80101153:	83 ec 0c             	sub    $0xc,%esp
80101156:	ff 73 10             	push   0x10(%ebx)
80101159:	e8 62 06 00 00       	call   801017c0 <ilock>
8010115e:	57                   	push   %edi
8010115f:	ff 73 14             	push   0x14(%ebx)
80101162:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101165:	01 f0                	add    %esi,%eax
80101167:	50                   	push   %eax
80101168:	ff 73 10             	push   0x10(%ebx)
8010116b:	e8 60 0a 00 00       	call   80101bd0 <writei>
80101170:	83 c4 20             	add    $0x20,%esp
80101173:	85 c0                	test   %eax,%eax
80101175:	7f a1                	jg     80101118 <filewrite+0x48>
80101177:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010117a:	83 ec 0c             	sub    $0xc,%esp
8010117d:	ff 73 10             	push   0x10(%ebx)
80101180:	e8 1b 07 00 00       	call   801018a0 <iunlock>
80101185:	e8 76 1b 00 00       	call   80102d00 <end_op>
8010118a:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010118d:	83 c4 10             	add    $0x10,%esp
80101190:	85 c0                	test   %eax,%eax
80101192:	75 14                	jne    801011a8 <filewrite+0xd8>
80101194:	83 ec 0c             	sub    $0xc,%esp
80101197:	68 cf 72 10 80       	push   $0x801072cf
8010119c:	e8 df f1 ff ff       	call   80100380 <panic>
801011a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801011a8:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801011ab:	74 05                	je     801011b2 <filewrite+0xe2>
801011ad:	be ff ff ff ff       	mov    $0xffffffff,%esi
801011b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011b5:	89 f0                	mov    %esi,%eax
801011b7:	5b                   	pop    %ebx
801011b8:	5e                   	pop    %esi
801011b9:	5f                   	pop    %edi
801011ba:	5d                   	pop    %ebp
801011bb:	c3                   	ret
801011bc:	8b 43 0c             	mov    0xc(%ebx),%eax
801011bf:	89 45 08             	mov    %eax,0x8(%ebp)
801011c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011c5:	5b                   	pop    %ebx
801011c6:	5e                   	pop    %esi
801011c7:	5f                   	pop    %edi
801011c8:	5d                   	pop    %ebp
801011c9:	e9 22 23 00 00       	jmp    801034f0 <pipewrite>
801011ce:	83 ec 0c             	sub    $0xc,%esp
801011d1:	68 d5 72 10 80       	push   $0x801072d5
801011d6:	e8 a5 f1 ff ff       	call   80100380 <panic>
801011db:	66 90                	xchg   %ax,%ax
801011dd:	66 90                	xchg   %ax,%ax
801011df:	90                   	nop

801011e0 <balloc>:
801011e0:	55                   	push   %ebp
801011e1:	89 e5                	mov    %esp,%ebp
801011e3:	57                   	push   %edi
801011e4:	56                   	push   %esi
801011e5:	53                   	push   %ebx
801011e6:	83 ec 1c             	sub    $0x1c,%esp
801011e9:	8b 0d b4 bf 11 80    	mov    0x8011bfb4,%ecx
801011ef:	89 45 dc             	mov    %eax,-0x24(%ebp)
801011f2:	85 c9                	test   %ecx,%ecx
801011f4:	0f 84 8c 00 00 00    	je     80101286 <balloc+0xa6>
801011fa:	31 ff                	xor    %edi,%edi
801011fc:	89 f8                	mov    %edi,%eax
801011fe:	83 ec 08             	sub    $0x8,%esp
80101201:	89 fe                	mov    %edi,%esi
80101203:	c1 f8 0e             	sar    $0xe,%eax
80101206:	03 05 cc bf 11 80    	add    0x8011bfcc,%eax
8010120c:	50                   	push   %eax
8010120d:	ff 75 dc             	push   -0x24(%ebp)
80101210:	e8 bb ee ff ff       	call   801000d0 <bread>
80101215:	89 7d d8             	mov    %edi,-0x28(%ebp)
80101218:	83 c4 10             	add    $0x10,%esp
8010121b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010121e:	a1 b4 bf 11 80       	mov    0x8011bfb4,%eax
80101223:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101226:	31 c0                	xor    %eax,%eax
80101228:	eb 32                	jmp    8010125c <balloc+0x7c>
8010122a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101230:	89 c1                	mov    %eax,%ecx
80101232:	bb 01 00 00 00       	mov    $0x1,%ebx
80101237:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010123a:	83 e1 07             	and    $0x7,%ecx
8010123d:	d3 e3                	shl    %cl,%ebx
8010123f:	89 c1                	mov    %eax,%ecx
80101241:	c1 f9 03             	sar    $0x3,%ecx
80101244:	0f b6 7c 0f 5c       	movzbl 0x5c(%edi,%ecx,1),%edi
80101249:	89 fa                	mov    %edi,%edx
8010124b:	85 df                	test   %ebx,%edi
8010124d:	74 49                	je     80101298 <balloc+0xb8>
8010124f:	83 c0 01             	add    $0x1,%eax
80101252:	83 c6 01             	add    $0x1,%esi
80101255:	3d 00 40 00 00       	cmp    $0x4000,%eax
8010125a:	74 07                	je     80101263 <balloc+0x83>
8010125c:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010125f:	39 d6                	cmp    %edx,%esi
80101261:	72 cd                	jb     80101230 <balloc+0x50>
80101263:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101266:	83 ec 0c             	sub    $0xc,%esp
80101269:	ff 75 e4             	push   -0x1c(%ebp)
8010126c:	81 c7 00 40 00 00    	add    $0x4000,%edi
80101272:	e8 79 ef ff ff       	call   801001f0 <brelse>
80101277:	83 c4 10             	add    $0x10,%esp
8010127a:	3b 3d b4 bf 11 80    	cmp    0x8011bfb4,%edi
80101280:	0f 82 76 ff ff ff    	jb     801011fc <balloc+0x1c>
80101286:	83 ec 0c             	sub    $0xc,%esp
80101289:	68 df 72 10 80       	push   $0x801072df
8010128e:	e8 ed f0 ff ff       	call   80100380 <panic>
80101293:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80101298:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010129b:	83 ec 0c             	sub    $0xc,%esp
8010129e:	09 da                	or     %ebx,%edx
801012a0:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801012a4:	57                   	push   %edi
801012a5:	e8 c6 1b 00 00       	call   80102e70 <log_write>
801012aa:	89 3c 24             	mov    %edi,(%esp)
801012ad:	e8 3e ef ff ff       	call   801001f0 <brelse>
801012b2:	58                   	pop    %eax
801012b3:	5a                   	pop    %edx
801012b4:	56                   	push   %esi
801012b5:	ff 75 dc             	push   -0x24(%ebp)
801012b8:	e8 13 ee ff ff       	call   801000d0 <bread>
801012bd:	83 c4 0c             	add    $0xc,%esp
801012c0:	89 c3                	mov    %eax,%ebx
801012c2:	8d 40 5c             	lea    0x5c(%eax),%eax
801012c5:	68 00 08 00 00       	push   $0x800
801012ca:	6a 00                	push   $0x0
801012cc:	50                   	push   %eax
801012cd:	e8 1e 34 00 00       	call   801046f0 <memset>
801012d2:	89 1c 24             	mov    %ebx,(%esp)
801012d5:	e8 96 1b 00 00       	call   80102e70 <log_write>
801012da:	89 1c 24             	mov    %ebx,(%esp)
801012dd:	e8 0e ef ff ff       	call   801001f0 <brelse>
801012e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012e5:	89 f0                	mov    %esi,%eax
801012e7:	5b                   	pop    %ebx
801012e8:	5e                   	pop    %esi
801012e9:	5f                   	pop    %edi
801012ea:	5d                   	pop    %ebp
801012eb:	c3                   	ret
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <iget>:
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	31 ff                	xor    %edi,%edi
801012f6:	56                   	push   %esi
801012f7:	89 c6                	mov    %eax,%esi
801012f9:	53                   	push   %ebx
801012fa:	bb 94 a3 11 80       	mov    $0x8011a394,%ebx
801012ff:	83 ec 28             	sub    $0x28,%esp
80101302:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101305:	68 60 a3 11 80       	push   $0x8011a360
8010130a:	e8 31 32 00 00       	call   80104540 <acquire>
8010130f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101312:	83 c4 10             	add    $0x10,%esp
80101315:	eb 1b                	jmp    80101332 <iget+0x42>
80101317:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010131e:	00 
8010131f:	90                   	nop
80101320:	39 33                	cmp    %esi,(%ebx)
80101322:	74 6c                	je     80101390 <iget+0xa0>
80101324:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010132a:	81 fb b4 bf 11 80    	cmp    $0x8011bfb4,%ebx
80101330:	74 26                	je     80101358 <iget+0x68>
80101332:	8b 43 08             	mov    0x8(%ebx),%eax
80101335:	85 c0                	test   %eax,%eax
80101337:	7f e7                	jg     80101320 <iget+0x30>
80101339:	85 ff                	test   %edi,%edi
8010133b:	75 e7                	jne    80101324 <iget+0x34>
8010133d:	85 c0                	test   %eax,%eax
8010133f:	75 76                	jne    801013b7 <iget+0xc7>
80101341:	89 df                	mov    %ebx,%edi
80101343:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101349:	81 fb b4 bf 11 80    	cmp    $0x8011bfb4,%ebx
8010134f:	75 e1                	jne    80101332 <iget+0x42>
80101351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101358:	85 ff                	test   %edi,%edi
8010135a:	74 79                	je     801013d5 <iget+0xe5>
8010135c:	83 ec 0c             	sub    $0xc,%esp
8010135f:	89 37                	mov    %esi,(%edi)
80101361:	89 57 04             	mov    %edx,0x4(%edi)
80101364:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%edi)
8010136b:	c7 47 4c 00 00 00 00 	movl   $0x0,0x4c(%edi)
80101372:	68 60 a3 11 80       	push   $0x8011a360
80101377:	e8 24 33 00 00       	call   801046a0 <release>
8010137c:	83 c4 10             	add    $0x10,%esp
8010137f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101382:	89 f8                	mov    %edi,%eax
80101384:	5b                   	pop    %ebx
80101385:	5e                   	pop    %esi
80101386:	5f                   	pop    %edi
80101387:	5d                   	pop    %ebp
80101388:	c3                   	ret
80101389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101390:	39 53 04             	cmp    %edx,0x4(%ebx)
80101393:	75 8f                	jne    80101324 <iget+0x34>
80101395:	83 c0 01             	add    $0x1,%eax
80101398:	83 ec 0c             	sub    $0xc,%esp
8010139b:	89 df                	mov    %ebx,%edi
8010139d:	89 43 08             	mov    %eax,0x8(%ebx)
801013a0:	68 60 a3 11 80       	push   $0x8011a360
801013a5:	e8 f6 32 00 00       	call   801046a0 <release>
801013aa:	83 c4 10             	add    $0x10,%esp
801013ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013b0:	89 f8                	mov    %edi,%eax
801013b2:	5b                   	pop    %ebx
801013b3:	5e                   	pop    %esi
801013b4:	5f                   	pop    %edi
801013b5:	5d                   	pop    %ebp
801013b6:	c3                   	ret
801013b7:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013bd:	81 fb b4 bf 11 80    	cmp    $0x8011bfb4,%ebx
801013c3:	74 10                	je     801013d5 <iget+0xe5>
801013c5:	8b 43 08             	mov    0x8(%ebx),%eax
801013c8:	85 c0                	test   %eax,%eax
801013ca:	0f 8f 50 ff ff ff    	jg     80101320 <iget+0x30>
801013d0:	e9 68 ff ff ff       	jmp    8010133d <iget+0x4d>
801013d5:	83 ec 0c             	sub    $0xc,%esp
801013d8:	68 f5 72 10 80       	push   $0x801072f5
801013dd:	e8 9e ef ff ff       	call   80100380 <panic>
801013e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801013e9:	00 
801013ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801013f0 <bmap>:
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	57                   	push   %edi
801013f4:	56                   	push   %esi
801013f5:	89 c6                	mov    %eax,%esi
801013f7:	53                   	push   %ebx
801013f8:	83 ec 1c             	sub    $0x1c,%esp
801013fb:	83 fa 0b             	cmp    $0xb,%edx
801013fe:	0f 86 8c 00 00 00    	jbe    80101490 <bmap+0xa0>
80101404:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101407:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
8010140d:	0f 87 9f 00 00 00    	ja     801014b2 <bmap+0xc2>
80101413:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101419:	85 c0                	test   %eax,%eax
8010141b:	74 5b                	je     80101478 <bmap+0x88>
8010141d:	83 ec 08             	sub    $0x8,%esp
80101420:	50                   	push   %eax
80101421:	ff 36                	push   (%esi)
80101423:	e8 a8 ec ff ff       	call   801000d0 <bread>
80101428:	83 c4 10             	add    $0x10,%esp
8010142b:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
8010142f:	89 c2                	mov    %eax,%edx
80101431:	8b 3b                	mov    (%ebx),%edi
80101433:	85 ff                	test   %edi,%edi
80101435:	74 19                	je     80101450 <bmap+0x60>
80101437:	83 ec 0c             	sub    $0xc,%esp
8010143a:	52                   	push   %edx
8010143b:	e8 b0 ed ff ff       	call   801001f0 <brelse>
80101440:	83 c4 10             	add    $0x10,%esp
80101443:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101446:	89 f8                	mov    %edi,%eax
80101448:	5b                   	pop    %ebx
80101449:	5e                   	pop    %esi
8010144a:	5f                   	pop    %edi
8010144b:	5d                   	pop    %ebp
8010144c:	c3                   	ret
8010144d:	8d 76 00             	lea    0x0(%esi),%esi
80101450:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101453:	8b 06                	mov    (%esi),%eax
80101455:	e8 86 fd ff ff       	call   801011e0 <balloc>
8010145a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010145d:	83 ec 0c             	sub    $0xc,%esp
80101460:	89 03                	mov    %eax,(%ebx)
80101462:	89 c7                	mov    %eax,%edi
80101464:	52                   	push   %edx
80101465:	e8 06 1a 00 00       	call   80102e70 <log_write>
8010146a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010146d:	83 c4 10             	add    $0x10,%esp
80101470:	eb c5                	jmp    80101437 <bmap+0x47>
80101472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101478:	8b 06                	mov    (%esi),%eax
8010147a:	e8 61 fd ff ff       	call   801011e0 <balloc>
8010147f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101485:	eb 96                	jmp    8010141d <bmap+0x2d>
80101487:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010148e:	00 
8010148f:	90                   	nop
80101490:	8d 5a 14             	lea    0x14(%edx),%ebx
80101493:	8b 7c 98 0c          	mov    0xc(%eax,%ebx,4),%edi
80101497:	85 ff                	test   %edi,%edi
80101499:	75 a8                	jne    80101443 <bmap+0x53>
8010149b:	8b 00                	mov    (%eax),%eax
8010149d:	e8 3e fd ff ff       	call   801011e0 <balloc>
801014a2:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
801014a6:	89 c7                	mov    %eax,%edi
801014a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014ab:	5b                   	pop    %ebx
801014ac:	89 f8                	mov    %edi,%eax
801014ae:	5e                   	pop    %esi
801014af:	5f                   	pop    %edi
801014b0:	5d                   	pop    %ebp
801014b1:	c3                   	ret
801014b2:	83 ec 0c             	sub    $0xc,%esp
801014b5:	68 05 73 10 80       	push   $0x80107305
801014ba:	e8 c1 ee ff ff       	call   80100380 <panic>
801014bf:	90                   	nop

801014c0 <bfree>:
801014c0:	55                   	push   %ebp
801014c1:	89 e5                	mov    %esp,%ebp
801014c3:	57                   	push   %edi
801014c4:	56                   	push   %esi
801014c5:	89 c6                	mov    %eax,%esi
801014c7:	53                   	push   %ebx
801014c8:	89 d3                	mov    %edx,%ebx
801014ca:	83 ec 14             	sub    $0x14,%esp
801014cd:	6a 01                	push   $0x1
801014cf:	50                   	push   %eax
801014d0:	e8 fb eb ff ff       	call   801000d0 <bread>
801014d5:	83 c4 0c             	add    $0xc,%esp
801014d8:	89 c7                	mov    %eax,%edi
801014da:	83 c0 5c             	add    $0x5c,%eax
801014dd:	6a 1c                	push   $0x1c
801014df:	50                   	push   %eax
801014e0:	68 b4 bf 11 80       	push   $0x8011bfb4
801014e5:	e8 96 32 00 00       	call   80104780 <memmove>
801014ea:	89 3c 24             	mov    %edi,(%esp)
801014ed:	e8 fe ec ff ff       	call   801001f0 <brelse>
801014f2:	58                   	pop    %eax
801014f3:	89 d8                	mov    %ebx,%eax
801014f5:	5a                   	pop    %edx
801014f6:	c1 e8 0e             	shr    $0xe,%eax
801014f9:	03 05 cc bf 11 80    	add    0x8011bfcc,%eax
801014ff:	50                   	push   %eax
80101500:	56                   	push   %esi
80101501:	e8 ca eb ff ff       	call   801000d0 <bread>
80101506:	89 d9                	mov    %ebx,%ecx
80101508:	c1 fb 03             	sar    $0x3,%ebx
8010150b:	83 c4 10             	add    $0x10,%esp
8010150e:	89 c6                	mov    %eax,%esi
80101510:	83 e1 07             	and    $0x7,%ecx
80101513:	b8 01 00 00 00       	mov    $0x1,%eax
80101518:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
8010151e:	d3 e0                	shl    %cl,%eax
80101520:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
80101525:	85 c1                	test   %eax,%ecx
80101527:	74 24                	je     8010154d <bfree+0x8d>
80101529:	f7 d0                	not    %eax
8010152b:	83 ec 0c             	sub    $0xc,%esp
8010152e:	21 c8                	and    %ecx,%eax
80101530:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
80101534:	56                   	push   %esi
80101535:	e8 36 19 00 00       	call   80102e70 <log_write>
8010153a:	89 34 24             	mov    %esi,(%esp)
8010153d:	e8 ae ec ff ff       	call   801001f0 <brelse>
80101542:	83 c4 10             	add    $0x10,%esp
80101545:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101548:	5b                   	pop    %ebx
80101549:	5e                   	pop    %esi
8010154a:	5f                   	pop    %edi
8010154b:	5d                   	pop    %ebp
8010154c:	c3                   	ret
8010154d:	83 ec 0c             	sub    $0xc,%esp
80101550:	68 18 73 10 80       	push   $0x80107318
80101555:	e8 26 ee ff ff       	call   80100380 <panic>
8010155a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101560 <readsb>:
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	56                   	push   %esi
80101564:	53                   	push   %ebx
80101565:	8b 75 0c             	mov    0xc(%ebp),%esi
80101568:	83 ec 08             	sub    $0x8,%esp
8010156b:	6a 01                	push   $0x1
8010156d:	ff 75 08             	push   0x8(%ebp)
80101570:	e8 5b eb ff ff       	call   801000d0 <bread>
80101575:	83 c4 0c             	add    $0xc,%esp
80101578:	89 c3                	mov    %eax,%ebx
8010157a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010157d:	6a 1c                	push   $0x1c
8010157f:	50                   	push   %eax
80101580:	56                   	push   %esi
80101581:	e8 fa 31 00 00       	call   80104780 <memmove>
80101586:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101589:	83 c4 10             	add    $0x10,%esp
8010158c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010158f:	5b                   	pop    %ebx
80101590:	5e                   	pop    %esi
80101591:	5d                   	pop    %ebp
80101592:	e9 59 ec ff ff       	jmp    801001f0 <brelse>
80101597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010159e:	00 
8010159f:	90                   	nop

801015a0 <iinit>:
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	53                   	push   %ebx
801015a4:	bb a0 a3 11 80       	mov    $0x8011a3a0,%ebx
801015a9:	83 ec 0c             	sub    $0xc,%esp
801015ac:	68 2b 73 10 80       	push   $0x8010732b
801015b1:	68 60 a3 11 80       	push   $0x8011a360
801015b6:	e8 55 2e 00 00       	call   80104410 <initlock>
801015bb:	83 c4 10             	add    $0x10,%esp
801015be:	66 90                	xchg   %ax,%ax
801015c0:	83 ec 08             	sub    $0x8,%esp
801015c3:	68 32 73 10 80       	push   $0x80107332
801015c8:	53                   	push   %ebx
801015c9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801015cf:	e8 2c 2d 00 00       	call   80104300 <initsleeplock>
801015d4:	83 c4 10             	add    $0x10,%esp
801015d7:	81 fb c0 bf 11 80    	cmp    $0x8011bfc0,%ebx
801015dd:	75 e1                	jne    801015c0 <iinit+0x20>
801015df:	83 ec 08             	sub    $0x8,%esp
801015e2:	6a 01                	push   $0x1
801015e4:	ff 75 08             	push   0x8(%ebp)
801015e7:	e8 e4 ea ff ff       	call   801000d0 <bread>
801015ec:	83 c4 0c             	add    $0xc,%esp
801015ef:	89 c3                	mov    %eax,%ebx
801015f1:	8d 40 5c             	lea    0x5c(%eax),%eax
801015f4:	6a 1c                	push   $0x1c
801015f6:	50                   	push   %eax
801015f7:	68 b4 bf 11 80       	push   $0x8011bfb4
801015fc:	e8 7f 31 00 00       	call   80104780 <memmove>
80101601:	89 1c 24             	mov    %ebx,(%esp)
80101604:	e8 e7 eb ff ff       	call   801001f0 <brelse>
80101609:	ff 35 cc bf 11 80    	push   0x8011bfcc
8010160f:	ff 35 c8 bf 11 80    	push   0x8011bfc8
80101615:	ff 35 c4 bf 11 80    	push   0x8011bfc4
8010161b:	ff 35 c0 bf 11 80    	push   0x8011bfc0
80101621:	ff 35 bc bf 11 80    	push   0x8011bfbc
80101627:	ff 35 b8 bf 11 80    	push   0x8011bfb8
8010162d:	ff 35 b4 bf 11 80    	push   0x8011bfb4
80101633:	68 98 73 10 80       	push   $0x80107398
80101638:	e8 73 f0 ff ff       	call   801006b0 <cprintf>
8010163d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101640:	83 c4 30             	add    $0x30,%esp
80101643:	c9                   	leave
80101644:	c3                   	ret
80101645:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010164c:	00 
8010164d:	8d 76 00             	lea    0x0(%esi),%esi

80101650 <ialloc>:
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	57                   	push   %edi
80101654:	56                   	push   %esi
80101655:	53                   	push   %ebx
80101656:	83 ec 1c             	sub    $0x1c,%esp
80101659:	8b 45 0c             	mov    0xc(%ebp),%eax
8010165c:	83 3d bc bf 11 80 01 	cmpl   $0x1,0x8011bfbc
80101663:	8b 75 08             	mov    0x8(%ebp),%esi
80101666:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101669:	0f 86 91 00 00 00    	jbe    80101700 <ialloc+0xb0>
8010166f:	bf 01 00 00 00       	mov    $0x1,%edi
80101674:	eb 21                	jmp    80101697 <ialloc+0x47>
80101676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010167d:	00 
8010167e:	66 90                	xchg   %ax,%ax
80101680:	83 ec 0c             	sub    $0xc,%esp
80101683:	83 c7 01             	add    $0x1,%edi
80101686:	53                   	push   %ebx
80101687:	e8 64 eb ff ff       	call   801001f0 <brelse>
8010168c:	83 c4 10             	add    $0x10,%esp
8010168f:	3b 3d bc bf 11 80    	cmp    0x8011bfbc,%edi
80101695:	73 69                	jae    80101700 <ialloc+0xb0>
80101697:	89 f8                	mov    %edi,%eax
80101699:	83 ec 08             	sub    $0x8,%esp
8010169c:	c1 e8 05             	shr    $0x5,%eax
8010169f:	03 05 c8 bf 11 80    	add    0x8011bfc8,%eax
801016a5:	50                   	push   %eax
801016a6:	56                   	push   %esi
801016a7:	e8 24 ea ff ff       	call   801000d0 <bread>
801016ac:	83 c4 10             	add    $0x10,%esp
801016af:	89 c3                	mov    %eax,%ebx
801016b1:	89 f8                	mov    %edi,%eax
801016b3:	83 e0 1f             	and    $0x1f,%eax
801016b6:	c1 e0 06             	shl    $0x6,%eax
801016b9:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
801016bd:	66 83 39 00          	cmpw   $0x0,(%ecx)
801016c1:	75 bd                	jne    80101680 <ialloc+0x30>
801016c3:	83 ec 04             	sub    $0x4,%esp
801016c6:	6a 40                	push   $0x40
801016c8:	6a 00                	push   $0x0
801016ca:	51                   	push   %ecx
801016cb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801016ce:	e8 1d 30 00 00       	call   801046f0 <memset>
801016d3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801016d7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801016da:	66 89 01             	mov    %ax,(%ecx)
801016dd:	89 1c 24             	mov    %ebx,(%esp)
801016e0:	e8 8b 17 00 00       	call   80102e70 <log_write>
801016e5:	89 1c 24             	mov    %ebx,(%esp)
801016e8:	e8 03 eb ff ff       	call   801001f0 <brelse>
801016ed:	83 c4 10             	add    $0x10,%esp
801016f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016f3:	89 fa                	mov    %edi,%edx
801016f5:	5b                   	pop    %ebx
801016f6:	89 f0                	mov    %esi,%eax
801016f8:	5e                   	pop    %esi
801016f9:	5f                   	pop    %edi
801016fa:	5d                   	pop    %ebp
801016fb:	e9 f0 fb ff ff       	jmp    801012f0 <iget>
80101700:	83 ec 0c             	sub    $0xc,%esp
80101703:	68 38 73 10 80       	push   $0x80107338
80101708:	e8 73 ec ff ff       	call   80100380 <panic>
8010170d:	8d 76 00             	lea    0x0(%esi),%esi

80101710 <iupdate>:
80101710:	55                   	push   %ebp
80101711:	89 e5                	mov    %esp,%ebp
80101713:	56                   	push   %esi
80101714:	53                   	push   %ebx
80101715:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101718:	8b 43 04             	mov    0x4(%ebx),%eax
8010171b:	83 c3 5c             	add    $0x5c,%ebx
8010171e:	83 ec 08             	sub    $0x8,%esp
80101721:	c1 e8 05             	shr    $0x5,%eax
80101724:	03 05 c8 bf 11 80    	add    0x8011bfc8,%eax
8010172a:	50                   	push   %eax
8010172b:	ff 73 a4             	push   -0x5c(%ebx)
8010172e:	e8 9d e9 ff ff       	call   801000d0 <bread>
80101733:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
80101737:	83 c4 0c             	add    $0xc,%esp
8010173a:	89 c6                	mov    %eax,%esi
8010173c:	8b 43 a8             	mov    -0x58(%ebx),%eax
8010173f:	83 e0 1f             	and    $0x1f,%eax
80101742:	c1 e0 06             	shl    $0x6,%eax
80101745:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101749:	66 89 10             	mov    %dx,(%eax)
8010174c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101750:	83 c0 0c             	add    $0xc,%eax
80101753:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101757:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010175b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010175f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101763:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101767:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010176a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010176d:	6a 34                	push   $0x34
8010176f:	53                   	push   %ebx
80101770:	50                   	push   %eax
80101771:	e8 0a 30 00 00       	call   80104780 <memmove>
80101776:	89 34 24             	mov    %esi,(%esp)
80101779:	e8 f2 16 00 00       	call   80102e70 <log_write>
8010177e:	89 75 08             	mov    %esi,0x8(%ebp)
80101781:	83 c4 10             	add    $0x10,%esp
80101784:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101787:	5b                   	pop    %ebx
80101788:	5e                   	pop    %esi
80101789:	5d                   	pop    %ebp
8010178a:	e9 61 ea ff ff       	jmp    801001f0 <brelse>
8010178f:	90                   	nop

80101790 <idup>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	53                   	push   %ebx
80101794:	83 ec 10             	sub    $0x10,%esp
80101797:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010179a:	68 60 a3 11 80       	push   $0x8011a360
8010179f:	e8 9c 2d 00 00       	call   80104540 <acquire>
801017a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
801017a8:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
801017af:	e8 ec 2e 00 00       	call   801046a0 <release>
801017b4:	89 d8                	mov    %ebx,%eax
801017b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801017b9:	c9                   	leave
801017ba:	c3                   	ret
801017bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801017c0 <ilock>:
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	56                   	push   %esi
801017c4:	53                   	push   %ebx
801017c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017c8:	85 db                	test   %ebx,%ebx
801017ca:	0f 84 b7 00 00 00    	je     80101887 <ilock+0xc7>
801017d0:	8b 53 08             	mov    0x8(%ebx),%edx
801017d3:	85 d2                	test   %edx,%edx
801017d5:	0f 8e ac 00 00 00    	jle    80101887 <ilock+0xc7>
801017db:	83 ec 0c             	sub    $0xc,%esp
801017de:	8d 43 0c             	lea    0xc(%ebx),%eax
801017e1:	50                   	push   %eax
801017e2:	e8 59 2b 00 00       	call   80104340 <acquiresleep>
801017e7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801017ea:	83 c4 10             	add    $0x10,%esp
801017ed:	85 c0                	test   %eax,%eax
801017ef:	74 0f                	je     80101800 <ilock+0x40>
801017f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017f4:	5b                   	pop    %ebx
801017f5:	5e                   	pop    %esi
801017f6:	5d                   	pop    %ebp
801017f7:	c3                   	ret
801017f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801017ff:	00 
80101800:	8b 43 04             	mov    0x4(%ebx),%eax
80101803:	83 ec 08             	sub    $0x8,%esp
80101806:	c1 e8 05             	shr    $0x5,%eax
80101809:	03 05 c8 bf 11 80    	add    0x8011bfc8,%eax
8010180f:	50                   	push   %eax
80101810:	ff 33                	push   (%ebx)
80101812:	e8 b9 e8 ff ff       	call   801000d0 <bread>
80101817:	83 c4 0c             	add    $0xc,%esp
8010181a:	89 c6                	mov    %eax,%esi
8010181c:	8b 43 04             	mov    0x4(%ebx),%eax
8010181f:	83 e0 1f             	and    $0x1f,%eax
80101822:	c1 e0 06             	shl    $0x6,%eax
80101825:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101829:	0f b7 10             	movzwl (%eax),%edx
8010182c:	83 c0 0c             	add    $0xc,%eax
8010182f:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101833:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101837:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010183b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010183f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101843:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101847:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010184b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010184e:	89 53 58             	mov    %edx,0x58(%ebx)
80101851:	6a 34                	push   $0x34
80101853:	50                   	push   %eax
80101854:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101857:	50                   	push   %eax
80101858:	e8 23 2f 00 00       	call   80104780 <memmove>
8010185d:	89 34 24             	mov    %esi,(%esp)
80101860:	e8 8b e9 ff ff       	call   801001f0 <brelse>
80101865:	83 c4 10             	add    $0x10,%esp
80101868:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010186d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101874:	0f 85 77 ff ff ff    	jne    801017f1 <ilock+0x31>
8010187a:	83 ec 0c             	sub    $0xc,%esp
8010187d:	68 50 73 10 80       	push   $0x80107350
80101882:	e8 f9 ea ff ff       	call   80100380 <panic>
80101887:	83 ec 0c             	sub    $0xc,%esp
8010188a:	68 4a 73 10 80       	push   $0x8010734a
8010188f:	e8 ec ea ff ff       	call   80100380 <panic>
80101894:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010189b:	00 
8010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018a0 <iunlock>:
801018a0:	55                   	push   %ebp
801018a1:	89 e5                	mov    %esp,%ebp
801018a3:	56                   	push   %esi
801018a4:	53                   	push   %ebx
801018a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018a8:	85 db                	test   %ebx,%ebx
801018aa:	74 28                	je     801018d4 <iunlock+0x34>
801018ac:	83 ec 0c             	sub    $0xc,%esp
801018af:	8d 73 0c             	lea    0xc(%ebx),%esi
801018b2:	56                   	push   %esi
801018b3:	e8 28 2b 00 00       	call   801043e0 <holdingsleep>
801018b8:	83 c4 10             	add    $0x10,%esp
801018bb:	85 c0                	test   %eax,%eax
801018bd:	74 15                	je     801018d4 <iunlock+0x34>
801018bf:	8b 43 08             	mov    0x8(%ebx),%eax
801018c2:	85 c0                	test   %eax,%eax
801018c4:	7e 0e                	jle    801018d4 <iunlock+0x34>
801018c6:	89 75 08             	mov    %esi,0x8(%ebp)
801018c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801018cc:	5b                   	pop    %ebx
801018cd:	5e                   	pop    %esi
801018ce:	5d                   	pop    %ebp
801018cf:	e9 cc 2a 00 00       	jmp    801043a0 <releasesleep>
801018d4:	83 ec 0c             	sub    $0xc,%esp
801018d7:	68 5f 73 10 80       	push   $0x8010735f
801018dc:	e8 9f ea ff ff       	call   80100380 <panic>
801018e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801018e8:	00 
801018e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iput>:
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	57                   	push   %edi
801018f4:	56                   	push   %esi
801018f5:	53                   	push   %ebx
801018f6:	83 ec 28             	sub    $0x28,%esp
801018f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018fc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801018ff:	57                   	push   %edi
80101900:	e8 3b 2a 00 00       	call   80104340 <acquiresleep>
80101905:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101908:	83 c4 10             	add    $0x10,%esp
8010190b:	85 d2                	test   %edx,%edx
8010190d:	74 07                	je     80101916 <iput+0x26>
8010190f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101914:	74 32                	je     80101948 <iput+0x58>
80101916:	83 ec 0c             	sub    $0xc,%esp
80101919:	57                   	push   %edi
8010191a:	e8 81 2a 00 00       	call   801043a0 <releasesleep>
8010191f:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
80101926:	e8 15 2c 00 00       	call   80104540 <acquire>
8010192b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
8010192f:	83 c4 10             	add    $0x10,%esp
80101932:	c7 45 08 60 a3 11 80 	movl   $0x8011a360,0x8(%ebp)
80101939:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010193c:	5b                   	pop    %ebx
8010193d:	5e                   	pop    %esi
8010193e:	5f                   	pop    %edi
8010193f:	5d                   	pop    %ebp
80101940:	e9 5b 2d 00 00       	jmp    801046a0 <release>
80101945:	8d 76 00             	lea    0x0(%esi),%esi
80101948:	83 ec 0c             	sub    $0xc,%esp
8010194b:	68 60 a3 11 80       	push   $0x8011a360
80101950:	e8 eb 2b 00 00       	call   80104540 <acquire>
80101955:	8b 73 08             	mov    0x8(%ebx),%esi
80101958:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
8010195f:	e8 3c 2d 00 00       	call   801046a0 <release>
80101964:	83 c4 10             	add    $0x10,%esp
80101967:	83 fe 01             	cmp    $0x1,%esi
8010196a:	75 aa                	jne    80101916 <iput+0x26>
8010196c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101972:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101975:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101978:	89 df                	mov    %ebx,%edi
8010197a:	89 cb                	mov    %ecx,%ebx
8010197c:	eb 09                	jmp    80101987 <iput+0x97>
8010197e:	66 90                	xchg   %ax,%ax
80101980:	83 c6 04             	add    $0x4,%esi
80101983:	39 de                	cmp    %ebx,%esi
80101985:	74 19                	je     801019a0 <iput+0xb0>
80101987:	8b 16                	mov    (%esi),%edx
80101989:	85 d2                	test   %edx,%edx
8010198b:	74 f3                	je     80101980 <iput+0x90>
8010198d:	8b 07                	mov    (%edi),%eax
8010198f:	e8 2c fb ff ff       	call   801014c0 <bfree>
80101994:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010199a:	eb e4                	jmp    80101980 <iput+0x90>
8010199c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019a0:	89 fb                	mov    %edi,%ebx
801019a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019a5:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801019ab:	85 c0                	test   %eax,%eax
801019ad:	75 2d                	jne    801019dc <iput+0xec>
801019af:	83 ec 0c             	sub    $0xc,%esp
801019b2:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801019b9:	53                   	push   %ebx
801019ba:	e8 51 fd ff ff       	call   80101710 <iupdate>
801019bf:	31 c0                	xor    %eax,%eax
801019c1:	66 89 43 50          	mov    %ax,0x50(%ebx)
801019c5:	89 1c 24             	mov    %ebx,(%esp)
801019c8:	e8 43 fd ff ff       	call   80101710 <iupdate>
801019cd:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801019d4:	83 c4 10             	add    $0x10,%esp
801019d7:	e9 3a ff ff ff       	jmp    80101916 <iput+0x26>
801019dc:	83 ec 08             	sub    $0x8,%esp
801019df:	50                   	push   %eax
801019e0:	ff 33                	push   (%ebx)
801019e2:	e8 e9 e6 ff ff       	call   801000d0 <bread>
801019e7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801019ea:	83 c4 10             	add    $0x10,%esp
801019ed:	8d 88 5c 08 00 00    	lea    0x85c(%eax),%ecx
801019f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
801019f6:	8d 70 5c             	lea    0x5c(%eax),%esi
801019f9:	89 cf                	mov    %ecx,%edi
801019fb:	eb 0a                	jmp    80101a07 <iput+0x117>
801019fd:	8d 76 00             	lea    0x0(%esi),%esi
80101a00:	83 c6 04             	add    $0x4,%esi
80101a03:	39 fe                	cmp    %edi,%esi
80101a05:	74 0f                	je     80101a16 <iput+0x126>
80101a07:	8b 16                	mov    (%esi),%edx
80101a09:	85 d2                	test   %edx,%edx
80101a0b:	74 f3                	je     80101a00 <iput+0x110>
80101a0d:	8b 03                	mov    (%ebx),%eax
80101a0f:	e8 ac fa ff ff       	call   801014c0 <bfree>
80101a14:	eb ea                	jmp    80101a00 <iput+0x110>
80101a16:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101a19:	83 ec 0c             	sub    $0xc,%esp
80101a1c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101a1f:	50                   	push   %eax
80101a20:	e8 cb e7 ff ff       	call   801001f0 <brelse>
80101a25:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101a2b:	8b 03                	mov    (%ebx),%eax
80101a2d:	e8 8e fa ff ff       	call   801014c0 <bfree>
80101a32:	83 c4 10             	add    $0x10,%esp
80101a35:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101a3c:	00 00 00 
80101a3f:	e9 6b ff ff ff       	jmp    801019af <iput+0xbf>
80101a44:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101a4b:	00 
80101a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a50 <iunlockput>:
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	56                   	push   %esi
80101a54:	53                   	push   %ebx
80101a55:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101a58:	85 db                	test   %ebx,%ebx
80101a5a:	74 34                	je     80101a90 <iunlockput+0x40>
80101a5c:	83 ec 0c             	sub    $0xc,%esp
80101a5f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101a62:	56                   	push   %esi
80101a63:	e8 78 29 00 00       	call   801043e0 <holdingsleep>
80101a68:	83 c4 10             	add    $0x10,%esp
80101a6b:	85 c0                	test   %eax,%eax
80101a6d:	74 21                	je     80101a90 <iunlockput+0x40>
80101a6f:	8b 43 08             	mov    0x8(%ebx),%eax
80101a72:	85 c0                	test   %eax,%eax
80101a74:	7e 1a                	jle    80101a90 <iunlockput+0x40>
80101a76:	83 ec 0c             	sub    $0xc,%esp
80101a79:	56                   	push   %esi
80101a7a:	e8 21 29 00 00       	call   801043a0 <releasesleep>
80101a7f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a82:	83 c4 10             	add    $0x10,%esp
80101a85:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101a88:	5b                   	pop    %ebx
80101a89:	5e                   	pop    %esi
80101a8a:	5d                   	pop    %ebp
80101a8b:	e9 60 fe ff ff       	jmp    801018f0 <iput>
80101a90:	83 ec 0c             	sub    $0xc,%esp
80101a93:	68 5f 73 10 80       	push   $0x8010735f
80101a98:	e8 e3 e8 ff ff       	call   80100380 <panic>
80101a9d:	8d 76 00             	lea    0x0(%esi),%esi

80101aa0 <stati>:
80101aa0:	55                   	push   %ebp
80101aa1:	89 e5                	mov    %esp,%ebp
80101aa3:	8b 55 08             	mov    0x8(%ebp),%edx
80101aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
80101aa9:	8b 0a                	mov    (%edx),%ecx
80101aab:	89 48 04             	mov    %ecx,0x4(%eax)
80101aae:	8b 4a 04             	mov    0x4(%edx),%ecx
80101ab1:	89 48 08             	mov    %ecx,0x8(%eax)
80101ab4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101ab8:	66 89 08             	mov    %cx,(%eax)
80101abb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101abf:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101ac3:	8b 52 58             	mov    0x58(%edx),%edx
80101ac6:	89 50 10             	mov    %edx,0x10(%eax)
80101ac9:	5d                   	pop    %ebp
80101aca:	c3                   	ret
80101acb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80101ad0 <readi>:
80101ad0:	55                   	push   %ebp
80101ad1:	89 e5                	mov    %esp,%ebp
80101ad3:	57                   	push   %edi
80101ad4:	56                   	push   %esi
80101ad5:	53                   	push   %ebx
80101ad6:	83 ec 1c             	sub    $0x1c,%esp
80101ad9:	8b 75 08             	mov    0x8(%ebp),%esi
80101adc:	8b 45 0c             	mov    0xc(%ebp),%eax
80101adf:	8b 7d 10             	mov    0x10(%ebp),%edi
80101ae2:	66 83 7e 50 03       	cmpw   $0x3,0x50(%esi)
80101ae7:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101aea:	89 75 d8             	mov    %esi,-0x28(%ebp)
80101aed:	8b 45 14             	mov    0x14(%ebp),%eax
80101af0:	0f 84 aa 00 00 00    	je     80101ba0 <readi+0xd0>
80101af6:	8b 75 d8             	mov    -0x28(%ebp),%esi
80101af9:	8b 56 58             	mov    0x58(%esi),%edx
80101afc:	39 fa                	cmp    %edi,%edx
80101afe:	0f 82 bd 00 00 00    	jb     80101bc1 <readi+0xf1>
80101b04:	89 f9                	mov    %edi,%ecx
80101b06:	31 db                	xor    %ebx,%ebx
80101b08:	01 c1                	add    %eax,%ecx
80101b0a:	0f 92 c3             	setb   %bl
80101b0d:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80101b10:	0f 82 ab 00 00 00    	jb     80101bc1 <readi+0xf1>
80101b16:	89 d3                	mov    %edx,%ebx
80101b18:	29 fb                	sub    %edi,%ebx
80101b1a:	39 ca                	cmp    %ecx,%edx
80101b1c:	0f 42 c3             	cmovb  %ebx,%eax
80101b1f:	85 c0                	test   %eax,%eax
80101b21:	74 73                	je     80101b96 <readi+0xc6>
80101b23:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101b26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b30:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101b33:	89 fa                	mov    %edi,%edx
80101b35:	c1 ea 0b             	shr    $0xb,%edx
80101b38:	89 d8                	mov    %ebx,%eax
80101b3a:	e8 b1 f8 ff ff       	call   801013f0 <bmap>
80101b3f:	83 ec 08             	sub    $0x8,%esp
80101b42:	50                   	push   %eax
80101b43:	ff 33                	push   (%ebx)
80101b45:	e8 86 e5 ff ff       	call   801000d0 <bread>
80101b4a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b4d:	b9 00 08 00 00       	mov    $0x800,%ecx
80101b52:	89 c2                	mov    %eax,%edx
80101b54:	89 f8                	mov    %edi,%eax
80101b56:	25 ff 07 00 00       	and    $0x7ff,%eax
80101b5b:	29 f3                	sub    %esi,%ebx
80101b5d:	29 c1                	sub    %eax,%ecx
80101b5f:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101b63:	39 d9                	cmp    %ebx,%ecx
80101b65:	0f 46 d9             	cmovbe %ecx,%ebx
80101b68:	83 c4 0c             	add    $0xc,%esp
80101b6b:	53                   	push   %ebx
80101b6c:	01 de                	add    %ebx,%esi
80101b6e:	01 df                	add    %ebx,%edi
80101b70:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101b73:	50                   	push   %eax
80101b74:	ff 75 e0             	push   -0x20(%ebp)
80101b77:	e8 04 2c 00 00       	call   80104780 <memmove>
80101b7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b7f:	89 14 24             	mov    %edx,(%esp)
80101b82:	e8 69 e6 ff ff       	call   801001f0 <brelse>
80101b87:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b8a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b8d:	83 c4 10             	add    $0x10,%esp
80101b90:	39 de                	cmp    %ebx,%esi
80101b92:	72 9c                	jb     80101b30 <readi+0x60>
80101b94:	89 d8                	mov    %ebx,%eax
80101b96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b99:	5b                   	pop    %ebx
80101b9a:	5e                   	pop    %esi
80101b9b:	5f                   	pop    %edi
80101b9c:	5d                   	pop    %ebp
80101b9d:	c3                   	ret
80101b9e:	66 90                	xchg   %ax,%ax
80101ba0:	0f bf 56 52          	movswl 0x52(%esi),%edx
80101ba4:	66 83 fa 09          	cmp    $0x9,%dx
80101ba8:	77 17                	ja     80101bc1 <readi+0xf1>
80101baa:	8b 14 d5 00 a3 11 80 	mov    -0x7fee5d00(,%edx,8),%edx
80101bb1:	85 d2                	test   %edx,%edx
80101bb3:	74 0c                	je     80101bc1 <readi+0xf1>
80101bb5:	89 45 10             	mov    %eax,0x10(%ebp)
80101bb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bbb:	5b                   	pop    %ebx
80101bbc:	5e                   	pop    %esi
80101bbd:	5f                   	pop    %edi
80101bbe:	5d                   	pop    %ebp
80101bbf:	ff e2                	jmp    *%edx
80101bc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bc6:	eb ce                	jmp    80101b96 <readi+0xc6>
80101bc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101bcf:	00 

80101bd0 <writei>:
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	57                   	push   %edi
80101bd4:	56                   	push   %esi
80101bd5:	53                   	push   %ebx
80101bd6:	83 ec 1c             	sub    $0x1c,%esp
80101bd9:	8b 45 08             	mov    0x8(%ebp),%eax
80101bdc:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101bdf:	8b 75 14             	mov    0x14(%ebp),%esi
80101be2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101be7:	89 7d dc             	mov    %edi,-0x24(%ebp)
80101bea:	89 75 e0             	mov    %esi,-0x20(%ebp)
80101bed:	8b 7d 10             	mov    0x10(%ebp),%edi
80101bf0:	0f 84 ba 00 00 00    	je     80101cb0 <writei+0xe0>
80101bf6:	39 78 58             	cmp    %edi,0x58(%eax)
80101bf9:	0f 82 ea 00 00 00    	jb     80101ce9 <writei+0x119>
80101bff:	8b 75 e0             	mov    -0x20(%ebp),%esi
80101c02:	89 f2                	mov    %esi,%edx
80101c04:	01 fa                	add    %edi,%edx
80101c06:	0f 82 dd 00 00 00    	jb     80101ce9 <writei+0x119>
80101c0c:	81 fa 00 60 10 00    	cmp    $0x106000,%edx
80101c12:	0f 87 d1 00 00 00    	ja     80101ce9 <writei+0x119>
80101c18:	85 f6                	test   %esi,%esi
80101c1a:	0f 84 85 00 00 00    	je     80101ca5 <writei+0xd5>
80101c20:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101c27:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c30:	8b 75 d8             	mov    -0x28(%ebp),%esi
80101c33:	89 fa                	mov    %edi,%edx
80101c35:	c1 ea 0b             	shr    $0xb,%edx
80101c38:	89 f0                	mov    %esi,%eax
80101c3a:	e8 b1 f7 ff ff       	call   801013f0 <bmap>
80101c3f:	83 ec 08             	sub    $0x8,%esp
80101c42:	50                   	push   %eax
80101c43:	ff 36                	push   (%esi)
80101c45:	e8 86 e4 ff ff       	call   801000d0 <bread>
80101c4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101c4d:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101c50:	b9 00 08 00 00       	mov    $0x800,%ecx
80101c55:	89 c6                	mov    %eax,%esi
80101c57:	89 f8                	mov    %edi,%eax
80101c59:	25 ff 07 00 00       	and    $0x7ff,%eax
80101c5e:	29 d3                	sub    %edx,%ebx
80101c60:	29 c1                	sub    %eax,%ecx
80101c62:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101c66:	39 d9                	cmp    %ebx,%ecx
80101c68:	0f 46 d9             	cmovbe %ecx,%ebx
80101c6b:	83 c4 0c             	add    $0xc,%esp
80101c6e:	53                   	push   %ebx
80101c6f:	01 df                	add    %ebx,%edi
80101c71:	ff 75 dc             	push   -0x24(%ebp)
80101c74:	50                   	push   %eax
80101c75:	e8 06 2b 00 00       	call   80104780 <memmove>
80101c7a:	89 34 24             	mov    %esi,(%esp)
80101c7d:	e8 ee 11 00 00       	call   80102e70 <log_write>
80101c82:	89 34 24             	mov    %esi,(%esp)
80101c85:	e8 66 e5 ff ff       	call   801001f0 <brelse>
80101c8a:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c90:	83 c4 10             	add    $0x10,%esp
80101c93:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c96:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101c99:	39 d8                	cmp    %ebx,%eax
80101c9b:	72 93                	jb     80101c30 <writei+0x60>
80101c9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101ca0:	39 78 58             	cmp    %edi,0x58(%eax)
80101ca3:	72 33                	jb     80101cd8 <writei+0x108>
80101ca5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ca8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101cab:	5b                   	pop    %ebx
80101cac:	5e                   	pop    %esi
80101cad:	5f                   	pop    %edi
80101cae:	5d                   	pop    %ebp
80101caf:	c3                   	ret
80101cb0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101cb4:	66 83 f8 09          	cmp    $0x9,%ax
80101cb8:	77 2f                	ja     80101ce9 <writei+0x119>
80101cba:	8b 04 c5 04 a3 11 80 	mov    -0x7fee5cfc(,%eax,8),%eax
80101cc1:	85 c0                	test   %eax,%eax
80101cc3:	74 24                	je     80101ce9 <writei+0x119>
80101cc5:	89 75 10             	mov    %esi,0x10(%ebp)
80101cc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ccb:	5b                   	pop    %ebx
80101ccc:	5e                   	pop    %esi
80101ccd:	5f                   	pop    %edi
80101cce:	5d                   	pop    %ebp
80101ccf:	ff e0                	jmp    *%eax
80101cd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cd8:	83 ec 0c             	sub    $0xc,%esp
80101cdb:	89 78 58             	mov    %edi,0x58(%eax)
80101cde:	50                   	push   %eax
80101cdf:	e8 2c fa ff ff       	call   80101710 <iupdate>
80101ce4:	83 c4 10             	add    $0x10,%esp
80101ce7:	eb bc                	jmp    80101ca5 <writei+0xd5>
80101ce9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cee:	eb b8                	jmp    80101ca8 <writei+0xd8>

80101cf0 <namecmp>:
80101cf0:	55                   	push   %ebp
80101cf1:	89 e5                	mov    %esp,%ebp
80101cf3:	83 ec 0c             	sub    $0xc,%esp
80101cf6:	6a 0e                	push   $0xe
80101cf8:	ff 75 0c             	push   0xc(%ebp)
80101cfb:	ff 75 08             	push   0x8(%ebp)
80101cfe:	e8 ed 2a 00 00       	call   801047f0 <strncmp>
80101d03:	c9                   	leave
80101d04:	c3                   	ret
80101d05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101d0c:	00 
80101d0d:	8d 76 00             	lea    0x0(%esi),%esi

80101d10 <dirlookup>:
80101d10:	55                   	push   %ebp
80101d11:	89 e5                	mov    %esp,%ebp
80101d13:	57                   	push   %edi
80101d14:	56                   	push   %esi
80101d15:	53                   	push   %ebx
80101d16:	83 ec 1c             	sub    $0x1c,%esp
80101d19:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101d1c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101d21:	0f 85 85 00 00 00    	jne    80101dac <dirlookup+0x9c>
80101d27:	8b 53 58             	mov    0x58(%ebx),%edx
80101d2a:	31 ff                	xor    %edi,%edi
80101d2c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101d2f:	85 d2                	test   %edx,%edx
80101d31:	74 3e                	je     80101d71 <dirlookup+0x61>
80101d33:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80101d38:	6a 10                	push   $0x10
80101d3a:	57                   	push   %edi
80101d3b:	56                   	push   %esi
80101d3c:	53                   	push   %ebx
80101d3d:	e8 8e fd ff ff       	call   80101ad0 <readi>
80101d42:	83 c4 10             	add    $0x10,%esp
80101d45:	83 f8 10             	cmp    $0x10,%eax
80101d48:	75 55                	jne    80101d9f <dirlookup+0x8f>
80101d4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d4f:	74 18                	je     80101d69 <dirlookup+0x59>
80101d51:	83 ec 04             	sub    $0x4,%esp
80101d54:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d57:	6a 0e                	push   $0xe
80101d59:	50                   	push   %eax
80101d5a:	ff 75 0c             	push   0xc(%ebp)
80101d5d:	e8 8e 2a 00 00       	call   801047f0 <strncmp>
80101d62:	83 c4 10             	add    $0x10,%esp
80101d65:	85 c0                	test   %eax,%eax
80101d67:	74 17                	je     80101d80 <dirlookup+0x70>
80101d69:	83 c7 10             	add    $0x10,%edi
80101d6c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101d6f:	72 c7                	jb     80101d38 <dirlookup+0x28>
80101d71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d74:	31 c0                	xor    %eax,%eax
80101d76:	5b                   	pop    %ebx
80101d77:	5e                   	pop    %esi
80101d78:	5f                   	pop    %edi
80101d79:	5d                   	pop    %ebp
80101d7a:	c3                   	ret
80101d7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80101d80:	8b 45 10             	mov    0x10(%ebp),%eax
80101d83:	85 c0                	test   %eax,%eax
80101d85:	74 05                	je     80101d8c <dirlookup+0x7c>
80101d87:	8b 45 10             	mov    0x10(%ebp),%eax
80101d8a:	89 38                	mov    %edi,(%eax)
80101d8c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101d90:	8b 03                	mov    (%ebx),%eax
80101d92:	e8 59 f5 ff ff       	call   801012f0 <iget>
80101d97:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d9a:	5b                   	pop    %ebx
80101d9b:	5e                   	pop    %esi
80101d9c:	5f                   	pop    %edi
80101d9d:	5d                   	pop    %ebp
80101d9e:	c3                   	ret
80101d9f:	83 ec 0c             	sub    $0xc,%esp
80101da2:	68 79 73 10 80       	push   $0x80107379
80101da7:	e8 d4 e5 ff ff       	call   80100380 <panic>
80101dac:	83 ec 0c             	sub    $0xc,%esp
80101daf:	68 67 73 10 80       	push   $0x80107367
80101db4:	e8 c7 e5 ff ff       	call   80100380 <panic>
80101db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101dc0 <namex>:
80101dc0:	55                   	push   %ebp
80101dc1:	89 e5                	mov    %esp,%ebp
80101dc3:	57                   	push   %edi
80101dc4:	56                   	push   %esi
80101dc5:	53                   	push   %ebx
80101dc6:	89 c3                	mov    %eax,%ebx
80101dc8:	83 ec 1c             	sub    $0x1c,%esp
80101dcb:	80 38 2f             	cmpb   $0x2f,(%eax)
80101dce:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dd1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101dd4:	0f 84 9e 01 00 00    	je     80101f78 <namex+0x1b8>
80101dda:	e8 e1 1a 00 00       	call   801038c0 <myproc>
80101ddf:	83 ec 0c             	sub    $0xc,%esp
80101de2:	8b 70 68             	mov    0x68(%eax),%esi
80101de5:	68 60 a3 11 80       	push   $0x8011a360
80101dea:	e8 51 27 00 00       	call   80104540 <acquire>
80101def:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101df3:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
80101dfa:	e8 a1 28 00 00       	call   801046a0 <release>
80101dff:	83 c4 10             	add    $0x10,%esp
80101e02:	eb 07                	jmp    80101e0b <namex+0x4b>
80101e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e08:	83 c3 01             	add    $0x1,%ebx
80101e0b:	0f b6 03             	movzbl (%ebx),%eax
80101e0e:	3c 2f                	cmp    $0x2f,%al
80101e10:	74 f6                	je     80101e08 <namex+0x48>
80101e12:	84 c0                	test   %al,%al
80101e14:	0f 84 06 01 00 00    	je     80101f20 <namex+0x160>
80101e1a:	0f b6 03             	movzbl (%ebx),%eax
80101e1d:	84 c0                	test   %al,%al
80101e1f:	0f 84 10 01 00 00    	je     80101f35 <namex+0x175>
80101e25:	89 df                	mov    %ebx,%edi
80101e27:	3c 2f                	cmp    $0x2f,%al
80101e29:	0f 84 06 01 00 00    	je     80101f35 <namex+0x175>
80101e2f:	90                   	nop
80101e30:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80101e34:	83 c7 01             	add    $0x1,%edi
80101e37:	3c 2f                	cmp    $0x2f,%al
80101e39:	74 04                	je     80101e3f <namex+0x7f>
80101e3b:	84 c0                	test   %al,%al
80101e3d:	75 f1                	jne    80101e30 <namex+0x70>
80101e3f:	89 f8                	mov    %edi,%eax
80101e41:	29 d8                	sub    %ebx,%eax
80101e43:	83 f8 0d             	cmp    $0xd,%eax
80101e46:	0f 8e ac 00 00 00    	jle    80101ef8 <namex+0x138>
80101e4c:	83 ec 04             	sub    $0x4,%esp
80101e4f:	6a 0e                	push   $0xe
80101e51:	53                   	push   %ebx
80101e52:	89 fb                	mov    %edi,%ebx
80101e54:	ff 75 e4             	push   -0x1c(%ebp)
80101e57:	e8 24 29 00 00       	call   80104780 <memmove>
80101e5c:	83 c4 10             	add    $0x10,%esp
80101e5f:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e62:	75 0c                	jne    80101e70 <namex+0xb0>
80101e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e68:	83 c3 01             	add    $0x1,%ebx
80101e6b:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e6e:	74 f8                	je     80101e68 <namex+0xa8>
80101e70:	83 ec 0c             	sub    $0xc,%esp
80101e73:	56                   	push   %esi
80101e74:	e8 47 f9 ff ff       	call   801017c0 <ilock>
80101e79:	83 c4 10             	add    $0x10,%esp
80101e7c:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e81:	0f 85 b7 00 00 00    	jne    80101f3e <namex+0x17e>
80101e87:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e8a:	85 c0                	test   %eax,%eax
80101e8c:	74 09                	je     80101e97 <namex+0xd7>
80101e8e:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e91:	0f 84 f7 00 00 00    	je     80101f8e <namex+0x1ce>
80101e97:	83 ec 04             	sub    $0x4,%esp
80101e9a:	6a 00                	push   $0x0
80101e9c:	ff 75 e4             	push   -0x1c(%ebp)
80101e9f:	56                   	push   %esi
80101ea0:	e8 6b fe ff ff       	call   80101d10 <dirlookup>
80101ea5:	83 c4 10             	add    $0x10,%esp
80101ea8:	89 c7                	mov    %eax,%edi
80101eaa:	85 c0                	test   %eax,%eax
80101eac:	0f 84 8c 00 00 00    	je     80101f3e <namex+0x17e>
80101eb2:	8d 4e 0c             	lea    0xc(%esi),%ecx
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	51                   	push   %ecx
80101eb9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101ebc:	e8 1f 25 00 00       	call   801043e0 <holdingsleep>
80101ec1:	83 c4 10             	add    $0x10,%esp
80101ec4:	85 c0                	test   %eax,%eax
80101ec6:	0f 84 02 01 00 00    	je     80101fce <namex+0x20e>
80101ecc:	8b 56 08             	mov    0x8(%esi),%edx
80101ecf:	85 d2                	test   %edx,%edx
80101ed1:	0f 8e f7 00 00 00    	jle    80101fce <namex+0x20e>
80101ed7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101eda:	83 ec 0c             	sub    $0xc,%esp
80101edd:	51                   	push   %ecx
80101ede:	e8 bd 24 00 00       	call   801043a0 <releasesleep>
80101ee3:	89 34 24             	mov    %esi,(%esp)
80101ee6:	89 fe                	mov    %edi,%esi
80101ee8:	e8 03 fa ff ff       	call   801018f0 <iput>
80101eed:	83 c4 10             	add    $0x10,%esp
80101ef0:	e9 16 ff ff ff       	jmp    80101e0b <namex+0x4b>
80101ef5:	8d 76 00             	lea    0x0(%esi),%esi
80101ef8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101efb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80101efe:	83 ec 04             	sub    $0x4,%esp
80101f01:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101f04:	50                   	push   %eax
80101f05:	53                   	push   %ebx
80101f06:	89 fb                	mov    %edi,%ebx
80101f08:	ff 75 e4             	push   -0x1c(%ebp)
80101f0b:	e8 70 28 00 00       	call   80104780 <memmove>
80101f10:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101f13:	83 c4 10             	add    $0x10,%esp
80101f16:	c6 01 00             	movb   $0x0,(%ecx)
80101f19:	e9 41 ff ff ff       	jmp    80101e5f <namex+0x9f>
80101f1e:	66 90                	xchg   %ax,%ax
80101f20:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101f23:	85 c0                	test   %eax,%eax
80101f25:	0f 85 93 00 00 00    	jne    80101fbe <namex+0x1fe>
80101f2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f2e:	89 f0                	mov    %esi,%eax
80101f30:	5b                   	pop    %ebx
80101f31:	5e                   	pop    %esi
80101f32:	5f                   	pop    %edi
80101f33:	5d                   	pop    %ebp
80101f34:	c3                   	ret
80101f35:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101f38:	89 df                	mov    %ebx,%edi
80101f3a:	31 c0                	xor    %eax,%eax
80101f3c:	eb c0                	jmp    80101efe <namex+0x13e>
80101f3e:	83 ec 0c             	sub    $0xc,%esp
80101f41:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f44:	53                   	push   %ebx
80101f45:	e8 96 24 00 00       	call   801043e0 <holdingsleep>
80101f4a:	83 c4 10             	add    $0x10,%esp
80101f4d:	85 c0                	test   %eax,%eax
80101f4f:	74 7d                	je     80101fce <namex+0x20e>
80101f51:	8b 4e 08             	mov    0x8(%esi),%ecx
80101f54:	85 c9                	test   %ecx,%ecx
80101f56:	7e 76                	jle    80101fce <namex+0x20e>
80101f58:	83 ec 0c             	sub    $0xc,%esp
80101f5b:	53                   	push   %ebx
80101f5c:	e8 3f 24 00 00       	call   801043a0 <releasesleep>
80101f61:	89 34 24             	mov    %esi,(%esp)
80101f64:	31 f6                	xor    %esi,%esi
80101f66:	e8 85 f9 ff ff       	call   801018f0 <iput>
80101f6b:	83 c4 10             	add    $0x10,%esp
80101f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f71:	89 f0                	mov    %esi,%eax
80101f73:	5b                   	pop    %ebx
80101f74:	5e                   	pop    %esi
80101f75:	5f                   	pop    %edi
80101f76:	5d                   	pop    %ebp
80101f77:	c3                   	ret
80101f78:	ba 01 00 00 00       	mov    $0x1,%edx
80101f7d:	b8 01 00 00 00       	mov    $0x1,%eax
80101f82:	e8 69 f3 ff ff       	call   801012f0 <iget>
80101f87:	89 c6                	mov    %eax,%esi
80101f89:	e9 7d fe ff ff       	jmp    80101e0b <namex+0x4b>
80101f8e:	83 ec 0c             	sub    $0xc,%esp
80101f91:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f94:	53                   	push   %ebx
80101f95:	e8 46 24 00 00       	call   801043e0 <holdingsleep>
80101f9a:	83 c4 10             	add    $0x10,%esp
80101f9d:	85 c0                	test   %eax,%eax
80101f9f:	74 2d                	je     80101fce <namex+0x20e>
80101fa1:	8b 7e 08             	mov    0x8(%esi),%edi
80101fa4:	85 ff                	test   %edi,%edi
80101fa6:	7e 26                	jle    80101fce <namex+0x20e>
80101fa8:	83 ec 0c             	sub    $0xc,%esp
80101fab:	53                   	push   %ebx
80101fac:	e8 ef 23 00 00       	call   801043a0 <releasesleep>
80101fb1:	83 c4 10             	add    $0x10,%esp
80101fb4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fb7:	89 f0                	mov    %esi,%eax
80101fb9:	5b                   	pop    %ebx
80101fba:	5e                   	pop    %esi
80101fbb:	5f                   	pop    %edi
80101fbc:	5d                   	pop    %ebp
80101fbd:	c3                   	ret
80101fbe:	83 ec 0c             	sub    $0xc,%esp
80101fc1:	56                   	push   %esi
80101fc2:	31 f6                	xor    %esi,%esi
80101fc4:	e8 27 f9 ff ff       	call   801018f0 <iput>
80101fc9:	83 c4 10             	add    $0x10,%esp
80101fcc:	eb a0                	jmp    80101f6e <namex+0x1ae>
80101fce:	83 ec 0c             	sub    $0xc,%esp
80101fd1:	68 5f 73 10 80       	push   $0x8010735f
80101fd6:	e8 a5 e3 ff ff       	call   80100380 <panic>
80101fdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80101fe0 <dirlink>:
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	57                   	push   %edi
80101fe4:	56                   	push   %esi
80101fe5:	53                   	push   %ebx
80101fe6:	83 ec 20             	sub    $0x20,%esp
80101fe9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101fec:	6a 00                	push   $0x0
80101fee:	ff 75 0c             	push   0xc(%ebp)
80101ff1:	53                   	push   %ebx
80101ff2:	e8 19 fd ff ff       	call   80101d10 <dirlookup>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	85 c0                	test   %eax,%eax
80101ffc:	75 67                	jne    80102065 <dirlink+0x85>
80101ffe:	8b 7b 58             	mov    0x58(%ebx),%edi
80102001:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102004:	85 ff                	test   %edi,%edi
80102006:	74 29                	je     80102031 <dirlink+0x51>
80102008:	31 ff                	xor    %edi,%edi
8010200a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010200d:	eb 09                	jmp    80102018 <dirlink+0x38>
8010200f:	90                   	nop
80102010:	83 c7 10             	add    $0x10,%edi
80102013:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102016:	73 19                	jae    80102031 <dirlink+0x51>
80102018:	6a 10                	push   $0x10
8010201a:	57                   	push   %edi
8010201b:	56                   	push   %esi
8010201c:	53                   	push   %ebx
8010201d:	e8 ae fa ff ff       	call   80101ad0 <readi>
80102022:	83 c4 10             	add    $0x10,%esp
80102025:	83 f8 10             	cmp    $0x10,%eax
80102028:	75 4e                	jne    80102078 <dirlink+0x98>
8010202a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010202f:	75 df                	jne    80102010 <dirlink+0x30>
80102031:	83 ec 04             	sub    $0x4,%esp
80102034:	8d 45 da             	lea    -0x26(%ebp),%eax
80102037:	6a 0e                	push   $0xe
80102039:	ff 75 0c             	push   0xc(%ebp)
8010203c:	50                   	push   %eax
8010203d:	e8 fe 27 00 00       	call   80104840 <strncpy>
80102042:	8b 45 10             	mov    0x10(%ebp),%eax
80102045:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80102049:	6a 10                	push   $0x10
8010204b:	57                   	push   %edi
8010204c:	56                   	push   %esi
8010204d:	53                   	push   %ebx
8010204e:	e8 7d fb ff ff       	call   80101bd0 <writei>
80102053:	83 c4 20             	add    $0x20,%esp
80102056:	83 f8 10             	cmp    $0x10,%eax
80102059:	75 2a                	jne    80102085 <dirlink+0xa5>
8010205b:	31 c0                	xor    %eax,%eax
8010205d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102060:	5b                   	pop    %ebx
80102061:	5e                   	pop    %esi
80102062:	5f                   	pop    %edi
80102063:	5d                   	pop    %ebp
80102064:	c3                   	ret
80102065:	83 ec 0c             	sub    $0xc,%esp
80102068:	50                   	push   %eax
80102069:	e8 82 f8 ff ff       	call   801018f0 <iput>
8010206e:	83 c4 10             	add    $0x10,%esp
80102071:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102076:	eb e5                	jmp    8010205d <dirlink+0x7d>
80102078:	83 ec 0c             	sub    $0xc,%esp
8010207b:	68 88 73 10 80       	push   $0x80107388
80102080:	e8 fb e2 ff ff       	call   80100380 <panic>
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	68 aa 77 10 80       	push   $0x801077aa
8010208d:	e8 ee e2 ff ff       	call   80100380 <panic>
80102092:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102099:	00 
8010209a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801020a0 <namei>:
801020a0:	55                   	push   %ebp
801020a1:	31 d2                	xor    %edx,%edx
801020a3:	89 e5                	mov    %esp,%ebp
801020a5:	83 ec 18             	sub    $0x18,%esp
801020a8:	8b 45 08             	mov    0x8(%ebp),%eax
801020ab:	8d 4d ea             	lea    -0x16(%ebp),%ecx
801020ae:	e8 0d fd ff ff       	call   80101dc0 <namex>
801020b3:	c9                   	leave
801020b4:	c3                   	ret
801020b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801020bc:	00 
801020bd:	8d 76 00             	lea    0x0(%esi),%esi

801020c0 <nameiparent>:
801020c0:	55                   	push   %ebp
801020c1:	ba 01 00 00 00       	mov    $0x1,%edx
801020c6:	89 e5                	mov    %esp,%ebp
801020c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801020cb:	8b 45 08             	mov    0x8(%ebp),%eax
801020ce:	5d                   	pop    %ebp
801020cf:	e9 ec fc ff ff       	jmp    80101dc0 <namex>
801020d4:	66 90                	xchg   %ax,%ax
801020d6:	66 90                	xchg   %ax,%ax
801020d8:	66 90                	xchg   %ax,%ax
801020da:	66 90                	xchg   %ax,%ax
801020dc:	66 90                	xchg   %ax,%ax
801020de:	66 90                	xchg   %ax,%ax

801020e0 <idestart>:
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	57                   	push   %edi
801020e4:	56                   	push   %esi
801020e5:	53                   	push   %ebx
801020e6:	83 ec 0c             	sub    $0xc,%esp
801020e9:	85 c0                	test   %eax,%eax
801020eb:	0f 84 b4 00 00 00    	je     801021a5 <idestart+0xc5>
801020f1:	8b 70 08             	mov    0x8(%eax),%esi
801020f4:	89 c3                	mov    %eax,%ebx
801020f6:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
801020fc:	0f 87 96 00 00 00    	ja     80102198 <idestart+0xb8>
80102102:	c1 e6 02             	shl    $0x2,%esi
80102105:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
8010210a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102110:	89 ca                	mov    %ecx,%edx
80102112:	ec                   	in     (%dx),%al
80102113:	83 e0 c0             	and    $0xffffffc0,%eax
80102116:	3c 40                	cmp    $0x40,%al
80102118:	75 f6                	jne    80102110 <idestart+0x30>
8010211a:	31 ff                	xor    %edi,%edi
8010211c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102121:	89 f8                	mov    %edi,%eax
80102123:	ee                   	out    %al,(%dx)
80102124:	b8 04 00 00 00       	mov    $0x4,%eax
80102129:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010212e:	ee                   	out    %al,(%dx)
8010212f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102134:	89 f0                	mov    %esi,%eax
80102136:	ee                   	out    %al,(%dx)
80102137:	89 f0                	mov    %esi,%eax
80102139:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010213e:	c1 f8 08             	sar    $0x8,%eax
80102141:	ee                   	out    %al,(%dx)
80102142:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102147:	89 f8                	mov    %edi,%eax
80102149:	ee                   	out    %al,(%dx)
8010214a:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
8010214e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102153:	c1 e0 04             	shl    $0x4,%eax
80102156:	83 e0 10             	and    $0x10,%eax
80102159:	83 c8 e0             	or     $0xffffffe0,%eax
8010215c:	ee                   	out    %al,(%dx)
8010215d:	f6 03 04             	testb  $0x4,(%ebx)
80102160:	75 16                	jne    80102178 <idestart+0x98>
80102162:	b8 c4 ff ff ff       	mov    $0xffffffc4,%eax
80102167:	89 ca                	mov    %ecx,%edx
80102169:	ee                   	out    %al,(%dx)
8010216a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010216d:	5b                   	pop    %ebx
8010216e:	5e                   	pop    %esi
8010216f:	5f                   	pop    %edi
80102170:	5d                   	pop    %ebp
80102171:	c3                   	ret
80102172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102178:	b8 c5 ff ff ff       	mov    $0xffffffc5,%eax
8010217d:	89 ca                	mov    %ecx,%edx
8010217f:	ee                   	out    %al,(%dx)
80102180:	b9 00 02 00 00       	mov    $0x200,%ecx
80102185:	8d 73 5c             	lea    0x5c(%ebx),%esi
80102188:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010218d:	fc                   	cld
8010218e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102190:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102193:	5b                   	pop    %ebx
80102194:	5e                   	pop    %esi
80102195:	5f                   	pop    %edi
80102196:	5d                   	pop    %ebp
80102197:	c3                   	ret
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 f4 73 10 80       	push   $0x801073f4
801021a0:	e8 db e1 ff ff       	call   80100380 <panic>
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 eb 73 10 80       	push   $0x801073eb
801021ad:	e8 ce e1 ff ff       	call   80100380 <panic>
801021b2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801021b9:	00 
801021ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801021c0 <ideinit>:
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 10             	sub    $0x10,%esp
801021c6:	68 06 74 10 80       	push   $0x80107406
801021cb:	68 00 c0 11 80       	push   $0x8011c000
801021d0:	e8 3b 22 00 00       	call   80104410 <initlock>
801021d5:	58                   	pop    %eax
801021d6:	a1 64 c1 11 80       	mov    0x8011c164,%eax
801021db:	5a                   	pop    %edx
801021dc:	83 e8 01             	sub    $0x1,%eax
801021df:	50                   	push   %eax
801021e0:	6a 0e                	push   $0xe
801021e2:	e8 99 02 00 00       	call   80102480 <ioapicenable>
801021e7:	83 c4 10             	add    $0x10,%esp
801021ea:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
801021ef:	90                   	nop
801021f0:	89 ca                	mov    %ecx,%edx
801021f2:	ec                   	in     (%dx),%al
801021f3:	83 e0 c0             	and    $0xffffffc0,%eax
801021f6:	3c 40                	cmp    $0x40,%al
801021f8:	75 f6                	jne    801021f0 <ideinit+0x30>
801021fa:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801021ff:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102204:	ee                   	out    %al,(%dx)
80102205:	89 ca                	mov    %ecx,%edx
80102207:	ec                   	in     (%dx),%al
80102208:	84 c0                	test   %al,%al
8010220a:	75 1e                	jne    8010222a <ideinit+0x6a>
8010220c:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102211:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102216:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010221d:	00 
8010221e:	66 90                	xchg   %ax,%ax
80102220:	83 e9 01             	sub    $0x1,%ecx
80102223:	74 0f                	je     80102234 <ideinit+0x74>
80102225:	ec                   	in     (%dx),%al
80102226:	84 c0                	test   %al,%al
80102228:	74 f6                	je     80102220 <ideinit+0x60>
8010222a:	c7 05 e0 bf 11 80 01 	movl   $0x1,0x8011bfe0
80102231:	00 00 00 
80102234:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102239:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010223e:	ee                   	out    %al,(%dx)
8010223f:	c9                   	leave
80102240:	c3                   	ret
80102241:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102248:	00 
80102249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102250 <ideintr>:
80102250:	55                   	push   %ebp
80102251:	89 e5                	mov    %esp,%ebp
80102253:	57                   	push   %edi
80102254:	56                   	push   %esi
80102255:	53                   	push   %ebx
80102256:	83 ec 18             	sub    $0x18,%esp
80102259:	68 00 c0 11 80       	push   $0x8011c000
8010225e:	e8 dd 22 00 00       	call   80104540 <acquire>
80102263:	8b 1d e4 bf 11 80    	mov    0x8011bfe4,%ebx
80102269:	83 c4 10             	add    $0x10,%esp
8010226c:	85 db                	test   %ebx,%ebx
8010226e:	74 63                	je     801022d3 <ideintr+0x83>
80102270:	8b 43 58             	mov    0x58(%ebx),%eax
80102273:	a3 e4 bf 11 80       	mov    %eax,0x8011bfe4
80102278:	8b 33                	mov    (%ebx),%esi
8010227a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102280:	75 2f                	jne    801022b1 <ideintr+0x61>
80102282:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010228e:	00 
8010228f:	90                   	nop
80102290:	ec                   	in     (%dx),%al
80102291:	89 c1                	mov    %eax,%ecx
80102293:	83 e1 c0             	and    $0xffffffc0,%ecx
80102296:	80 f9 40             	cmp    $0x40,%cl
80102299:	75 f5                	jne    80102290 <ideintr+0x40>
8010229b:	a8 21                	test   $0x21,%al
8010229d:	75 12                	jne    801022b1 <ideintr+0x61>
8010229f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801022a2:	b9 00 02 00 00       	mov    $0x200,%ecx
801022a7:	ba f0 01 00 00       	mov    $0x1f0,%edx
801022ac:	fc                   	cld
801022ad:	f3 6d                	rep insl (%dx),%es:(%edi)
801022af:	8b 33                	mov    (%ebx),%esi
801022b1:	83 e6 fb             	and    $0xfffffffb,%esi
801022b4:	83 ec 0c             	sub    $0xc,%esp
801022b7:	83 ce 02             	or     $0x2,%esi
801022ba:	89 33                	mov    %esi,(%ebx)
801022bc:	53                   	push   %ebx
801022bd:	e8 8e 1d 00 00       	call   80104050 <wakeup>
801022c2:	a1 e4 bf 11 80       	mov    0x8011bfe4,%eax
801022c7:	83 c4 10             	add    $0x10,%esp
801022ca:	85 c0                	test   %eax,%eax
801022cc:	74 05                	je     801022d3 <ideintr+0x83>
801022ce:	e8 0d fe ff ff       	call   801020e0 <idestart>
801022d3:	83 ec 0c             	sub    $0xc,%esp
801022d6:	68 00 c0 11 80       	push   $0x8011c000
801022db:	e8 c0 23 00 00       	call   801046a0 <release>
801022e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801022e3:	5b                   	pop    %ebx
801022e4:	5e                   	pop    %esi
801022e5:	5f                   	pop    %edi
801022e6:	5d                   	pop    %ebp
801022e7:	c3                   	ret
801022e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801022ef:	00 

801022f0 <iderw>:
801022f0:	55                   	push   %ebp
801022f1:	89 e5                	mov    %esp,%ebp
801022f3:	53                   	push   %ebx
801022f4:	83 ec 10             	sub    $0x10,%esp
801022f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801022fd:	50                   	push   %eax
801022fe:	e8 dd 20 00 00       	call   801043e0 <holdingsleep>
80102303:	83 c4 10             	add    $0x10,%esp
80102306:	85 c0                	test   %eax,%eax
80102308:	0f 84 c3 00 00 00    	je     801023d1 <iderw+0xe1>
8010230e:	8b 03                	mov    (%ebx),%eax
80102310:	83 e0 06             	and    $0x6,%eax
80102313:	83 f8 02             	cmp    $0x2,%eax
80102316:	0f 84 a8 00 00 00    	je     801023c4 <iderw+0xd4>
8010231c:	8b 53 04             	mov    0x4(%ebx),%edx
8010231f:	85 d2                	test   %edx,%edx
80102321:	74 0d                	je     80102330 <iderw+0x40>
80102323:	a1 e0 bf 11 80       	mov    0x8011bfe0,%eax
80102328:	85 c0                	test   %eax,%eax
8010232a:	0f 84 87 00 00 00    	je     801023b7 <iderw+0xc7>
80102330:	83 ec 0c             	sub    $0xc,%esp
80102333:	68 00 c0 11 80       	push   $0x8011c000
80102338:	e8 03 22 00 00       	call   80104540 <acquire>
8010233d:	a1 e4 bf 11 80       	mov    0x8011bfe4,%eax
80102342:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80102349:	83 c4 10             	add    $0x10,%esp
8010234c:	85 c0                	test   %eax,%eax
8010234e:	74 60                	je     801023b0 <iderw+0xc0>
80102350:	89 c2                	mov    %eax,%edx
80102352:	8b 40 58             	mov    0x58(%eax),%eax
80102355:	85 c0                	test   %eax,%eax
80102357:	75 f7                	jne    80102350 <iderw+0x60>
80102359:	83 c2 58             	add    $0x58,%edx
8010235c:	89 1a                	mov    %ebx,(%edx)
8010235e:	39 1d e4 bf 11 80    	cmp    %ebx,0x8011bfe4
80102364:	74 3a                	je     801023a0 <iderw+0xb0>
80102366:	8b 03                	mov    (%ebx),%eax
80102368:	83 e0 06             	and    $0x6,%eax
8010236b:	83 f8 02             	cmp    $0x2,%eax
8010236e:	74 1b                	je     8010238b <iderw+0x9b>
80102370:	83 ec 08             	sub    $0x8,%esp
80102373:	68 00 c0 11 80       	push   $0x8011c000
80102378:	53                   	push   %ebx
80102379:	e8 12 1c 00 00       	call   80103f90 <sleep>
8010237e:	8b 03                	mov    (%ebx),%eax
80102380:	83 c4 10             	add    $0x10,%esp
80102383:	83 e0 06             	and    $0x6,%eax
80102386:	83 f8 02             	cmp    $0x2,%eax
80102389:	75 e5                	jne    80102370 <iderw+0x80>
8010238b:	c7 45 08 00 c0 11 80 	movl   $0x8011c000,0x8(%ebp)
80102392:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102395:	c9                   	leave
80102396:	e9 05 23 00 00       	jmp    801046a0 <release>
8010239b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801023a0:	89 d8                	mov    %ebx,%eax
801023a2:	e8 39 fd ff ff       	call   801020e0 <idestart>
801023a7:	eb bd                	jmp    80102366 <iderw+0x76>
801023a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023b0:	ba e4 bf 11 80       	mov    $0x8011bfe4,%edx
801023b5:	eb a5                	jmp    8010235c <iderw+0x6c>
801023b7:	83 ec 0c             	sub    $0xc,%esp
801023ba:	68 35 74 10 80       	push   $0x80107435
801023bf:	e8 bc df ff ff       	call   80100380 <panic>
801023c4:	83 ec 0c             	sub    $0xc,%esp
801023c7:	68 20 74 10 80       	push   $0x80107420
801023cc:	e8 af df ff ff       	call   80100380 <panic>
801023d1:	83 ec 0c             	sub    $0xc,%esp
801023d4:	68 0a 74 10 80       	push   $0x8010740a
801023d9:	e8 a2 df ff ff       	call   80100380 <panic>
801023de:	66 90                	xchg   %ax,%ax

801023e0 <ioapicinit>:
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	c7 05 34 c0 11 80 00 	movl   $0xfec00000,0x8011c034
801023ec:	00 c0 fe 
801023ef:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801023f6:	00 00 00 
801023f9:	8b 15 34 c0 11 80    	mov    0x8011c034,%edx
801023ff:	8b 72 10             	mov    0x10(%edx),%esi
80102402:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102408:	8b 1d 34 c0 11 80    	mov    0x8011c034,%ebx
8010240e:	0f b6 15 60 c1 11 80 	movzbl 0x8011c160,%edx
80102415:	c1 ee 10             	shr    $0x10,%esi
80102418:	89 f0                	mov    %esi,%eax
8010241a:	0f b6 f0             	movzbl %al,%esi
8010241d:	8b 43 10             	mov    0x10(%ebx),%eax
80102420:	c1 e8 18             	shr    $0x18,%eax
80102423:	39 c2                	cmp    %eax,%edx
80102425:	74 16                	je     8010243d <ioapicinit+0x5d>
80102427:	83 ec 0c             	sub    $0xc,%esp
8010242a:	68 54 74 10 80       	push   $0x80107454
8010242f:	e8 7c e2 ff ff       	call   801006b0 <cprintf>
80102434:	8b 1d 34 c0 11 80    	mov    0x8011c034,%ebx
8010243a:	83 c4 10             	add    $0x10,%esp
8010243d:	ba 10 00 00 00       	mov    $0x10,%edx
80102442:	31 c0                	xor    %eax,%eax
80102444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102448:	89 13                	mov    %edx,(%ebx)
8010244a:	8d 48 20             	lea    0x20(%eax),%ecx
8010244d:	8b 1d 34 c0 11 80    	mov    0x8011c034,%ebx
80102453:	83 c0 01             	add    $0x1,%eax
80102456:	81 c9 00 00 01 00    	or     $0x10000,%ecx
8010245c:	89 4b 10             	mov    %ecx,0x10(%ebx)
8010245f:	8d 4a 01             	lea    0x1(%edx),%ecx
80102462:	83 c2 02             	add    $0x2,%edx
80102465:	89 0b                	mov    %ecx,(%ebx)
80102467:	8b 1d 34 c0 11 80    	mov    0x8011c034,%ebx
8010246d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80102474:	39 c6                	cmp    %eax,%esi
80102476:	7d d0                	jge    80102448 <ioapicinit+0x68>
80102478:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010247b:	5b                   	pop    %ebx
8010247c:	5e                   	pop    %esi
8010247d:	5d                   	pop    %ebp
8010247e:	c3                   	ret
8010247f:	90                   	nop

80102480 <ioapicenable>:
80102480:	55                   	push   %ebp
80102481:	8b 0d 34 c0 11 80    	mov    0x8011c034,%ecx
80102487:	89 e5                	mov    %esp,%ebp
80102489:	8b 45 08             	mov    0x8(%ebp),%eax
8010248c:	8d 50 20             	lea    0x20(%eax),%edx
8010248f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102493:	89 01                	mov    %eax,(%ecx)
80102495:	8b 0d 34 c0 11 80    	mov    0x8011c034,%ecx
8010249b:	83 c0 01             	add    $0x1,%eax
8010249e:	89 51 10             	mov    %edx,0x10(%ecx)
801024a1:	8b 55 0c             	mov    0xc(%ebp),%edx
801024a4:	89 01                	mov    %eax,(%ecx)
801024a6:	a1 34 c0 11 80       	mov    0x8011c034,%eax
801024ab:	c1 e2 18             	shl    $0x18,%edx
801024ae:	89 50 10             	mov    %edx,0x10(%eax)
801024b1:	5d                   	pop    %ebp
801024b2:	c3                   	ret
801024b3:	66 90                	xchg   %ax,%ax
801024b5:	66 90                	xchg   %ax,%ax
801024b7:	66 90                	xchg   %ax,%ax
801024b9:	66 90                	xchg   %ax,%ax
801024bb:	66 90                	xchg   %ax,%ax
801024bd:	66 90                	xchg   %ax,%ax
801024bf:	90                   	nop

801024c0 <kfree>:
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 04             	sub    $0x4,%esp
801024c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801024ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801024d0:	75 76                	jne    80102548 <kfree+0x88>
801024d2:	81 fb b0 ff 11 80    	cmp    $0x8011ffb0,%ebx
801024d8:	72 6e                	jb     80102548 <kfree+0x88>
801024da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801024e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801024e5:	77 61                	ja     80102548 <kfree+0x88>
801024e7:	83 ec 04             	sub    $0x4,%esp
801024ea:	68 00 10 00 00       	push   $0x1000
801024ef:	6a 01                	push   $0x1
801024f1:	53                   	push   %ebx
801024f2:	e8 f9 21 00 00       	call   801046f0 <memset>
801024f7:	8b 15 74 c0 11 80    	mov    0x8011c074,%edx
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	85 d2                	test   %edx,%edx
80102502:	75 1c                	jne    80102520 <kfree+0x60>
80102504:	a1 78 c0 11 80       	mov    0x8011c078,%eax
80102509:	89 03                	mov    %eax,(%ebx)
8010250b:	a1 74 c0 11 80       	mov    0x8011c074,%eax
80102510:	89 1d 78 c0 11 80    	mov    %ebx,0x8011c078
80102516:	85 c0                	test   %eax,%eax
80102518:	75 1e                	jne    80102538 <kfree+0x78>
8010251a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010251d:	c9                   	leave
8010251e:	c3                   	ret
8010251f:	90                   	nop
80102520:	83 ec 0c             	sub    $0xc,%esp
80102523:	68 40 c0 11 80       	push   $0x8011c040
80102528:	e8 13 20 00 00       	call   80104540 <acquire>
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	eb d2                	jmp    80102504 <kfree+0x44>
80102532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102538:	c7 45 08 40 c0 11 80 	movl   $0x8011c040,0x8(%ebp)
8010253f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102542:	c9                   	leave
80102543:	e9 58 21 00 00       	jmp    801046a0 <release>
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	68 86 74 10 80       	push   $0x80107486
80102550:	e8 2b de ff ff       	call   80100380 <panic>
80102555:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010255c:	00 
8010255d:	8d 76 00             	lea    0x0(%esi),%esi

80102560 <freerange>:
80102560:	55                   	push   %ebp
80102561:	89 e5                	mov    %esp,%ebp
80102563:	56                   	push   %esi
80102564:	53                   	push   %ebx
80102565:	8b 45 08             	mov    0x8(%ebp),%eax
80102568:	8b 75 0c             	mov    0xc(%ebp),%esi
8010256b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102571:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102577:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010257d:	39 de                	cmp    %ebx,%esi
8010257f:	72 23                	jb     801025a4 <freerange+0x44>
80102581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102588:	83 ec 0c             	sub    $0xc,%esp
8010258b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102591:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102597:	50                   	push   %eax
80102598:	e8 23 ff ff ff       	call   801024c0 <kfree>
8010259d:	83 c4 10             	add    $0x10,%esp
801025a0:	39 de                	cmp    %ebx,%esi
801025a2:	73 e4                	jae    80102588 <freerange+0x28>
801025a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025a7:	5b                   	pop    %ebx
801025a8:	5e                   	pop    %esi
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret
801025ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801025b0 <kinit2>:
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	56                   	push   %esi
801025b4:	53                   	push   %ebx
801025b5:	8b 45 08             	mov    0x8(%ebp),%eax
801025b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801025bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801025c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025cd:	39 de                	cmp    %ebx,%esi
801025cf:	72 23                	jb     801025f4 <kinit2+0x44>
801025d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025d8:	83 ec 0c             	sub    $0xc,%esp
801025db:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025e7:	50                   	push   %eax
801025e8:	e8 d3 fe ff ff       	call   801024c0 <kfree>
801025ed:	83 c4 10             	add    $0x10,%esp
801025f0:	39 de                	cmp    %ebx,%esi
801025f2:	73 e4                	jae    801025d8 <kinit2+0x28>
801025f4:	c7 05 74 c0 11 80 01 	movl   $0x1,0x8011c074
801025fb:	00 00 00 
801025fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102601:	5b                   	pop    %ebx
80102602:	5e                   	pop    %esi
80102603:	5d                   	pop    %ebp
80102604:	c3                   	ret
80102605:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010260c:	00 
8010260d:	8d 76 00             	lea    0x0(%esi),%esi

80102610 <kinit1>:
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	56                   	push   %esi
80102614:	53                   	push   %ebx
80102615:	8b 75 0c             	mov    0xc(%ebp),%esi
80102618:	83 ec 08             	sub    $0x8,%esp
8010261b:	68 8c 74 10 80       	push   $0x8010748c
80102620:	68 40 c0 11 80       	push   $0x8011c040
80102625:	e8 e6 1d 00 00       	call   80104410 <initlock>
8010262a:	8b 45 08             	mov    0x8(%ebp),%eax
8010262d:	83 c4 10             	add    $0x10,%esp
80102630:	c7 05 74 c0 11 80 00 	movl   $0x0,0x8011c074
80102637:	00 00 00 
8010263a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102640:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102646:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010264c:	39 de                	cmp    %ebx,%esi
8010264e:	72 1c                	jb     8010266c <kinit1+0x5c>
80102650:	83 ec 0c             	sub    $0xc,%esp
80102653:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102659:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010265f:	50                   	push   %eax
80102660:	e8 5b fe ff ff       	call   801024c0 <kfree>
80102665:	83 c4 10             	add    $0x10,%esp
80102668:	39 de                	cmp    %ebx,%esi
8010266a:	73 e4                	jae    80102650 <kinit1+0x40>
8010266c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010266f:	5b                   	pop    %ebx
80102670:	5e                   	pop    %esi
80102671:	5d                   	pop    %ebp
80102672:	c3                   	ret
80102673:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010267a:	00 
8010267b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102680 <kalloc>:
80102680:	55                   	push   %ebp
80102681:	89 e5                	mov    %esp,%ebp
80102683:	53                   	push   %ebx
80102684:	83 ec 04             	sub    $0x4,%esp
80102687:	a1 74 c0 11 80       	mov    0x8011c074,%eax
8010268c:	85 c0                	test   %eax,%eax
8010268e:	75 20                	jne    801026b0 <kalloc+0x30>
80102690:	8b 1d 78 c0 11 80    	mov    0x8011c078,%ebx
80102696:	85 db                	test   %ebx,%ebx
80102698:	74 07                	je     801026a1 <kalloc+0x21>
8010269a:	8b 03                	mov    (%ebx),%eax
8010269c:	a3 78 c0 11 80       	mov    %eax,0x8011c078
801026a1:	89 d8                	mov    %ebx,%eax
801026a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026a6:	c9                   	leave
801026a7:	c3                   	ret
801026a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801026af:	00 
801026b0:	83 ec 0c             	sub    $0xc,%esp
801026b3:	68 40 c0 11 80       	push   $0x8011c040
801026b8:	e8 83 1e 00 00       	call   80104540 <acquire>
801026bd:	8b 1d 78 c0 11 80    	mov    0x8011c078,%ebx
801026c3:	a1 74 c0 11 80       	mov    0x8011c074,%eax
801026c8:	83 c4 10             	add    $0x10,%esp
801026cb:	85 db                	test   %ebx,%ebx
801026cd:	74 08                	je     801026d7 <kalloc+0x57>
801026cf:	8b 13                	mov    (%ebx),%edx
801026d1:	89 15 78 c0 11 80    	mov    %edx,0x8011c078
801026d7:	85 c0                	test   %eax,%eax
801026d9:	74 c6                	je     801026a1 <kalloc+0x21>
801026db:	83 ec 0c             	sub    $0xc,%esp
801026de:	68 40 c0 11 80       	push   $0x8011c040
801026e3:	e8 b8 1f 00 00       	call   801046a0 <release>
801026e8:	89 d8                	mov    %ebx,%eax
801026ea:	83 c4 10             	add    $0x10,%esp
801026ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026f0:	c9                   	leave
801026f1:	c3                   	ret
801026f2:	66 90                	xchg   %ax,%ax
801026f4:	66 90                	xchg   %ax,%ax
801026f6:	66 90                	xchg   %ax,%ax
801026f8:	66 90                	xchg   %ax,%ax
801026fa:	66 90                	xchg   %ax,%ax
801026fc:	66 90                	xchg   %ax,%ax
801026fe:	66 90                	xchg   %ax,%ax

80102700 <kbdgetc>:
80102700:	b8 05 00 00 00       	mov    $0x5,%eax
80102705:	c3                   	ret
80102706:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010270d:	00 
8010270e:	66 90                	xchg   %ax,%ax

80102710 <kbdintr>:
80102710:	55                   	push   %ebp
80102711:	89 e5                	mov    %esp,%ebp
80102713:	83 ec 14             	sub    $0x14,%esp
80102716:	68 00 27 10 80       	push   $0x80102700
8010271b:	e8 80 e1 ff ff       	call   801008a0 <consoleintr>
80102720:	83 c4 10             	add    $0x10,%esp
80102723:	c9                   	leave
80102724:	c3                   	ret
80102725:	66 90                	xchg   %ax,%ax
80102727:	66 90                	xchg   %ax,%ax
80102729:	66 90                	xchg   %ax,%ax
8010272b:	66 90                	xchg   %ax,%ax
8010272d:	66 90                	xchg   %ax,%ax
8010272f:	90                   	nop

80102730 <lapicinit>:
80102730:	a1 7c c0 11 80       	mov    0x8011c07c,%eax
80102735:	85 c0                	test   %eax,%eax
80102737:	0f 84 c3 00 00 00    	je     80102800 <lapicinit+0xd0>
8010273d:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102744:	01 00 00 
80102747:	8b 50 20             	mov    0x20(%eax),%edx
8010274a:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102751:	00 00 00 
80102754:	8b 50 20             	mov    0x20(%eax),%edx
80102757:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010275e:	00 02 00 
80102761:	8b 50 20             	mov    0x20(%eax),%edx
80102764:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010276b:	96 98 00 
8010276e:	8b 50 20             	mov    0x20(%eax),%edx
80102771:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102778:	00 01 00 
8010277b:	8b 50 20             	mov    0x20(%eax),%edx
8010277e:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102785:	00 01 00 
80102788:	8b 50 20             	mov    0x20(%eax),%edx
8010278b:	8b 50 30             	mov    0x30(%eax),%edx
8010278e:	81 e2 00 00 fc 00    	and    $0xfc0000,%edx
80102794:	75 72                	jne    80102808 <lapicinit+0xd8>
80102796:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
8010279d:	00 00 00 
801027a0:	8b 50 20             	mov    0x20(%eax),%edx
801027a3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027aa:	00 00 00 
801027ad:	8b 50 20             	mov    0x20(%eax),%edx
801027b0:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027b7:	00 00 00 
801027ba:	8b 50 20             	mov    0x20(%eax),%edx
801027bd:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027c4:	00 00 00 
801027c7:	8b 50 20             	mov    0x20(%eax),%edx
801027ca:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801027d1:	00 00 00 
801027d4:	8b 50 20             	mov    0x20(%eax),%edx
801027d7:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801027de:	85 08 00 
801027e1:	8b 50 20             	mov    0x20(%eax),%edx
801027e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027e8:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801027ee:	80 e6 10             	and    $0x10,%dh
801027f1:	75 f5                	jne    801027e8 <lapicinit+0xb8>
801027f3:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801027fa:	00 00 00 
801027fd:	8b 40 20             	mov    0x20(%eax),%eax
80102800:	c3                   	ret
80102801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102808:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010280f:	00 01 00 
80102812:	8b 50 20             	mov    0x20(%eax),%edx
80102815:	e9 7c ff ff ff       	jmp    80102796 <lapicinit+0x66>
8010281a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102820 <lapicid>:
80102820:	a1 7c c0 11 80       	mov    0x8011c07c,%eax
80102825:	85 c0                	test   %eax,%eax
80102827:	74 07                	je     80102830 <lapicid+0x10>
80102829:	8b 40 20             	mov    0x20(%eax),%eax
8010282c:	c1 e8 18             	shr    $0x18,%eax
8010282f:	c3                   	ret
80102830:	31 c0                	xor    %eax,%eax
80102832:	c3                   	ret
80102833:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010283a:	00 
8010283b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102840 <lapiceoi>:
80102840:	a1 7c c0 11 80       	mov    0x8011c07c,%eax
80102845:	85 c0                	test   %eax,%eax
80102847:	74 0d                	je     80102856 <lapiceoi+0x16>
80102849:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102850:	00 00 00 
80102853:	8b 40 20             	mov    0x20(%eax),%eax
80102856:	c3                   	ret
80102857:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010285e:	00 
8010285f:	90                   	nop

80102860 <microdelay>:
80102860:	c3                   	ret
80102861:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102868:	00 
80102869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102870 <lapicstartap>:
80102870:	55                   	push   %ebp
80102871:	b8 0f 00 00 00       	mov    $0xf,%eax
80102876:	ba 70 00 00 00       	mov    $0x70,%edx
8010287b:	89 e5                	mov    %esp,%ebp
8010287d:	53                   	push   %ebx
8010287e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102881:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102884:	ee                   	out    %al,(%dx)
80102885:	b8 0a 00 00 00       	mov    $0xa,%eax
8010288a:	ba 71 00 00 00       	mov    $0x71,%edx
8010288f:	ee                   	out    %al,(%dx)
80102890:	31 c0                	xor    %eax,%eax
80102892:	c1 e3 18             	shl    $0x18,%ebx
80102895:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010289b:	89 c8                	mov    %ecx,%eax
8010289d:	c1 e9 0c             	shr    $0xc,%ecx
801028a0:	89 da                	mov    %ebx,%edx
801028a2:	c1 e8 04             	shr    $0x4,%eax
801028a5:	80 cd 06             	or     $0x6,%ch
801028a8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801028ae:	a1 7c c0 11 80       	mov    0x8011c07c,%eax
801028b3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801028b9:	8b 58 20             	mov    0x20(%eax),%ebx
801028bc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801028c3:	c5 00 00 
801028c6:	8b 58 20             	mov    0x20(%eax),%ebx
801028c9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801028d0:	85 00 00 
801028d3:	8b 58 20             	mov    0x20(%eax),%ebx
801028d6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801028dc:	8b 58 20             	mov    0x20(%eax),%ebx
801028df:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801028e5:	8b 58 20             	mov    0x20(%eax),%ebx
801028e8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801028ee:	8b 50 20             	mov    0x20(%eax),%edx
801028f1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801028f7:	8b 40 20             	mov    0x20(%eax),%eax
801028fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801028fd:	c9                   	leave
801028fe:	c3                   	ret
801028ff:	90                   	nop

80102900 <cmostime>:
80102900:	55                   	push   %ebp
80102901:	b8 0b 00 00 00       	mov    $0xb,%eax
80102906:	ba 70 00 00 00       	mov    $0x70,%edx
8010290b:	89 e5                	mov    %esp,%ebp
8010290d:	57                   	push   %edi
8010290e:	56                   	push   %esi
8010290f:	53                   	push   %ebx
80102910:	83 ec 4c             	sub    $0x4c,%esp
80102913:	ee                   	out    %al,(%dx)
80102914:	ba 71 00 00 00       	mov    $0x71,%edx
80102919:	ec                   	in     (%dx),%al
8010291a:	83 e0 04             	and    $0x4,%eax
8010291d:	bf 70 00 00 00       	mov    $0x70,%edi
80102922:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102925:	8d 76 00             	lea    0x0(%esi),%esi
80102928:	31 c0                	xor    %eax,%eax
8010292a:	89 fa                	mov    %edi,%edx
8010292c:	ee                   	out    %al,(%dx)
8010292d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102932:	89 ca                	mov    %ecx,%edx
80102934:	ec                   	in     (%dx),%al
80102935:	88 45 b7             	mov    %al,-0x49(%ebp)
80102938:	89 fa                	mov    %edi,%edx
8010293a:	b8 02 00 00 00       	mov    $0x2,%eax
8010293f:	ee                   	out    %al,(%dx)
80102940:	89 ca                	mov    %ecx,%edx
80102942:	ec                   	in     (%dx),%al
80102943:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102946:	89 fa                	mov    %edi,%edx
80102948:	b8 04 00 00 00       	mov    $0x4,%eax
8010294d:	ee                   	out    %al,(%dx)
8010294e:	89 ca                	mov    %ecx,%edx
80102950:	ec                   	in     (%dx),%al
80102951:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102954:	89 fa                	mov    %edi,%edx
80102956:	b8 07 00 00 00       	mov    $0x7,%eax
8010295b:	ee                   	out    %al,(%dx)
8010295c:	89 ca                	mov    %ecx,%edx
8010295e:	ec                   	in     (%dx),%al
8010295f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102962:	89 fa                	mov    %edi,%edx
80102964:	b8 08 00 00 00       	mov    $0x8,%eax
80102969:	ee                   	out    %al,(%dx)
8010296a:	89 ca                	mov    %ecx,%edx
8010296c:	ec                   	in     (%dx),%al
8010296d:	89 c6                	mov    %eax,%esi
8010296f:	89 fa                	mov    %edi,%edx
80102971:	b8 09 00 00 00       	mov    $0x9,%eax
80102976:	ee                   	out    %al,(%dx)
80102977:	89 ca                	mov    %ecx,%edx
80102979:	ec                   	in     (%dx),%al
8010297a:	0f b6 d8             	movzbl %al,%ebx
8010297d:	89 fa                	mov    %edi,%edx
8010297f:	b8 0a 00 00 00       	mov    $0xa,%eax
80102984:	ee                   	out    %al,(%dx)
80102985:	89 ca                	mov    %ecx,%edx
80102987:	ec                   	in     (%dx),%al
80102988:	84 c0                	test   %al,%al
8010298a:	78 9c                	js     80102928 <cmostime+0x28>
8010298c:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102990:	89 f2                	mov    %esi,%edx
80102992:	89 5d cc             	mov    %ebx,-0x34(%ebp)
80102995:	0f b6 f2             	movzbl %dl,%esi
80102998:	89 fa                	mov    %edi,%edx
8010299a:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010299d:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801029a1:	89 75 c8             	mov    %esi,-0x38(%ebp)
801029a4:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029a7:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801029ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029ae:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801029b2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029b5:	31 c0                	xor    %eax,%eax
801029b7:	ee                   	out    %al,(%dx)
801029b8:	89 ca                	mov    %ecx,%edx
801029ba:	ec                   	in     (%dx),%al
801029bb:	0f b6 c0             	movzbl %al,%eax
801029be:	89 fa                	mov    %edi,%edx
801029c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
801029c3:	b8 02 00 00 00       	mov    $0x2,%eax
801029c8:	ee                   	out    %al,(%dx)
801029c9:	89 ca                	mov    %ecx,%edx
801029cb:	ec                   	in     (%dx),%al
801029cc:	0f b6 c0             	movzbl %al,%eax
801029cf:	89 fa                	mov    %edi,%edx
801029d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801029d4:	b8 04 00 00 00       	mov    $0x4,%eax
801029d9:	ee                   	out    %al,(%dx)
801029da:	89 ca                	mov    %ecx,%edx
801029dc:	ec                   	in     (%dx),%al
801029dd:	0f b6 c0             	movzbl %al,%eax
801029e0:	89 fa                	mov    %edi,%edx
801029e2:	89 45 d8             	mov    %eax,-0x28(%ebp)
801029e5:	b8 07 00 00 00       	mov    $0x7,%eax
801029ea:	ee                   	out    %al,(%dx)
801029eb:	89 ca                	mov    %ecx,%edx
801029ed:	ec                   	in     (%dx),%al
801029ee:	0f b6 c0             	movzbl %al,%eax
801029f1:	89 fa                	mov    %edi,%edx
801029f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
801029f6:	b8 08 00 00 00       	mov    $0x8,%eax
801029fb:	ee                   	out    %al,(%dx)
801029fc:	89 ca                	mov    %ecx,%edx
801029fe:	ec                   	in     (%dx),%al
801029ff:	0f b6 c0             	movzbl %al,%eax
80102a02:	89 fa                	mov    %edi,%edx
80102a04:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102a07:	b8 09 00 00 00       	mov    $0x9,%eax
80102a0c:	ee                   	out    %al,(%dx)
80102a0d:	89 ca                	mov    %ecx,%edx
80102a0f:	ec                   	in     (%dx),%al
80102a10:	0f b6 c0             	movzbl %al,%eax
80102a13:	83 ec 04             	sub    $0x4,%esp
80102a16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102a19:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102a1c:	6a 18                	push   $0x18
80102a1e:	50                   	push   %eax
80102a1f:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102a22:	50                   	push   %eax
80102a23:	e8 08 1d 00 00       	call   80104730 <memcmp>
80102a28:	83 c4 10             	add    $0x10,%esp
80102a2b:	85 c0                	test   %eax,%eax
80102a2d:	0f 85 f5 fe ff ff    	jne    80102928 <cmostime+0x28>
80102a33:	0f b6 75 b3          	movzbl -0x4d(%ebp),%esi
80102a37:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102a3a:	89 f0                	mov    %esi,%eax
80102a3c:	84 c0                	test   %al,%al
80102a3e:	75 78                	jne    80102ab8 <cmostime+0x1b8>
80102a40:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a43:	89 c2                	mov    %eax,%edx
80102a45:	83 e0 0f             	and    $0xf,%eax
80102a48:	c1 ea 04             	shr    $0x4,%edx
80102a4b:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a4e:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a51:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a54:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a57:	89 c2                	mov    %eax,%edx
80102a59:	83 e0 0f             	and    $0xf,%eax
80102a5c:	c1 ea 04             	shr    $0x4,%edx
80102a5f:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a62:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a65:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a68:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a6b:	89 c2                	mov    %eax,%edx
80102a6d:	83 e0 0f             	and    $0xf,%eax
80102a70:	c1 ea 04             	shr    $0x4,%edx
80102a73:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a76:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a79:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102a7c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a7f:	89 c2                	mov    %eax,%edx
80102a81:	83 e0 0f             	and    $0xf,%eax
80102a84:	c1 ea 04             	shr    $0x4,%edx
80102a87:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a8a:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a8d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a90:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a93:	89 c2                	mov    %eax,%edx
80102a95:	83 e0 0f             	and    $0xf,%eax
80102a98:	c1 ea 04             	shr    $0x4,%edx
80102a9b:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a9e:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102aa1:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102aa4:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102aa7:	89 c2                	mov    %eax,%edx
80102aa9:	83 e0 0f             	and    $0xf,%eax
80102aac:	c1 ea 04             	shr    $0x4,%edx
80102aaf:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ab2:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ab5:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102ab8:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102abb:	89 03                	mov    %eax,(%ebx)
80102abd:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102ac0:	89 43 04             	mov    %eax,0x4(%ebx)
80102ac3:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102ac6:	89 43 08             	mov    %eax,0x8(%ebx)
80102ac9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102acc:	89 43 0c             	mov    %eax,0xc(%ebx)
80102acf:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102ad2:	89 43 10             	mov    %eax,0x10(%ebx)
80102ad5:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102ad8:	89 43 14             	mov    %eax,0x14(%ebx)
80102adb:	81 43 14 d0 07 00 00 	addl   $0x7d0,0x14(%ebx)
80102ae2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ae5:	5b                   	pop    %ebx
80102ae6:	5e                   	pop    %esi
80102ae7:	5f                   	pop    %edi
80102ae8:	5d                   	pop    %ebp
80102ae9:	c3                   	ret
80102aea:	66 90                	xchg   %ax,%ax
80102aec:	66 90                	xchg   %ax,%ax
80102aee:	66 90                	xchg   %ax,%ax

80102af0 <install_trans>:
80102af0:	8b 0d c8 c0 11 80    	mov    0x8011c0c8,%ecx
80102af6:	85 c9                	test   %ecx,%ecx
80102af8:	0f 8e 8a 00 00 00    	jle    80102b88 <install_trans+0x98>
80102afe:	55                   	push   %ebp
80102aff:	89 e5                	mov    %esp,%ebp
80102b01:	57                   	push   %edi
80102b02:	31 ff                	xor    %edi,%edi
80102b04:	56                   	push   %esi
80102b05:	53                   	push   %ebx
80102b06:	83 ec 0c             	sub    $0xc,%esp
80102b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102b10:	a1 b4 c0 11 80       	mov    0x8011c0b4,%eax
80102b15:	83 ec 08             	sub    $0x8,%esp
80102b18:	01 f8                	add    %edi,%eax
80102b1a:	83 c0 01             	add    $0x1,%eax
80102b1d:	50                   	push   %eax
80102b1e:	ff 35 c4 c0 11 80    	push   0x8011c0c4
80102b24:	e8 a7 d5 ff ff       	call   801000d0 <bread>
80102b29:	89 c6                	mov    %eax,%esi
80102b2b:	58                   	pop    %eax
80102b2c:	5a                   	pop    %edx
80102b2d:	ff 34 bd cc c0 11 80 	push   -0x7fee3f34(,%edi,4)
80102b34:	ff 35 c4 c0 11 80    	push   0x8011c0c4
80102b3a:	83 c7 01             	add    $0x1,%edi
80102b3d:	e8 8e d5 ff ff       	call   801000d0 <bread>
80102b42:	83 c4 0c             	add    $0xc,%esp
80102b45:	89 c3                	mov    %eax,%ebx
80102b47:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b4a:	68 00 08 00 00       	push   $0x800
80102b4f:	50                   	push   %eax
80102b50:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102b53:	50                   	push   %eax
80102b54:	e8 27 1c 00 00       	call   80104780 <memmove>
80102b59:	89 1c 24             	mov    %ebx,(%esp)
80102b5c:	e8 4f d6 ff ff       	call   801001b0 <bwrite>
80102b61:	89 34 24             	mov    %esi,(%esp)
80102b64:	e8 87 d6 ff ff       	call   801001f0 <brelse>
80102b69:	89 1c 24             	mov    %ebx,(%esp)
80102b6c:	e8 7f d6 ff ff       	call   801001f0 <brelse>
80102b71:	83 c4 10             	add    $0x10,%esp
80102b74:	39 3d c8 c0 11 80    	cmp    %edi,0x8011c0c8
80102b7a:	7f 94                	jg     80102b10 <install_trans+0x20>
80102b7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b7f:	5b                   	pop    %ebx
80102b80:	5e                   	pop    %esi
80102b81:	5f                   	pop    %edi
80102b82:	5d                   	pop    %ebp
80102b83:	c3                   	ret
80102b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b88:	c3                   	ret
80102b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102b90 <write_head>:
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	53                   	push   %ebx
80102b94:	83 ec 0c             	sub    $0xc,%esp
80102b97:	ff 35 b4 c0 11 80    	push   0x8011c0b4
80102b9d:	ff 35 c4 c0 11 80    	push   0x8011c0c4
80102ba3:	e8 28 d5 ff ff       	call   801000d0 <bread>
80102ba8:	83 c4 10             	add    $0x10,%esp
80102bab:	89 c3                	mov    %eax,%ebx
80102bad:	a1 c8 c0 11 80       	mov    0x8011c0c8,%eax
80102bb2:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102bb5:	85 c0                	test   %eax,%eax
80102bb7:	7e 19                	jle    80102bd2 <write_head+0x42>
80102bb9:	31 d2                	xor    %edx,%edx
80102bbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80102bc0:	8b 0c 95 cc c0 11 80 	mov    -0x7fee3f34(,%edx,4),%ecx
80102bc7:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
80102bcb:	83 c2 01             	add    $0x1,%edx
80102bce:	39 d0                	cmp    %edx,%eax
80102bd0:	75 ee                	jne    80102bc0 <write_head+0x30>
80102bd2:	83 ec 0c             	sub    $0xc,%esp
80102bd5:	53                   	push   %ebx
80102bd6:	e8 d5 d5 ff ff       	call   801001b0 <bwrite>
80102bdb:	89 1c 24             	mov    %ebx,(%esp)
80102bde:	e8 0d d6 ff ff       	call   801001f0 <brelse>
80102be3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102be6:	83 c4 10             	add    $0x10,%esp
80102be9:	c9                   	leave
80102bea:	c3                   	ret
80102beb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102bf0 <initlog>:
80102bf0:	55                   	push   %ebp
80102bf1:	89 e5                	mov    %esp,%ebp
80102bf3:	53                   	push   %ebx
80102bf4:	83 ec 2c             	sub    $0x2c,%esp
80102bf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102bfa:	68 91 74 10 80       	push   $0x80107491
80102bff:	68 80 c0 11 80       	push   $0x8011c080
80102c04:	e8 07 18 00 00       	call   80104410 <initlock>
80102c09:	58                   	pop    %eax
80102c0a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102c0d:	5a                   	pop    %edx
80102c0e:	50                   	push   %eax
80102c0f:	53                   	push   %ebx
80102c10:	e8 4b e9 ff ff       	call   80101560 <readsb>
80102c15:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102c18:	59                   	pop    %ecx
80102c19:	89 1d c4 c0 11 80    	mov    %ebx,0x8011c0c4
80102c1f:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102c22:	a3 b4 c0 11 80       	mov    %eax,0x8011c0b4
80102c27:	89 15 b8 c0 11 80    	mov    %edx,0x8011c0b8
80102c2d:	5a                   	pop    %edx
80102c2e:	50                   	push   %eax
80102c2f:	53                   	push   %ebx
80102c30:	e8 9b d4 ff ff       	call   801000d0 <bread>
80102c35:	83 c4 10             	add    $0x10,%esp
80102c38:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102c3b:	89 1d c8 c0 11 80    	mov    %ebx,0x8011c0c8
80102c41:	85 db                	test   %ebx,%ebx
80102c43:	7e 1d                	jle    80102c62 <initlog+0x72>
80102c45:	31 d2                	xor    %edx,%edx
80102c47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102c4e:	00 
80102c4f:	90                   	nop
80102c50:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102c54:	89 0c 95 cc c0 11 80 	mov    %ecx,-0x7fee3f34(,%edx,4)
80102c5b:	83 c2 01             	add    $0x1,%edx
80102c5e:	39 d3                	cmp    %edx,%ebx
80102c60:	75 ee                	jne    80102c50 <initlog+0x60>
80102c62:	83 ec 0c             	sub    $0xc,%esp
80102c65:	50                   	push   %eax
80102c66:	e8 85 d5 ff ff       	call   801001f0 <brelse>
80102c6b:	e8 80 fe ff ff       	call   80102af0 <install_trans>
80102c70:	c7 05 c8 c0 11 80 00 	movl   $0x0,0x8011c0c8
80102c77:	00 00 00 
80102c7a:	e8 11 ff ff ff       	call   80102b90 <write_head>
80102c7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c82:	83 c4 10             	add    $0x10,%esp
80102c85:	c9                   	leave
80102c86:	c3                   	ret
80102c87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102c8e:	00 
80102c8f:	90                   	nop

80102c90 <begin_op>:
80102c90:	55                   	push   %ebp
80102c91:	89 e5                	mov    %esp,%ebp
80102c93:	83 ec 14             	sub    $0x14,%esp
80102c96:	68 80 c0 11 80       	push   $0x8011c080
80102c9b:	e8 a0 18 00 00       	call   80104540 <acquire>
80102ca0:	83 c4 10             	add    $0x10,%esp
80102ca3:	eb 18                	jmp    80102cbd <begin_op+0x2d>
80102ca5:	8d 76 00             	lea    0x0(%esi),%esi
80102ca8:	83 ec 08             	sub    $0x8,%esp
80102cab:	68 80 c0 11 80       	push   $0x8011c080
80102cb0:	68 80 c0 11 80       	push   $0x8011c080
80102cb5:	e8 d6 12 00 00       	call   80103f90 <sleep>
80102cba:	83 c4 10             	add    $0x10,%esp
80102cbd:	a1 c0 c0 11 80       	mov    0x8011c0c0,%eax
80102cc2:	85 c0                	test   %eax,%eax
80102cc4:	75 e2                	jne    80102ca8 <begin_op+0x18>
80102cc6:	a1 bc c0 11 80       	mov    0x8011c0bc,%eax
80102ccb:	8b 15 c8 c0 11 80    	mov    0x8011c0c8,%edx
80102cd1:	83 c0 01             	add    $0x1,%eax
80102cd4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102cd7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102cda:	83 fa 1e             	cmp    $0x1e,%edx
80102cdd:	7f c9                	jg     80102ca8 <begin_op+0x18>
80102cdf:	83 ec 0c             	sub    $0xc,%esp
80102ce2:	a3 bc c0 11 80       	mov    %eax,0x8011c0bc
80102ce7:	68 80 c0 11 80       	push   $0x8011c080
80102cec:	e8 af 19 00 00       	call   801046a0 <release>
80102cf1:	83 c4 10             	add    $0x10,%esp
80102cf4:	c9                   	leave
80102cf5:	c3                   	ret
80102cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102cfd:	00 
80102cfe:	66 90                	xchg   %ax,%ax

80102d00 <end_op>:
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	57                   	push   %edi
80102d04:	56                   	push   %esi
80102d05:	53                   	push   %ebx
80102d06:	83 ec 18             	sub    $0x18,%esp
80102d09:	68 80 c0 11 80       	push   $0x8011c080
80102d0e:	e8 2d 18 00 00       	call   80104540 <acquire>
80102d13:	a1 bc c0 11 80       	mov    0x8011c0bc,%eax
80102d18:	8b 35 c0 c0 11 80    	mov    0x8011c0c0,%esi
80102d1e:	83 c4 10             	add    $0x10,%esp
80102d21:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102d24:	89 1d bc c0 11 80    	mov    %ebx,0x8011c0bc
80102d2a:	85 f6                	test   %esi,%esi
80102d2c:	0f 85 22 01 00 00    	jne    80102e54 <end_op+0x154>
80102d32:	85 db                	test   %ebx,%ebx
80102d34:	0f 85 f6 00 00 00    	jne    80102e30 <end_op+0x130>
80102d3a:	c7 05 c0 c0 11 80 01 	movl   $0x1,0x8011c0c0
80102d41:	00 00 00 
80102d44:	83 ec 0c             	sub    $0xc,%esp
80102d47:	68 80 c0 11 80       	push   $0x8011c080
80102d4c:	e8 4f 19 00 00       	call   801046a0 <release>
80102d51:	8b 0d c8 c0 11 80    	mov    0x8011c0c8,%ecx
80102d57:	83 c4 10             	add    $0x10,%esp
80102d5a:	85 c9                	test   %ecx,%ecx
80102d5c:	7f 42                	jg     80102da0 <end_op+0xa0>
80102d5e:	83 ec 0c             	sub    $0xc,%esp
80102d61:	68 80 c0 11 80       	push   $0x8011c080
80102d66:	e8 d5 17 00 00       	call   80104540 <acquire>
80102d6b:	c7 05 c0 c0 11 80 00 	movl   $0x0,0x8011c0c0
80102d72:	00 00 00 
80102d75:	c7 04 24 80 c0 11 80 	movl   $0x8011c080,(%esp)
80102d7c:	e8 cf 12 00 00       	call   80104050 <wakeup>
80102d81:	c7 04 24 80 c0 11 80 	movl   $0x8011c080,(%esp)
80102d88:	e8 13 19 00 00       	call   801046a0 <release>
80102d8d:	83 c4 10             	add    $0x10,%esp
80102d90:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d93:	5b                   	pop    %ebx
80102d94:	5e                   	pop    %esi
80102d95:	5f                   	pop    %edi
80102d96:	5d                   	pop    %ebp
80102d97:	c3                   	ret
80102d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102d9f:	00 
80102da0:	a1 b4 c0 11 80       	mov    0x8011c0b4,%eax
80102da5:	83 ec 08             	sub    $0x8,%esp
80102da8:	01 d8                	add    %ebx,%eax
80102daa:	83 c0 01             	add    $0x1,%eax
80102dad:	50                   	push   %eax
80102dae:	ff 35 c4 c0 11 80    	push   0x8011c0c4
80102db4:	e8 17 d3 ff ff       	call   801000d0 <bread>
80102db9:	89 c6                	mov    %eax,%esi
80102dbb:	58                   	pop    %eax
80102dbc:	5a                   	pop    %edx
80102dbd:	ff 34 9d cc c0 11 80 	push   -0x7fee3f34(,%ebx,4)
80102dc4:	ff 35 c4 c0 11 80    	push   0x8011c0c4
80102dca:	83 c3 01             	add    $0x1,%ebx
80102dcd:	e8 fe d2 ff ff       	call   801000d0 <bread>
80102dd2:	83 c4 0c             	add    $0xc,%esp
80102dd5:	89 c7                	mov    %eax,%edi
80102dd7:	8d 40 5c             	lea    0x5c(%eax),%eax
80102dda:	68 00 08 00 00       	push   $0x800
80102ddf:	50                   	push   %eax
80102de0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102de3:	50                   	push   %eax
80102de4:	e8 97 19 00 00       	call   80104780 <memmove>
80102de9:	89 34 24             	mov    %esi,(%esp)
80102dec:	e8 bf d3 ff ff       	call   801001b0 <bwrite>
80102df1:	89 3c 24             	mov    %edi,(%esp)
80102df4:	e8 f7 d3 ff ff       	call   801001f0 <brelse>
80102df9:	89 34 24             	mov    %esi,(%esp)
80102dfc:	e8 ef d3 ff ff       	call   801001f0 <brelse>
80102e01:	83 c4 10             	add    $0x10,%esp
80102e04:	3b 1d c8 c0 11 80    	cmp    0x8011c0c8,%ebx
80102e0a:	7c 94                	jl     80102da0 <end_op+0xa0>
80102e0c:	e8 7f fd ff ff       	call   80102b90 <write_head>
80102e11:	e8 da fc ff ff       	call   80102af0 <install_trans>
80102e16:	c7 05 c8 c0 11 80 00 	movl   $0x0,0x8011c0c8
80102e1d:	00 00 00 
80102e20:	e8 6b fd ff ff       	call   80102b90 <write_head>
80102e25:	e9 34 ff ff ff       	jmp    80102d5e <end_op+0x5e>
80102e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e30:	83 ec 0c             	sub    $0xc,%esp
80102e33:	68 80 c0 11 80       	push   $0x8011c080
80102e38:	e8 13 12 00 00       	call   80104050 <wakeup>
80102e3d:	c7 04 24 80 c0 11 80 	movl   $0x8011c080,(%esp)
80102e44:	e8 57 18 00 00       	call   801046a0 <release>
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e4f:	5b                   	pop    %ebx
80102e50:	5e                   	pop    %esi
80102e51:	5f                   	pop    %edi
80102e52:	5d                   	pop    %ebp
80102e53:	c3                   	ret
80102e54:	83 ec 0c             	sub    $0xc,%esp
80102e57:	68 95 74 10 80       	push   $0x80107495
80102e5c:	e8 1f d5 ff ff       	call   80100380 <panic>
80102e61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102e68:	00 
80102e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e70 <log_write>:
80102e70:	55                   	push   %ebp
80102e71:	89 e5                	mov    %esp,%ebp
80102e73:	53                   	push   %ebx
80102e74:	83 ec 04             	sub    $0x4,%esp
80102e77:	8b 15 c8 c0 11 80    	mov    0x8011c0c8,%edx
80102e7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e80:	83 fa 1d             	cmp    $0x1d,%edx
80102e83:	7f 7d                	jg     80102f02 <log_write+0x92>
80102e85:	a1 b8 c0 11 80       	mov    0x8011c0b8,%eax
80102e8a:	83 e8 01             	sub    $0x1,%eax
80102e8d:	39 c2                	cmp    %eax,%edx
80102e8f:	7d 71                	jge    80102f02 <log_write+0x92>
80102e91:	a1 bc c0 11 80       	mov    0x8011c0bc,%eax
80102e96:	85 c0                	test   %eax,%eax
80102e98:	7e 75                	jle    80102f0f <log_write+0x9f>
80102e9a:	83 ec 0c             	sub    $0xc,%esp
80102e9d:	68 80 c0 11 80       	push   $0x8011c080
80102ea2:	e8 99 16 00 00       	call   80104540 <acquire>
80102ea7:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102eaa:	83 c4 10             	add    $0x10,%esp
80102ead:	31 c0                	xor    %eax,%eax
80102eaf:	8b 15 c8 c0 11 80    	mov    0x8011c0c8,%edx
80102eb5:	85 d2                	test   %edx,%edx
80102eb7:	7f 0e                	jg     80102ec7 <log_write+0x57>
80102eb9:	eb 15                	jmp    80102ed0 <log_write+0x60>
80102ebb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80102ec0:	83 c0 01             	add    $0x1,%eax
80102ec3:	39 c2                	cmp    %eax,%edx
80102ec5:	74 29                	je     80102ef0 <log_write+0x80>
80102ec7:	39 0c 85 cc c0 11 80 	cmp    %ecx,-0x7fee3f34(,%eax,4)
80102ece:	75 f0                	jne    80102ec0 <log_write+0x50>
80102ed0:	89 0c 85 cc c0 11 80 	mov    %ecx,-0x7fee3f34(,%eax,4)
80102ed7:	39 c2                	cmp    %eax,%edx
80102ed9:	74 1c                	je     80102ef7 <log_write+0x87>
80102edb:	83 0b 04             	orl    $0x4,(%ebx)
80102ede:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ee1:	c7 45 08 80 c0 11 80 	movl   $0x8011c080,0x8(%ebp)
80102ee8:	c9                   	leave
80102ee9:	e9 b2 17 00 00       	jmp    801046a0 <release>
80102eee:	66 90                	xchg   %ax,%ax
80102ef0:	89 0c 95 cc c0 11 80 	mov    %ecx,-0x7fee3f34(,%edx,4)
80102ef7:	83 c2 01             	add    $0x1,%edx
80102efa:	89 15 c8 c0 11 80    	mov    %edx,0x8011c0c8
80102f00:	eb d9                	jmp    80102edb <log_write+0x6b>
80102f02:	83 ec 0c             	sub    $0xc,%esp
80102f05:	68 a4 74 10 80       	push   $0x801074a4
80102f0a:	e8 71 d4 ff ff       	call   80100380 <panic>
80102f0f:	83 ec 0c             	sub    $0xc,%esp
80102f12:	68 ba 74 10 80       	push   $0x801074ba
80102f17:	e8 64 d4 ff ff       	call   80100380 <panic>
80102f1c:	66 90                	xchg   %ax,%ax
80102f1e:	66 90                	xchg   %ax,%ax

80102f20 <mpmain>:
80102f20:	55                   	push   %ebp
80102f21:	89 e5                	mov    %esp,%ebp
80102f23:	53                   	push   %ebx
80102f24:	83 ec 04             	sub    $0x4,%esp
80102f27:	e8 74 09 00 00       	call   801038a0 <cpuid>
80102f2c:	89 c3                	mov    %eax,%ebx
80102f2e:	e8 6d 09 00 00       	call   801038a0 <cpuid>
80102f33:	83 ec 04             	sub    $0x4,%esp
80102f36:	53                   	push   %ebx
80102f37:	50                   	push   %eax
80102f38:	68 d5 74 10 80       	push   $0x801074d5
80102f3d:	e8 6e d7 ff ff       	call   801006b0 <cprintf>
80102f42:	e8 69 2a 00 00       	call   801059b0 <idtinit>
80102f47:	e8 f4 08 00 00       	call   80103840 <mycpu>
80102f4c:	89 c2                	mov    %eax,%edx
80102f4e:	b8 01 00 00 00       	mov    $0x1,%eax
80102f53:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102f5a:	e8 11 0c 00 00       	call   80103b70 <scheduler>
80102f5f:	90                   	nop

80102f60 <mpenter>:
80102f60:	55                   	push   %ebp
80102f61:	89 e5                	mov    %esp,%ebp
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	e8 45 3b 00 00       	call   80106ab0 <switchkvm>
80102f6b:	e8 b0 3a 00 00       	call   80106a20 <seginit>
80102f70:	e8 bb f7 ff ff       	call   80102730 <lapicinit>
80102f75:	e8 a6 ff ff ff       	call   80102f20 <mpmain>
80102f7a:	66 90                	xchg   %ax,%ax
80102f7c:	66 90                	xchg   %ax,%ax
80102f7e:	66 90                	xchg   %ax,%ax

80102f80 <main>:
80102f80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f84:	83 e4 f0             	and    $0xfffffff0,%esp
80102f87:	ff 71 fc             	push   -0x4(%ecx)
80102f8a:	55                   	push   %ebp
80102f8b:	89 e5                	mov    %esp,%ebp
80102f8d:	53                   	push   %ebx
80102f8e:	51                   	push   %ecx
80102f8f:	83 ec 08             	sub    $0x8,%esp
80102f92:	68 00 00 40 80       	push   $0x80400000
80102f97:	68 b0 ff 11 80       	push   $0x8011ffb0
80102f9c:	e8 6f f6 ff ff       	call   80102610 <kinit1>
80102fa1:	e8 ca 3f 00 00       	call   80106f70 <kvmalloc>
80102fa6:	e8 85 01 00 00       	call   80103130 <mpinit>
80102fab:	e8 80 f7 ff ff       	call   80102730 <lapicinit>
80102fb0:	e8 6b 3a 00 00       	call   80106a20 <seginit>
80102fb5:	e8 86 03 00 00       	call   80103340 <picinit>
80102fba:	e8 21 f4 ff ff       	call   801023e0 <ioapicinit>
80102fbf:	e8 9c da ff ff       	call   80100a60 <consoleinit>
80102fc4:	e8 c7 2c 00 00       	call   80105c90 <uartinit>
80102fc9:	e8 52 08 00 00       	call   80103820 <pinit>
80102fce:	e8 5d 29 00 00       	call   80105930 <tvinit>
80102fd3:	e8 68 d0 ff ff       	call   80100040 <binit>
80102fd8:	e8 53 de ff ff       	call   80100e30 <fileinit>
80102fdd:	e8 de f1 ff ff       	call   801021c0 <ideinit>
80102fe2:	83 c4 0c             	add    $0xc,%esp
80102fe5:	68 8a 00 00 00       	push   $0x8a
80102fea:	68 8c 94 10 80       	push   $0x8010948c
80102fef:	68 00 70 00 80       	push   $0x80007000
80102ff4:	e8 87 17 00 00       	call   80104780 <memmove>
80102ff9:	83 c4 10             	add    $0x10,%esp
80102ffc:	69 05 64 c1 11 80 b0 	imul   $0xb0,0x8011c164,%eax
80103003:	00 00 00 
80103006:	05 80 c1 11 80       	add    $0x8011c180,%eax
8010300b:	3d 80 c1 11 80       	cmp    $0x8011c180,%eax
80103010:	76 7e                	jbe    80103090 <main+0x110>
80103012:	bb 80 c1 11 80       	mov    $0x8011c180,%ebx
80103017:	eb 20                	jmp    80103039 <main+0xb9>
80103019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103020:	69 05 64 c1 11 80 b0 	imul   $0xb0,0x8011c164,%eax
80103027:	00 00 00 
8010302a:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103030:	05 80 c1 11 80       	add    $0x8011c180,%eax
80103035:	39 c3                	cmp    %eax,%ebx
80103037:	73 57                	jae    80103090 <main+0x110>
80103039:	e8 02 08 00 00       	call   80103840 <mycpu>
8010303e:	39 c3                	cmp    %eax,%ebx
80103040:	74 de                	je     80103020 <main+0xa0>
80103042:	e8 39 f6 ff ff       	call   80102680 <kalloc>
80103047:	83 ec 08             	sub    $0x8,%esp
8010304a:	c7 05 f8 6f 00 80 60 	movl   $0x80102f60,0x80006ff8
80103051:	2f 10 80 
80103054:	c7 05 f4 6f 00 80 00 	movl   $0x108000,0x80006ff4
8010305b:	80 10 00 
8010305e:	05 00 10 00 00       	add    $0x1000,%eax
80103063:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103068:	0f b6 03             	movzbl (%ebx),%eax
8010306b:	68 00 70 00 00       	push   $0x7000
80103070:	50                   	push   %eax
80103071:	e8 fa f7 ff ff       	call   80102870 <lapicstartap>
80103076:	83 c4 10             	add    $0x10,%esp
80103079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103080:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103086:	85 c0                	test   %eax,%eax
80103088:	74 f6                	je     80103080 <main+0x100>
8010308a:	eb 94                	jmp    80103020 <main+0xa0>
8010308c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103090:	83 ec 08             	sub    $0x8,%esp
80103093:	68 00 00 00 8e       	push   $0x8e000000
80103098:	68 00 00 40 80       	push   $0x80400000
8010309d:	e8 0e f5 ff ff       	call   801025b0 <kinit2>
801030a2:	e8 49 08 00 00       	call   801038f0 <userinit>
801030a7:	e8 74 fe ff ff       	call   80102f20 <mpmain>
801030ac:	66 90                	xchg   %ax,%ax
801030ae:	66 90                	xchg   %ax,%ax

801030b0 <mpsearch1>:
801030b0:	55                   	push   %ebp
801030b1:	89 e5                	mov    %esp,%ebp
801030b3:	57                   	push   %edi
801030b4:	56                   	push   %esi
801030b5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801030bb:	53                   	push   %ebx
801030bc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
801030bf:	83 ec 0c             	sub    $0xc,%esp
801030c2:	39 de                	cmp    %ebx,%esi
801030c4:	72 10                	jb     801030d6 <mpsearch1+0x26>
801030c6:	eb 50                	jmp    80103118 <mpsearch1+0x68>
801030c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801030cf:	00 
801030d0:	89 fe                	mov    %edi,%esi
801030d2:	39 df                	cmp    %ebx,%edi
801030d4:	73 42                	jae    80103118 <mpsearch1+0x68>
801030d6:	83 ec 04             	sub    $0x4,%esp
801030d9:	8d 7e 10             	lea    0x10(%esi),%edi
801030dc:	6a 04                	push   $0x4
801030de:	68 e9 74 10 80       	push   $0x801074e9
801030e3:	56                   	push   %esi
801030e4:	e8 47 16 00 00       	call   80104730 <memcmp>
801030e9:	83 c4 10             	add    $0x10,%esp
801030ec:	85 c0                	test   %eax,%eax
801030ee:	75 e0                	jne    801030d0 <mpsearch1+0x20>
801030f0:	89 f2                	mov    %esi,%edx
801030f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030f8:	0f b6 0a             	movzbl (%edx),%ecx
801030fb:	83 c2 01             	add    $0x1,%edx
801030fe:	01 c8                	add    %ecx,%eax
80103100:	39 fa                	cmp    %edi,%edx
80103102:	75 f4                	jne    801030f8 <mpsearch1+0x48>
80103104:	84 c0                	test   %al,%al
80103106:	75 c8                	jne    801030d0 <mpsearch1+0x20>
80103108:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010310b:	89 f0                	mov    %esi,%eax
8010310d:	5b                   	pop    %ebx
8010310e:	5e                   	pop    %esi
8010310f:	5f                   	pop    %edi
80103110:	5d                   	pop    %ebp
80103111:	c3                   	ret
80103112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103118:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010311b:	31 f6                	xor    %esi,%esi
8010311d:	5b                   	pop    %ebx
8010311e:	89 f0                	mov    %esi,%eax
80103120:	5e                   	pop    %esi
80103121:	5f                   	pop    %edi
80103122:	5d                   	pop    %ebp
80103123:	c3                   	ret
80103124:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010312b:	00 
8010312c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103130 <mpinit>:
80103130:	55                   	push   %ebp
80103131:	89 e5                	mov    %esp,%ebp
80103133:	57                   	push   %edi
80103134:	56                   	push   %esi
80103135:	53                   	push   %ebx
80103136:	83 ec 1c             	sub    $0x1c,%esp
80103139:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103140:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103147:	c1 e0 08             	shl    $0x8,%eax
8010314a:	09 d0                	or     %edx,%eax
8010314c:	c1 e0 04             	shl    $0x4,%eax
8010314f:	75 1b                	jne    8010316c <mpinit+0x3c>
80103151:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80103158:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
8010315f:	c1 e0 08             	shl    $0x8,%eax
80103162:	09 d0                	or     %edx,%eax
80103164:	c1 e0 0a             	shl    $0xa,%eax
80103167:	2d 00 04 00 00       	sub    $0x400,%eax
8010316c:	ba 00 04 00 00       	mov    $0x400,%edx
80103171:	e8 3a ff ff ff       	call   801030b0 <mpsearch1>
80103176:	89 c3                	mov    %eax,%ebx
80103178:	85 c0                	test   %eax,%eax
8010317a:	0f 84 58 01 00 00    	je     801032d8 <mpinit+0x1a8>
80103180:	8b 73 04             	mov    0x4(%ebx),%esi
80103183:	85 f6                	test   %esi,%esi
80103185:	0f 84 3d 01 00 00    	je     801032c8 <mpinit+0x198>
8010318b:	83 ec 04             	sub    $0x4,%esp
8010318e:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80103194:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103197:	6a 04                	push   $0x4
80103199:	68 ee 74 10 80       	push   $0x801074ee
8010319e:	50                   	push   %eax
8010319f:	e8 8c 15 00 00       	call   80104730 <memcmp>
801031a4:	83 c4 10             	add    $0x10,%esp
801031a7:	85 c0                	test   %eax,%eax
801031a9:	0f 85 19 01 00 00    	jne    801032c8 <mpinit+0x198>
801031af:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
801031b6:	3c 01                	cmp    $0x1,%al
801031b8:	74 08                	je     801031c2 <mpinit+0x92>
801031ba:	3c 04                	cmp    $0x4,%al
801031bc:	0f 85 06 01 00 00    	jne    801032c8 <mpinit+0x198>
801031c2:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
801031c9:	66 85 d2             	test   %dx,%dx
801031cc:	74 22                	je     801031f0 <mpinit+0xc0>
801031ce:	8d 3c 32             	lea    (%edx,%esi,1),%edi
801031d1:	89 f0                	mov    %esi,%eax
801031d3:	31 d2                	xor    %edx,%edx
801031d5:	8d 76 00             	lea    0x0(%esi),%esi
801031d8:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
801031df:	83 c0 01             	add    $0x1,%eax
801031e2:	01 ca                	add    %ecx,%edx
801031e4:	39 f8                	cmp    %edi,%eax
801031e6:	75 f0                	jne    801031d8 <mpinit+0xa8>
801031e8:	84 d2                	test   %dl,%dl
801031ea:	0f 85 d8 00 00 00    	jne    801032c8 <mpinit+0x198>
801031f0:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801031f6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801031f9:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801031fc:	a3 7c c0 11 80       	mov    %eax,0x8011c07c
80103201:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80103208:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
8010320e:	01 d7                	add    %edx,%edi
80103210:	89 fa                	mov    %edi,%edx
80103212:	bf 01 00 00 00       	mov    $0x1,%edi
80103217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010321e:	00 
8010321f:	90                   	nop
80103220:	39 d0                	cmp    %edx,%eax
80103222:	73 19                	jae    8010323d <mpinit+0x10d>
80103224:	0f b6 08             	movzbl (%eax),%ecx
80103227:	80 f9 02             	cmp    $0x2,%cl
8010322a:	0f 84 80 00 00 00    	je     801032b0 <mpinit+0x180>
80103230:	77 6e                	ja     801032a0 <mpinit+0x170>
80103232:	84 c9                	test   %cl,%cl
80103234:	74 3a                	je     80103270 <mpinit+0x140>
80103236:	83 c0 08             	add    $0x8,%eax
80103239:	39 d0                	cmp    %edx,%eax
8010323b:	72 e7                	jb     80103224 <mpinit+0xf4>
8010323d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103240:	85 ff                	test   %edi,%edi
80103242:	0f 84 dd 00 00 00    	je     80103325 <mpinit+0x1f5>
80103248:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
8010324c:	74 15                	je     80103263 <mpinit+0x133>
8010324e:	b8 70 00 00 00       	mov    $0x70,%eax
80103253:	ba 22 00 00 00       	mov    $0x22,%edx
80103258:	ee                   	out    %al,(%dx)
80103259:	ba 23 00 00 00       	mov    $0x23,%edx
8010325e:	ec                   	in     (%dx),%al
8010325f:	83 c8 01             	or     $0x1,%eax
80103262:	ee                   	out    %al,(%dx)
80103263:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103266:	5b                   	pop    %ebx
80103267:	5e                   	pop    %esi
80103268:	5f                   	pop    %edi
80103269:	5d                   	pop    %ebp
8010326a:	c3                   	ret
8010326b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103270:	8b 0d 64 c1 11 80    	mov    0x8011c164,%ecx
80103276:	83 f9 07             	cmp    $0x7,%ecx
80103279:	7f 19                	jg     80103294 <mpinit+0x164>
8010327b:	69 f1 b0 00 00 00    	imul   $0xb0,%ecx,%esi
80103281:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
80103285:	83 c1 01             	add    $0x1,%ecx
80103288:	89 0d 64 c1 11 80    	mov    %ecx,0x8011c164
8010328e:	88 9e 80 c1 11 80    	mov    %bl,-0x7fee3e80(%esi)
80103294:	83 c0 14             	add    $0x14,%eax
80103297:	eb 87                	jmp    80103220 <mpinit+0xf0>
80103299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032a0:	83 e9 03             	sub    $0x3,%ecx
801032a3:	80 f9 01             	cmp    $0x1,%cl
801032a6:	76 8e                	jbe    80103236 <mpinit+0x106>
801032a8:	31 ff                	xor    %edi,%edi
801032aa:	e9 71 ff ff ff       	jmp    80103220 <mpinit+0xf0>
801032af:	90                   	nop
801032b0:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
801032b4:	83 c0 08             	add    $0x8,%eax
801032b7:	88 0d 60 c1 11 80    	mov    %cl,0x8011c160
801032bd:	e9 5e ff ff ff       	jmp    80103220 <mpinit+0xf0>
801032c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801032c8:	83 ec 0c             	sub    $0xc,%esp
801032cb:	68 f3 74 10 80       	push   $0x801074f3
801032d0:	e8 ab d0 ff ff       	call   80100380 <panic>
801032d5:	8d 76 00             	lea    0x0(%esi),%esi
801032d8:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
801032dd:	eb 0b                	jmp    801032ea <mpinit+0x1ba>
801032df:	90                   	nop
801032e0:	89 f3                	mov    %esi,%ebx
801032e2:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
801032e8:	74 de                	je     801032c8 <mpinit+0x198>
801032ea:	83 ec 04             	sub    $0x4,%esp
801032ed:	8d 73 10             	lea    0x10(%ebx),%esi
801032f0:	6a 04                	push   $0x4
801032f2:	68 e9 74 10 80       	push   $0x801074e9
801032f7:	53                   	push   %ebx
801032f8:	e8 33 14 00 00       	call   80104730 <memcmp>
801032fd:	83 c4 10             	add    $0x10,%esp
80103300:	85 c0                	test   %eax,%eax
80103302:	75 dc                	jne    801032e0 <mpinit+0x1b0>
80103304:	89 da                	mov    %ebx,%edx
80103306:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010330d:	00 
8010330e:	66 90                	xchg   %ax,%ax
80103310:	0f b6 0a             	movzbl (%edx),%ecx
80103313:	83 c2 01             	add    $0x1,%edx
80103316:	01 c8                	add    %ecx,%eax
80103318:	39 d6                	cmp    %edx,%esi
8010331a:	75 f4                	jne    80103310 <mpinit+0x1e0>
8010331c:	84 c0                	test   %al,%al
8010331e:	75 c0                	jne    801032e0 <mpinit+0x1b0>
80103320:	e9 5b fe ff ff       	jmp    80103180 <mpinit+0x50>
80103325:	83 ec 0c             	sub    $0xc,%esp
80103328:	68 0c 75 10 80       	push   $0x8010750c
8010332d:	e8 4e d0 ff ff       	call   80100380 <panic>
80103332:	66 90                	xchg   %ax,%ax
80103334:	66 90                	xchg   %ax,%ax
80103336:	66 90                	xchg   %ax,%ax
80103338:	66 90                	xchg   %ax,%ax
8010333a:	66 90                	xchg   %ax,%ax
8010333c:	66 90                	xchg   %ax,%ax
8010333e:	66 90                	xchg   %ax,%ax

80103340 <picinit>:
80103340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103345:	ba 21 00 00 00       	mov    $0x21,%edx
8010334a:	ee                   	out    %al,(%dx)
8010334b:	ba a1 00 00 00       	mov    $0xa1,%edx
80103350:	ee                   	out    %al,(%dx)
80103351:	c3                   	ret
80103352:	66 90                	xchg   %ax,%ax
80103354:	66 90                	xchg   %ax,%ax
80103356:	66 90                	xchg   %ax,%ax
80103358:	66 90                	xchg   %ax,%ax
8010335a:	66 90                	xchg   %ax,%ax
8010335c:	66 90                	xchg   %ax,%ax
8010335e:	66 90                	xchg   %ax,%ax

80103360 <pipealloc>:
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	57                   	push   %edi
80103364:	56                   	push   %esi
80103365:	53                   	push   %ebx
80103366:	83 ec 0c             	sub    $0xc,%esp
80103369:	8b 75 08             	mov    0x8(%ebp),%esi
8010336c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010336f:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80103375:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010337b:	e8 d0 da ff ff       	call   80100e50 <filealloc>
80103380:	89 06                	mov    %eax,(%esi)
80103382:	85 c0                	test   %eax,%eax
80103384:	0f 84 a5 00 00 00    	je     8010342f <pipealloc+0xcf>
8010338a:	e8 c1 da ff ff       	call   80100e50 <filealloc>
8010338f:	89 07                	mov    %eax,(%edi)
80103391:	85 c0                	test   %eax,%eax
80103393:	0f 84 84 00 00 00    	je     8010341d <pipealloc+0xbd>
80103399:	e8 e2 f2 ff ff       	call   80102680 <kalloc>
8010339e:	89 c3                	mov    %eax,%ebx
801033a0:	85 c0                	test   %eax,%eax
801033a2:	0f 84 a0 00 00 00    	je     80103448 <pipealloc+0xe8>
801033a8:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033af:	00 00 00 
801033b2:	83 ec 08             	sub    $0x8,%esp
801033b5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033bc:	00 00 00 
801033bf:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033c6:	00 00 00 
801033c9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033d0:	00 00 00 
801033d3:	68 2b 75 10 80       	push   $0x8010752b
801033d8:	50                   	push   %eax
801033d9:	e8 32 10 00 00       	call   80104410 <initlock>
801033de:	8b 06                	mov    (%esi),%eax
801033e0:	83 c4 10             	add    $0x10,%esp
801033e3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033e9:	8b 06                	mov    (%esi),%eax
801033eb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033ef:	8b 06                	mov    (%esi),%eax
801033f1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801033f5:	8b 06                	mov    (%esi),%eax
801033f7:	89 58 0c             	mov    %ebx,0xc(%eax)
801033fa:	8b 07                	mov    (%edi),%eax
801033fc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103402:	8b 07                	mov    (%edi),%eax
80103404:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103408:	8b 07                	mov    (%edi),%eax
8010340a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010340e:	8b 07                	mov    (%edi),%eax
80103410:	89 58 0c             	mov    %ebx,0xc(%eax)
80103413:	31 c0                	xor    %eax,%eax
80103415:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103418:	5b                   	pop    %ebx
80103419:	5e                   	pop    %esi
8010341a:	5f                   	pop    %edi
8010341b:	5d                   	pop    %ebp
8010341c:	c3                   	ret
8010341d:	8b 06                	mov    (%esi),%eax
8010341f:	85 c0                	test   %eax,%eax
80103421:	74 1e                	je     80103441 <pipealloc+0xe1>
80103423:	83 ec 0c             	sub    $0xc,%esp
80103426:	50                   	push   %eax
80103427:	e8 e4 da ff ff       	call   80100f10 <fileclose>
8010342c:	83 c4 10             	add    $0x10,%esp
8010342f:	8b 07                	mov    (%edi),%eax
80103431:	85 c0                	test   %eax,%eax
80103433:	74 0c                	je     80103441 <pipealloc+0xe1>
80103435:	83 ec 0c             	sub    $0xc,%esp
80103438:	50                   	push   %eax
80103439:	e8 d2 da ff ff       	call   80100f10 <fileclose>
8010343e:	83 c4 10             	add    $0x10,%esp
80103441:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103446:	eb cd                	jmp    80103415 <pipealloc+0xb5>
80103448:	8b 06                	mov    (%esi),%eax
8010344a:	85 c0                	test   %eax,%eax
8010344c:	75 d5                	jne    80103423 <pipealloc+0xc3>
8010344e:	eb df                	jmp    8010342f <pipealloc+0xcf>

80103450 <pipeclose>:
80103450:	55                   	push   %ebp
80103451:	89 e5                	mov    %esp,%ebp
80103453:	56                   	push   %esi
80103454:	53                   	push   %ebx
80103455:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103458:	8b 75 0c             	mov    0xc(%ebp),%esi
8010345b:	83 ec 0c             	sub    $0xc,%esp
8010345e:	53                   	push   %ebx
8010345f:	e8 dc 10 00 00       	call   80104540 <acquire>
80103464:	83 c4 10             	add    $0x10,%esp
80103467:	85 f6                	test   %esi,%esi
80103469:	74 65                	je     801034d0 <pipeclose+0x80>
8010346b:	83 ec 0c             	sub    $0xc,%esp
8010346e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103474:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010347b:	00 00 00 
8010347e:	50                   	push   %eax
8010347f:	e8 cc 0b 00 00       	call   80104050 <wakeup>
80103484:	83 c4 10             	add    $0x10,%esp
80103487:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010348d:	85 d2                	test   %edx,%edx
8010348f:	75 0a                	jne    8010349b <pipeclose+0x4b>
80103491:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103497:	85 c0                	test   %eax,%eax
80103499:	74 15                	je     801034b0 <pipeclose+0x60>
8010349b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010349e:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034a1:	5b                   	pop    %ebx
801034a2:	5e                   	pop    %esi
801034a3:	5d                   	pop    %ebp
801034a4:	e9 f7 11 00 00       	jmp    801046a0 <release>
801034a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034b0:	83 ec 0c             	sub    $0xc,%esp
801034b3:	53                   	push   %ebx
801034b4:	e8 e7 11 00 00       	call   801046a0 <release>
801034b9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034bc:	83 c4 10             	add    $0x10,%esp
801034bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034c2:	5b                   	pop    %ebx
801034c3:	5e                   	pop    %esi
801034c4:	5d                   	pop    %ebp
801034c5:	e9 f6 ef ff ff       	jmp    801024c0 <kfree>
801034ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801034d0:	83 ec 0c             	sub    $0xc,%esp
801034d3:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801034d9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034e0:	00 00 00 
801034e3:	50                   	push   %eax
801034e4:	e8 67 0b 00 00       	call   80104050 <wakeup>
801034e9:	83 c4 10             	add    $0x10,%esp
801034ec:	eb 99                	jmp    80103487 <pipeclose+0x37>
801034ee:	66 90                	xchg   %ax,%ax

801034f0 <pipewrite>:
801034f0:	55                   	push   %ebp
801034f1:	89 e5                	mov    %esp,%ebp
801034f3:	57                   	push   %edi
801034f4:	56                   	push   %esi
801034f5:	53                   	push   %ebx
801034f6:	83 ec 28             	sub    $0x28,%esp
801034f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801034fc:	8b 7d 10             	mov    0x10(%ebp),%edi
801034ff:	53                   	push   %ebx
80103500:	e8 3b 10 00 00       	call   80104540 <acquire>
80103505:	83 c4 10             	add    $0x10,%esp
80103508:	85 ff                	test   %edi,%edi
8010350a:	0f 8e ce 00 00 00    	jle    801035de <pipewrite+0xee>
80103510:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103516:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103519:	89 7d 10             	mov    %edi,0x10(%ebp)
8010351c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010351f:	8d 34 39             	lea    (%ecx,%edi,1),%esi
80103522:	89 75 e0             	mov    %esi,-0x20(%ebp)
80103525:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010352b:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103531:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
80103537:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010353d:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
80103540:	0f 85 b6 00 00 00    	jne    801035fc <pipewrite+0x10c>
80103546:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103549:	eb 3b                	jmp    80103586 <pipewrite+0x96>
8010354b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103550:	e8 6b 03 00 00       	call   801038c0 <myproc>
80103555:	8b 48 24             	mov    0x24(%eax),%ecx
80103558:	85 c9                	test   %ecx,%ecx
8010355a:	75 34                	jne    80103590 <pipewrite+0xa0>
8010355c:	83 ec 0c             	sub    $0xc,%esp
8010355f:	56                   	push   %esi
80103560:	e8 eb 0a 00 00       	call   80104050 <wakeup>
80103565:	58                   	pop    %eax
80103566:	5a                   	pop    %edx
80103567:	53                   	push   %ebx
80103568:	57                   	push   %edi
80103569:	e8 22 0a 00 00       	call   80103f90 <sleep>
8010356e:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103574:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010357a:	83 c4 10             	add    $0x10,%esp
8010357d:	05 00 02 00 00       	add    $0x200,%eax
80103582:	39 c2                	cmp    %eax,%edx
80103584:	75 2a                	jne    801035b0 <pipewrite+0xc0>
80103586:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010358c:	85 c0                	test   %eax,%eax
8010358e:	75 c0                	jne    80103550 <pipewrite+0x60>
80103590:	83 ec 0c             	sub    $0xc,%esp
80103593:	53                   	push   %ebx
80103594:	e8 07 11 00 00       	call   801046a0 <release>
80103599:	83 c4 10             	add    $0x10,%esp
8010359c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035a4:	5b                   	pop    %ebx
801035a5:	5e                   	pop    %esi
801035a6:	5f                   	pop    %edi
801035a7:	5d                   	pop    %ebp
801035a8:	c3                   	ret
801035a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035b0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801035b3:	8d 42 01             	lea    0x1(%edx),%eax
801035b6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035bc:	83 c1 01             	add    $0x1,%ecx
801035bf:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801035c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801035c8:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
801035cc:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
801035d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801035d3:	39 c1                	cmp    %eax,%ecx
801035d5:	0f 85 50 ff ff ff    	jne    8010352b <pipewrite+0x3b>
801035db:	8b 7d 10             	mov    0x10(%ebp),%edi
801035de:	83 ec 0c             	sub    $0xc,%esp
801035e1:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801035e7:	50                   	push   %eax
801035e8:	e8 63 0a 00 00       	call   80104050 <wakeup>
801035ed:	89 1c 24             	mov    %ebx,(%esp)
801035f0:	e8 ab 10 00 00       	call   801046a0 <release>
801035f5:	83 c4 10             	add    $0x10,%esp
801035f8:	89 f8                	mov    %edi,%eax
801035fa:	eb a5                	jmp    801035a1 <pipewrite+0xb1>
801035fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801035ff:	eb b2                	jmp    801035b3 <pipewrite+0xc3>
80103601:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103608:	00 
80103609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103610 <piperead>:
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	57                   	push   %edi
80103614:	56                   	push   %esi
80103615:	53                   	push   %ebx
80103616:	83 ec 18             	sub    $0x18,%esp
80103619:	8b 75 08             	mov    0x8(%ebp),%esi
8010361c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010361f:	56                   	push   %esi
80103620:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103626:	e8 15 0f 00 00       	call   80104540 <acquire>
8010362b:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103631:	83 c4 10             	add    $0x10,%esp
80103634:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010363a:	74 2f                	je     8010366b <piperead+0x5b>
8010363c:	eb 37                	jmp    80103675 <piperead+0x65>
8010363e:	66 90                	xchg   %ax,%ax
80103640:	e8 7b 02 00 00       	call   801038c0 <myproc>
80103645:	8b 40 24             	mov    0x24(%eax),%eax
80103648:	85 c0                	test   %eax,%eax
8010364a:	0f 85 80 00 00 00    	jne    801036d0 <piperead+0xc0>
80103650:	83 ec 08             	sub    $0x8,%esp
80103653:	56                   	push   %esi
80103654:	53                   	push   %ebx
80103655:	e8 36 09 00 00       	call   80103f90 <sleep>
8010365a:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103660:	83 c4 10             	add    $0x10,%esp
80103663:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103669:	75 0a                	jne    80103675 <piperead+0x65>
8010366b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103671:	85 d2                	test   %edx,%edx
80103673:	75 cb                	jne    80103640 <piperead+0x30>
80103675:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103678:	31 db                	xor    %ebx,%ebx
8010367a:	85 c9                	test   %ecx,%ecx
8010367c:	7f 26                	jg     801036a4 <piperead+0x94>
8010367e:	eb 2c                	jmp    801036ac <piperead+0x9c>
80103680:	8d 48 01             	lea    0x1(%eax),%ecx
80103683:	25 ff 01 00 00       	and    $0x1ff,%eax
80103688:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010368e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103693:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80103696:	83 c3 01             	add    $0x1,%ebx
80103699:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010369c:	74 0e                	je     801036ac <piperead+0x9c>
8010369e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801036a4:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
801036aa:	75 d4                	jne    80103680 <piperead+0x70>
801036ac:	83 ec 0c             	sub    $0xc,%esp
801036af:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801036b5:	50                   	push   %eax
801036b6:	e8 95 09 00 00       	call   80104050 <wakeup>
801036bb:	89 34 24             	mov    %esi,(%esp)
801036be:	e8 dd 0f 00 00       	call   801046a0 <release>
801036c3:	83 c4 10             	add    $0x10,%esp
801036c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036c9:	89 d8                	mov    %ebx,%eax
801036cb:	5b                   	pop    %ebx
801036cc:	5e                   	pop    %esi
801036cd:	5f                   	pop    %edi
801036ce:	5d                   	pop    %ebp
801036cf:	c3                   	ret
801036d0:	83 ec 0c             	sub    $0xc,%esp
801036d3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801036d8:	56                   	push   %esi
801036d9:	e8 c2 0f 00 00       	call   801046a0 <release>
801036de:	83 c4 10             	add    $0x10,%esp
801036e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036e4:	89 d8                	mov    %ebx,%eax
801036e6:	5b                   	pop    %ebx
801036e7:	5e                   	pop    %esi
801036e8:	5f                   	pop    %edi
801036e9:	5d                   	pop    %ebp
801036ea:	c3                   	ret
801036eb:	66 90                	xchg   %ax,%ax
801036ed:	66 90                	xchg   %ax,%ax
801036ef:	90                   	nop

801036f0 <allocproc>:
801036f0:	55                   	push   %ebp
801036f1:	89 e5                	mov    %esp,%ebp
801036f3:	53                   	push   %ebx
801036f4:	bb 34 c7 11 80       	mov    $0x8011c734,%ebx
801036f9:	83 ec 10             	sub    $0x10,%esp
801036fc:	68 00 c7 11 80       	push   $0x8011c700
80103701:	e8 3a 0e 00 00       	call   80104540 <acquire>
80103706:	83 c4 10             	add    $0x10,%esp
80103709:	eb 14                	jmp    8010371f <allocproc+0x2f>
8010370b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103710:	83 eb 80             	sub    $0xffffff80,%ebx
80103713:	81 fb 34 e7 11 80    	cmp    $0x8011e734,%ebx
80103719:	0f 84 81 00 00 00    	je     801037a0 <allocproc+0xb0>
8010371f:	8b 43 0c             	mov    0xc(%ebx),%eax
80103722:	85 c0                	test   %eax,%eax
80103724:	75 ea                	jne    80103710 <allocproc+0x20>
80103726:	a1 04 90 10 80       	mov    0x80109004,%eax
8010372b:	83 ec 0c             	sub    $0xc,%esp
8010372e:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103735:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
8010373c:	89 43 10             	mov    %eax,0x10(%ebx)
8010373f:	8d 50 01             	lea    0x1(%eax),%edx
80103742:	68 00 c7 11 80       	push   $0x8011c700
80103747:	89 15 04 90 10 80    	mov    %edx,0x80109004
8010374d:	e8 4e 0f 00 00       	call   801046a0 <release>
80103752:	e8 29 ef ff ff       	call   80102680 <kalloc>
80103757:	83 c4 10             	add    $0x10,%esp
8010375a:	89 43 08             	mov    %eax,0x8(%ebx)
8010375d:	85 c0                	test   %eax,%eax
8010375f:	74 58                	je     801037b9 <allocproc+0xc9>
80103761:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
80103767:	83 ec 04             	sub    $0x4,%esp
8010376a:	05 9c 0f 00 00       	add    $0xf9c,%eax
8010376f:	89 53 18             	mov    %edx,0x18(%ebx)
80103772:	c7 40 14 1f 59 10 80 	movl   $0x8010591f,0x14(%eax)
80103779:	89 43 1c             	mov    %eax,0x1c(%ebx)
8010377c:	6a 14                	push   $0x14
8010377e:	6a 00                	push   $0x0
80103780:	50                   	push   %eax
80103781:	e8 6a 0f 00 00       	call   801046f0 <memset>
80103786:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103789:	83 c4 10             	add    $0x10,%esp
8010378c:	c7 40 10 d0 37 10 80 	movl   $0x801037d0,0x10(%eax)
80103793:	89 d8                	mov    %ebx,%eax
80103795:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103798:	c9                   	leave
80103799:	c3                   	ret
8010379a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037a0:	83 ec 0c             	sub    $0xc,%esp
801037a3:	31 db                	xor    %ebx,%ebx
801037a5:	68 00 c7 11 80       	push   $0x8011c700
801037aa:	e8 f1 0e 00 00       	call   801046a0 <release>
801037af:	83 c4 10             	add    $0x10,%esp
801037b2:	89 d8                	mov    %ebx,%eax
801037b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037b7:	c9                   	leave
801037b8:	c3                   	ret
801037b9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801037c0:	31 db                	xor    %ebx,%ebx
801037c2:	eb ee                	jmp    801037b2 <allocproc+0xc2>
801037c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801037cb:	00 
801037cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037d0 <forkret>:
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 14             	sub    $0x14,%esp
801037d6:	68 00 c7 11 80       	push   $0x8011c700
801037db:	e8 c0 0e 00 00       	call   801046a0 <release>
801037e0:	a1 00 90 10 80       	mov    0x80109000,%eax
801037e5:	83 c4 10             	add    $0x10,%esp
801037e8:	85 c0                	test   %eax,%eax
801037ea:	75 04                	jne    801037f0 <forkret+0x20>
801037ec:	c9                   	leave
801037ed:	c3                   	ret
801037ee:	66 90                	xchg   %ax,%ax
801037f0:	c7 05 00 90 10 80 00 	movl   $0x0,0x80109000
801037f7:	00 00 00 
801037fa:	83 ec 0c             	sub    $0xc,%esp
801037fd:	6a 01                	push   $0x1
801037ff:	e8 9c dd ff ff       	call   801015a0 <iinit>
80103804:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010380b:	e8 e0 f3 ff ff       	call   80102bf0 <initlog>
80103810:	83 c4 10             	add    $0x10,%esp
80103813:	c9                   	leave
80103814:	c3                   	ret
80103815:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010381c:	00 
8010381d:	8d 76 00             	lea    0x0(%esi),%esi

80103820 <pinit>:
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	83 ec 10             	sub    $0x10,%esp
80103826:	68 30 75 10 80       	push   $0x80107530
8010382b:	68 00 c7 11 80       	push   $0x8011c700
80103830:	e8 db 0b 00 00       	call   80104410 <initlock>
80103835:	83 c4 10             	add    $0x10,%esp
80103838:	c9                   	leave
80103839:	c3                   	ret
8010383a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103840 <mycpu>:
80103840:	55                   	push   %ebp
80103841:	89 e5                	mov    %esp,%ebp
80103843:	56                   	push   %esi
80103844:	53                   	push   %ebx
80103845:	9c                   	pushf
80103846:	58                   	pop    %eax
80103847:	f6 c4 02             	test   $0x2,%ah
8010384a:	75 46                	jne    80103892 <mycpu+0x52>
8010384c:	e8 cf ef ff ff       	call   80102820 <lapicid>
80103851:	8b 35 64 c1 11 80    	mov    0x8011c164,%esi
80103857:	85 f6                	test   %esi,%esi
80103859:	7e 2a                	jle    80103885 <mycpu+0x45>
8010385b:	31 d2                	xor    %edx,%edx
8010385d:	eb 08                	jmp    80103867 <mycpu+0x27>
8010385f:	90                   	nop
80103860:	83 c2 01             	add    $0x1,%edx
80103863:	39 f2                	cmp    %esi,%edx
80103865:	74 1e                	je     80103885 <mycpu+0x45>
80103867:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
8010386d:	0f b6 99 80 c1 11 80 	movzbl -0x7fee3e80(%ecx),%ebx
80103874:	39 c3                	cmp    %eax,%ebx
80103876:	75 e8                	jne    80103860 <mycpu+0x20>
80103878:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010387b:	8d 81 80 c1 11 80    	lea    -0x7fee3e80(%ecx),%eax
80103881:	5b                   	pop    %ebx
80103882:	5e                   	pop    %esi
80103883:	5d                   	pop    %ebp
80103884:	c3                   	ret
80103885:	83 ec 0c             	sub    $0xc,%esp
80103888:	68 37 75 10 80       	push   $0x80107537
8010388d:	e8 ee ca ff ff       	call   80100380 <panic>
80103892:	83 ec 0c             	sub    $0xc,%esp
80103895:	68 64 76 10 80       	push   $0x80107664
8010389a:	e8 e1 ca ff ff       	call   80100380 <panic>
8010389f:	90                   	nop

801038a0 <cpuid>:
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	83 ec 08             	sub    $0x8,%esp
801038a6:	e8 95 ff ff ff       	call   80103840 <mycpu>
801038ab:	c9                   	leave
801038ac:	2d 80 c1 11 80       	sub    $0x8011c180,%eax
801038b1:	c1 f8 04             	sar    $0x4,%eax
801038b4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
801038ba:	c3                   	ret
801038bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801038c0 <myproc>:
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	53                   	push   %ebx
801038c4:	83 ec 04             	sub    $0x4,%esp
801038c7:	e8 24 0c 00 00       	call   801044f0 <pushcli>
801038cc:	e8 6f ff ff ff       	call   80103840 <mycpu>
801038d1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801038d7:	e8 64 0d 00 00       	call   80104640 <popcli>
801038dc:	89 d8                	mov    %ebx,%eax
801038de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038e1:	c9                   	leave
801038e2:	c3                   	ret
801038e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801038ea:	00 
801038eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801038f0 <userinit>:
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	53                   	push   %ebx
801038f4:	83 ec 04             	sub    $0x4,%esp
801038f7:	e8 f4 fd ff ff       	call   801036f0 <allocproc>
801038fc:	89 c3                	mov    %eax,%ebx
801038fe:	a3 34 e7 11 80       	mov    %eax,0x8011e734
80103903:	e8 e8 35 00 00       	call   80106ef0 <setupkvm>
80103908:	89 43 04             	mov    %eax,0x4(%ebx)
8010390b:	85 c0                	test   %eax,%eax
8010390d:	0f 84 bd 00 00 00    	je     801039d0 <userinit+0xe0>
80103913:	83 ec 04             	sub    $0x4,%esp
80103916:	68 2c 00 00 00       	push   $0x2c
8010391b:	68 60 94 10 80       	push   $0x80109460
80103920:	50                   	push   %eax
80103921:	e8 aa 32 00 00       	call   80106bd0 <inituvm>
80103926:	83 c4 0c             	add    $0xc,%esp
80103929:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
8010392f:	6a 4c                	push   $0x4c
80103931:	6a 00                	push   $0x0
80103933:	ff 73 18             	push   0x18(%ebx)
80103936:	e8 b5 0d 00 00       	call   801046f0 <memset>
8010393b:	8b 43 18             	mov    0x18(%ebx),%eax
8010393e:	ba 1b 00 00 00       	mov    $0x1b,%edx
80103943:	83 c4 0c             	add    $0xc,%esp
80103946:	b9 23 00 00 00       	mov    $0x23,%ecx
8010394b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
8010394f:	8b 43 18             	mov    0x18(%ebx),%eax
80103952:	66 89 48 2c          	mov    %cx,0x2c(%eax)
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010395d:	66 89 50 28          	mov    %dx,0x28(%eax)
80103961:	8b 43 18             	mov    0x18(%ebx),%eax
80103964:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103968:	66 89 50 48          	mov    %dx,0x48(%eax)
8010396c:	8b 43 18             	mov    0x18(%ebx),%eax
8010396f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103976:	8b 43 18             	mov    0x18(%ebx),%eax
80103979:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103980:	8b 43 18             	mov    0x18(%ebx),%eax
80103983:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010398a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010398d:	6a 10                	push   $0x10
8010398f:	68 60 75 10 80       	push   $0x80107560
80103994:	50                   	push   %eax
80103995:	e8 06 0f 00 00       	call   801048a0 <safestrcpy>
8010399a:	c7 04 24 69 75 10 80 	movl   $0x80107569,(%esp)
801039a1:	e8 fa e6 ff ff       	call   801020a0 <namei>
801039a6:	89 43 68             	mov    %eax,0x68(%ebx)
801039a9:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
801039b0:	e8 8b 0b 00 00       	call   80104540 <acquire>
801039b5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801039bc:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
801039c3:	e8 d8 0c 00 00       	call   801046a0 <release>
801039c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039cb:	83 c4 10             	add    $0x10,%esp
801039ce:	c9                   	leave
801039cf:	c3                   	ret
801039d0:	83 ec 0c             	sub    $0xc,%esp
801039d3:	68 47 75 10 80       	push   $0x80107547
801039d8:	e8 a3 c9 ff ff       	call   80100380 <panic>
801039dd:	8d 76 00             	lea    0x0(%esi),%esi

801039e0 <growproc>:
801039e0:	55                   	push   %ebp
801039e1:	89 e5                	mov    %esp,%ebp
801039e3:	56                   	push   %esi
801039e4:	53                   	push   %ebx
801039e5:	8b 75 08             	mov    0x8(%ebp),%esi
801039e8:	e8 03 0b 00 00       	call   801044f0 <pushcli>
801039ed:	e8 4e fe ff ff       	call   80103840 <mycpu>
801039f2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801039f8:	e8 43 0c 00 00       	call   80104640 <popcli>
801039fd:	8b 03                	mov    (%ebx),%eax
801039ff:	85 f6                	test   %esi,%esi
80103a01:	7f 1d                	jg     80103a20 <growproc+0x40>
80103a03:	75 3b                	jne    80103a40 <growproc+0x60>
80103a05:	83 ec 0c             	sub    $0xc,%esp
80103a08:	89 03                	mov    %eax,(%ebx)
80103a0a:	53                   	push   %ebx
80103a0b:	e8 b0 30 00 00       	call   80106ac0 <switchuvm>
80103a10:	83 c4 10             	add    $0x10,%esp
80103a13:	31 c0                	xor    %eax,%eax
80103a15:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a18:	5b                   	pop    %ebx
80103a19:	5e                   	pop    %esi
80103a1a:	5d                   	pop    %ebp
80103a1b:	c3                   	ret
80103a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103a20:	83 ec 04             	sub    $0x4,%esp
80103a23:	01 c6                	add    %eax,%esi
80103a25:	56                   	push   %esi
80103a26:	50                   	push   %eax
80103a27:	ff 73 04             	push   0x4(%ebx)
80103a2a:	e8 f1 32 00 00       	call   80106d20 <allocuvm>
80103a2f:	83 c4 10             	add    $0x10,%esp
80103a32:	85 c0                	test   %eax,%eax
80103a34:	75 cf                	jne    80103a05 <growproc+0x25>
80103a36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a3b:	eb d8                	jmp    80103a15 <growproc+0x35>
80103a3d:	8d 76 00             	lea    0x0(%esi),%esi
80103a40:	83 ec 04             	sub    $0x4,%esp
80103a43:	01 c6                	add    %eax,%esi
80103a45:	56                   	push   %esi
80103a46:	50                   	push   %eax
80103a47:	ff 73 04             	push   0x4(%ebx)
80103a4a:	e8 f1 33 00 00       	call   80106e40 <deallocuvm>
80103a4f:	83 c4 10             	add    $0x10,%esp
80103a52:	85 c0                	test   %eax,%eax
80103a54:	75 af                	jne    80103a05 <growproc+0x25>
80103a56:	eb de                	jmp    80103a36 <growproc+0x56>
80103a58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103a5f:	00 

80103a60 <fork>:
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	57                   	push   %edi
80103a64:	56                   	push   %esi
80103a65:	53                   	push   %ebx
80103a66:	83 ec 1c             	sub    $0x1c,%esp
80103a69:	e8 82 0a 00 00       	call   801044f0 <pushcli>
80103a6e:	e8 cd fd ff ff       	call   80103840 <mycpu>
80103a73:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103a79:	e8 c2 0b 00 00       	call   80104640 <popcli>
80103a7e:	e8 6d fc ff ff       	call   801036f0 <allocproc>
80103a83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a86:	85 c0                	test   %eax,%eax
80103a88:	0f 84 d6 00 00 00    	je     80103b64 <fork+0x104>
80103a8e:	83 ec 08             	sub    $0x8,%esp
80103a91:	ff 33                	push   (%ebx)
80103a93:	89 c7                	mov    %eax,%edi
80103a95:	ff 73 04             	push   0x4(%ebx)
80103a98:	e8 43 35 00 00       	call   80106fe0 <copyuvm>
80103a9d:	83 c4 10             	add    $0x10,%esp
80103aa0:	89 47 04             	mov    %eax,0x4(%edi)
80103aa3:	85 c0                	test   %eax,%eax
80103aa5:	0f 84 9a 00 00 00    	je     80103b45 <fork+0xe5>
80103aab:	8b 03                	mov    (%ebx),%eax
80103aad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103ab0:	89 01                	mov    %eax,(%ecx)
80103ab2:	8b 79 18             	mov    0x18(%ecx),%edi
80103ab5:	89 c8                	mov    %ecx,%eax
80103ab7:	89 59 14             	mov    %ebx,0x14(%ecx)
80103aba:	b9 13 00 00 00       	mov    $0x13,%ecx
80103abf:	8b 73 18             	mov    0x18(%ebx),%esi
80103ac2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103ac4:	31 f6                	xor    %esi,%esi
80103ac6:	8b 40 18             	mov    0x18(%eax),%eax
80103ac9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103ad0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ad4:	85 c0                	test   %eax,%eax
80103ad6:	74 13                	je     80103aeb <fork+0x8b>
80103ad8:	83 ec 0c             	sub    $0xc,%esp
80103adb:	50                   	push   %eax
80103adc:	e8 df d3 ff ff       	call   80100ec0 <filedup>
80103ae1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ae4:	83 c4 10             	add    $0x10,%esp
80103ae7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103aeb:	83 c6 01             	add    $0x1,%esi
80103aee:	83 fe 10             	cmp    $0x10,%esi
80103af1:	75 dd                	jne    80103ad0 <fork+0x70>
80103af3:	83 ec 0c             	sub    $0xc,%esp
80103af6:	ff 73 68             	push   0x68(%ebx)
80103af9:	83 c3 6c             	add    $0x6c,%ebx
80103afc:	e8 8f dc ff ff       	call   80101790 <idup>
80103b01:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103b04:	83 c4 0c             	add    $0xc,%esp
80103b07:	89 47 68             	mov    %eax,0x68(%edi)
80103b0a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b0d:	6a 10                	push   $0x10
80103b0f:	53                   	push   %ebx
80103b10:	50                   	push   %eax
80103b11:	e8 8a 0d 00 00       	call   801048a0 <safestrcpy>
80103b16:	8b 5f 10             	mov    0x10(%edi),%ebx
80103b19:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103b20:	e8 1b 0a 00 00       	call   80104540 <acquire>
80103b25:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103b2c:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103b33:	e8 68 0b 00 00       	call   801046a0 <release>
80103b38:	83 c4 10             	add    $0x10,%esp
80103b3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b3e:	89 d8                	mov    %ebx,%eax
80103b40:	5b                   	pop    %ebx
80103b41:	5e                   	pop    %esi
80103b42:	5f                   	pop    %edi
80103b43:	5d                   	pop    %ebp
80103b44:	c3                   	ret
80103b45:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b48:	83 ec 0c             	sub    $0xc,%esp
80103b4b:	ff 73 08             	push   0x8(%ebx)
80103b4e:	e8 6d e9 ff ff       	call   801024c0 <kfree>
80103b53:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103b5a:	83 c4 10             	add    $0x10,%esp
80103b5d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103b64:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b69:	eb d0                	jmp    80103b3b <fork+0xdb>
80103b6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80103b70 <scheduler>:
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	57                   	push   %edi
80103b74:	56                   	push   %esi
80103b75:	53                   	push   %ebx
80103b76:	83 ec 1c             	sub    $0x1c,%esp
80103b79:	e8 c2 fc ff ff       	call   80103840 <mycpu>
80103b7e:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103b85:	00 00 00 
80103b88:	89 c6                	mov    %eax,%esi
80103b8a:	8d 78 04             	lea    0x4(%eax),%edi
80103b8d:	8d 76 00             	lea    0x0(%esi),%esi
80103b90:	fb                   	sti
80103b91:	83 ec 0c             	sub    $0xc,%esp
80103b94:	bb 34 c7 11 80       	mov    $0x8011c734,%ebx
80103b99:	68 00 c7 11 80       	push   $0x8011c700
80103b9e:	e8 9d 09 00 00       	call   80104540 <acquire>
80103ba3:	83 c4 10             	add    $0x10,%esp
80103ba6:	31 c0                	xor    %eax,%eax
80103ba8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103baf:	00 
80103bb0:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103bb4:	75 38                	jne    80103bee <scheduler+0x7e>
80103bb6:	83 ec 0c             	sub    $0xc,%esp
80103bb9:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
80103bbf:	53                   	push   %ebx
80103bc0:	e8 fb 2e 00 00       	call   80106ac0 <switchuvm>
80103bc5:	58                   	pop    %eax
80103bc6:	5a                   	pop    %edx
80103bc7:	ff 73 1c             	push   0x1c(%ebx)
80103bca:	57                   	push   %edi
80103bcb:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
80103bd2:	e8 24 0d 00 00       	call   801048fb <swtch>
80103bd7:	e8 d4 2e 00 00       	call   80106ab0 <switchkvm>
80103bdc:	83 c4 10             	add    $0x10,%esp
80103bdf:	b8 01 00 00 00       	mov    $0x1,%eax
80103be4:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103beb:	00 00 00 
80103bee:	83 eb 80             	sub    $0xffffff80,%ebx
80103bf1:	81 fb 34 e7 11 80    	cmp    $0x8011e734,%ebx
80103bf7:	75 b7                	jne    80103bb0 <scheduler+0x40>
80103bf9:	83 ec 0c             	sub    $0xc,%esp
80103bfc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103bff:	68 00 c7 11 80       	push   $0x8011c700
80103c04:	e8 97 0a 00 00       	call   801046a0 <release>
80103c09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103c0c:	83 c4 10             	add    $0x10,%esp
80103c0f:	85 c0                	test   %eax,%eax
80103c11:	0f 85 79 ff ff ff    	jne    80103b90 <scheduler+0x20>
80103c17:	f4                   	hlt
80103c18:	e9 73 ff ff ff       	jmp    80103b90 <scheduler+0x20>
80103c1d:	8d 76 00             	lea    0x0(%esi),%esi

80103c20 <sched>:
80103c20:	55                   	push   %ebp
80103c21:	89 e5                	mov    %esp,%ebp
80103c23:	56                   	push   %esi
80103c24:	53                   	push   %ebx
80103c25:	e8 c6 08 00 00       	call   801044f0 <pushcli>
80103c2a:	e8 11 fc ff ff       	call   80103840 <mycpu>
80103c2f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103c35:	e8 06 0a 00 00       	call   80104640 <popcli>
80103c3a:	83 ec 0c             	sub    $0xc,%esp
80103c3d:	68 00 c7 11 80       	push   $0x8011c700
80103c42:	e8 69 08 00 00       	call   801044b0 <holding>
80103c47:	83 c4 10             	add    $0x10,%esp
80103c4a:	85 c0                	test   %eax,%eax
80103c4c:	74 4f                	je     80103c9d <sched+0x7d>
80103c4e:	e8 ed fb ff ff       	call   80103840 <mycpu>
80103c53:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103c5a:	75 68                	jne    80103cc4 <sched+0xa4>
80103c5c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103c60:	74 55                	je     80103cb7 <sched+0x97>
80103c62:	9c                   	pushf
80103c63:	58                   	pop    %eax
80103c64:	f6 c4 02             	test   $0x2,%ah
80103c67:	75 41                	jne    80103caa <sched+0x8a>
80103c69:	e8 d2 fb ff ff       	call   80103840 <mycpu>
80103c6e:	83 c3 1c             	add    $0x1c,%ebx
80103c71:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103c77:	e8 c4 fb ff ff       	call   80103840 <mycpu>
80103c7c:	83 ec 08             	sub    $0x8,%esp
80103c7f:	ff 70 04             	push   0x4(%eax)
80103c82:	53                   	push   %ebx
80103c83:	e8 73 0c 00 00       	call   801048fb <swtch>
80103c88:	e8 b3 fb ff ff       	call   80103840 <mycpu>
80103c8d:	83 c4 10             	add    $0x10,%esp
80103c90:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103c96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c99:	5b                   	pop    %ebx
80103c9a:	5e                   	pop    %esi
80103c9b:	5d                   	pop    %ebp
80103c9c:	c3                   	ret
80103c9d:	83 ec 0c             	sub    $0xc,%esp
80103ca0:	68 6b 75 10 80       	push   $0x8010756b
80103ca5:	e8 d6 c6 ff ff       	call   80100380 <panic>
80103caa:	83 ec 0c             	sub    $0xc,%esp
80103cad:	68 97 75 10 80       	push   $0x80107597
80103cb2:	e8 c9 c6 ff ff       	call   80100380 <panic>
80103cb7:	83 ec 0c             	sub    $0xc,%esp
80103cba:	68 89 75 10 80       	push   $0x80107589
80103cbf:	e8 bc c6 ff ff       	call   80100380 <panic>
80103cc4:	83 ec 0c             	sub    $0xc,%esp
80103cc7:	68 7d 75 10 80       	push   $0x8010757d
80103ccc:	e8 af c6 ff ff       	call   80100380 <panic>
80103cd1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103cd8:	00 
80103cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ce0 <exit>:
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	57                   	push   %edi
80103ce4:	56                   	push   %esi
80103ce5:	53                   	push   %ebx
80103ce6:	83 ec 0c             	sub    $0xc,%esp
80103ce9:	e8 d2 fb ff ff       	call   801038c0 <myproc>
80103cee:	39 05 34 e7 11 80    	cmp    %eax,0x8011e734
80103cf4:	0f 84 fd 00 00 00    	je     80103df7 <exit+0x117>
80103cfa:	89 c3                	mov    %eax,%ebx
80103cfc:	8d 70 28             	lea    0x28(%eax),%esi
80103cff:	8d 78 68             	lea    0x68(%eax),%edi
80103d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d08:	8b 06                	mov    (%esi),%eax
80103d0a:	85 c0                	test   %eax,%eax
80103d0c:	74 12                	je     80103d20 <exit+0x40>
80103d0e:	83 ec 0c             	sub    $0xc,%esp
80103d11:	50                   	push   %eax
80103d12:	e8 f9 d1 ff ff       	call   80100f10 <fileclose>
80103d17:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103d1d:	83 c4 10             	add    $0x10,%esp
80103d20:	83 c6 04             	add    $0x4,%esi
80103d23:	39 f7                	cmp    %esi,%edi
80103d25:	75 e1                	jne    80103d08 <exit+0x28>
80103d27:	e8 64 ef ff ff       	call   80102c90 <begin_op>
80103d2c:	83 ec 0c             	sub    $0xc,%esp
80103d2f:	ff 73 68             	push   0x68(%ebx)
80103d32:	e8 b9 db ff ff       	call   801018f0 <iput>
80103d37:	e8 c4 ef ff ff       	call   80102d00 <end_op>
80103d3c:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
80103d43:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103d4a:	e8 f1 07 00 00       	call   80104540 <acquire>
80103d4f:	8b 53 14             	mov    0x14(%ebx),%edx
80103d52:	83 c4 10             	add    $0x10,%esp
80103d55:	b8 34 c7 11 80       	mov    $0x8011c734,%eax
80103d5a:	eb 0e                	jmp    80103d6a <exit+0x8a>
80103d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d60:	83 e8 80             	sub    $0xffffff80,%eax
80103d63:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
80103d68:	74 1c                	je     80103d86 <exit+0xa6>
80103d6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d6e:	75 f0                	jne    80103d60 <exit+0x80>
80103d70:	3b 50 20             	cmp    0x20(%eax),%edx
80103d73:	75 eb                	jne    80103d60 <exit+0x80>
80103d75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d7c:	83 e8 80             	sub    $0xffffff80,%eax
80103d7f:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
80103d84:	75 e4                	jne    80103d6a <exit+0x8a>
80103d86:	8b 0d 34 e7 11 80    	mov    0x8011e734,%ecx
80103d8c:	ba 34 c7 11 80       	mov    $0x8011c734,%edx
80103d91:	eb 10                	jmp    80103da3 <exit+0xc3>
80103d93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103d98:	83 ea 80             	sub    $0xffffff80,%edx
80103d9b:	81 fa 34 e7 11 80    	cmp    $0x8011e734,%edx
80103da1:	74 3b                	je     80103dde <exit+0xfe>
80103da3:	39 5a 14             	cmp    %ebx,0x14(%edx)
80103da6:	75 f0                	jne    80103d98 <exit+0xb8>
80103da8:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103dac:	89 4a 14             	mov    %ecx,0x14(%edx)
80103daf:	75 e7                	jne    80103d98 <exit+0xb8>
80103db1:	b8 34 c7 11 80       	mov    $0x8011c734,%eax
80103db6:	eb 12                	jmp    80103dca <exit+0xea>
80103db8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103dbf:	00 
80103dc0:	83 e8 80             	sub    $0xffffff80,%eax
80103dc3:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
80103dc8:	74 ce                	je     80103d98 <exit+0xb8>
80103dca:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dce:	75 f0                	jne    80103dc0 <exit+0xe0>
80103dd0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103dd3:	75 eb                	jne    80103dc0 <exit+0xe0>
80103dd5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103ddc:	eb e2                	jmp    80103dc0 <exit+0xe0>
80103dde:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
80103de5:	e8 36 fe ff ff       	call   80103c20 <sched>
80103dea:	83 ec 0c             	sub    $0xc,%esp
80103ded:	68 b8 75 10 80       	push   $0x801075b8
80103df2:	e8 89 c5 ff ff       	call   80100380 <panic>
80103df7:	83 ec 0c             	sub    $0xc,%esp
80103dfa:	68 ab 75 10 80       	push   $0x801075ab
80103dff:	e8 7c c5 ff ff       	call   80100380 <panic>
80103e04:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103e0b:	00 
80103e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103e10 <wait>:
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	56                   	push   %esi
80103e14:	53                   	push   %ebx
80103e15:	e8 d6 06 00 00       	call   801044f0 <pushcli>
80103e1a:	e8 21 fa ff ff       	call   80103840 <mycpu>
80103e1f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103e25:	e8 16 08 00 00       	call   80104640 <popcli>
80103e2a:	83 ec 0c             	sub    $0xc,%esp
80103e2d:	68 00 c7 11 80       	push   $0x8011c700
80103e32:	e8 09 07 00 00       	call   80104540 <acquire>
80103e37:	83 c4 10             	add    $0x10,%esp
80103e3a:	31 c0                	xor    %eax,%eax
80103e3c:	bb 34 c7 11 80       	mov    $0x8011c734,%ebx
80103e41:	eb 10                	jmp    80103e53 <wait+0x43>
80103e43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103e48:	83 eb 80             	sub    $0xffffff80,%ebx
80103e4b:	81 fb 34 e7 11 80    	cmp    $0x8011e734,%ebx
80103e51:	74 1b                	je     80103e6e <wait+0x5e>
80103e53:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e56:	75 f0                	jne    80103e48 <wait+0x38>
80103e58:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e5c:	74 62                	je     80103ec0 <wait+0xb0>
80103e5e:	83 eb 80             	sub    $0xffffff80,%ebx
80103e61:	b8 01 00 00 00       	mov    $0x1,%eax
80103e66:	81 fb 34 e7 11 80    	cmp    $0x8011e734,%ebx
80103e6c:	75 e5                	jne    80103e53 <wait+0x43>
80103e6e:	85 c0                	test   %eax,%eax
80103e70:	0f 84 a0 00 00 00    	je     80103f16 <wait+0x106>
80103e76:	8b 46 24             	mov    0x24(%esi),%eax
80103e79:	85 c0                	test   %eax,%eax
80103e7b:	0f 85 95 00 00 00    	jne    80103f16 <wait+0x106>
80103e81:	e8 6a 06 00 00       	call   801044f0 <pushcli>
80103e86:	e8 b5 f9 ff ff       	call   80103840 <mycpu>
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103e91:	e8 aa 07 00 00       	call   80104640 <popcli>
80103e96:	85 db                	test   %ebx,%ebx
80103e98:	0f 84 8f 00 00 00    	je     80103f2d <wait+0x11d>
80103e9e:	89 73 20             	mov    %esi,0x20(%ebx)
80103ea1:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103ea8:	e8 73 fd ff ff       	call   80103c20 <sched>
80103ead:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103eb4:	eb 84                	jmp    80103e3a <wait+0x2a>
80103eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103ebd:	00 
80103ebe:	66 90                	xchg   %ax,%ax
80103ec0:	83 ec 0c             	sub    $0xc,%esp
80103ec3:	8b 73 10             	mov    0x10(%ebx),%esi
80103ec6:	ff 73 08             	push   0x8(%ebx)
80103ec9:	e8 f2 e5 ff ff       	call   801024c0 <kfree>
80103ece:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103ed5:	5a                   	pop    %edx
80103ed6:	ff 73 04             	push   0x4(%ebx)
80103ed9:	e8 92 2f 00 00       	call   80106e70 <freevm>
80103ede:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103ee5:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103eec:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103ef0:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103ef7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103efe:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103f05:	e8 96 07 00 00       	call   801046a0 <release>
80103f0a:	83 c4 10             	add    $0x10,%esp
80103f0d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f10:	89 f0                	mov    %esi,%eax
80103f12:	5b                   	pop    %ebx
80103f13:	5e                   	pop    %esi
80103f14:	5d                   	pop    %ebp
80103f15:	c3                   	ret
80103f16:	83 ec 0c             	sub    $0xc,%esp
80103f19:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103f1e:	68 00 c7 11 80       	push   $0x8011c700
80103f23:	e8 78 07 00 00       	call   801046a0 <release>
80103f28:	83 c4 10             	add    $0x10,%esp
80103f2b:	eb e0                	jmp    80103f0d <wait+0xfd>
80103f2d:	83 ec 0c             	sub    $0xc,%esp
80103f30:	68 c4 75 10 80       	push   $0x801075c4
80103f35:	e8 46 c4 ff ff       	call   80100380 <panic>
80103f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103f40 <yield>:
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	68 00 c7 11 80       	push   $0x8011c700
80103f4c:	e8 ef 05 00 00       	call   80104540 <acquire>
80103f51:	e8 9a 05 00 00       	call   801044f0 <pushcli>
80103f56:	e8 e5 f8 ff ff       	call   80103840 <mycpu>
80103f5b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103f61:	e8 da 06 00 00       	call   80104640 <popcli>
80103f66:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103f6d:	e8 ae fc ff ff       	call   80103c20 <sched>
80103f72:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103f79:	e8 22 07 00 00       	call   801046a0 <release>
80103f7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f81:	83 c4 10             	add    $0x10,%esp
80103f84:	c9                   	leave
80103f85:	c3                   	ret
80103f86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103f8d:	00 
80103f8e:	66 90                	xchg   %ax,%ax

80103f90 <sleep>:
80103f90:	55                   	push   %ebp
80103f91:	89 e5                	mov    %esp,%ebp
80103f93:	57                   	push   %edi
80103f94:	56                   	push   %esi
80103f95:	53                   	push   %ebx
80103f96:	83 ec 0c             	sub    $0xc,%esp
80103f99:	8b 7d 08             	mov    0x8(%ebp),%edi
80103f9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80103f9f:	e8 4c 05 00 00       	call   801044f0 <pushcli>
80103fa4:	e8 97 f8 ff ff       	call   80103840 <mycpu>
80103fa9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103faf:	e8 8c 06 00 00       	call   80104640 <popcli>
80103fb4:	85 db                	test   %ebx,%ebx
80103fb6:	0f 84 87 00 00 00    	je     80104043 <sleep+0xb3>
80103fbc:	85 f6                	test   %esi,%esi
80103fbe:	74 76                	je     80104036 <sleep+0xa6>
80103fc0:	81 fe 00 c7 11 80    	cmp    $0x8011c700,%esi
80103fc6:	74 50                	je     80104018 <sleep+0x88>
80103fc8:	83 ec 0c             	sub    $0xc,%esp
80103fcb:	68 00 c7 11 80       	push   $0x8011c700
80103fd0:	e8 6b 05 00 00       	call   80104540 <acquire>
80103fd5:	89 34 24             	mov    %esi,(%esp)
80103fd8:	e8 c3 06 00 00       	call   801046a0 <release>
80103fdd:	89 7b 20             	mov    %edi,0x20(%ebx)
80103fe0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103fe7:	e8 34 fc ff ff       	call   80103c20 <sched>
80103fec:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103ff3:	c7 04 24 00 c7 11 80 	movl   $0x8011c700,(%esp)
80103ffa:	e8 a1 06 00 00       	call   801046a0 <release>
80103fff:	89 75 08             	mov    %esi,0x8(%ebp)
80104002:	83 c4 10             	add    $0x10,%esp
80104005:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104008:	5b                   	pop    %ebx
80104009:	5e                   	pop    %esi
8010400a:	5f                   	pop    %edi
8010400b:	5d                   	pop    %ebp
8010400c:	e9 2f 05 00 00       	jmp    80104540 <acquire>
80104011:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104018:	89 7b 20             	mov    %edi,0x20(%ebx)
8010401b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80104022:	e8 f9 fb ff ff       	call   80103c20 <sched>
80104027:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
8010402e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104031:	5b                   	pop    %ebx
80104032:	5e                   	pop    %esi
80104033:	5f                   	pop    %edi
80104034:	5d                   	pop    %ebp
80104035:	c3                   	ret
80104036:	83 ec 0c             	sub    $0xc,%esp
80104039:	68 ca 75 10 80       	push   $0x801075ca
8010403e:	e8 3d c3 ff ff       	call   80100380 <panic>
80104043:	83 ec 0c             	sub    $0xc,%esp
80104046:	68 c4 75 10 80       	push   $0x801075c4
8010404b:	e8 30 c3 ff ff       	call   80100380 <panic>

80104050 <wakeup>:
80104050:	55                   	push   %ebp
80104051:	89 e5                	mov    %esp,%ebp
80104053:	53                   	push   %ebx
80104054:	83 ec 10             	sub    $0x10,%esp
80104057:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010405a:	68 00 c7 11 80       	push   $0x8011c700
8010405f:	e8 dc 04 00 00       	call   80104540 <acquire>
80104064:	83 c4 10             	add    $0x10,%esp
80104067:	b8 34 c7 11 80       	mov    $0x8011c734,%eax
8010406c:	eb 0c                	jmp    8010407a <wakeup+0x2a>
8010406e:	66 90                	xchg   %ax,%ax
80104070:	83 e8 80             	sub    $0xffffff80,%eax
80104073:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
80104078:	74 1c                	je     80104096 <wakeup+0x46>
8010407a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010407e:	75 f0                	jne    80104070 <wakeup+0x20>
80104080:	3b 58 20             	cmp    0x20(%eax),%ebx
80104083:	75 eb                	jne    80104070 <wakeup+0x20>
80104085:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010408c:	83 e8 80             	sub    $0xffffff80,%eax
8010408f:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
80104094:	75 e4                	jne    8010407a <wakeup+0x2a>
80104096:	c7 45 08 00 c7 11 80 	movl   $0x8011c700,0x8(%ebp)
8010409d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040a0:	c9                   	leave
801040a1:	e9 fa 05 00 00       	jmp    801046a0 <release>
801040a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801040ad:	00 
801040ae:	66 90                	xchg   %ax,%ax

801040b0 <kill>:
801040b0:	55                   	push   %ebp
801040b1:	89 e5                	mov    %esp,%ebp
801040b3:	53                   	push   %ebx
801040b4:	83 ec 10             	sub    $0x10,%esp
801040b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040ba:	68 00 c7 11 80       	push   $0x8011c700
801040bf:	e8 7c 04 00 00       	call   80104540 <acquire>
801040c4:	83 c4 10             	add    $0x10,%esp
801040c7:	b8 34 c7 11 80       	mov    $0x8011c734,%eax
801040cc:	eb 0c                	jmp    801040da <kill+0x2a>
801040ce:	66 90                	xchg   %ax,%ax
801040d0:	83 e8 80             	sub    $0xffffff80,%eax
801040d3:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
801040d8:	74 36                	je     80104110 <kill+0x60>
801040da:	39 58 10             	cmp    %ebx,0x10(%eax)
801040dd:	75 f1                	jne    801040d0 <kill+0x20>
801040df:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040e3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801040ea:	75 07                	jne    801040f3 <kill+0x43>
801040ec:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801040f3:	83 ec 0c             	sub    $0xc,%esp
801040f6:	68 00 c7 11 80       	push   $0x8011c700
801040fb:	e8 a0 05 00 00       	call   801046a0 <release>
80104100:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104103:	83 c4 10             	add    $0x10,%esp
80104106:	31 c0                	xor    %eax,%eax
80104108:	c9                   	leave
80104109:	c3                   	ret
8010410a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104110:	83 ec 0c             	sub    $0xc,%esp
80104113:	68 00 c7 11 80       	push   $0x8011c700
80104118:	e8 83 05 00 00       	call   801046a0 <release>
8010411d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104120:	83 c4 10             	add    $0x10,%esp
80104123:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104128:	c9                   	leave
80104129:	c3                   	ret
8010412a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104130 <procdump>:
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	57                   	push   %edi
80104134:	56                   	push   %esi
80104135:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104138:	53                   	push   %ebx
80104139:	bb a0 c7 11 80       	mov    $0x8011c7a0,%ebx
8010413e:	83 ec 3c             	sub    $0x3c,%esp
80104141:	eb 24                	jmp    80104167 <procdump+0x37>
80104143:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104148:	83 ec 0c             	sub    $0xc,%esp
8010414b:	68 c3 79 10 80       	push   $0x801079c3
80104150:	e8 5b c5 ff ff       	call   801006b0 <cprintf>
80104155:	83 c4 10             	add    $0x10,%esp
80104158:	83 eb 80             	sub    $0xffffff80,%ebx
8010415b:	81 fb a0 e7 11 80    	cmp    $0x8011e7a0,%ebx
80104161:	0f 84 81 00 00 00    	je     801041e8 <procdump+0xb8>
80104167:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010416a:	85 c0                	test   %eax,%eax
8010416c:	74 ea                	je     80104158 <procdump+0x28>
8010416e:	ba db 75 10 80       	mov    $0x801075db,%edx
80104173:	83 f8 05             	cmp    $0x5,%eax
80104176:	77 11                	ja     80104189 <procdump+0x59>
80104178:	8b 14 85 ac 76 10 80 	mov    -0x7fef8954(,%eax,4),%edx
8010417f:	b8 db 75 10 80       	mov    $0x801075db,%eax
80104184:	85 d2                	test   %edx,%edx
80104186:	0f 44 d0             	cmove  %eax,%edx
80104189:	53                   	push   %ebx
8010418a:	52                   	push   %edx
8010418b:	ff 73 a4             	push   -0x5c(%ebx)
8010418e:	68 df 75 10 80       	push   $0x801075df
80104193:	e8 18 c5 ff ff       	call   801006b0 <cprintf>
80104198:	83 c4 10             	add    $0x10,%esp
8010419b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010419f:	75 a7                	jne    80104148 <procdump+0x18>
801041a1:	83 ec 08             	sub    $0x8,%esp
801041a4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041a7:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041aa:	50                   	push   %eax
801041ab:	8b 43 b0             	mov    -0x50(%ebx),%eax
801041ae:	8b 40 0c             	mov    0xc(%eax),%eax
801041b1:	83 c0 08             	add    $0x8,%eax
801041b4:	50                   	push   %eax
801041b5:	e8 76 02 00 00       	call   80104430 <getcallerpcs>
801041ba:	83 c4 10             	add    $0x10,%esp
801041bd:	8d 76 00             	lea    0x0(%esi),%esi
801041c0:	8b 17                	mov    (%edi),%edx
801041c2:	85 d2                	test   %edx,%edx
801041c4:	74 82                	je     80104148 <procdump+0x18>
801041c6:	83 ec 08             	sub    $0x8,%esp
801041c9:	83 c7 04             	add    $0x4,%edi
801041cc:	52                   	push   %edx
801041cd:	68 61 72 10 80       	push   $0x80107261
801041d2:	e8 d9 c4 ff ff       	call   801006b0 <cprintf>
801041d7:	83 c4 10             	add    $0x10,%esp
801041da:	39 f7                	cmp    %esi,%edi
801041dc:	75 e2                	jne    801041c0 <procdump+0x90>
801041de:	e9 65 ff ff ff       	jmp    80104148 <procdump+0x18>
801041e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801041e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041eb:	5b                   	pop    %ebx
801041ec:	5e                   	pop    %esi
801041ed:	5f                   	pop    %edi
801041ee:	5d                   	pop    %ebp
801041ef:	c3                   	ret

801041f0 <cps>:
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	53                   	push   %ebx
801041f4:	83 ec 10             	sub    $0x10,%esp
801041f7:	fb                   	sti
801041f8:	68 00 c7 11 80       	push   $0x8011c700
801041fd:	bb a0 c7 11 80       	mov    $0x8011c7a0,%ebx
80104202:	e8 39 03 00 00       	call   80104540 <acquire>
80104207:	c7 04 24 8c 76 10 80 	movl   $0x8010768c,(%esp)
8010420e:	e8 9d c4 ff ff       	call   801006b0 <cprintf>
80104213:	83 c4 10             	add    $0x10,%esp
80104216:	eb 1d                	jmp    80104235 <cps+0x45>
80104218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010421f:	00 
80104220:	83 f8 04             	cmp    $0x4,%eax
80104223:	74 53                	je     80104278 <cps+0x88>
80104225:	83 f8 03             	cmp    $0x3,%eax
80104228:	74 66                	je     80104290 <cps+0xa0>
8010422a:	83 eb 80             	sub    $0xffffff80,%ebx
8010422d:	81 fb a0 e7 11 80    	cmp    $0x8011e7a0,%ebx
80104233:	74 27                	je     8010425c <cps+0x6c>
80104235:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104238:	83 f8 02             	cmp    $0x2,%eax
8010423b:	75 e3                	jne    80104220 <cps+0x30>
8010423d:	ff 73 10             	push   0x10(%ebx)
80104240:	ff 73 a4             	push   -0x5c(%ebx)
80104243:	53                   	push   %ebx
80104244:	83 eb 80             	sub    $0xffffff80,%ebx
80104247:	68 e8 75 10 80       	push   $0x801075e8
8010424c:	e8 5f c4 ff ff       	call   801006b0 <cprintf>
80104251:	83 c4 10             	add    $0x10,%esp
80104254:	81 fb a0 e7 11 80    	cmp    $0x8011e7a0,%ebx
8010425a:	75 d9                	jne    80104235 <cps+0x45>
8010425c:	83 ec 0c             	sub    $0xc,%esp
8010425f:	68 00 c7 11 80       	push   $0x8011c700
80104264:	e8 37 04 00 00       	call   801046a0 <release>
80104269:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010426c:	b8 16 00 00 00       	mov    $0x16,%eax
80104271:	c9                   	leave
80104272:	c3                   	ret
80104273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104278:	ff 73 10             	push   0x10(%ebx)
8010427b:	ff 73 a4             	push   -0x5c(%ebx)
8010427e:	53                   	push   %ebx
8010427f:	68 03 76 10 80       	push   $0x80107603
80104284:	e8 27 c4 ff ff       	call   801006b0 <cprintf>
80104289:	83 c4 10             	add    $0x10,%esp
8010428c:	eb 9c                	jmp    8010422a <cps+0x3a>
8010428e:	66 90                	xchg   %ax,%ax
80104290:	ff 73 10             	push   0x10(%ebx)
80104293:	ff 73 a4             	push   -0x5c(%ebx)
80104296:	53                   	push   %ebx
80104297:	68 1d 76 10 80       	push   $0x8010761d
8010429c:	e8 0f c4 ff ff       	call   801006b0 <cprintf>
801042a1:	83 c4 10             	add    $0x10,%esp
801042a4:	eb 84                	jmp    8010422a <cps+0x3a>
801042a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801042ad:	00 
801042ae:	66 90                	xchg   %ax,%ax

801042b0 <chpr>:
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	53                   	push   %ebx
801042b4:	83 ec 10             	sub    $0x10,%esp
801042b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ba:	68 00 c7 11 80       	push   $0x8011c700
801042bf:	e8 7c 02 00 00       	call   80104540 <acquire>
801042c4:	83 c4 10             	add    $0x10,%esp
801042c7:	b8 34 c7 11 80       	mov    $0x8011c734,%eax
801042cc:	eb 0c                	jmp    801042da <chpr+0x2a>
801042ce:	66 90                	xchg   %ax,%ax
801042d0:	83 e8 80             	sub    $0xffffff80,%eax
801042d3:	3d 34 e7 11 80       	cmp    $0x8011e734,%eax
801042d8:	74 0b                	je     801042e5 <chpr+0x35>
801042da:	39 58 10             	cmp    %ebx,0x10(%eax)
801042dd:	75 f1                	jne    801042d0 <chpr+0x20>
801042df:	8b 55 0c             	mov    0xc(%ebp),%edx
801042e2:	89 50 7c             	mov    %edx,0x7c(%eax)
801042e5:	83 ec 0c             	sub    $0xc,%esp
801042e8:	68 00 c7 11 80       	push   $0x8011c700
801042ed:	e8 ae 03 00 00       	call   801046a0 <release>
801042f2:	89 d8                	mov    %ebx,%eax
801042f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042f7:	c9                   	leave
801042f8:	c3                   	ret
801042f9:	66 90                	xchg   %ax,%ax
801042fb:	66 90                	xchg   %ax,%ax
801042fd:	66 90                	xchg   %ax,%ax
801042ff:	90                   	nop

80104300 <initsleeplock>:
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	53                   	push   %ebx
80104304:	83 ec 0c             	sub    $0xc,%esp
80104307:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010430a:	68 c4 76 10 80       	push   $0x801076c4
8010430f:	8d 43 04             	lea    0x4(%ebx),%eax
80104312:	50                   	push   %eax
80104313:	e8 f8 00 00 00       	call   80104410 <initlock>
80104318:	8b 45 0c             	mov    0xc(%ebp),%eax
8010431b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104321:	83 c4 10             	add    $0x10,%esp
80104324:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010432b:	89 43 38             	mov    %eax,0x38(%ebx)
8010432e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104331:	c9                   	leave
80104332:	c3                   	ret
80104333:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010433a:	00 
8010433b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80104340 <acquiresleep>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
80104345:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104348:	8d 73 04             	lea    0x4(%ebx),%esi
8010434b:	83 ec 0c             	sub    $0xc,%esp
8010434e:	56                   	push   %esi
8010434f:	e8 ec 01 00 00       	call   80104540 <acquire>
80104354:	8b 13                	mov    (%ebx),%edx
80104356:	83 c4 10             	add    $0x10,%esp
80104359:	85 d2                	test   %edx,%edx
8010435b:	74 16                	je     80104373 <acquiresleep+0x33>
8010435d:	8d 76 00             	lea    0x0(%esi),%esi
80104360:	83 ec 08             	sub    $0x8,%esp
80104363:	56                   	push   %esi
80104364:	53                   	push   %ebx
80104365:	e8 26 fc ff ff       	call   80103f90 <sleep>
8010436a:	8b 03                	mov    (%ebx),%eax
8010436c:	83 c4 10             	add    $0x10,%esp
8010436f:	85 c0                	test   %eax,%eax
80104371:	75 ed                	jne    80104360 <acquiresleep+0x20>
80104373:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104379:	e8 42 f5 ff ff       	call   801038c0 <myproc>
8010437e:	8b 40 10             	mov    0x10(%eax),%eax
80104381:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104384:	89 75 08             	mov    %esi,0x8(%ebp)
80104387:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010438a:	5b                   	pop    %ebx
8010438b:	5e                   	pop    %esi
8010438c:	5d                   	pop    %ebp
8010438d:	e9 0e 03 00 00       	jmp    801046a0 <release>
80104392:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104399:	00 
8010439a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043a0 <releasesleep>:
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	53                   	push   %ebx
801043a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043a8:	8d 73 04             	lea    0x4(%ebx),%esi
801043ab:	83 ec 0c             	sub    $0xc,%esp
801043ae:	56                   	push   %esi
801043af:	e8 8c 01 00 00       	call   80104540 <acquire>
801043b4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801043ba:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801043c1:	89 1c 24             	mov    %ebx,(%esp)
801043c4:	e8 87 fc ff ff       	call   80104050 <wakeup>
801043c9:	89 75 08             	mov    %esi,0x8(%ebp)
801043cc:	83 c4 10             	add    $0x10,%esp
801043cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043d2:	5b                   	pop    %ebx
801043d3:	5e                   	pop    %esi
801043d4:	5d                   	pop    %ebp
801043d5:	e9 c6 02 00 00       	jmp    801046a0 <release>
801043da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043e0 <holdingsleep>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	56                   	push   %esi
801043e4:	53                   	push   %ebx
801043e5:	8b 75 08             	mov    0x8(%ebp),%esi
801043e8:	8d 5e 04             	lea    0x4(%esi),%ebx
801043eb:	83 ec 0c             	sub    $0xc,%esp
801043ee:	53                   	push   %ebx
801043ef:	e8 4c 01 00 00       	call   80104540 <acquire>
801043f4:	8b 36                	mov    (%esi),%esi
801043f6:	89 1c 24             	mov    %ebx,(%esp)
801043f9:	e8 a2 02 00 00       	call   801046a0 <release>
801043fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104401:	89 f0                	mov    %esi,%eax
80104403:	5b                   	pop    %ebx
80104404:	5e                   	pop    %esi
80104405:	5d                   	pop    %ebp
80104406:	c3                   	ret
80104407:	66 90                	xchg   %ax,%ax
80104409:	66 90                	xchg   %ax,%ax
8010440b:	66 90                	xchg   %ax,%ax
8010440d:	66 90                	xchg   %ax,%ax
8010440f:	90                   	nop

80104410 <initlock>:
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	8b 45 08             	mov    0x8(%ebp),%eax
80104416:	8b 55 0c             	mov    0xc(%ebp),%edx
80104419:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010441f:	89 50 04             	mov    %edx,0x4(%eax)
80104422:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104429:	5d                   	pop    %ebp
8010442a:	c3                   	ret
8010442b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80104430 <getcallerpcs>:
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	53                   	push   %ebx
80104434:	8b 45 08             	mov    0x8(%ebp),%eax
80104437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010443a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010443d:	05 f8 ff ff 7f       	add    $0x7ffffff8,%eax
80104442:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
80104447:	b8 00 00 00 00       	mov    $0x0,%eax
8010444c:	76 10                	jbe    8010445e <getcallerpcs+0x2e>
8010444e:	eb 28                	jmp    80104478 <getcallerpcs+0x48>
80104450:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104456:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010445c:	77 1a                	ja     80104478 <getcallerpcs+0x48>
8010445e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104461:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104464:	83 c0 01             	add    $0x1,%eax
80104467:	8b 12                	mov    (%edx),%edx
80104469:	83 f8 0a             	cmp    $0xa,%eax
8010446c:	75 e2                	jne    80104450 <getcallerpcs+0x20>
8010446e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104471:	c9                   	leave
80104472:	c3                   	ret
80104473:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104478:	8d 04 81             	lea    (%ecx,%eax,4),%eax
8010447b:	83 c1 28             	add    $0x28,%ecx
8010447e:	89 ca                	mov    %ecx,%edx
80104480:	29 c2                	sub    %eax,%edx
80104482:	83 e2 04             	and    $0x4,%edx
80104485:	74 11                	je     80104498 <getcallerpcs+0x68>
80104487:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010448d:	83 c0 04             	add    $0x4,%eax
80104490:	39 c1                	cmp    %eax,%ecx
80104492:	74 da                	je     8010446e <getcallerpcs+0x3e>
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104498:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010449e:	83 c0 08             	add    $0x8,%eax
801044a1:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
801044a8:	39 c1                	cmp    %eax,%ecx
801044aa:	75 ec                	jne    80104498 <getcallerpcs+0x68>
801044ac:	eb c0                	jmp    8010446e <getcallerpcs+0x3e>
801044ae:	66 90                	xchg   %ax,%ax

801044b0 <holding>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	53                   	push   %ebx
801044b4:	83 ec 04             	sub    $0x4,%esp
801044b7:	8b 55 08             	mov    0x8(%ebp),%edx
801044ba:	8b 02                	mov    (%edx),%eax
801044bc:	85 c0                	test   %eax,%eax
801044be:	75 10                	jne    801044d0 <holding+0x20>
801044c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044c3:	31 c0                	xor    %eax,%eax
801044c5:	c9                   	leave
801044c6:	c3                   	ret
801044c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801044ce:	00 
801044cf:	90                   	nop
801044d0:	8b 5a 08             	mov    0x8(%edx),%ebx
801044d3:	e8 68 f3 ff ff       	call   80103840 <mycpu>
801044d8:	39 c3                	cmp    %eax,%ebx
801044da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044dd:	c9                   	leave
801044de:	0f 94 c0             	sete   %al
801044e1:	0f b6 c0             	movzbl %al,%eax
801044e4:	c3                   	ret
801044e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801044ec:	00 
801044ed:	8d 76 00             	lea    0x0(%esi),%esi

801044f0 <pushcli>:
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	53                   	push   %ebx
801044f4:	83 ec 04             	sub    $0x4,%esp
801044f7:	9c                   	pushf
801044f8:	5b                   	pop    %ebx
801044f9:	fa                   	cli
801044fa:	e8 41 f3 ff ff       	call   80103840 <mycpu>
801044ff:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104505:	85 c0                	test   %eax,%eax
80104507:	74 17                	je     80104520 <pushcli+0x30>
80104509:	e8 32 f3 ff ff       	call   80103840 <mycpu>
8010450e:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104515:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104518:	c9                   	leave
80104519:	c3                   	ret
8010451a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104520:	e8 1b f3 ff ff       	call   80103840 <mycpu>
80104525:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010452b:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80104531:	eb d6                	jmp    80104509 <pushcli+0x19>
80104533:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010453a:	00 
8010453b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80104540 <acquire>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	53                   	push   %ebx
80104544:	83 ec 04             	sub    $0x4,%esp
80104547:	e8 a4 ff ff ff       	call   801044f0 <pushcli>
8010454c:	8b 55 08             	mov    0x8(%ebp),%edx
8010454f:	8b 02                	mov    (%edx),%eax
80104551:	85 c0                	test   %eax,%eax
80104553:	0f 85 b7 00 00 00    	jne    80104610 <acquire+0xd0>
80104559:	b8 01 00 00 00       	mov    $0x1,%eax
8010455e:	f0 87 02             	lock xchg %eax,(%edx)
80104561:	b9 01 00 00 00       	mov    $0x1,%ecx
80104566:	85 c0                	test   %eax,%eax
80104568:	74 12                	je     8010457c <acquire+0x3c>
8010456a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104570:	8b 55 08             	mov    0x8(%ebp),%edx
80104573:	89 c8                	mov    %ecx,%eax
80104575:	f0 87 02             	lock xchg %eax,(%edx)
80104578:	85 c0                	test   %eax,%eax
8010457a:	75 f4                	jne    80104570 <acquire+0x30>
8010457c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104581:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104584:	e8 b7 f2 ff ff       	call   80103840 <mycpu>
80104589:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010458c:	31 d2                	xor    %edx,%edx
8010458e:	89 43 08             	mov    %eax,0x8(%ebx)
80104591:	8d 85 00 00 00 80    	lea    -0x80000000(%ebp),%eax
80104597:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
8010459c:	77 32                	ja     801045d0 <acquire+0x90>
8010459e:	89 e8                	mov    %ebp,%eax
801045a0:	eb 14                	jmp    801045b6 <acquire+0x76>
801045a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045a8:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801045ae:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801045b4:	77 1a                	ja     801045d0 <acquire+0x90>
801045b6:	8b 58 04             	mov    0x4(%eax),%ebx
801045b9:	89 5c 91 0c          	mov    %ebx,0xc(%ecx,%edx,4)
801045bd:	83 c2 01             	add    $0x1,%edx
801045c0:	8b 00                	mov    (%eax),%eax
801045c2:	83 fa 0a             	cmp    $0xa,%edx
801045c5:	75 e1                	jne    801045a8 <acquire+0x68>
801045c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045ca:	c9                   	leave
801045cb:	c3                   	ret
801045cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045d0:	8d 44 91 0c          	lea    0xc(%ecx,%edx,4),%eax
801045d4:	83 c1 34             	add    $0x34,%ecx
801045d7:	89 ca                	mov    %ecx,%edx
801045d9:	29 c2                	sub    %eax,%edx
801045db:	83 e2 04             	and    $0x4,%edx
801045de:	74 10                	je     801045f0 <acquire+0xb0>
801045e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801045e6:	83 c0 04             	add    $0x4,%eax
801045e9:	39 c8                	cmp    %ecx,%eax
801045eb:	74 da                	je     801045c7 <acquire+0x87>
801045ed:	8d 76 00             	lea    0x0(%esi),%esi
801045f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801045f6:	83 c0 08             	add    $0x8,%eax
801045f9:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
80104600:	39 c8                	cmp    %ecx,%eax
80104602:	75 ec                	jne    801045f0 <acquire+0xb0>
80104604:	eb c1                	jmp    801045c7 <acquire+0x87>
80104606:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010460d:	00 
8010460e:	66 90                	xchg   %ax,%ax
80104610:	8b 5a 08             	mov    0x8(%edx),%ebx
80104613:	e8 28 f2 ff ff       	call   80103840 <mycpu>
80104618:	39 c3                	cmp    %eax,%ebx
8010461a:	74 0c                	je     80104628 <acquire+0xe8>
8010461c:	8b 55 08             	mov    0x8(%ebp),%edx
8010461f:	e9 35 ff ff ff       	jmp    80104559 <acquire+0x19>
80104624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104628:	83 ec 0c             	sub    $0xc,%esp
8010462b:	68 cf 76 10 80       	push   $0x801076cf
80104630:	e8 4b bd ff ff       	call   80100380 <panic>
80104635:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010463c:	00 
8010463d:	8d 76 00             	lea    0x0(%esi),%esi

80104640 <popcli>:
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	83 ec 08             	sub    $0x8,%esp
80104646:	9c                   	pushf
80104647:	58                   	pop    %eax
80104648:	f6 c4 02             	test   $0x2,%ah
8010464b:	75 35                	jne    80104682 <popcli+0x42>
8010464d:	e8 ee f1 ff ff       	call   80103840 <mycpu>
80104652:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104659:	78 34                	js     8010468f <popcli+0x4f>
8010465b:	e8 e0 f1 ff ff       	call   80103840 <mycpu>
80104660:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104666:	85 d2                	test   %edx,%edx
80104668:	74 06                	je     80104670 <popcli+0x30>
8010466a:	c9                   	leave
8010466b:	c3                   	ret
8010466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104670:	e8 cb f1 ff ff       	call   80103840 <mycpu>
80104675:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010467b:	85 c0                	test   %eax,%eax
8010467d:	74 eb                	je     8010466a <popcli+0x2a>
8010467f:	fb                   	sti
80104680:	c9                   	leave
80104681:	c3                   	ret
80104682:	83 ec 0c             	sub    $0xc,%esp
80104685:	68 d7 76 10 80       	push   $0x801076d7
8010468a:	e8 f1 bc ff ff       	call   80100380 <panic>
8010468f:	83 ec 0c             	sub    $0xc,%esp
80104692:	68 ee 76 10 80       	push   $0x801076ee
80104697:	e8 e4 bc ff ff       	call   80100380 <panic>
8010469c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046a0 <release>:
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	56                   	push   %esi
801046a4:	53                   	push   %ebx
801046a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046a8:	8b 03                	mov    (%ebx),%eax
801046aa:	85 c0                	test   %eax,%eax
801046ac:	75 12                	jne    801046c0 <release+0x20>
801046ae:	83 ec 0c             	sub    $0xc,%esp
801046b1:	68 f5 76 10 80       	push   $0x801076f5
801046b6:	e8 c5 bc ff ff       	call   80100380 <panic>
801046bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801046c0:	8b 73 08             	mov    0x8(%ebx),%esi
801046c3:	e8 78 f1 ff ff       	call   80103840 <mycpu>
801046c8:	39 c6                	cmp    %eax,%esi
801046ca:	75 e2                	jne    801046ae <release+0xe>
801046cc:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801046d3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801046da:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801046df:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801046e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046e8:	5b                   	pop    %ebx
801046e9:	5e                   	pop    %esi
801046ea:	5d                   	pop    %ebp
801046eb:	e9 50 ff ff ff       	jmp    80104640 <popcli>

801046f0 <memset>:
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	57                   	push   %edi
801046f4:	8b 55 08             	mov    0x8(%ebp),%edx
801046f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046fa:	89 d0                	mov    %edx,%eax
801046fc:	09 c8                	or     %ecx,%eax
801046fe:	a8 03                	test   $0x3,%al
80104700:	75 1e                	jne    80104720 <memset+0x30>
80104702:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
80104706:	c1 e9 02             	shr    $0x2,%ecx
80104709:	89 d7                	mov    %edx,%edi
8010470b:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
80104711:	fc                   	cld
80104712:	f3 ab                	rep stos %eax,%es:(%edi)
80104714:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104717:	89 d0                	mov    %edx,%eax
80104719:	c9                   	leave
8010471a:	c3                   	ret
8010471b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104720:	8b 45 0c             	mov    0xc(%ebp),%eax
80104723:	89 d7                	mov    %edx,%edi
80104725:	fc                   	cld
80104726:	f3 aa                	rep stos %al,%es:(%edi)
80104728:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010472b:	89 d0                	mov    %edx,%eax
8010472d:	c9                   	leave
8010472e:	c3                   	ret
8010472f:	90                   	nop

80104730 <memcmp>:
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	56                   	push   %esi
80104734:	8b 75 10             	mov    0x10(%ebp),%esi
80104737:	8b 45 08             	mov    0x8(%ebp),%eax
8010473a:	53                   	push   %ebx
8010473b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010473e:	85 f6                	test   %esi,%esi
80104740:	74 2e                	je     80104770 <memcmp+0x40>
80104742:	01 c6                	add    %eax,%esi
80104744:	eb 14                	jmp    8010475a <memcmp+0x2a>
80104746:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010474d:	00 
8010474e:	66 90                	xchg   %ax,%ax
80104750:	83 c0 01             	add    $0x1,%eax
80104753:	83 c2 01             	add    $0x1,%edx
80104756:	39 f0                	cmp    %esi,%eax
80104758:	74 16                	je     80104770 <memcmp+0x40>
8010475a:	0f b6 08             	movzbl (%eax),%ecx
8010475d:	0f b6 1a             	movzbl (%edx),%ebx
80104760:	38 d9                	cmp    %bl,%cl
80104762:	74 ec                	je     80104750 <memcmp+0x20>
80104764:	0f b6 c1             	movzbl %cl,%eax
80104767:	29 d8                	sub    %ebx,%eax
80104769:	5b                   	pop    %ebx
8010476a:	5e                   	pop    %esi
8010476b:	5d                   	pop    %ebp
8010476c:	c3                   	ret
8010476d:	8d 76 00             	lea    0x0(%esi),%esi
80104770:	5b                   	pop    %ebx
80104771:	31 c0                	xor    %eax,%eax
80104773:	5e                   	pop    %esi
80104774:	5d                   	pop    %ebp
80104775:	c3                   	ret
80104776:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010477d:	00 
8010477e:	66 90                	xchg   %ax,%ax

80104780 <memmove>:
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	57                   	push   %edi
80104784:	8b 55 08             	mov    0x8(%ebp),%edx
80104787:	8b 45 10             	mov    0x10(%ebp),%eax
8010478a:	56                   	push   %esi
8010478b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010478e:	39 d6                	cmp    %edx,%esi
80104790:	73 26                	jae    801047b8 <memmove+0x38>
80104792:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
80104795:	39 ca                	cmp    %ecx,%edx
80104797:	73 1f                	jae    801047b8 <memmove+0x38>
80104799:	85 c0                	test   %eax,%eax
8010479b:	74 0f                	je     801047ac <memmove+0x2c>
8010479d:	83 e8 01             	sub    $0x1,%eax
801047a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801047a4:	88 0c 02             	mov    %cl,(%edx,%eax,1)
801047a7:	83 e8 01             	sub    $0x1,%eax
801047aa:	73 f4                	jae    801047a0 <memmove+0x20>
801047ac:	5e                   	pop    %esi
801047ad:	89 d0                	mov    %edx,%eax
801047af:	5f                   	pop    %edi
801047b0:	5d                   	pop    %ebp
801047b1:	c3                   	ret
801047b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047b8:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
801047bb:	89 d7                	mov    %edx,%edi
801047bd:	85 c0                	test   %eax,%eax
801047bf:	74 eb                	je     801047ac <memmove+0x2c>
801047c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047c8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
801047c9:	39 ce                	cmp    %ecx,%esi
801047cb:	75 fb                	jne    801047c8 <memmove+0x48>
801047cd:	5e                   	pop    %esi
801047ce:	89 d0                	mov    %edx,%eax
801047d0:	5f                   	pop    %edi
801047d1:	5d                   	pop    %ebp
801047d2:	c3                   	ret
801047d3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801047da:	00 
801047db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801047e0 <memcpy>:
801047e0:	eb 9e                	jmp    80104780 <memmove>
801047e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801047e9:	00 
801047ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801047f0 <strncmp>:
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	53                   	push   %ebx
801047f4:	8b 55 10             	mov    0x10(%ebp),%edx
801047f7:	8b 45 08             	mov    0x8(%ebp),%eax
801047fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801047fd:	85 d2                	test   %edx,%edx
801047ff:	75 16                	jne    80104817 <strncmp+0x27>
80104801:	eb 2d                	jmp    80104830 <strncmp+0x40>
80104803:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104808:	3a 19                	cmp    (%ecx),%bl
8010480a:	75 12                	jne    8010481e <strncmp+0x2e>
8010480c:	83 c0 01             	add    $0x1,%eax
8010480f:	83 c1 01             	add    $0x1,%ecx
80104812:	83 ea 01             	sub    $0x1,%edx
80104815:	74 19                	je     80104830 <strncmp+0x40>
80104817:	0f b6 18             	movzbl (%eax),%ebx
8010481a:	84 db                	test   %bl,%bl
8010481c:	75 ea                	jne    80104808 <strncmp+0x18>
8010481e:	0f b6 00             	movzbl (%eax),%eax
80104821:	0f b6 11             	movzbl (%ecx),%edx
80104824:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104827:	c9                   	leave
80104828:	29 d0                	sub    %edx,%eax
8010482a:	c3                   	ret
8010482b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104830:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104833:	31 c0                	xor    %eax,%eax
80104835:	c9                   	leave
80104836:	c3                   	ret
80104837:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010483e:	00 
8010483f:	90                   	nop

80104840 <strncpy>:
80104840:	55                   	push   %ebp
80104841:	89 e5                	mov    %esp,%ebp
80104843:	57                   	push   %edi
80104844:	56                   	push   %esi
80104845:	8b 75 08             	mov    0x8(%ebp),%esi
80104848:	53                   	push   %ebx
80104849:	8b 55 10             	mov    0x10(%ebp),%edx
8010484c:	89 f0                	mov    %esi,%eax
8010484e:	eb 15                	jmp    80104865 <strncpy+0x25>
80104850:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80104854:	8b 7d 0c             	mov    0xc(%ebp),%edi
80104857:	83 c0 01             	add    $0x1,%eax
8010485a:	0f b6 4f ff          	movzbl -0x1(%edi),%ecx
8010485e:	88 48 ff             	mov    %cl,-0x1(%eax)
80104861:	84 c9                	test   %cl,%cl
80104863:	74 13                	je     80104878 <strncpy+0x38>
80104865:	89 d3                	mov    %edx,%ebx
80104867:	83 ea 01             	sub    $0x1,%edx
8010486a:	85 db                	test   %ebx,%ebx
8010486c:	7f e2                	jg     80104850 <strncpy+0x10>
8010486e:	5b                   	pop    %ebx
8010486f:	89 f0                	mov    %esi,%eax
80104871:	5e                   	pop    %esi
80104872:	5f                   	pop    %edi
80104873:	5d                   	pop    %ebp
80104874:	c3                   	ret
80104875:	8d 76 00             	lea    0x0(%esi),%esi
80104878:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
8010487b:	83 e9 01             	sub    $0x1,%ecx
8010487e:	85 d2                	test   %edx,%edx
80104880:	74 ec                	je     8010486e <strncpy+0x2e>
80104882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104888:	83 c0 01             	add    $0x1,%eax
8010488b:	89 ca                	mov    %ecx,%edx
8010488d:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
80104891:	29 c2                	sub    %eax,%edx
80104893:	85 d2                	test   %edx,%edx
80104895:	7f f1                	jg     80104888 <strncpy+0x48>
80104897:	5b                   	pop    %ebx
80104898:	89 f0                	mov    %esi,%eax
8010489a:	5e                   	pop    %esi
8010489b:	5f                   	pop    %edi
8010489c:	5d                   	pop    %ebp
8010489d:	c3                   	ret
8010489e:	66 90                	xchg   %ax,%ax

801048a0 <safestrcpy>:
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	56                   	push   %esi
801048a4:	8b 55 10             	mov    0x10(%ebp),%edx
801048a7:	8b 75 08             	mov    0x8(%ebp),%esi
801048aa:	53                   	push   %ebx
801048ab:	8b 45 0c             	mov    0xc(%ebp),%eax
801048ae:	85 d2                	test   %edx,%edx
801048b0:	7e 25                	jle    801048d7 <safestrcpy+0x37>
801048b2:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
801048b6:	89 f2                	mov    %esi,%edx
801048b8:	eb 16                	jmp    801048d0 <safestrcpy+0x30>
801048ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048c0:	0f b6 08             	movzbl (%eax),%ecx
801048c3:	83 c0 01             	add    $0x1,%eax
801048c6:	83 c2 01             	add    $0x1,%edx
801048c9:	88 4a ff             	mov    %cl,-0x1(%edx)
801048cc:	84 c9                	test   %cl,%cl
801048ce:	74 04                	je     801048d4 <safestrcpy+0x34>
801048d0:	39 d8                	cmp    %ebx,%eax
801048d2:	75 ec                	jne    801048c0 <safestrcpy+0x20>
801048d4:	c6 02 00             	movb   $0x0,(%edx)
801048d7:	89 f0                	mov    %esi,%eax
801048d9:	5b                   	pop    %ebx
801048da:	5e                   	pop    %esi
801048db:	5d                   	pop    %ebp
801048dc:	c3                   	ret
801048dd:	8d 76 00             	lea    0x0(%esi),%esi

801048e0 <strlen>:
801048e0:	55                   	push   %ebp
801048e1:	31 c0                	xor    %eax,%eax
801048e3:	89 e5                	mov    %esp,%ebp
801048e5:	8b 55 08             	mov    0x8(%ebp),%edx
801048e8:	80 3a 00             	cmpb   $0x0,(%edx)
801048eb:	74 0c                	je     801048f9 <strlen+0x19>
801048ed:	8d 76 00             	lea    0x0(%esi),%esi
801048f0:	83 c0 01             	add    $0x1,%eax
801048f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801048f7:	75 f7                	jne    801048f0 <strlen+0x10>
801048f9:	5d                   	pop    %ebp
801048fa:	c3                   	ret

801048fb <swtch>:
801048fb:	8b 44 24 04          	mov    0x4(%esp),%eax
801048ff:	8b 54 24 08          	mov    0x8(%esp),%edx
80104903:	55                   	push   %ebp
80104904:	53                   	push   %ebx
80104905:	56                   	push   %esi
80104906:	57                   	push   %edi
80104907:	89 20                	mov    %esp,(%eax)
80104909:	89 d4                	mov    %edx,%esp
8010490b:	5f                   	pop    %edi
8010490c:	5e                   	pop    %esi
8010490d:	5b                   	pop    %ebx
8010490e:	5d                   	pop    %ebp
8010490f:	c3                   	ret

80104910 <fetchint>:
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	53                   	push   %ebx
80104914:	83 ec 04             	sub    $0x4,%esp
80104917:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010491a:	e8 a1 ef ff ff       	call   801038c0 <myproc>
8010491f:	8b 00                	mov    (%eax),%eax
80104921:	39 c3                	cmp    %eax,%ebx
80104923:	73 1b                	jae    80104940 <fetchint+0x30>
80104925:	8d 53 04             	lea    0x4(%ebx),%edx
80104928:	39 d0                	cmp    %edx,%eax
8010492a:	72 14                	jb     80104940 <fetchint+0x30>
8010492c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010492f:	8b 13                	mov    (%ebx),%edx
80104931:	89 10                	mov    %edx,(%eax)
80104933:	31 c0                	xor    %eax,%eax
80104935:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104938:	c9                   	leave
80104939:	c3                   	ret
8010493a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104940:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104945:	eb ee                	jmp    80104935 <fetchint+0x25>
80104947:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010494e:	00 
8010494f:	90                   	nop

80104950 <fetchstr>:
80104950:	55                   	push   %ebp
80104951:	89 e5                	mov    %esp,%ebp
80104953:	53                   	push   %ebx
80104954:	83 ec 04             	sub    $0x4,%esp
80104957:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010495a:	e8 61 ef ff ff       	call   801038c0 <myproc>
8010495f:	3b 18                	cmp    (%eax),%ebx
80104961:	73 2d                	jae    80104990 <fetchstr+0x40>
80104963:	8b 55 0c             	mov    0xc(%ebp),%edx
80104966:	89 1a                	mov    %ebx,(%edx)
80104968:	8b 10                	mov    (%eax),%edx
8010496a:	39 d3                	cmp    %edx,%ebx
8010496c:	73 22                	jae    80104990 <fetchstr+0x40>
8010496e:	89 d8                	mov    %ebx,%eax
80104970:	eb 0d                	jmp    8010497f <fetchstr+0x2f>
80104972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104978:	83 c0 01             	add    $0x1,%eax
8010497b:	39 d0                	cmp    %edx,%eax
8010497d:	73 11                	jae    80104990 <fetchstr+0x40>
8010497f:	80 38 00             	cmpb   $0x0,(%eax)
80104982:	75 f4                	jne    80104978 <fetchstr+0x28>
80104984:	29 d8                	sub    %ebx,%eax
80104986:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104989:	c9                   	leave
8010498a:	c3                   	ret
8010498b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104990:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104993:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104998:	c9                   	leave
80104999:	c3                   	ret
8010499a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801049a0 <argint>:
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	56                   	push   %esi
801049a4:	53                   	push   %ebx
801049a5:	e8 16 ef ff ff       	call   801038c0 <myproc>
801049aa:	8b 55 08             	mov    0x8(%ebp),%edx
801049ad:	8b 40 18             	mov    0x18(%eax),%eax
801049b0:	8b 40 44             	mov    0x44(%eax),%eax
801049b3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801049b6:	e8 05 ef ff ff       	call   801038c0 <myproc>
801049bb:	8d 73 04             	lea    0x4(%ebx),%esi
801049be:	8b 00                	mov    (%eax),%eax
801049c0:	39 c6                	cmp    %eax,%esi
801049c2:	73 1c                	jae    801049e0 <argint+0x40>
801049c4:	8d 53 08             	lea    0x8(%ebx),%edx
801049c7:	39 d0                	cmp    %edx,%eax
801049c9:	72 15                	jb     801049e0 <argint+0x40>
801049cb:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ce:	8b 53 04             	mov    0x4(%ebx),%edx
801049d1:	89 10                	mov    %edx,(%eax)
801049d3:	31 c0                	xor    %eax,%eax
801049d5:	5b                   	pop    %ebx
801049d6:	5e                   	pop    %esi
801049d7:	5d                   	pop    %ebp
801049d8:	c3                   	ret
801049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049e5:	eb ee                	jmp    801049d5 <argint+0x35>
801049e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801049ee:	00 
801049ef:	90                   	nop

801049f0 <argptr>:
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	57                   	push   %edi
801049f4:	56                   	push   %esi
801049f5:	53                   	push   %ebx
801049f6:	83 ec 0c             	sub    $0xc,%esp
801049f9:	e8 c2 ee ff ff       	call   801038c0 <myproc>
801049fe:	89 c6                	mov    %eax,%esi
80104a00:	e8 bb ee ff ff       	call   801038c0 <myproc>
80104a05:	8b 55 08             	mov    0x8(%ebp),%edx
80104a08:	8b 40 18             	mov    0x18(%eax),%eax
80104a0b:	8b 40 44             	mov    0x44(%eax),%eax
80104a0e:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104a11:	e8 aa ee ff ff       	call   801038c0 <myproc>
80104a16:	8d 7b 04             	lea    0x4(%ebx),%edi
80104a19:	8b 00                	mov    (%eax),%eax
80104a1b:	39 c7                	cmp    %eax,%edi
80104a1d:	73 31                	jae    80104a50 <argptr+0x60>
80104a1f:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104a22:	39 c8                	cmp    %ecx,%eax
80104a24:	72 2a                	jb     80104a50 <argptr+0x60>
80104a26:	8b 55 10             	mov    0x10(%ebp),%edx
80104a29:	8b 43 04             	mov    0x4(%ebx),%eax
80104a2c:	85 d2                	test   %edx,%edx
80104a2e:	78 20                	js     80104a50 <argptr+0x60>
80104a30:	8b 16                	mov    (%esi),%edx
80104a32:	39 d0                	cmp    %edx,%eax
80104a34:	73 1a                	jae    80104a50 <argptr+0x60>
80104a36:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104a39:	01 c3                	add    %eax,%ebx
80104a3b:	39 da                	cmp    %ebx,%edx
80104a3d:	72 11                	jb     80104a50 <argptr+0x60>
80104a3f:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a42:	89 02                	mov    %eax,(%edx)
80104a44:	31 c0                	xor    %eax,%eax
80104a46:	83 c4 0c             	add    $0xc,%esp
80104a49:	5b                   	pop    %ebx
80104a4a:	5e                   	pop    %esi
80104a4b:	5f                   	pop    %edi
80104a4c:	5d                   	pop    %ebp
80104a4d:	c3                   	ret
80104a4e:	66 90                	xchg   %ax,%ax
80104a50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a55:	eb ef                	jmp    80104a46 <argptr+0x56>
80104a57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104a5e:	00 
80104a5f:	90                   	nop

80104a60 <argstr>:
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	56                   	push   %esi
80104a64:	53                   	push   %ebx
80104a65:	e8 56 ee ff ff       	call   801038c0 <myproc>
80104a6a:	8b 55 08             	mov    0x8(%ebp),%edx
80104a6d:	8b 40 18             	mov    0x18(%eax),%eax
80104a70:	8b 40 44             	mov    0x44(%eax),%eax
80104a73:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104a76:	e8 45 ee ff ff       	call   801038c0 <myproc>
80104a7b:	8d 73 04             	lea    0x4(%ebx),%esi
80104a7e:	8b 00                	mov    (%eax),%eax
80104a80:	39 c6                	cmp    %eax,%esi
80104a82:	73 44                	jae    80104ac8 <argstr+0x68>
80104a84:	8d 53 08             	lea    0x8(%ebx),%edx
80104a87:	39 d0                	cmp    %edx,%eax
80104a89:	72 3d                	jb     80104ac8 <argstr+0x68>
80104a8b:	8b 5b 04             	mov    0x4(%ebx),%ebx
80104a8e:	e8 2d ee ff ff       	call   801038c0 <myproc>
80104a93:	3b 18                	cmp    (%eax),%ebx
80104a95:	73 31                	jae    80104ac8 <argstr+0x68>
80104a97:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a9a:	89 1a                	mov    %ebx,(%edx)
80104a9c:	8b 10                	mov    (%eax),%edx
80104a9e:	39 d3                	cmp    %edx,%ebx
80104aa0:	73 26                	jae    80104ac8 <argstr+0x68>
80104aa2:	89 d8                	mov    %ebx,%eax
80104aa4:	eb 11                	jmp    80104ab7 <argstr+0x57>
80104aa6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104aad:	00 
80104aae:	66 90                	xchg   %ax,%ax
80104ab0:	83 c0 01             	add    $0x1,%eax
80104ab3:	39 d0                	cmp    %edx,%eax
80104ab5:	73 11                	jae    80104ac8 <argstr+0x68>
80104ab7:	80 38 00             	cmpb   $0x0,(%eax)
80104aba:	75 f4                	jne    80104ab0 <argstr+0x50>
80104abc:	29 d8                	sub    %ebx,%eax
80104abe:	5b                   	pop    %ebx
80104abf:	5e                   	pop    %esi
80104ac0:	5d                   	pop    %ebp
80104ac1:	c3                   	ret
80104ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ac8:	5b                   	pop    %ebx
80104ac9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ace:	5e                   	pop    %esi
80104acf:	5d                   	pop    %ebp
80104ad0:	c3                   	ret
80104ad1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104ad8:	00 
80104ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104ae0 <syscall>:
80104ae0:	55                   	push   %ebp
80104ae1:	89 e5                	mov    %esp,%ebp
80104ae3:	53                   	push   %ebx
80104ae4:	83 ec 04             	sub    $0x4,%esp
80104ae7:	e8 d4 ed ff ff       	call   801038c0 <myproc>
80104aec:	89 c3                	mov    %eax,%ebx
80104aee:	8b 40 18             	mov    0x18(%eax),%eax
80104af1:	8b 40 1c             	mov    0x1c(%eax),%eax
80104af4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104af7:	83 fa 17             	cmp    $0x17,%edx
80104afa:	77 24                	ja     80104b20 <syscall+0x40>
80104afc:	8b 14 85 20 77 10 80 	mov    -0x7fef88e0(,%eax,4),%edx
80104b03:	85 d2                	test   %edx,%edx
80104b05:	74 19                	je     80104b20 <syscall+0x40>
80104b07:	ff d2                	call   *%edx
80104b09:	89 c2                	mov    %eax,%edx
80104b0b:	8b 43 18             	mov    0x18(%ebx),%eax
80104b0e:	89 50 1c             	mov    %edx,0x1c(%eax)
80104b11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b14:	c9                   	leave
80104b15:	c3                   	ret
80104b16:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104b1d:	00 
80104b1e:	66 90                	xchg   %ax,%ax
80104b20:	50                   	push   %eax
80104b21:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104b24:	50                   	push   %eax
80104b25:	ff 73 10             	push   0x10(%ebx)
80104b28:	68 fd 76 10 80       	push   $0x801076fd
80104b2d:	e8 7e bb ff ff       	call   801006b0 <cprintf>
80104b32:	8b 43 18             	mov    0x18(%ebx),%eax
80104b35:	83 c4 10             	add    $0x10,%esp
80104b38:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104b3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b42:	c9                   	leave
80104b43:	c3                   	ret
80104b44:	66 90                	xchg   %ax,%ax
80104b46:	66 90                	xchg   %ax,%ax
80104b48:	66 90                	xchg   %ax,%ax
80104b4a:	66 90                	xchg   %ax,%ax
80104b4c:	66 90                	xchg   %ax,%ax
80104b4e:	66 90                	xchg   %ax,%ax

80104b50 <create>:
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	57                   	push   %edi
80104b54:	56                   	push   %esi
80104b55:	8d 7d da             	lea    -0x26(%ebp),%edi
80104b58:	53                   	push   %ebx
80104b59:	83 ec 44             	sub    $0x44,%esp
80104b5c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104b5f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104b62:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104b65:	89 4d bc             	mov    %ecx,-0x44(%ebp)
80104b68:	57                   	push   %edi
80104b69:	50                   	push   %eax
80104b6a:	e8 51 d5 ff ff       	call   801020c0 <nameiparent>
80104b6f:	83 c4 10             	add    $0x10,%esp
80104b72:	85 c0                	test   %eax,%eax
80104b74:	74 5e                	je     80104bd4 <create+0x84>
80104b76:	83 ec 0c             	sub    $0xc,%esp
80104b79:	89 c3                	mov    %eax,%ebx
80104b7b:	50                   	push   %eax
80104b7c:	e8 3f cc ff ff       	call   801017c0 <ilock>
80104b81:	83 c4 0c             	add    $0xc,%esp
80104b84:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104b87:	50                   	push   %eax
80104b88:	57                   	push   %edi
80104b89:	53                   	push   %ebx
80104b8a:	e8 81 d1 ff ff       	call   80101d10 <dirlookup>
80104b8f:	83 c4 10             	add    $0x10,%esp
80104b92:	89 c6                	mov    %eax,%esi
80104b94:	85 c0                	test   %eax,%eax
80104b96:	74 48                	je     80104be0 <create+0x90>
80104b98:	83 ec 0c             	sub    $0xc,%esp
80104b9b:	53                   	push   %ebx
80104b9c:	e8 af ce ff ff       	call   80101a50 <iunlockput>
80104ba1:	89 34 24             	mov    %esi,(%esp)
80104ba4:	e8 17 cc ff ff       	call   801017c0 <ilock>
80104ba9:	83 c4 10             	add    $0x10,%esp
80104bac:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104bb1:	75 15                	jne    80104bc8 <create+0x78>
80104bb3:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104bb8:	75 0e                	jne    80104bc8 <create+0x78>
80104bba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bbd:	89 f0                	mov    %esi,%eax
80104bbf:	5b                   	pop    %ebx
80104bc0:	5e                   	pop    %esi
80104bc1:	5f                   	pop    %edi
80104bc2:	5d                   	pop    %ebp
80104bc3:	c3                   	ret
80104bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104bc8:	83 ec 0c             	sub    $0xc,%esp
80104bcb:	56                   	push   %esi
80104bcc:	e8 7f ce ff ff       	call   80101a50 <iunlockput>
80104bd1:	83 c4 10             	add    $0x10,%esp
80104bd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bd7:	31 f6                	xor    %esi,%esi
80104bd9:	5b                   	pop    %ebx
80104bda:	89 f0                	mov    %esi,%eax
80104bdc:	5e                   	pop    %esi
80104bdd:	5f                   	pop    %edi
80104bde:	5d                   	pop    %ebp
80104bdf:	c3                   	ret
80104be0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104be4:	83 ec 08             	sub    $0x8,%esp
80104be7:	50                   	push   %eax
80104be8:	ff 33                	push   (%ebx)
80104bea:	e8 61 ca ff ff       	call   80101650 <ialloc>
80104bef:	83 c4 10             	add    $0x10,%esp
80104bf2:	89 c6                	mov    %eax,%esi
80104bf4:	85 c0                	test   %eax,%eax
80104bf6:	0f 84 bc 00 00 00    	je     80104cb8 <create+0x168>
80104bfc:	83 ec 0c             	sub    $0xc,%esp
80104bff:	50                   	push   %eax
80104c00:	e8 bb cb ff ff       	call   801017c0 <ilock>
80104c05:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104c09:	66 89 46 52          	mov    %ax,0x52(%esi)
80104c0d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104c11:	66 89 46 54          	mov    %ax,0x54(%esi)
80104c15:	b8 01 00 00 00       	mov    $0x1,%eax
80104c1a:	66 89 46 56          	mov    %ax,0x56(%esi)
80104c1e:	89 34 24             	mov    %esi,(%esp)
80104c21:	e8 ea ca ff ff       	call   80101710 <iupdate>
80104c26:	83 c4 10             	add    $0x10,%esp
80104c29:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104c2e:	74 30                	je     80104c60 <create+0x110>
80104c30:	83 ec 04             	sub    $0x4,%esp
80104c33:	ff 76 04             	push   0x4(%esi)
80104c36:	57                   	push   %edi
80104c37:	53                   	push   %ebx
80104c38:	e8 a3 d3 ff ff       	call   80101fe0 <dirlink>
80104c3d:	83 c4 10             	add    $0x10,%esp
80104c40:	85 c0                	test   %eax,%eax
80104c42:	78 67                	js     80104cab <create+0x15b>
80104c44:	83 ec 0c             	sub    $0xc,%esp
80104c47:	53                   	push   %ebx
80104c48:	e8 03 ce ff ff       	call   80101a50 <iunlockput>
80104c4d:	83 c4 10             	add    $0x10,%esp
80104c50:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c53:	89 f0                	mov    %esi,%eax
80104c55:	5b                   	pop    %ebx
80104c56:	5e                   	pop    %esi
80104c57:	5f                   	pop    %edi
80104c58:	5d                   	pop    %ebp
80104c59:	c3                   	ret
80104c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104c68:	53                   	push   %ebx
80104c69:	e8 a2 ca ff ff       	call   80101710 <iupdate>
80104c6e:	83 c4 0c             	add    $0xc,%esp
80104c71:	ff 76 04             	push   0x4(%esi)
80104c74:	68 a0 77 10 80       	push   $0x801077a0
80104c79:	56                   	push   %esi
80104c7a:	e8 61 d3 ff ff       	call   80101fe0 <dirlink>
80104c7f:	83 c4 10             	add    $0x10,%esp
80104c82:	85 c0                	test   %eax,%eax
80104c84:	78 18                	js     80104c9e <create+0x14e>
80104c86:	83 ec 04             	sub    $0x4,%esp
80104c89:	ff 73 04             	push   0x4(%ebx)
80104c8c:	68 9f 77 10 80       	push   $0x8010779f
80104c91:	56                   	push   %esi
80104c92:	e8 49 d3 ff ff       	call   80101fe0 <dirlink>
80104c97:	83 c4 10             	add    $0x10,%esp
80104c9a:	85 c0                	test   %eax,%eax
80104c9c:	79 92                	jns    80104c30 <create+0xe0>
80104c9e:	83 ec 0c             	sub    $0xc,%esp
80104ca1:	68 93 77 10 80       	push   $0x80107793
80104ca6:	e8 d5 b6 ff ff       	call   80100380 <panic>
80104cab:	83 ec 0c             	sub    $0xc,%esp
80104cae:	68 a2 77 10 80       	push   $0x801077a2
80104cb3:	e8 c8 b6 ff ff       	call   80100380 <panic>
80104cb8:	83 ec 0c             	sub    $0xc,%esp
80104cbb:	68 84 77 10 80       	push   $0x80107784
80104cc0:	e8 bb b6 ff ff       	call   80100380 <panic>
80104cc5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104ccc:	00 
80104ccd:	8d 76 00             	lea    0x0(%esi),%esi

80104cd0 <sys_dup>:
80104cd0:	55                   	push   %ebp
80104cd1:	89 e5                	mov    %esp,%ebp
80104cd3:	56                   	push   %esi
80104cd4:	53                   	push   %ebx
80104cd5:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cd8:	83 ec 18             	sub    $0x18,%esp
80104cdb:	50                   	push   %eax
80104cdc:	6a 00                	push   $0x0
80104cde:	e8 bd fc ff ff       	call   801049a0 <argint>
80104ce3:	83 c4 10             	add    $0x10,%esp
80104ce6:	85 c0                	test   %eax,%eax
80104ce8:	78 36                	js     80104d20 <sys_dup+0x50>
80104cea:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104cee:	77 30                	ja     80104d20 <sys_dup+0x50>
80104cf0:	e8 cb eb ff ff       	call   801038c0 <myproc>
80104cf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104cf8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104cfc:	85 f6                	test   %esi,%esi
80104cfe:	74 20                	je     80104d20 <sys_dup+0x50>
80104d00:	e8 bb eb ff ff       	call   801038c0 <myproc>
80104d05:	31 db                	xor    %ebx,%ebx
80104d07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104d0e:	00 
80104d0f:	90                   	nop
80104d10:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104d14:	85 d2                	test   %edx,%edx
80104d16:	74 18                	je     80104d30 <sys_dup+0x60>
80104d18:	83 c3 01             	add    $0x1,%ebx
80104d1b:	83 fb 10             	cmp    $0x10,%ebx
80104d1e:	75 f0                	jne    80104d10 <sys_dup+0x40>
80104d20:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d23:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104d28:	89 d8                	mov    %ebx,%eax
80104d2a:	5b                   	pop    %ebx
80104d2b:	5e                   	pop    %esi
80104d2c:	5d                   	pop    %ebp
80104d2d:	c3                   	ret
80104d2e:	66 90                	xchg   %ax,%ax
80104d30:	83 ec 0c             	sub    $0xc,%esp
80104d33:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104d37:	56                   	push   %esi
80104d38:	e8 83 c1 ff ff       	call   80100ec0 <filedup>
80104d3d:	83 c4 10             	add    $0x10,%esp
80104d40:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d43:	89 d8                	mov    %ebx,%eax
80104d45:	5b                   	pop    %ebx
80104d46:	5e                   	pop    %esi
80104d47:	5d                   	pop    %ebp
80104d48:	c3                   	ret
80104d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104d50 <sys_read>:
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	56                   	push   %esi
80104d54:	53                   	push   %ebx
80104d55:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104d58:	83 ec 18             	sub    $0x18,%esp
80104d5b:	53                   	push   %ebx
80104d5c:	6a 00                	push   $0x0
80104d5e:	e8 3d fc ff ff       	call   801049a0 <argint>
80104d63:	83 c4 10             	add    $0x10,%esp
80104d66:	85 c0                	test   %eax,%eax
80104d68:	78 5e                	js     80104dc8 <sys_read+0x78>
80104d6a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104d6e:	77 58                	ja     80104dc8 <sys_read+0x78>
80104d70:	e8 4b eb ff ff       	call   801038c0 <myproc>
80104d75:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d78:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104d7c:	85 f6                	test   %esi,%esi
80104d7e:	74 48                	je     80104dc8 <sys_read+0x78>
80104d80:	83 ec 08             	sub    $0x8,%esp
80104d83:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d86:	50                   	push   %eax
80104d87:	6a 02                	push   $0x2
80104d89:	e8 12 fc ff ff       	call   801049a0 <argint>
80104d8e:	83 c4 10             	add    $0x10,%esp
80104d91:	85 c0                	test   %eax,%eax
80104d93:	78 33                	js     80104dc8 <sys_read+0x78>
80104d95:	83 ec 04             	sub    $0x4,%esp
80104d98:	ff 75 f0             	push   -0x10(%ebp)
80104d9b:	53                   	push   %ebx
80104d9c:	6a 01                	push   $0x1
80104d9e:	e8 4d fc ff ff       	call   801049f0 <argptr>
80104da3:	83 c4 10             	add    $0x10,%esp
80104da6:	85 c0                	test   %eax,%eax
80104da8:	78 1e                	js     80104dc8 <sys_read+0x78>
80104daa:	83 ec 04             	sub    $0x4,%esp
80104dad:	ff 75 f0             	push   -0x10(%ebp)
80104db0:	ff 75 f4             	push   -0xc(%ebp)
80104db3:	56                   	push   %esi
80104db4:	e8 87 c2 ff ff       	call   80101040 <fileread>
80104db9:	83 c4 10             	add    $0x10,%esp
80104dbc:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104dbf:	5b                   	pop    %ebx
80104dc0:	5e                   	pop    %esi
80104dc1:	5d                   	pop    %ebp
80104dc2:	c3                   	ret
80104dc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104dc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dcd:	eb ed                	jmp    80104dbc <sys_read+0x6c>
80104dcf:	90                   	nop

80104dd0 <sys_write>:
80104dd0:	55                   	push   %ebp
80104dd1:	89 e5                	mov    %esp,%ebp
80104dd3:	56                   	push   %esi
80104dd4:	53                   	push   %ebx
80104dd5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104dd8:	83 ec 18             	sub    $0x18,%esp
80104ddb:	53                   	push   %ebx
80104ddc:	6a 00                	push   $0x0
80104dde:	e8 bd fb ff ff       	call   801049a0 <argint>
80104de3:	83 c4 10             	add    $0x10,%esp
80104de6:	85 c0                	test   %eax,%eax
80104de8:	78 5e                	js     80104e48 <sys_write+0x78>
80104dea:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104dee:	77 58                	ja     80104e48 <sys_write+0x78>
80104df0:	e8 cb ea ff ff       	call   801038c0 <myproc>
80104df5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104df8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104dfc:	85 f6                	test   %esi,%esi
80104dfe:	74 48                	je     80104e48 <sys_write+0x78>
80104e00:	83 ec 08             	sub    $0x8,%esp
80104e03:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e06:	50                   	push   %eax
80104e07:	6a 02                	push   $0x2
80104e09:	e8 92 fb ff ff       	call   801049a0 <argint>
80104e0e:	83 c4 10             	add    $0x10,%esp
80104e11:	85 c0                	test   %eax,%eax
80104e13:	78 33                	js     80104e48 <sys_write+0x78>
80104e15:	83 ec 04             	sub    $0x4,%esp
80104e18:	ff 75 f0             	push   -0x10(%ebp)
80104e1b:	53                   	push   %ebx
80104e1c:	6a 01                	push   $0x1
80104e1e:	e8 cd fb ff ff       	call   801049f0 <argptr>
80104e23:	83 c4 10             	add    $0x10,%esp
80104e26:	85 c0                	test   %eax,%eax
80104e28:	78 1e                	js     80104e48 <sys_write+0x78>
80104e2a:	83 ec 04             	sub    $0x4,%esp
80104e2d:	ff 75 f0             	push   -0x10(%ebp)
80104e30:	ff 75 f4             	push   -0xc(%ebp)
80104e33:	56                   	push   %esi
80104e34:	e8 97 c2 ff ff       	call   801010d0 <filewrite>
80104e39:	83 c4 10             	add    $0x10,%esp
80104e3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e3f:	5b                   	pop    %ebx
80104e40:	5e                   	pop    %esi
80104e41:	5d                   	pop    %ebp
80104e42:	c3                   	ret
80104e43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104e48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e4d:	eb ed                	jmp    80104e3c <sys_write+0x6c>
80104e4f:	90                   	nop

80104e50 <sys_close>:
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	56                   	push   %esi
80104e54:	53                   	push   %ebx
80104e55:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e58:	83 ec 18             	sub    $0x18,%esp
80104e5b:	50                   	push   %eax
80104e5c:	6a 00                	push   $0x0
80104e5e:	e8 3d fb ff ff       	call   801049a0 <argint>
80104e63:	83 c4 10             	add    $0x10,%esp
80104e66:	85 c0                	test   %eax,%eax
80104e68:	78 3e                	js     80104ea8 <sys_close+0x58>
80104e6a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104e6e:	77 38                	ja     80104ea8 <sys_close+0x58>
80104e70:	e8 4b ea ff ff       	call   801038c0 <myproc>
80104e75:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104e78:	8d 5a 08             	lea    0x8(%edx),%ebx
80104e7b:	8b 74 98 08          	mov    0x8(%eax,%ebx,4),%esi
80104e7f:	85 f6                	test   %esi,%esi
80104e81:	74 25                	je     80104ea8 <sys_close+0x58>
80104e83:	e8 38 ea ff ff       	call   801038c0 <myproc>
80104e88:	83 ec 0c             	sub    $0xc,%esp
80104e8b:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
80104e92:	00 
80104e93:	56                   	push   %esi
80104e94:	e8 77 c0 ff ff       	call   80100f10 <fileclose>
80104e99:	83 c4 10             	add    $0x10,%esp
80104e9c:	31 c0                	xor    %eax,%eax
80104e9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ea1:	5b                   	pop    %ebx
80104ea2:	5e                   	pop    %esi
80104ea3:	5d                   	pop    %ebp
80104ea4:	c3                   	ret
80104ea5:	8d 76 00             	lea    0x0(%esi),%esi
80104ea8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ead:	eb ef                	jmp    80104e9e <sys_close+0x4e>
80104eaf:	90                   	nop

80104eb0 <sys_fstat>:
80104eb0:	55                   	push   %ebp
80104eb1:	89 e5                	mov    %esp,%ebp
80104eb3:	56                   	push   %esi
80104eb4:	53                   	push   %ebx
80104eb5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104eb8:	83 ec 18             	sub    $0x18,%esp
80104ebb:	53                   	push   %ebx
80104ebc:	6a 00                	push   $0x0
80104ebe:	e8 dd fa ff ff       	call   801049a0 <argint>
80104ec3:	83 c4 10             	add    $0x10,%esp
80104ec6:	85 c0                	test   %eax,%eax
80104ec8:	78 46                	js     80104f10 <sys_fstat+0x60>
80104eca:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ece:	77 40                	ja     80104f10 <sys_fstat+0x60>
80104ed0:	e8 eb e9 ff ff       	call   801038c0 <myproc>
80104ed5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104ed8:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104edc:	85 f6                	test   %esi,%esi
80104ede:	74 30                	je     80104f10 <sys_fstat+0x60>
80104ee0:	83 ec 04             	sub    $0x4,%esp
80104ee3:	6a 14                	push   $0x14
80104ee5:	53                   	push   %ebx
80104ee6:	6a 01                	push   $0x1
80104ee8:	e8 03 fb ff ff       	call   801049f0 <argptr>
80104eed:	83 c4 10             	add    $0x10,%esp
80104ef0:	85 c0                	test   %eax,%eax
80104ef2:	78 1c                	js     80104f10 <sys_fstat+0x60>
80104ef4:	83 ec 08             	sub    $0x8,%esp
80104ef7:	ff 75 f4             	push   -0xc(%ebp)
80104efa:	56                   	push   %esi
80104efb:	e8 f0 c0 ff ff       	call   80100ff0 <filestat>
80104f00:	83 c4 10             	add    $0x10,%esp
80104f03:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f06:	5b                   	pop    %ebx
80104f07:	5e                   	pop    %esi
80104f08:	5d                   	pop    %ebp
80104f09:	c3                   	ret
80104f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f15:	eb ec                	jmp    80104f03 <sys_fstat+0x53>
80104f17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104f1e:	00 
80104f1f:	90                   	nop

80104f20 <sys_link>:
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	57                   	push   %edi
80104f24:	56                   	push   %esi
80104f25:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104f28:	53                   	push   %ebx
80104f29:	83 ec 34             	sub    $0x34,%esp
80104f2c:	50                   	push   %eax
80104f2d:	6a 00                	push   $0x0
80104f2f:	e8 2c fb ff ff       	call   80104a60 <argstr>
80104f34:	83 c4 10             	add    $0x10,%esp
80104f37:	85 c0                	test   %eax,%eax
80104f39:	0f 88 fb 00 00 00    	js     8010503a <sys_link+0x11a>
80104f3f:	83 ec 08             	sub    $0x8,%esp
80104f42:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f45:	50                   	push   %eax
80104f46:	6a 01                	push   $0x1
80104f48:	e8 13 fb ff ff       	call   80104a60 <argstr>
80104f4d:	83 c4 10             	add    $0x10,%esp
80104f50:	85 c0                	test   %eax,%eax
80104f52:	0f 88 e2 00 00 00    	js     8010503a <sys_link+0x11a>
80104f58:	e8 33 dd ff ff       	call   80102c90 <begin_op>
80104f5d:	83 ec 0c             	sub    $0xc,%esp
80104f60:	ff 75 d4             	push   -0x2c(%ebp)
80104f63:	e8 38 d1 ff ff       	call   801020a0 <namei>
80104f68:	83 c4 10             	add    $0x10,%esp
80104f6b:	89 c3                	mov    %eax,%ebx
80104f6d:	85 c0                	test   %eax,%eax
80104f6f:	0f 84 df 00 00 00    	je     80105054 <sys_link+0x134>
80104f75:	83 ec 0c             	sub    $0xc,%esp
80104f78:	50                   	push   %eax
80104f79:	e8 42 c8 ff ff       	call   801017c0 <ilock>
80104f7e:	83 c4 10             	add    $0x10,%esp
80104f81:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f86:	0f 84 b5 00 00 00    	je     80105041 <sys_link+0x121>
80104f8c:	83 ec 0c             	sub    $0xc,%esp
80104f8f:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104f94:	8d 7d da             	lea    -0x26(%ebp),%edi
80104f97:	53                   	push   %ebx
80104f98:	e8 73 c7 ff ff       	call   80101710 <iupdate>
80104f9d:	89 1c 24             	mov    %ebx,(%esp)
80104fa0:	e8 fb c8 ff ff       	call   801018a0 <iunlock>
80104fa5:	58                   	pop    %eax
80104fa6:	5a                   	pop    %edx
80104fa7:	57                   	push   %edi
80104fa8:	ff 75 d0             	push   -0x30(%ebp)
80104fab:	e8 10 d1 ff ff       	call   801020c0 <nameiparent>
80104fb0:	83 c4 10             	add    $0x10,%esp
80104fb3:	89 c6                	mov    %eax,%esi
80104fb5:	85 c0                	test   %eax,%eax
80104fb7:	74 5b                	je     80105014 <sys_link+0xf4>
80104fb9:	83 ec 0c             	sub    $0xc,%esp
80104fbc:	50                   	push   %eax
80104fbd:	e8 fe c7 ff ff       	call   801017c0 <ilock>
80104fc2:	8b 03                	mov    (%ebx),%eax
80104fc4:	83 c4 10             	add    $0x10,%esp
80104fc7:	39 06                	cmp    %eax,(%esi)
80104fc9:	75 3d                	jne    80105008 <sys_link+0xe8>
80104fcb:	83 ec 04             	sub    $0x4,%esp
80104fce:	ff 73 04             	push   0x4(%ebx)
80104fd1:	57                   	push   %edi
80104fd2:	56                   	push   %esi
80104fd3:	e8 08 d0 ff ff       	call   80101fe0 <dirlink>
80104fd8:	83 c4 10             	add    $0x10,%esp
80104fdb:	85 c0                	test   %eax,%eax
80104fdd:	78 29                	js     80105008 <sys_link+0xe8>
80104fdf:	83 ec 0c             	sub    $0xc,%esp
80104fe2:	56                   	push   %esi
80104fe3:	e8 68 ca ff ff       	call   80101a50 <iunlockput>
80104fe8:	89 1c 24             	mov    %ebx,(%esp)
80104feb:	e8 00 c9 ff ff       	call   801018f0 <iput>
80104ff0:	e8 0b dd ff ff       	call   80102d00 <end_op>
80104ff5:	83 c4 10             	add    $0x10,%esp
80104ff8:	31 c0                	xor    %eax,%eax
80104ffa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ffd:	5b                   	pop    %ebx
80104ffe:	5e                   	pop    %esi
80104fff:	5f                   	pop    %edi
80105000:	5d                   	pop    %ebp
80105001:	c3                   	ret
80105002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105008:	83 ec 0c             	sub    $0xc,%esp
8010500b:	56                   	push   %esi
8010500c:	e8 3f ca ff ff       	call   80101a50 <iunlockput>
80105011:	83 c4 10             	add    $0x10,%esp
80105014:	83 ec 0c             	sub    $0xc,%esp
80105017:	53                   	push   %ebx
80105018:	e8 a3 c7 ff ff       	call   801017c0 <ilock>
8010501d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105022:	89 1c 24             	mov    %ebx,(%esp)
80105025:	e8 e6 c6 ff ff       	call   80101710 <iupdate>
8010502a:	89 1c 24             	mov    %ebx,(%esp)
8010502d:	e8 1e ca ff ff       	call   80101a50 <iunlockput>
80105032:	e8 c9 dc ff ff       	call   80102d00 <end_op>
80105037:	83 c4 10             	add    $0x10,%esp
8010503a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010503f:	eb b9                	jmp    80104ffa <sys_link+0xda>
80105041:	83 ec 0c             	sub    $0xc,%esp
80105044:	53                   	push   %ebx
80105045:	e8 06 ca ff ff       	call   80101a50 <iunlockput>
8010504a:	e8 b1 dc ff ff       	call   80102d00 <end_op>
8010504f:	83 c4 10             	add    $0x10,%esp
80105052:	eb e6                	jmp    8010503a <sys_link+0x11a>
80105054:	e8 a7 dc ff ff       	call   80102d00 <end_op>
80105059:	eb df                	jmp    8010503a <sys_link+0x11a>
8010505b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80105060 <sys_unlink>:
80105060:	55                   	push   %ebp
80105061:	89 e5                	mov    %esp,%ebp
80105063:	57                   	push   %edi
80105064:	56                   	push   %esi
80105065:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105068:	53                   	push   %ebx
80105069:	83 ec 54             	sub    $0x54,%esp
8010506c:	50                   	push   %eax
8010506d:	6a 00                	push   $0x0
8010506f:	e8 ec f9 ff ff       	call   80104a60 <argstr>
80105074:	83 c4 10             	add    $0x10,%esp
80105077:	85 c0                	test   %eax,%eax
80105079:	0f 88 54 01 00 00    	js     801051d3 <sys_unlink+0x173>
8010507f:	e8 0c dc ff ff       	call   80102c90 <begin_op>
80105084:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105087:	83 ec 08             	sub    $0x8,%esp
8010508a:	53                   	push   %ebx
8010508b:	ff 75 c0             	push   -0x40(%ebp)
8010508e:	e8 2d d0 ff ff       	call   801020c0 <nameiparent>
80105093:	83 c4 10             	add    $0x10,%esp
80105096:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80105099:	85 c0                	test   %eax,%eax
8010509b:	0f 84 58 01 00 00    	je     801051f9 <sys_unlink+0x199>
801050a1:	8b 7d b4             	mov    -0x4c(%ebp),%edi
801050a4:	83 ec 0c             	sub    $0xc,%esp
801050a7:	57                   	push   %edi
801050a8:	e8 13 c7 ff ff       	call   801017c0 <ilock>
801050ad:	58                   	pop    %eax
801050ae:	5a                   	pop    %edx
801050af:	68 a0 77 10 80       	push   $0x801077a0
801050b4:	53                   	push   %ebx
801050b5:	e8 36 cc ff ff       	call   80101cf0 <namecmp>
801050ba:	83 c4 10             	add    $0x10,%esp
801050bd:	85 c0                	test   %eax,%eax
801050bf:	0f 84 fb 00 00 00    	je     801051c0 <sys_unlink+0x160>
801050c5:	83 ec 08             	sub    $0x8,%esp
801050c8:	68 9f 77 10 80       	push   $0x8010779f
801050cd:	53                   	push   %ebx
801050ce:	e8 1d cc ff ff       	call   80101cf0 <namecmp>
801050d3:	83 c4 10             	add    $0x10,%esp
801050d6:	85 c0                	test   %eax,%eax
801050d8:	0f 84 e2 00 00 00    	je     801051c0 <sys_unlink+0x160>
801050de:	83 ec 04             	sub    $0x4,%esp
801050e1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801050e4:	50                   	push   %eax
801050e5:	53                   	push   %ebx
801050e6:	57                   	push   %edi
801050e7:	e8 24 cc ff ff       	call   80101d10 <dirlookup>
801050ec:	83 c4 10             	add    $0x10,%esp
801050ef:	89 c3                	mov    %eax,%ebx
801050f1:	85 c0                	test   %eax,%eax
801050f3:	0f 84 c7 00 00 00    	je     801051c0 <sys_unlink+0x160>
801050f9:	83 ec 0c             	sub    $0xc,%esp
801050fc:	50                   	push   %eax
801050fd:	e8 be c6 ff ff       	call   801017c0 <ilock>
80105102:	83 c4 10             	add    $0x10,%esp
80105105:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010510a:	0f 8e 0a 01 00 00    	jle    8010521a <sys_unlink+0x1ba>
80105110:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105115:	8d 7d d8             	lea    -0x28(%ebp),%edi
80105118:	74 66                	je     80105180 <sys_unlink+0x120>
8010511a:	83 ec 04             	sub    $0x4,%esp
8010511d:	6a 10                	push   $0x10
8010511f:	6a 00                	push   $0x0
80105121:	57                   	push   %edi
80105122:	e8 c9 f5 ff ff       	call   801046f0 <memset>
80105127:	6a 10                	push   $0x10
80105129:	ff 75 c4             	push   -0x3c(%ebp)
8010512c:	57                   	push   %edi
8010512d:	ff 75 b4             	push   -0x4c(%ebp)
80105130:	e8 9b ca ff ff       	call   80101bd0 <writei>
80105135:	83 c4 20             	add    $0x20,%esp
80105138:	83 f8 10             	cmp    $0x10,%eax
8010513b:	0f 85 cc 00 00 00    	jne    8010520d <sys_unlink+0x1ad>
80105141:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105146:	0f 84 94 00 00 00    	je     801051e0 <sys_unlink+0x180>
8010514c:	83 ec 0c             	sub    $0xc,%esp
8010514f:	ff 75 b4             	push   -0x4c(%ebp)
80105152:	e8 f9 c8 ff ff       	call   80101a50 <iunlockput>
80105157:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
8010515c:	89 1c 24             	mov    %ebx,(%esp)
8010515f:	e8 ac c5 ff ff       	call   80101710 <iupdate>
80105164:	89 1c 24             	mov    %ebx,(%esp)
80105167:	e8 e4 c8 ff ff       	call   80101a50 <iunlockput>
8010516c:	e8 8f db ff ff       	call   80102d00 <end_op>
80105171:	83 c4 10             	add    $0x10,%esp
80105174:	31 c0                	xor    %eax,%eax
80105176:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105179:	5b                   	pop    %ebx
8010517a:	5e                   	pop    %esi
8010517b:	5f                   	pop    %edi
8010517c:	5d                   	pop    %ebp
8010517d:	c3                   	ret
8010517e:	66 90                	xchg   %ax,%ax
80105180:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105184:	76 94                	jbe    8010511a <sys_unlink+0xba>
80105186:	be 20 00 00 00       	mov    $0x20,%esi
8010518b:	eb 0b                	jmp    80105198 <sys_unlink+0x138>
8010518d:	8d 76 00             	lea    0x0(%esi),%esi
80105190:	83 c6 10             	add    $0x10,%esi
80105193:	3b 73 58             	cmp    0x58(%ebx),%esi
80105196:	73 82                	jae    8010511a <sys_unlink+0xba>
80105198:	6a 10                	push   $0x10
8010519a:	56                   	push   %esi
8010519b:	57                   	push   %edi
8010519c:	53                   	push   %ebx
8010519d:	e8 2e c9 ff ff       	call   80101ad0 <readi>
801051a2:	83 c4 10             	add    $0x10,%esp
801051a5:	83 f8 10             	cmp    $0x10,%eax
801051a8:	75 56                	jne    80105200 <sys_unlink+0x1a0>
801051aa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801051af:	74 df                	je     80105190 <sys_unlink+0x130>
801051b1:	83 ec 0c             	sub    $0xc,%esp
801051b4:	53                   	push   %ebx
801051b5:	e8 96 c8 ff ff       	call   80101a50 <iunlockput>
801051ba:	83 c4 10             	add    $0x10,%esp
801051bd:	8d 76 00             	lea    0x0(%esi),%esi
801051c0:	83 ec 0c             	sub    $0xc,%esp
801051c3:	ff 75 b4             	push   -0x4c(%ebp)
801051c6:	e8 85 c8 ff ff       	call   80101a50 <iunlockput>
801051cb:	e8 30 db ff ff       	call   80102d00 <end_op>
801051d0:	83 c4 10             	add    $0x10,%esp
801051d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051d8:	eb 9c                	jmp    80105176 <sys_unlink+0x116>
801051da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801051e0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801051e3:	83 ec 0c             	sub    $0xc,%esp
801051e6:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
801051eb:	50                   	push   %eax
801051ec:	e8 1f c5 ff ff       	call   80101710 <iupdate>
801051f1:	83 c4 10             	add    $0x10,%esp
801051f4:	e9 53 ff ff ff       	jmp    8010514c <sys_unlink+0xec>
801051f9:	e8 02 db ff ff       	call   80102d00 <end_op>
801051fe:	eb d3                	jmp    801051d3 <sys_unlink+0x173>
80105200:	83 ec 0c             	sub    $0xc,%esp
80105203:	68 c4 77 10 80       	push   $0x801077c4
80105208:	e8 73 b1 ff ff       	call   80100380 <panic>
8010520d:	83 ec 0c             	sub    $0xc,%esp
80105210:	68 d6 77 10 80       	push   $0x801077d6
80105215:	e8 66 b1 ff ff       	call   80100380 <panic>
8010521a:	83 ec 0c             	sub    $0xc,%esp
8010521d:	68 b2 77 10 80       	push   $0x801077b2
80105222:	e8 59 b1 ff ff       	call   80100380 <panic>
80105227:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010522e:	00 
8010522f:	90                   	nop

80105230 <sys_open>:
80105230:	55                   	push   %ebp
80105231:	89 e5                	mov    %esp,%ebp
80105233:	57                   	push   %edi
80105234:	56                   	push   %esi
80105235:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105238:	53                   	push   %ebx
80105239:	83 ec 24             	sub    $0x24,%esp
8010523c:	50                   	push   %eax
8010523d:	6a 00                	push   $0x0
8010523f:	e8 1c f8 ff ff       	call   80104a60 <argstr>
80105244:	83 c4 10             	add    $0x10,%esp
80105247:	85 c0                	test   %eax,%eax
80105249:	0f 88 8e 00 00 00    	js     801052dd <sys_open+0xad>
8010524f:	83 ec 08             	sub    $0x8,%esp
80105252:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105255:	50                   	push   %eax
80105256:	6a 01                	push   $0x1
80105258:	e8 43 f7 ff ff       	call   801049a0 <argint>
8010525d:	83 c4 10             	add    $0x10,%esp
80105260:	85 c0                	test   %eax,%eax
80105262:	78 79                	js     801052dd <sys_open+0xad>
80105264:	e8 27 da ff ff       	call   80102c90 <begin_op>
80105269:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
8010526d:	75 79                	jne    801052e8 <sys_open+0xb8>
8010526f:	83 ec 0c             	sub    $0xc,%esp
80105272:	ff 75 e0             	push   -0x20(%ebp)
80105275:	e8 26 ce ff ff       	call   801020a0 <namei>
8010527a:	83 c4 10             	add    $0x10,%esp
8010527d:	89 c6                	mov    %eax,%esi
8010527f:	85 c0                	test   %eax,%eax
80105281:	0f 84 7e 00 00 00    	je     80105305 <sys_open+0xd5>
80105287:	83 ec 0c             	sub    $0xc,%esp
8010528a:	50                   	push   %eax
8010528b:	e8 30 c5 ff ff       	call   801017c0 <ilock>
80105290:	83 c4 10             	add    $0x10,%esp
80105293:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105298:	0f 84 ba 00 00 00    	je     80105358 <sys_open+0x128>
8010529e:	e8 ad bb ff ff       	call   80100e50 <filealloc>
801052a3:	89 c7                	mov    %eax,%edi
801052a5:	85 c0                	test   %eax,%eax
801052a7:	74 23                	je     801052cc <sys_open+0x9c>
801052a9:	e8 12 e6 ff ff       	call   801038c0 <myproc>
801052ae:	31 db                	xor    %ebx,%ebx
801052b0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801052b4:	85 d2                	test   %edx,%edx
801052b6:	74 58                	je     80105310 <sys_open+0xe0>
801052b8:	83 c3 01             	add    $0x1,%ebx
801052bb:	83 fb 10             	cmp    $0x10,%ebx
801052be:	75 f0                	jne    801052b0 <sys_open+0x80>
801052c0:	83 ec 0c             	sub    $0xc,%esp
801052c3:	57                   	push   %edi
801052c4:	e8 47 bc ff ff       	call   80100f10 <fileclose>
801052c9:	83 c4 10             	add    $0x10,%esp
801052cc:	83 ec 0c             	sub    $0xc,%esp
801052cf:	56                   	push   %esi
801052d0:	e8 7b c7 ff ff       	call   80101a50 <iunlockput>
801052d5:	e8 26 da ff ff       	call   80102d00 <end_op>
801052da:	83 c4 10             	add    $0x10,%esp
801052dd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801052e2:	eb 65                	jmp    80105349 <sys_open+0x119>
801052e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801052e8:	83 ec 0c             	sub    $0xc,%esp
801052eb:	31 c9                	xor    %ecx,%ecx
801052ed:	ba 02 00 00 00       	mov    $0x2,%edx
801052f2:	6a 00                	push   $0x0
801052f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801052f7:	e8 54 f8 ff ff       	call   80104b50 <create>
801052fc:	83 c4 10             	add    $0x10,%esp
801052ff:	89 c6                	mov    %eax,%esi
80105301:	85 c0                	test   %eax,%eax
80105303:	75 99                	jne    8010529e <sys_open+0x6e>
80105305:	e8 f6 d9 ff ff       	call   80102d00 <end_op>
8010530a:	eb d1                	jmp    801052dd <sys_open+0xad>
8010530c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
80105317:	56                   	push   %esi
80105318:	e8 83 c5 ff ff       	call   801018a0 <iunlock>
8010531d:	e8 de d9 ff ff       	call   80102d00 <end_op>
80105322:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80105328:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010532b:	83 c4 10             	add    $0x10,%esp
8010532e:	89 77 10             	mov    %esi,0x10(%edi)
80105331:	89 d0                	mov    %edx,%eax
80105333:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
8010533a:	f7 d0                	not    %eax
8010533c:	83 e0 01             	and    $0x1,%eax
8010533f:	83 e2 03             	and    $0x3,%edx
80105342:	88 47 08             	mov    %al,0x8(%edi)
80105345:	0f 95 47 09          	setne  0x9(%edi)
80105349:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010534c:	89 d8                	mov    %ebx,%eax
8010534e:	5b                   	pop    %ebx
8010534f:	5e                   	pop    %esi
80105350:	5f                   	pop    %edi
80105351:	5d                   	pop    %ebp
80105352:	c3                   	ret
80105353:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105358:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010535b:	85 c9                	test   %ecx,%ecx
8010535d:	0f 84 3b ff ff ff    	je     8010529e <sys_open+0x6e>
80105363:	e9 64 ff ff ff       	jmp    801052cc <sys_open+0x9c>
80105368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010536f:	00 

80105370 <sys_mkdir>:
80105370:	55                   	push   %ebp
80105371:	89 e5                	mov    %esp,%ebp
80105373:	83 ec 18             	sub    $0x18,%esp
80105376:	e8 15 d9 ff ff       	call   80102c90 <begin_op>
8010537b:	83 ec 08             	sub    $0x8,%esp
8010537e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105381:	50                   	push   %eax
80105382:	6a 00                	push   $0x0
80105384:	e8 d7 f6 ff ff       	call   80104a60 <argstr>
80105389:	83 c4 10             	add    $0x10,%esp
8010538c:	85 c0                	test   %eax,%eax
8010538e:	78 30                	js     801053c0 <sys_mkdir+0x50>
80105390:	83 ec 0c             	sub    $0xc,%esp
80105393:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105396:	31 c9                	xor    %ecx,%ecx
80105398:	ba 01 00 00 00       	mov    $0x1,%edx
8010539d:	6a 00                	push   $0x0
8010539f:	e8 ac f7 ff ff       	call   80104b50 <create>
801053a4:	83 c4 10             	add    $0x10,%esp
801053a7:	85 c0                	test   %eax,%eax
801053a9:	74 15                	je     801053c0 <sys_mkdir+0x50>
801053ab:	83 ec 0c             	sub    $0xc,%esp
801053ae:	50                   	push   %eax
801053af:	e8 9c c6 ff ff       	call   80101a50 <iunlockput>
801053b4:	e8 47 d9 ff ff       	call   80102d00 <end_op>
801053b9:	83 c4 10             	add    $0x10,%esp
801053bc:	31 c0                	xor    %eax,%eax
801053be:	c9                   	leave
801053bf:	c3                   	ret
801053c0:	e8 3b d9 ff ff       	call   80102d00 <end_op>
801053c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ca:	c9                   	leave
801053cb:	c3                   	ret
801053cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053d0 <sys_mknod>:
801053d0:	55                   	push   %ebp
801053d1:	89 e5                	mov    %esp,%ebp
801053d3:	83 ec 18             	sub    $0x18,%esp
801053d6:	e8 b5 d8 ff ff       	call   80102c90 <begin_op>
801053db:	83 ec 08             	sub    $0x8,%esp
801053de:	8d 45 ec             	lea    -0x14(%ebp),%eax
801053e1:	50                   	push   %eax
801053e2:	6a 00                	push   $0x0
801053e4:	e8 77 f6 ff ff       	call   80104a60 <argstr>
801053e9:	83 c4 10             	add    $0x10,%esp
801053ec:	85 c0                	test   %eax,%eax
801053ee:	78 60                	js     80105450 <sys_mknod+0x80>
801053f0:	83 ec 08             	sub    $0x8,%esp
801053f3:	8d 45 f0             	lea    -0x10(%ebp),%eax
801053f6:	50                   	push   %eax
801053f7:	6a 01                	push   $0x1
801053f9:	e8 a2 f5 ff ff       	call   801049a0 <argint>
801053fe:	83 c4 10             	add    $0x10,%esp
80105401:	85 c0                	test   %eax,%eax
80105403:	78 4b                	js     80105450 <sys_mknod+0x80>
80105405:	83 ec 08             	sub    $0x8,%esp
80105408:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010540b:	50                   	push   %eax
8010540c:	6a 02                	push   $0x2
8010540e:	e8 8d f5 ff ff       	call   801049a0 <argint>
80105413:	83 c4 10             	add    $0x10,%esp
80105416:	85 c0                	test   %eax,%eax
80105418:	78 36                	js     80105450 <sys_mknod+0x80>
8010541a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010541e:	83 ec 0c             	sub    $0xc,%esp
80105421:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105425:	ba 03 00 00 00       	mov    $0x3,%edx
8010542a:	50                   	push   %eax
8010542b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010542e:	e8 1d f7 ff ff       	call   80104b50 <create>
80105433:	83 c4 10             	add    $0x10,%esp
80105436:	85 c0                	test   %eax,%eax
80105438:	74 16                	je     80105450 <sys_mknod+0x80>
8010543a:	83 ec 0c             	sub    $0xc,%esp
8010543d:	50                   	push   %eax
8010543e:	e8 0d c6 ff ff       	call   80101a50 <iunlockput>
80105443:	e8 b8 d8 ff ff       	call   80102d00 <end_op>
80105448:	83 c4 10             	add    $0x10,%esp
8010544b:	31 c0                	xor    %eax,%eax
8010544d:	c9                   	leave
8010544e:	c3                   	ret
8010544f:	90                   	nop
80105450:	e8 ab d8 ff ff       	call   80102d00 <end_op>
80105455:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010545a:	c9                   	leave
8010545b:	c3                   	ret
8010545c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105460 <sys_chdir>:
80105460:	55                   	push   %ebp
80105461:	89 e5                	mov    %esp,%ebp
80105463:	56                   	push   %esi
80105464:	53                   	push   %ebx
80105465:	83 ec 10             	sub    $0x10,%esp
80105468:	e8 53 e4 ff ff       	call   801038c0 <myproc>
8010546d:	89 c6                	mov    %eax,%esi
8010546f:	e8 1c d8 ff ff       	call   80102c90 <begin_op>
80105474:	83 ec 08             	sub    $0x8,%esp
80105477:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010547a:	50                   	push   %eax
8010547b:	6a 00                	push   $0x0
8010547d:	e8 de f5 ff ff       	call   80104a60 <argstr>
80105482:	83 c4 10             	add    $0x10,%esp
80105485:	85 c0                	test   %eax,%eax
80105487:	78 77                	js     80105500 <sys_chdir+0xa0>
80105489:	83 ec 0c             	sub    $0xc,%esp
8010548c:	ff 75 f4             	push   -0xc(%ebp)
8010548f:	e8 0c cc ff ff       	call   801020a0 <namei>
80105494:	83 c4 10             	add    $0x10,%esp
80105497:	89 c3                	mov    %eax,%ebx
80105499:	85 c0                	test   %eax,%eax
8010549b:	74 63                	je     80105500 <sys_chdir+0xa0>
8010549d:	83 ec 0c             	sub    $0xc,%esp
801054a0:	50                   	push   %eax
801054a1:	e8 1a c3 ff ff       	call   801017c0 <ilock>
801054a6:	83 c4 10             	add    $0x10,%esp
801054a9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054ae:	75 30                	jne    801054e0 <sys_chdir+0x80>
801054b0:	83 ec 0c             	sub    $0xc,%esp
801054b3:	53                   	push   %ebx
801054b4:	e8 e7 c3 ff ff       	call   801018a0 <iunlock>
801054b9:	58                   	pop    %eax
801054ba:	ff 76 68             	push   0x68(%esi)
801054bd:	e8 2e c4 ff ff       	call   801018f0 <iput>
801054c2:	e8 39 d8 ff ff       	call   80102d00 <end_op>
801054c7:	89 5e 68             	mov    %ebx,0x68(%esi)
801054ca:	83 c4 10             	add    $0x10,%esp
801054cd:	31 c0                	xor    %eax,%eax
801054cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801054d2:	5b                   	pop    %ebx
801054d3:	5e                   	pop    %esi
801054d4:	5d                   	pop    %ebp
801054d5:	c3                   	ret
801054d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801054dd:	00 
801054de:	66 90                	xchg   %ax,%ax
801054e0:	83 ec 0c             	sub    $0xc,%esp
801054e3:	53                   	push   %ebx
801054e4:	e8 67 c5 ff ff       	call   80101a50 <iunlockput>
801054e9:	e8 12 d8 ff ff       	call   80102d00 <end_op>
801054ee:	83 c4 10             	add    $0x10,%esp
801054f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054f6:	eb d7                	jmp    801054cf <sys_chdir+0x6f>
801054f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801054ff:	00 
80105500:	e8 fb d7 ff ff       	call   80102d00 <end_op>
80105505:	eb ea                	jmp    801054f1 <sys_chdir+0x91>
80105507:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010550e:	00 
8010550f:	90                   	nop

80105510 <sys_exec>:
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	57                   	push   %edi
80105514:	56                   	push   %esi
80105515:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010551b:	53                   	push   %ebx
8010551c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105522:	50                   	push   %eax
80105523:	6a 00                	push   $0x0
80105525:	e8 36 f5 ff ff       	call   80104a60 <argstr>
8010552a:	83 c4 10             	add    $0x10,%esp
8010552d:	85 c0                	test   %eax,%eax
8010552f:	0f 88 87 00 00 00    	js     801055bc <sys_exec+0xac>
80105535:	83 ec 08             	sub    $0x8,%esp
80105538:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010553e:	50                   	push   %eax
8010553f:	6a 01                	push   $0x1
80105541:	e8 5a f4 ff ff       	call   801049a0 <argint>
80105546:	83 c4 10             	add    $0x10,%esp
80105549:	85 c0                	test   %eax,%eax
8010554b:	78 6f                	js     801055bc <sys_exec+0xac>
8010554d:	83 ec 04             	sub    $0x4,%esp
80105550:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105556:	31 db                	xor    %ebx,%ebx
80105558:	68 80 00 00 00       	push   $0x80
8010555d:	6a 00                	push   $0x0
8010555f:	56                   	push   %esi
80105560:	e8 8b f1 ff ff       	call   801046f0 <memset>
80105565:	83 c4 10             	add    $0x10,%esp
80105568:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010556f:	00 
80105570:	83 ec 08             	sub    $0x8,%esp
80105573:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80105579:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
80105580:	50                   	push   %eax
80105581:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105587:	01 f8                	add    %edi,%eax
80105589:	50                   	push   %eax
8010558a:	e8 81 f3 ff ff       	call   80104910 <fetchint>
8010558f:	83 c4 10             	add    $0x10,%esp
80105592:	85 c0                	test   %eax,%eax
80105594:	78 26                	js     801055bc <sys_exec+0xac>
80105596:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010559c:	85 c0                	test   %eax,%eax
8010559e:	74 30                	je     801055d0 <sys_exec+0xc0>
801055a0:	83 ec 08             	sub    $0x8,%esp
801055a3:	8d 14 3e             	lea    (%esi,%edi,1),%edx
801055a6:	52                   	push   %edx
801055a7:	50                   	push   %eax
801055a8:	e8 a3 f3 ff ff       	call   80104950 <fetchstr>
801055ad:	83 c4 10             	add    $0x10,%esp
801055b0:	85 c0                	test   %eax,%eax
801055b2:	78 08                	js     801055bc <sys_exec+0xac>
801055b4:	83 c3 01             	add    $0x1,%ebx
801055b7:	83 fb 20             	cmp    $0x20,%ebx
801055ba:	75 b4                	jne    80105570 <sys_exec+0x60>
801055bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055c4:	5b                   	pop    %ebx
801055c5:	5e                   	pop    %esi
801055c6:	5f                   	pop    %edi
801055c7:	5d                   	pop    %ebp
801055c8:	c3                   	ret
801055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055d0:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801055d7:	00 00 00 00 
801055db:	83 ec 08             	sub    $0x8,%esp
801055de:	56                   	push   %esi
801055df:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
801055e5:	e8 c6 b4 ff ff       	call   80100ab0 <exec>
801055ea:	83 c4 10             	add    $0x10,%esp
801055ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055f0:	5b                   	pop    %ebx
801055f1:	5e                   	pop    %esi
801055f2:	5f                   	pop    %edi
801055f3:	5d                   	pop    %ebp
801055f4:	c3                   	ret
801055f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801055fc:	00 
801055fd:	8d 76 00             	lea    0x0(%esi),%esi

80105600 <sys_pipe>:
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	57                   	push   %edi
80105604:	56                   	push   %esi
80105605:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105608:	53                   	push   %ebx
80105609:	83 ec 20             	sub    $0x20,%esp
8010560c:	6a 08                	push   $0x8
8010560e:	50                   	push   %eax
8010560f:	6a 00                	push   $0x0
80105611:	e8 da f3 ff ff       	call   801049f0 <argptr>
80105616:	83 c4 10             	add    $0x10,%esp
80105619:	85 c0                	test   %eax,%eax
8010561b:	0f 88 8b 00 00 00    	js     801056ac <sys_pipe+0xac>
80105621:	83 ec 08             	sub    $0x8,%esp
80105624:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105627:	50                   	push   %eax
80105628:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010562b:	50                   	push   %eax
8010562c:	e8 2f dd ff ff       	call   80103360 <pipealloc>
80105631:	83 c4 10             	add    $0x10,%esp
80105634:	85 c0                	test   %eax,%eax
80105636:	78 74                	js     801056ac <sys_pipe+0xac>
80105638:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010563b:	31 db                	xor    %ebx,%ebx
8010563d:	e8 7e e2 ff ff       	call   801038c0 <myproc>
80105642:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105646:	85 f6                	test   %esi,%esi
80105648:	74 16                	je     80105660 <sys_pipe+0x60>
8010564a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105650:	83 c3 01             	add    $0x1,%ebx
80105653:	83 fb 10             	cmp    $0x10,%ebx
80105656:	74 3d                	je     80105695 <sys_pipe+0x95>
80105658:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010565c:	85 f6                	test   %esi,%esi
8010565e:	75 f0                	jne    80105650 <sys_pipe+0x50>
80105660:	8d 73 08             	lea    0x8(%ebx),%esi
80105663:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105667:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010566a:	e8 51 e2 ff ff       	call   801038c0 <myproc>
8010566f:	31 d2                	xor    %edx,%edx
80105671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105678:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
8010567c:	85 c9                	test   %ecx,%ecx
8010567e:	74 38                	je     801056b8 <sys_pipe+0xb8>
80105680:	83 c2 01             	add    $0x1,%edx
80105683:	83 fa 10             	cmp    $0x10,%edx
80105686:	75 f0                	jne    80105678 <sys_pipe+0x78>
80105688:	e8 33 e2 ff ff       	call   801038c0 <myproc>
8010568d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105694:	00 
80105695:	83 ec 0c             	sub    $0xc,%esp
80105698:	ff 75 e0             	push   -0x20(%ebp)
8010569b:	e8 70 b8 ff ff       	call   80100f10 <fileclose>
801056a0:	58                   	pop    %eax
801056a1:	ff 75 e4             	push   -0x1c(%ebp)
801056a4:	e8 67 b8 ff ff       	call   80100f10 <fileclose>
801056a9:	83 c4 10             	add    $0x10,%esp
801056ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056b1:	eb 16                	jmp    801056c9 <sys_pipe+0xc9>
801056b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801056b8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
801056bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056bf:	89 18                	mov    %ebx,(%eax)
801056c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056c4:	89 50 04             	mov    %edx,0x4(%eax)
801056c7:	31 c0                	xor    %eax,%eax
801056c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056cc:	5b                   	pop    %ebx
801056cd:	5e                   	pop    %esi
801056ce:	5f                   	pop    %edi
801056cf:	5d                   	pop    %ebp
801056d0:	c3                   	ret
801056d1:	66 90                	xchg   %ax,%ax
801056d3:	66 90                	xchg   %ax,%ax
801056d5:	66 90                	xchg   %ax,%ax
801056d7:	66 90                	xchg   %ax,%ax
801056d9:	66 90                	xchg   %ax,%ax
801056db:	66 90                	xchg   %ax,%ax
801056dd:	66 90                	xchg   %ax,%ax
801056df:	90                   	nop

801056e0 <sys_fork>:
801056e0:	e9 7b e3 ff ff       	jmp    80103a60 <fork>
801056e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801056ec:	00 
801056ed:	8d 76 00             	lea    0x0(%esi),%esi

801056f0 <sys_exit>:
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	83 ec 08             	sub    $0x8,%esp
801056f6:	e8 e5 e5 ff ff       	call   80103ce0 <exit>
801056fb:	31 c0                	xor    %eax,%eax
801056fd:	c9                   	leave
801056fe:	c3                   	ret
801056ff:	90                   	nop

80105700 <sys_wait>:
80105700:	e9 0b e7 ff ff       	jmp    80103e10 <wait>
80105705:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010570c:	00 
8010570d:	8d 76 00             	lea    0x0(%esi),%esi

80105710 <sys_kill>:
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	83 ec 20             	sub    $0x20,%esp
80105716:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105719:	50                   	push   %eax
8010571a:	6a 00                	push   $0x0
8010571c:	e8 7f f2 ff ff       	call   801049a0 <argint>
80105721:	83 c4 10             	add    $0x10,%esp
80105724:	85 c0                	test   %eax,%eax
80105726:	78 18                	js     80105740 <sys_kill+0x30>
80105728:	83 ec 0c             	sub    $0xc,%esp
8010572b:	ff 75 f4             	push   -0xc(%ebp)
8010572e:	e8 7d e9 ff ff       	call   801040b0 <kill>
80105733:	83 c4 10             	add    $0x10,%esp
80105736:	c9                   	leave
80105737:	c3                   	ret
80105738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010573f:	00 
80105740:	c9                   	leave
80105741:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105746:	c3                   	ret
80105747:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010574e:	00 
8010574f:	90                   	nop

80105750 <sys_getpid>:
80105750:	55                   	push   %ebp
80105751:	89 e5                	mov    %esp,%ebp
80105753:	83 ec 08             	sub    $0x8,%esp
80105756:	e8 65 e1 ff ff       	call   801038c0 <myproc>
8010575b:	8b 40 10             	mov    0x10(%eax),%eax
8010575e:	c9                   	leave
8010575f:	c3                   	ret

80105760 <sys_sbrk>:
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	53                   	push   %ebx
80105764:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105767:	83 ec 1c             	sub    $0x1c,%esp
8010576a:	50                   	push   %eax
8010576b:	6a 00                	push   $0x0
8010576d:	e8 2e f2 ff ff       	call   801049a0 <argint>
80105772:	83 c4 10             	add    $0x10,%esp
80105775:	85 c0                	test   %eax,%eax
80105777:	78 27                	js     801057a0 <sys_sbrk+0x40>
80105779:	e8 42 e1 ff ff       	call   801038c0 <myproc>
8010577e:	83 ec 0c             	sub    $0xc,%esp
80105781:	8b 18                	mov    (%eax),%ebx
80105783:	ff 75 f4             	push   -0xc(%ebp)
80105786:	e8 55 e2 ff ff       	call   801039e0 <growproc>
8010578b:	83 c4 10             	add    $0x10,%esp
8010578e:	85 c0                	test   %eax,%eax
80105790:	78 0e                	js     801057a0 <sys_sbrk+0x40>
80105792:	89 d8                	mov    %ebx,%eax
80105794:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105797:	c9                   	leave
80105798:	c3                   	ret
80105799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801057a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801057a5:	eb eb                	jmp    80105792 <sys_sbrk+0x32>
801057a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801057ae:	00 
801057af:	90                   	nop

801057b0 <sys_sleep>:
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
801057b3:	53                   	push   %ebx
801057b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057b7:	83 ec 1c             	sub    $0x1c,%esp
801057ba:	50                   	push   %eax
801057bb:	6a 00                	push   $0x0
801057bd:	e8 de f1 ff ff       	call   801049a0 <argint>
801057c2:	83 c4 10             	add    $0x10,%esp
801057c5:	85 c0                	test   %eax,%eax
801057c7:	78 64                	js     8010582d <sys_sleep+0x7d>
801057c9:	83 ec 0c             	sub    $0xc,%esp
801057cc:	68 60 e7 11 80       	push   $0x8011e760
801057d1:	e8 6a ed ff ff       	call   80104540 <acquire>
801057d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057d9:	8b 1d 40 e7 11 80    	mov    0x8011e740,%ebx
801057df:	83 c4 10             	add    $0x10,%esp
801057e2:	85 d2                	test   %edx,%edx
801057e4:	75 2b                	jne    80105811 <sys_sleep+0x61>
801057e6:	eb 58                	jmp    80105840 <sys_sleep+0x90>
801057e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801057ef:	00 
801057f0:	83 ec 08             	sub    $0x8,%esp
801057f3:	68 60 e7 11 80       	push   $0x8011e760
801057f8:	68 40 e7 11 80       	push   $0x8011e740
801057fd:	e8 8e e7 ff ff       	call   80103f90 <sleep>
80105802:	a1 40 e7 11 80       	mov    0x8011e740,%eax
80105807:	83 c4 10             	add    $0x10,%esp
8010580a:	29 d8                	sub    %ebx,%eax
8010580c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010580f:	73 2f                	jae    80105840 <sys_sleep+0x90>
80105811:	e8 aa e0 ff ff       	call   801038c0 <myproc>
80105816:	8b 40 24             	mov    0x24(%eax),%eax
80105819:	85 c0                	test   %eax,%eax
8010581b:	74 d3                	je     801057f0 <sys_sleep+0x40>
8010581d:	83 ec 0c             	sub    $0xc,%esp
80105820:	68 60 e7 11 80       	push   $0x8011e760
80105825:	e8 76 ee ff ff       	call   801046a0 <release>
8010582a:	83 c4 10             	add    $0x10,%esp
8010582d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105835:	c9                   	leave
80105836:	c3                   	ret
80105837:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010583e:	00 
8010583f:	90                   	nop
80105840:	83 ec 0c             	sub    $0xc,%esp
80105843:	68 60 e7 11 80       	push   $0x8011e760
80105848:	e8 53 ee ff ff       	call   801046a0 <release>
8010584d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105850:	83 c4 10             	add    $0x10,%esp
80105853:	31 c0                	xor    %eax,%eax
80105855:	c9                   	leave
80105856:	c3                   	ret
80105857:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010585e:	00 
8010585f:	90                   	nop

80105860 <sys_uptime>:
80105860:	55                   	push   %ebp
80105861:	89 e5                	mov    %esp,%ebp
80105863:	53                   	push   %ebx
80105864:	83 ec 10             	sub    $0x10,%esp
80105867:	68 60 e7 11 80       	push   $0x8011e760
8010586c:	e8 cf ec ff ff       	call   80104540 <acquire>
80105871:	8b 1d 40 e7 11 80    	mov    0x8011e740,%ebx
80105877:	c7 04 24 60 e7 11 80 	movl   $0x8011e760,(%esp)
8010587e:	e8 1d ee ff ff       	call   801046a0 <release>
80105883:	89 d8                	mov    %ebx,%eax
80105885:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105888:	c9                   	leave
80105889:	c3                   	ret
8010588a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105890 <sys_shutdown>:
80105890:	b8 00 20 00 00       	mov    $0x2000,%eax
80105895:	ba 04 b0 ff ff       	mov    $0xffffb004,%edx
8010589a:	66 ef                	out    %ax,(%dx)
8010589c:	ba 04 06 00 00       	mov    $0x604,%edx
801058a1:	66 ef                	out    %ax,(%dx)
801058a3:	31 c0                	xor    %eax,%eax
801058a5:	c3                   	ret
801058a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801058ad:	00 
801058ae:	66 90                	xchg   %ax,%ax

801058b0 <sys_cps>:
801058b0:	e9 3b e9 ff ff       	jmp    801041f0 <cps>
801058b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801058bc:	00 
801058bd:	8d 76 00             	lea    0x0(%esi),%esi

801058c0 <sys_chpr>:
801058c0:	55                   	push   %ebp
801058c1:	89 e5                	mov    %esp,%ebp
801058c3:	83 ec 20             	sub    $0x20,%esp
801058c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
801058c9:	50                   	push   %eax
801058ca:	6a 00                	push   $0x0
801058cc:	e8 cf f0 ff ff       	call   801049a0 <argint>
801058d1:	83 c4 10             	add    $0x10,%esp
801058d4:	85 c0                	test   %eax,%eax
801058d6:	78 28                	js     80105900 <sys_chpr+0x40>
801058d8:	83 ec 08             	sub    $0x8,%esp
801058db:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058de:	50                   	push   %eax
801058df:	6a 01                	push   $0x1
801058e1:	e8 ba f0 ff ff       	call   801049a0 <argint>
801058e6:	83 c4 10             	add    $0x10,%esp
801058e9:	85 c0                	test   %eax,%eax
801058eb:	78 13                	js     80105900 <sys_chpr+0x40>
801058ed:	83 ec 08             	sub    $0x8,%esp
801058f0:	ff 75 f4             	push   -0xc(%ebp)
801058f3:	ff 75 f0             	push   -0x10(%ebp)
801058f6:	e8 b5 e9 ff ff       	call   801042b0 <chpr>
801058fb:	83 c4 10             	add    $0x10,%esp
801058fe:	c9                   	leave
801058ff:	c3                   	ret
80105900:	c9                   	leave
80105901:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105906:	c3                   	ret

80105907 <alltraps>:
80105907:	1e                   	push   %ds
80105908:	06                   	push   %es
80105909:	0f a0                	push   %fs
8010590b:	0f a8                	push   %gs
8010590d:	60                   	pusha
8010590e:	66 b8 10 00          	mov    $0x10,%ax
80105912:	8e d8                	mov    %eax,%ds
80105914:	8e c0                	mov    %eax,%es
80105916:	54                   	push   %esp
80105917:	e8 c4 00 00 00       	call   801059e0 <trap>
8010591c:	83 c4 04             	add    $0x4,%esp

8010591f <trapret>:
8010591f:	61                   	popa
80105920:	0f a9                	pop    %gs
80105922:	0f a1                	pop    %fs
80105924:	07                   	pop    %es
80105925:	1f                   	pop    %ds
80105926:	83 c4 08             	add    $0x8,%esp
80105929:	cf                   	iret
8010592a:	66 90                	xchg   %ax,%ax
8010592c:	66 90                	xchg   %ax,%ax
8010592e:	66 90                	xchg   %ax,%ax

80105930 <tvinit>:
80105930:	55                   	push   %ebp
80105931:	31 c0                	xor    %eax,%eax
80105933:	89 e5                	mov    %esp,%ebp
80105935:	83 ec 08             	sub    $0x8,%esp
80105938:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010593f:	00 
80105940:	8b 14 85 08 90 10 80 	mov    -0x7fef6ff8(,%eax,4),%edx
80105947:	c7 04 c5 a2 e7 11 80 	movl   $0x8e000008,-0x7fee185e(,%eax,8)
8010594e:	08 00 00 8e 
80105952:	66 89 14 c5 a0 e7 11 	mov    %dx,-0x7fee1860(,%eax,8)
80105959:	80 
8010595a:	c1 ea 10             	shr    $0x10,%edx
8010595d:	66 89 14 c5 a6 e7 11 	mov    %dx,-0x7fee185a(,%eax,8)
80105964:	80 
80105965:	83 c0 01             	add    $0x1,%eax
80105968:	3d 00 01 00 00       	cmp    $0x100,%eax
8010596d:	75 d1                	jne    80105940 <tvinit+0x10>
8010596f:	83 ec 08             	sub    $0x8,%esp
80105972:	a1 08 91 10 80       	mov    0x80109108,%eax
80105977:	c7 05 a2 e9 11 80 08 	movl   $0xef000008,0x8011e9a2
8010597e:	00 00 ef 
80105981:	68 e5 77 10 80       	push   $0x801077e5
80105986:	68 60 e7 11 80       	push   $0x8011e760
8010598b:	66 a3 a0 e9 11 80    	mov    %ax,0x8011e9a0
80105991:	c1 e8 10             	shr    $0x10,%eax
80105994:	66 a3 a6 e9 11 80    	mov    %ax,0x8011e9a6
8010599a:	e8 71 ea ff ff       	call   80104410 <initlock>
8010599f:	83 c4 10             	add    $0x10,%esp
801059a2:	c9                   	leave
801059a3:	c3                   	ret
801059a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801059ab:	00 
801059ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801059b0 <idtinit>:
801059b0:	55                   	push   %ebp
801059b1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801059b6:	89 e5                	mov    %esp,%ebp
801059b8:	83 ec 10             	sub    $0x10,%esp
801059bb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
801059bf:	b8 a0 e7 11 80       	mov    $0x8011e7a0,%eax
801059c4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801059c8:	c1 e8 10             	shr    $0x10,%eax
801059cb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801059cf:	8d 45 fa             	lea    -0x6(%ebp),%eax
801059d2:	0f 01 18             	lidtl  (%eax)
801059d5:	c9                   	leave
801059d6:	c3                   	ret
801059d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801059de:	00 
801059df:	90                   	nop

801059e0 <trap>:
801059e0:	55                   	push   %ebp
801059e1:	89 e5                	mov    %esp,%ebp
801059e3:	57                   	push   %edi
801059e4:	56                   	push   %esi
801059e5:	53                   	push   %ebx
801059e6:	83 ec 1c             	sub    $0x1c,%esp
801059e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801059ec:	8b 43 30             	mov    0x30(%ebx),%eax
801059ef:	83 f8 40             	cmp    $0x40,%eax
801059f2:	0f 84 58 01 00 00    	je     80105b50 <trap+0x170>
801059f8:	83 e8 20             	sub    $0x20,%eax
801059fb:	83 f8 1f             	cmp    $0x1f,%eax
801059fe:	0f 87 7c 00 00 00    	ja     80105a80 <trap+0xa0>
80105a04:	ff 24 85 8c 78 10 80 	jmp    *-0x7fef8774(,%eax,4)
80105a0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105a10:	e8 3b c8 ff ff       	call   80102250 <ideintr>
80105a15:	e8 26 ce ff ff       	call   80102840 <lapiceoi>
80105a1a:	e8 a1 de ff ff       	call   801038c0 <myproc>
80105a1f:	85 c0                	test   %eax,%eax
80105a21:	74 1a                	je     80105a3d <trap+0x5d>
80105a23:	e8 98 de ff ff       	call   801038c0 <myproc>
80105a28:	8b 50 24             	mov    0x24(%eax),%edx
80105a2b:	85 d2                	test   %edx,%edx
80105a2d:	74 0e                	je     80105a3d <trap+0x5d>
80105a2f:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105a33:	f7 d0                	not    %eax
80105a35:	a8 03                	test   $0x3,%al
80105a37:	0f 84 db 01 00 00    	je     80105c18 <trap+0x238>
80105a3d:	e8 7e de ff ff       	call   801038c0 <myproc>
80105a42:	85 c0                	test   %eax,%eax
80105a44:	74 0f                	je     80105a55 <trap+0x75>
80105a46:	e8 75 de ff ff       	call   801038c0 <myproc>
80105a4b:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a4f:	0f 84 ab 00 00 00    	je     80105b00 <trap+0x120>
80105a55:	e8 66 de ff ff       	call   801038c0 <myproc>
80105a5a:	85 c0                	test   %eax,%eax
80105a5c:	74 1a                	je     80105a78 <trap+0x98>
80105a5e:	e8 5d de ff ff       	call   801038c0 <myproc>
80105a63:	8b 40 24             	mov    0x24(%eax),%eax
80105a66:	85 c0                	test   %eax,%eax
80105a68:	74 0e                	je     80105a78 <trap+0x98>
80105a6a:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105a6e:	f7 d0                	not    %eax
80105a70:	a8 03                	test   $0x3,%al
80105a72:	0f 84 05 01 00 00    	je     80105b7d <trap+0x19d>
80105a78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a7b:	5b                   	pop    %ebx
80105a7c:	5e                   	pop    %esi
80105a7d:	5f                   	pop    %edi
80105a7e:	5d                   	pop    %ebp
80105a7f:	c3                   	ret
80105a80:	e8 3b de ff ff       	call   801038c0 <myproc>
80105a85:	8b 7b 38             	mov    0x38(%ebx),%edi
80105a88:	85 c0                	test   %eax,%eax
80105a8a:	0f 84 a2 01 00 00    	je     80105c32 <trap+0x252>
80105a90:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105a94:	0f 84 98 01 00 00    	je     80105c32 <trap+0x252>
80105a9a:	0f 20 d1             	mov    %cr2,%ecx
80105a9d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105aa0:	e8 fb dd ff ff       	call   801038a0 <cpuid>
80105aa5:	8b 73 30             	mov    0x30(%ebx),%esi
80105aa8:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105aab:	8b 43 34             	mov    0x34(%ebx),%eax
80105aae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105ab1:	e8 0a de ff ff       	call   801038c0 <myproc>
80105ab6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105ab9:	e8 02 de ff ff       	call   801038c0 <myproc>
80105abe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105ac1:	51                   	push   %ecx
80105ac2:	57                   	push   %edi
80105ac3:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105ac6:	52                   	push   %edx
80105ac7:	ff 75 e4             	push   -0x1c(%ebp)
80105aca:	56                   	push   %esi
80105acb:	8b 75 e0             	mov    -0x20(%ebp),%esi
80105ace:	83 c6 6c             	add    $0x6c,%esi
80105ad1:	56                   	push   %esi
80105ad2:	ff 70 10             	push   0x10(%eax)
80105ad5:	68 48 78 10 80       	push   $0x80107848
80105ada:	e8 d1 ab ff ff       	call   801006b0 <cprintf>
80105adf:	83 c4 20             	add    $0x20,%esp
80105ae2:	e8 d9 dd ff ff       	call   801038c0 <myproc>
80105ae7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105aee:	e8 cd dd ff ff       	call   801038c0 <myproc>
80105af3:	85 c0                	test   %eax,%eax
80105af5:	0f 85 28 ff ff ff    	jne    80105a23 <trap+0x43>
80105afb:	e9 3d ff ff ff       	jmp    80105a3d <trap+0x5d>
80105b00:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105b04:	0f 85 4b ff ff ff    	jne    80105a55 <trap+0x75>
80105b0a:	e8 31 e4 ff ff       	call   80103f40 <yield>
80105b0f:	e9 41 ff ff ff       	jmp    80105a55 <trap+0x75>
80105b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b18:	8b 7b 38             	mov    0x38(%ebx),%edi
80105b1b:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105b1f:	e8 7c dd ff ff       	call   801038a0 <cpuid>
80105b24:	57                   	push   %edi
80105b25:	56                   	push   %esi
80105b26:	50                   	push   %eax
80105b27:	68 f0 77 10 80       	push   $0x801077f0
80105b2c:	e8 7f ab ff ff       	call   801006b0 <cprintf>
80105b31:	e8 0a cd ff ff       	call   80102840 <lapiceoi>
80105b36:	83 c4 10             	add    $0x10,%esp
80105b39:	e8 82 dd ff ff       	call   801038c0 <myproc>
80105b3e:	85 c0                	test   %eax,%eax
80105b40:	0f 85 dd fe ff ff    	jne    80105a23 <trap+0x43>
80105b46:	e9 f2 fe ff ff       	jmp    80105a3d <trap+0x5d>
80105b4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105b50:	e8 6b dd ff ff       	call   801038c0 <myproc>
80105b55:	8b 70 24             	mov    0x24(%eax),%esi
80105b58:	85 f6                	test   %esi,%esi
80105b5a:	0f 85 c8 00 00 00    	jne    80105c28 <trap+0x248>
80105b60:	e8 5b dd ff ff       	call   801038c0 <myproc>
80105b65:	89 58 18             	mov    %ebx,0x18(%eax)
80105b68:	e8 73 ef ff ff       	call   80104ae0 <syscall>
80105b6d:	e8 4e dd ff ff       	call   801038c0 <myproc>
80105b72:	8b 48 24             	mov    0x24(%eax),%ecx
80105b75:	85 c9                	test   %ecx,%ecx
80105b77:	0f 84 fb fe ff ff    	je     80105a78 <trap+0x98>
80105b7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b80:	5b                   	pop    %ebx
80105b81:	5e                   	pop    %esi
80105b82:	5f                   	pop    %edi
80105b83:	5d                   	pop    %ebp
80105b84:	e9 57 e1 ff ff       	jmp    80103ce0 <exit>
80105b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b90:	e8 4b 02 00 00       	call   80105de0 <uartintr>
80105b95:	e8 a6 cc ff ff       	call   80102840 <lapiceoi>
80105b9a:	e8 21 dd ff ff       	call   801038c0 <myproc>
80105b9f:	85 c0                	test   %eax,%eax
80105ba1:	0f 85 7c fe ff ff    	jne    80105a23 <trap+0x43>
80105ba7:	e9 91 fe ff ff       	jmp    80105a3d <trap+0x5d>
80105bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bb0:	e8 5b cb ff ff       	call   80102710 <kbdintr>
80105bb5:	e8 86 cc ff ff       	call   80102840 <lapiceoi>
80105bba:	e8 01 dd ff ff       	call   801038c0 <myproc>
80105bbf:	85 c0                	test   %eax,%eax
80105bc1:	0f 85 5c fe ff ff    	jne    80105a23 <trap+0x43>
80105bc7:	e9 71 fe ff ff       	jmp    80105a3d <trap+0x5d>
80105bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bd0:	e8 cb dc ff ff       	call   801038a0 <cpuid>
80105bd5:	85 c0                	test   %eax,%eax
80105bd7:	0f 85 38 fe ff ff    	jne    80105a15 <trap+0x35>
80105bdd:	83 ec 0c             	sub    $0xc,%esp
80105be0:	68 60 e7 11 80       	push   $0x8011e760
80105be5:	e8 56 e9 ff ff       	call   80104540 <acquire>
80105bea:	83 05 40 e7 11 80 01 	addl   $0x1,0x8011e740
80105bf1:	c7 04 24 40 e7 11 80 	movl   $0x8011e740,(%esp)
80105bf8:	e8 53 e4 ff ff       	call   80104050 <wakeup>
80105bfd:	c7 04 24 60 e7 11 80 	movl   $0x8011e760,(%esp)
80105c04:	e8 97 ea ff ff       	call   801046a0 <release>
80105c09:	83 c4 10             	add    $0x10,%esp
80105c0c:	e9 04 fe ff ff       	jmp    80105a15 <trap+0x35>
80105c11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c18:	e8 c3 e0 ff ff       	call   80103ce0 <exit>
80105c1d:	e9 1b fe ff ff       	jmp    80105a3d <trap+0x5d>
80105c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c28:	e8 b3 e0 ff ff       	call   80103ce0 <exit>
80105c2d:	e9 2e ff ff ff       	jmp    80105b60 <trap+0x180>
80105c32:	0f 20 d6             	mov    %cr2,%esi
80105c35:	e8 66 dc ff ff       	call   801038a0 <cpuid>
80105c3a:	83 ec 0c             	sub    $0xc,%esp
80105c3d:	56                   	push   %esi
80105c3e:	57                   	push   %edi
80105c3f:	50                   	push   %eax
80105c40:	ff 73 30             	push   0x30(%ebx)
80105c43:	68 14 78 10 80       	push   $0x80107814
80105c48:	e8 63 aa ff ff       	call   801006b0 <cprintf>
80105c4d:	83 c4 14             	add    $0x14,%esp
80105c50:	68 ea 77 10 80       	push   $0x801077ea
80105c55:	e8 26 a7 ff ff       	call   80100380 <panic>
80105c5a:	66 90                	xchg   %ax,%ax
80105c5c:	66 90                	xchg   %ax,%ax
80105c5e:	66 90                	xchg   %ax,%ax

80105c60 <uartgetc>:
80105c60:	a1 a0 ef 11 80       	mov    0x8011efa0,%eax
80105c65:	85 c0                	test   %eax,%eax
80105c67:	74 17                	je     80105c80 <uartgetc+0x20>
80105c69:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c6e:	ec                   	in     (%dx),%al
80105c6f:	a8 01                	test   $0x1,%al
80105c71:	74 0d                	je     80105c80 <uartgetc+0x20>
80105c73:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c78:	ec                   	in     (%dx),%al
80105c79:	0f b6 c0             	movzbl %al,%eax
80105c7c:	c3                   	ret
80105c7d:	8d 76 00             	lea    0x0(%esi),%esi
80105c80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c85:	c3                   	ret
80105c86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105c8d:	00 
80105c8e:	66 90                	xchg   %ax,%ax

80105c90 <uartinit>:
80105c90:	55                   	push   %ebp
80105c91:	31 c9                	xor    %ecx,%ecx
80105c93:	89 c8                	mov    %ecx,%eax
80105c95:	89 e5                	mov    %esp,%ebp
80105c97:	57                   	push   %edi
80105c98:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105c9d:	56                   	push   %esi
80105c9e:	89 fa                	mov    %edi,%edx
80105ca0:	53                   	push   %ebx
80105ca1:	83 ec 1c             	sub    $0x1c,%esp
80105ca4:	ee                   	out    %al,(%dx)
80105ca5:	be fb 03 00 00       	mov    $0x3fb,%esi
80105caa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105caf:	89 f2                	mov    %esi,%edx
80105cb1:	ee                   	out    %al,(%dx)
80105cb2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105cb7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cbc:	ee                   	out    %al,(%dx)
80105cbd:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105cc2:	89 c8                	mov    %ecx,%eax
80105cc4:	89 da                	mov    %ebx,%edx
80105cc6:	ee                   	out    %al,(%dx)
80105cc7:	b8 03 00 00 00       	mov    $0x3,%eax
80105ccc:	89 f2                	mov    %esi,%edx
80105cce:	ee                   	out    %al,(%dx)
80105ccf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105cd4:	89 c8                	mov    %ecx,%eax
80105cd6:	ee                   	out    %al,(%dx)
80105cd7:	b8 01 00 00 00       	mov    $0x1,%eax
80105cdc:	89 da                	mov    %ebx,%edx
80105cde:	ee                   	out    %al,(%dx)
80105cdf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ce4:	ec                   	in     (%dx),%al
80105ce5:	3c ff                	cmp    $0xff,%al
80105ce7:	0f 84 7c 00 00 00    	je     80105d69 <uartinit+0xd9>
80105ced:	c7 05 a0 ef 11 80 01 	movl   $0x1,0x8011efa0
80105cf4:	00 00 00 
80105cf7:	89 fa                	mov    %edi,%edx
80105cf9:	ec                   	in     (%dx),%al
80105cfa:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cff:	ec                   	in     (%dx),%al
80105d00:	83 ec 08             	sub    $0x8,%esp
80105d03:	bf 0c 79 10 80       	mov    $0x8010790c,%edi
80105d08:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d0d:	6a 00                	push   $0x0
80105d0f:	6a 04                	push   $0x4
80105d11:	e8 6a c7 ff ff       	call   80102480 <ioapicenable>
80105d16:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
80105d1a:	83 c4 10             	add    $0x10,%esp
80105d1d:	8d 76 00             	lea    0x0(%esi),%esi
80105d20:	a1 a0 ef 11 80       	mov    0x8011efa0,%eax
80105d25:	85 c0                	test   %eax,%eax
80105d27:	74 32                	je     80105d5b <uartinit+0xcb>
80105d29:	89 f2                	mov    %esi,%edx
80105d2b:	ec                   	in     (%dx),%al
80105d2c:	a8 20                	test   $0x20,%al
80105d2e:	75 21                	jne    80105d51 <uartinit+0xc1>
80105d30:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d35:	8d 76 00             	lea    0x0(%esi),%esi
80105d38:	83 ec 0c             	sub    $0xc,%esp
80105d3b:	6a 0a                	push   $0xa
80105d3d:	e8 1e cb ff ff       	call   80102860 <microdelay>
80105d42:	83 c4 10             	add    $0x10,%esp
80105d45:	83 eb 01             	sub    $0x1,%ebx
80105d48:	74 07                	je     80105d51 <uartinit+0xc1>
80105d4a:	89 f2                	mov    %esi,%edx
80105d4c:	ec                   	in     (%dx),%al
80105d4d:	a8 20                	test   $0x20,%al
80105d4f:	74 e7                	je     80105d38 <uartinit+0xa8>
80105d51:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d56:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
80105d5a:	ee                   	out    %al,(%dx)
80105d5b:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80105d5f:	83 c7 01             	add    $0x1,%edi
80105d62:	88 45 e7             	mov    %al,-0x19(%ebp)
80105d65:	84 c0                	test   %al,%al
80105d67:	75 b7                	jne    80105d20 <uartinit+0x90>
80105d69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d6c:	5b                   	pop    %ebx
80105d6d:	5e                   	pop    %esi
80105d6e:	5f                   	pop    %edi
80105d6f:	5d                   	pop    %ebp
80105d70:	c3                   	ret
80105d71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105d78:	00 
80105d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d80 <uartputc>:
80105d80:	a1 a0 ef 11 80       	mov    0x8011efa0,%eax
80105d85:	85 c0                	test   %eax,%eax
80105d87:	74 4f                	je     80105dd8 <uartputc+0x58>
80105d89:	55                   	push   %ebp
80105d8a:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d8f:	89 e5                	mov    %esp,%ebp
80105d91:	56                   	push   %esi
80105d92:	53                   	push   %ebx
80105d93:	ec                   	in     (%dx),%al
80105d94:	a8 20                	test   $0x20,%al
80105d96:	75 29                	jne    80105dc1 <uartputc+0x41>
80105d98:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d9d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105da8:	83 ec 0c             	sub    $0xc,%esp
80105dab:	6a 0a                	push   $0xa
80105dad:	e8 ae ca ff ff       	call   80102860 <microdelay>
80105db2:	83 c4 10             	add    $0x10,%esp
80105db5:	83 eb 01             	sub    $0x1,%ebx
80105db8:	74 07                	je     80105dc1 <uartputc+0x41>
80105dba:	89 f2                	mov    %esi,%edx
80105dbc:	ec                   	in     (%dx),%al
80105dbd:	a8 20                	test   $0x20,%al
80105dbf:	74 e7                	je     80105da8 <uartputc+0x28>
80105dc1:	8b 45 08             	mov    0x8(%ebp),%eax
80105dc4:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dc9:	ee                   	out    %al,(%dx)
80105dca:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105dcd:	5b                   	pop    %ebx
80105dce:	5e                   	pop    %esi
80105dcf:	5d                   	pop    %ebp
80105dd0:	c3                   	ret
80105dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105dd8:	c3                   	ret
80105dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105de0 <uartintr>:
80105de0:	55                   	push   %ebp
80105de1:	89 e5                	mov    %esp,%ebp
80105de3:	83 ec 14             	sub    $0x14,%esp
80105de6:	68 60 5c 10 80       	push   $0x80105c60
80105deb:	e8 b0 aa ff ff       	call   801008a0 <consoleintr>
80105df0:	83 c4 10             	add    $0x10,%esp
80105df3:	c9                   	leave
80105df4:	c3                   	ret

80105df5 <vector0>:
80105df5:	6a 00                	push   $0x0
80105df7:	6a 00                	push   $0x0
80105df9:	e9 09 fb ff ff       	jmp    80105907 <alltraps>

80105dfe <vector1>:
80105dfe:	6a 00                	push   $0x0
80105e00:	6a 01                	push   $0x1
80105e02:	e9 00 fb ff ff       	jmp    80105907 <alltraps>

80105e07 <vector2>:
80105e07:	6a 00                	push   $0x0
80105e09:	6a 02                	push   $0x2
80105e0b:	e9 f7 fa ff ff       	jmp    80105907 <alltraps>

80105e10 <vector3>:
80105e10:	6a 00                	push   $0x0
80105e12:	6a 03                	push   $0x3
80105e14:	e9 ee fa ff ff       	jmp    80105907 <alltraps>

80105e19 <vector4>:
80105e19:	6a 00                	push   $0x0
80105e1b:	6a 04                	push   $0x4
80105e1d:	e9 e5 fa ff ff       	jmp    80105907 <alltraps>

80105e22 <vector5>:
80105e22:	6a 00                	push   $0x0
80105e24:	6a 05                	push   $0x5
80105e26:	e9 dc fa ff ff       	jmp    80105907 <alltraps>

80105e2b <vector6>:
80105e2b:	6a 00                	push   $0x0
80105e2d:	6a 06                	push   $0x6
80105e2f:	e9 d3 fa ff ff       	jmp    80105907 <alltraps>

80105e34 <vector7>:
80105e34:	6a 00                	push   $0x0
80105e36:	6a 07                	push   $0x7
80105e38:	e9 ca fa ff ff       	jmp    80105907 <alltraps>

80105e3d <vector8>:
80105e3d:	6a 08                	push   $0x8
80105e3f:	e9 c3 fa ff ff       	jmp    80105907 <alltraps>

80105e44 <vector9>:
80105e44:	6a 00                	push   $0x0
80105e46:	6a 09                	push   $0x9
80105e48:	e9 ba fa ff ff       	jmp    80105907 <alltraps>

80105e4d <vector10>:
80105e4d:	6a 0a                	push   $0xa
80105e4f:	e9 b3 fa ff ff       	jmp    80105907 <alltraps>

80105e54 <vector11>:
80105e54:	6a 0b                	push   $0xb
80105e56:	e9 ac fa ff ff       	jmp    80105907 <alltraps>

80105e5b <vector12>:
80105e5b:	6a 0c                	push   $0xc
80105e5d:	e9 a5 fa ff ff       	jmp    80105907 <alltraps>

80105e62 <vector13>:
80105e62:	6a 0d                	push   $0xd
80105e64:	e9 9e fa ff ff       	jmp    80105907 <alltraps>

80105e69 <vector14>:
80105e69:	6a 0e                	push   $0xe
80105e6b:	e9 97 fa ff ff       	jmp    80105907 <alltraps>

80105e70 <vector15>:
80105e70:	6a 00                	push   $0x0
80105e72:	6a 0f                	push   $0xf
80105e74:	e9 8e fa ff ff       	jmp    80105907 <alltraps>

80105e79 <vector16>:
80105e79:	6a 00                	push   $0x0
80105e7b:	6a 10                	push   $0x10
80105e7d:	e9 85 fa ff ff       	jmp    80105907 <alltraps>

80105e82 <vector17>:
80105e82:	6a 11                	push   $0x11
80105e84:	e9 7e fa ff ff       	jmp    80105907 <alltraps>

80105e89 <vector18>:
80105e89:	6a 00                	push   $0x0
80105e8b:	6a 12                	push   $0x12
80105e8d:	e9 75 fa ff ff       	jmp    80105907 <alltraps>

80105e92 <vector19>:
80105e92:	6a 00                	push   $0x0
80105e94:	6a 13                	push   $0x13
80105e96:	e9 6c fa ff ff       	jmp    80105907 <alltraps>

80105e9b <vector20>:
80105e9b:	6a 00                	push   $0x0
80105e9d:	6a 14                	push   $0x14
80105e9f:	e9 63 fa ff ff       	jmp    80105907 <alltraps>

80105ea4 <vector21>:
80105ea4:	6a 00                	push   $0x0
80105ea6:	6a 15                	push   $0x15
80105ea8:	e9 5a fa ff ff       	jmp    80105907 <alltraps>

80105ead <vector22>:
80105ead:	6a 00                	push   $0x0
80105eaf:	6a 16                	push   $0x16
80105eb1:	e9 51 fa ff ff       	jmp    80105907 <alltraps>

80105eb6 <vector23>:
80105eb6:	6a 00                	push   $0x0
80105eb8:	6a 17                	push   $0x17
80105eba:	e9 48 fa ff ff       	jmp    80105907 <alltraps>

80105ebf <vector24>:
80105ebf:	6a 00                	push   $0x0
80105ec1:	6a 18                	push   $0x18
80105ec3:	e9 3f fa ff ff       	jmp    80105907 <alltraps>

80105ec8 <vector25>:
80105ec8:	6a 00                	push   $0x0
80105eca:	6a 19                	push   $0x19
80105ecc:	e9 36 fa ff ff       	jmp    80105907 <alltraps>

80105ed1 <vector26>:
80105ed1:	6a 00                	push   $0x0
80105ed3:	6a 1a                	push   $0x1a
80105ed5:	e9 2d fa ff ff       	jmp    80105907 <alltraps>

80105eda <vector27>:
80105eda:	6a 00                	push   $0x0
80105edc:	6a 1b                	push   $0x1b
80105ede:	e9 24 fa ff ff       	jmp    80105907 <alltraps>

80105ee3 <vector28>:
80105ee3:	6a 00                	push   $0x0
80105ee5:	6a 1c                	push   $0x1c
80105ee7:	e9 1b fa ff ff       	jmp    80105907 <alltraps>

80105eec <vector29>:
80105eec:	6a 00                	push   $0x0
80105eee:	6a 1d                	push   $0x1d
80105ef0:	e9 12 fa ff ff       	jmp    80105907 <alltraps>

80105ef5 <vector30>:
80105ef5:	6a 00                	push   $0x0
80105ef7:	6a 1e                	push   $0x1e
80105ef9:	e9 09 fa ff ff       	jmp    80105907 <alltraps>

80105efe <vector31>:
80105efe:	6a 00                	push   $0x0
80105f00:	6a 1f                	push   $0x1f
80105f02:	e9 00 fa ff ff       	jmp    80105907 <alltraps>

80105f07 <vector32>:
80105f07:	6a 00                	push   $0x0
80105f09:	6a 20                	push   $0x20
80105f0b:	e9 f7 f9 ff ff       	jmp    80105907 <alltraps>

80105f10 <vector33>:
80105f10:	6a 00                	push   $0x0
80105f12:	6a 21                	push   $0x21
80105f14:	e9 ee f9 ff ff       	jmp    80105907 <alltraps>

80105f19 <vector34>:
80105f19:	6a 00                	push   $0x0
80105f1b:	6a 22                	push   $0x22
80105f1d:	e9 e5 f9 ff ff       	jmp    80105907 <alltraps>

80105f22 <vector35>:
80105f22:	6a 00                	push   $0x0
80105f24:	6a 23                	push   $0x23
80105f26:	e9 dc f9 ff ff       	jmp    80105907 <alltraps>

80105f2b <vector36>:
80105f2b:	6a 00                	push   $0x0
80105f2d:	6a 24                	push   $0x24
80105f2f:	e9 d3 f9 ff ff       	jmp    80105907 <alltraps>

80105f34 <vector37>:
80105f34:	6a 00                	push   $0x0
80105f36:	6a 25                	push   $0x25
80105f38:	e9 ca f9 ff ff       	jmp    80105907 <alltraps>

80105f3d <vector38>:
80105f3d:	6a 00                	push   $0x0
80105f3f:	6a 26                	push   $0x26
80105f41:	e9 c1 f9 ff ff       	jmp    80105907 <alltraps>

80105f46 <vector39>:
80105f46:	6a 00                	push   $0x0
80105f48:	6a 27                	push   $0x27
80105f4a:	e9 b8 f9 ff ff       	jmp    80105907 <alltraps>

80105f4f <vector40>:
80105f4f:	6a 00                	push   $0x0
80105f51:	6a 28                	push   $0x28
80105f53:	e9 af f9 ff ff       	jmp    80105907 <alltraps>

80105f58 <vector41>:
80105f58:	6a 00                	push   $0x0
80105f5a:	6a 29                	push   $0x29
80105f5c:	e9 a6 f9 ff ff       	jmp    80105907 <alltraps>

80105f61 <vector42>:
80105f61:	6a 00                	push   $0x0
80105f63:	6a 2a                	push   $0x2a
80105f65:	e9 9d f9 ff ff       	jmp    80105907 <alltraps>

80105f6a <vector43>:
80105f6a:	6a 00                	push   $0x0
80105f6c:	6a 2b                	push   $0x2b
80105f6e:	e9 94 f9 ff ff       	jmp    80105907 <alltraps>

80105f73 <vector44>:
80105f73:	6a 00                	push   $0x0
80105f75:	6a 2c                	push   $0x2c
80105f77:	e9 8b f9 ff ff       	jmp    80105907 <alltraps>

80105f7c <vector45>:
80105f7c:	6a 00                	push   $0x0
80105f7e:	6a 2d                	push   $0x2d
80105f80:	e9 82 f9 ff ff       	jmp    80105907 <alltraps>

80105f85 <vector46>:
80105f85:	6a 00                	push   $0x0
80105f87:	6a 2e                	push   $0x2e
80105f89:	e9 79 f9 ff ff       	jmp    80105907 <alltraps>

80105f8e <vector47>:
80105f8e:	6a 00                	push   $0x0
80105f90:	6a 2f                	push   $0x2f
80105f92:	e9 70 f9 ff ff       	jmp    80105907 <alltraps>

80105f97 <vector48>:
80105f97:	6a 00                	push   $0x0
80105f99:	6a 30                	push   $0x30
80105f9b:	e9 67 f9 ff ff       	jmp    80105907 <alltraps>

80105fa0 <vector49>:
80105fa0:	6a 00                	push   $0x0
80105fa2:	6a 31                	push   $0x31
80105fa4:	e9 5e f9 ff ff       	jmp    80105907 <alltraps>

80105fa9 <vector50>:
80105fa9:	6a 00                	push   $0x0
80105fab:	6a 32                	push   $0x32
80105fad:	e9 55 f9 ff ff       	jmp    80105907 <alltraps>

80105fb2 <vector51>:
80105fb2:	6a 00                	push   $0x0
80105fb4:	6a 33                	push   $0x33
80105fb6:	e9 4c f9 ff ff       	jmp    80105907 <alltraps>

80105fbb <vector52>:
80105fbb:	6a 00                	push   $0x0
80105fbd:	6a 34                	push   $0x34
80105fbf:	e9 43 f9 ff ff       	jmp    80105907 <alltraps>

80105fc4 <vector53>:
80105fc4:	6a 00                	push   $0x0
80105fc6:	6a 35                	push   $0x35
80105fc8:	e9 3a f9 ff ff       	jmp    80105907 <alltraps>

80105fcd <vector54>:
80105fcd:	6a 00                	push   $0x0
80105fcf:	6a 36                	push   $0x36
80105fd1:	e9 31 f9 ff ff       	jmp    80105907 <alltraps>

80105fd6 <vector55>:
80105fd6:	6a 00                	push   $0x0
80105fd8:	6a 37                	push   $0x37
80105fda:	e9 28 f9 ff ff       	jmp    80105907 <alltraps>

80105fdf <vector56>:
80105fdf:	6a 00                	push   $0x0
80105fe1:	6a 38                	push   $0x38
80105fe3:	e9 1f f9 ff ff       	jmp    80105907 <alltraps>

80105fe8 <vector57>:
80105fe8:	6a 00                	push   $0x0
80105fea:	6a 39                	push   $0x39
80105fec:	e9 16 f9 ff ff       	jmp    80105907 <alltraps>

80105ff1 <vector58>:
80105ff1:	6a 00                	push   $0x0
80105ff3:	6a 3a                	push   $0x3a
80105ff5:	e9 0d f9 ff ff       	jmp    80105907 <alltraps>

80105ffa <vector59>:
80105ffa:	6a 00                	push   $0x0
80105ffc:	6a 3b                	push   $0x3b
80105ffe:	e9 04 f9 ff ff       	jmp    80105907 <alltraps>

80106003 <vector60>:
80106003:	6a 00                	push   $0x0
80106005:	6a 3c                	push   $0x3c
80106007:	e9 fb f8 ff ff       	jmp    80105907 <alltraps>

8010600c <vector61>:
8010600c:	6a 00                	push   $0x0
8010600e:	6a 3d                	push   $0x3d
80106010:	e9 f2 f8 ff ff       	jmp    80105907 <alltraps>

80106015 <vector62>:
80106015:	6a 00                	push   $0x0
80106017:	6a 3e                	push   $0x3e
80106019:	e9 e9 f8 ff ff       	jmp    80105907 <alltraps>

8010601e <vector63>:
8010601e:	6a 00                	push   $0x0
80106020:	6a 3f                	push   $0x3f
80106022:	e9 e0 f8 ff ff       	jmp    80105907 <alltraps>

80106027 <vector64>:
80106027:	6a 00                	push   $0x0
80106029:	6a 40                	push   $0x40
8010602b:	e9 d7 f8 ff ff       	jmp    80105907 <alltraps>

80106030 <vector65>:
80106030:	6a 00                	push   $0x0
80106032:	6a 41                	push   $0x41
80106034:	e9 ce f8 ff ff       	jmp    80105907 <alltraps>

80106039 <vector66>:
80106039:	6a 00                	push   $0x0
8010603b:	6a 42                	push   $0x42
8010603d:	e9 c5 f8 ff ff       	jmp    80105907 <alltraps>

80106042 <vector67>:
80106042:	6a 00                	push   $0x0
80106044:	6a 43                	push   $0x43
80106046:	e9 bc f8 ff ff       	jmp    80105907 <alltraps>

8010604b <vector68>:
8010604b:	6a 00                	push   $0x0
8010604d:	6a 44                	push   $0x44
8010604f:	e9 b3 f8 ff ff       	jmp    80105907 <alltraps>

80106054 <vector69>:
80106054:	6a 00                	push   $0x0
80106056:	6a 45                	push   $0x45
80106058:	e9 aa f8 ff ff       	jmp    80105907 <alltraps>

8010605d <vector70>:
8010605d:	6a 00                	push   $0x0
8010605f:	6a 46                	push   $0x46
80106061:	e9 a1 f8 ff ff       	jmp    80105907 <alltraps>

80106066 <vector71>:
80106066:	6a 00                	push   $0x0
80106068:	6a 47                	push   $0x47
8010606a:	e9 98 f8 ff ff       	jmp    80105907 <alltraps>

8010606f <vector72>:
8010606f:	6a 00                	push   $0x0
80106071:	6a 48                	push   $0x48
80106073:	e9 8f f8 ff ff       	jmp    80105907 <alltraps>

80106078 <vector73>:
80106078:	6a 00                	push   $0x0
8010607a:	6a 49                	push   $0x49
8010607c:	e9 86 f8 ff ff       	jmp    80105907 <alltraps>

80106081 <vector74>:
80106081:	6a 00                	push   $0x0
80106083:	6a 4a                	push   $0x4a
80106085:	e9 7d f8 ff ff       	jmp    80105907 <alltraps>

8010608a <vector75>:
8010608a:	6a 00                	push   $0x0
8010608c:	6a 4b                	push   $0x4b
8010608e:	e9 74 f8 ff ff       	jmp    80105907 <alltraps>

80106093 <vector76>:
80106093:	6a 00                	push   $0x0
80106095:	6a 4c                	push   $0x4c
80106097:	e9 6b f8 ff ff       	jmp    80105907 <alltraps>

8010609c <vector77>:
8010609c:	6a 00                	push   $0x0
8010609e:	6a 4d                	push   $0x4d
801060a0:	e9 62 f8 ff ff       	jmp    80105907 <alltraps>

801060a5 <vector78>:
801060a5:	6a 00                	push   $0x0
801060a7:	6a 4e                	push   $0x4e
801060a9:	e9 59 f8 ff ff       	jmp    80105907 <alltraps>

801060ae <vector79>:
801060ae:	6a 00                	push   $0x0
801060b0:	6a 4f                	push   $0x4f
801060b2:	e9 50 f8 ff ff       	jmp    80105907 <alltraps>

801060b7 <vector80>:
801060b7:	6a 00                	push   $0x0
801060b9:	6a 50                	push   $0x50
801060bb:	e9 47 f8 ff ff       	jmp    80105907 <alltraps>

801060c0 <vector81>:
801060c0:	6a 00                	push   $0x0
801060c2:	6a 51                	push   $0x51
801060c4:	e9 3e f8 ff ff       	jmp    80105907 <alltraps>

801060c9 <vector82>:
801060c9:	6a 00                	push   $0x0
801060cb:	6a 52                	push   $0x52
801060cd:	e9 35 f8 ff ff       	jmp    80105907 <alltraps>

801060d2 <vector83>:
801060d2:	6a 00                	push   $0x0
801060d4:	6a 53                	push   $0x53
801060d6:	e9 2c f8 ff ff       	jmp    80105907 <alltraps>

801060db <vector84>:
801060db:	6a 00                	push   $0x0
801060dd:	6a 54                	push   $0x54
801060df:	e9 23 f8 ff ff       	jmp    80105907 <alltraps>

801060e4 <vector85>:
801060e4:	6a 00                	push   $0x0
801060e6:	6a 55                	push   $0x55
801060e8:	e9 1a f8 ff ff       	jmp    80105907 <alltraps>

801060ed <vector86>:
801060ed:	6a 00                	push   $0x0
801060ef:	6a 56                	push   $0x56
801060f1:	e9 11 f8 ff ff       	jmp    80105907 <alltraps>

801060f6 <vector87>:
801060f6:	6a 00                	push   $0x0
801060f8:	6a 57                	push   $0x57
801060fa:	e9 08 f8 ff ff       	jmp    80105907 <alltraps>

801060ff <vector88>:
801060ff:	6a 00                	push   $0x0
80106101:	6a 58                	push   $0x58
80106103:	e9 ff f7 ff ff       	jmp    80105907 <alltraps>

80106108 <vector89>:
80106108:	6a 00                	push   $0x0
8010610a:	6a 59                	push   $0x59
8010610c:	e9 f6 f7 ff ff       	jmp    80105907 <alltraps>

80106111 <vector90>:
80106111:	6a 00                	push   $0x0
80106113:	6a 5a                	push   $0x5a
80106115:	e9 ed f7 ff ff       	jmp    80105907 <alltraps>

8010611a <vector91>:
8010611a:	6a 00                	push   $0x0
8010611c:	6a 5b                	push   $0x5b
8010611e:	e9 e4 f7 ff ff       	jmp    80105907 <alltraps>

80106123 <vector92>:
80106123:	6a 00                	push   $0x0
80106125:	6a 5c                	push   $0x5c
80106127:	e9 db f7 ff ff       	jmp    80105907 <alltraps>

8010612c <vector93>:
8010612c:	6a 00                	push   $0x0
8010612e:	6a 5d                	push   $0x5d
80106130:	e9 d2 f7 ff ff       	jmp    80105907 <alltraps>

80106135 <vector94>:
80106135:	6a 00                	push   $0x0
80106137:	6a 5e                	push   $0x5e
80106139:	e9 c9 f7 ff ff       	jmp    80105907 <alltraps>

8010613e <vector95>:
8010613e:	6a 00                	push   $0x0
80106140:	6a 5f                	push   $0x5f
80106142:	e9 c0 f7 ff ff       	jmp    80105907 <alltraps>

80106147 <vector96>:
80106147:	6a 00                	push   $0x0
80106149:	6a 60                	push   $0x60
8010614b:	e9 b7 f7 ff ff       	jmp    80105907 <alltraps>

80106150 <vector97>:
80106150:	6a 00                	push   $0x0
80106152:	6a 61                	push   $0x61
80106154:	e9 ae f7 ff ff       	jmp    80105907 <alltraps>

80106159 <vector98>:
80106159:	6a 00                	push   $0x0
8010615b:	6a 62                	push   $0x62
8010615d:	e9 a5 f7 ff ff       	jmp    80105907 <alltraps>

80106162 <vector99>:
80106162:	6a 00                	push   $0x0
80106164:	6a 63                	push   $0x63
80106166:	e9 9c f7 ff ff       	jmp    80105907 <alltraps>

8010616b <vector100>:
8010616b:	6a 00                	push   $0x0
8010616d:	6a 64                	push   $0x64
8010616f:	e9 93 f7 ff ff       	jmp    80105907 <alltraps>

80106174 <vector101>:
80106174:	6a 00                	push   $0x0
80106176:	6a 65                	push   $0x65
80106178:	e9 8a f7 ff ff       	jmp    80105907 <alltraps>

8010617d <vector102>:
8010617d:	6a 00                	push   $0x0
8010617f:	6a 66                	push   $0x66
80106181:	e9 81 f7 ff ff       	jmp    80105907 <alltraps>

80106186 <vector103>:
80106186:	6a 00                	push   $0x0
80106188:	6a 67                	push   $0x67
8010618a:	e9 78 f7 ff ff       	jmp    80105907 <alltraps>

8010618f <vector104>:
8010618f:	6a 00                	push   $0x0
80106191:	6a 68                	push   $0x68
80106193:	e9 6f f7 ff ff       	jmp    80105907 <alltraps>

80106198 <vector105>:
80106198:	6a 00                	push   $0x0
8010619a:	6a 69                	push   $0x69
8010619c:	e9 66 f7 ff ff       	jmp    80105907 <alltraps>

801061a1 <vector106>:
801061a1:	6a 00                	push   $0x0
801061a3:	6a 6a                	push   $0x6a
801061a5:	e9 5d f7 ff ff       	jmp    80105907 <alltraps>

801061aa <vector107>:
801061aa:	6a 00                	push   $0x0
801061ac:	6a 6b                	push   $0x6b
801061ae:	e9 54 f7 ff ff       	jmp    80105907 <alltraps>

801061b3 <vector108>:
801061b3:	6a 00                	push   $0x0
801061b5:	6a 6c                	push   $0x6c
801061b7:	e9 4b f7 ff ff       	jmp    80105907 <alltraps>

801061bc <vector109>:
801061bc:	6a 00                	push   $0x0
801061be:	6a 6d                	push   $0x6d
801061c0:	e9 42 f7 ff ff       	jmp    80105907 <alltraps>

801061c5 <vector110>:
801061c5:	6a 00                	push   $0x0
801061c7:	6a 6e                	push   $0x6e
801061c9:	e9 39 f7 ff ff       	jmp    80105907 <alltraps>

801061ce <vector111>:
801061ce:	6a 00                	push   $0x0
801061d0:	6a 6f                	push   $0x6f
801061d2:	e9 30 f7 ff ff       	jmp    80105907 <alltraps>

801061d7 <vector112>:
801061d7:	6a 00                	push   $0x0
801061d9:	6a 70                	push   $0x70
801061db:	e9 27 f7 ff ff       	jmp    80105907 <alltraps>

801061e0 <vector113>:
801061e0:	6a 00                	push   $0x0
801061e2:	6a 71                	push   $0x71
801061e4:	e9 1e f7 ff ff       	jmp    80105907 <alltraps>

801061e9 <vector114>:
801061e9:	6a 00                	push   $0x0
801061eb:	6a 72                	push   $0x72
801061ed:	e9 15 f7 ff ff       	jmp    80105907 <alltraps>

801061f2 <vector115>:
801061f2:	6a 00                	push   $0x0
801061f4:	6a 73                	push   $0x73
801061f6:	e9 0c f7 ff ff       	jmp    80105907 <alltraps>

801061fb <vector116>:
801061fb:	6a 00                	push   $0x0
801061fd:	6a 74                	push   $0x74
801061ff:	e9 03 f7 ff ff       	jmp    80105907 <alltraps>

80106204 <vector117>:
80106204:	6a 00                	push   $0x0
80106206:	6a 75                	push   $0x75
80106208:	e9 fa f6 ff ff       	jmp    80105907 <alltraps>

8010620d <vector118>:
8010620d:	6a 00                	push   $0x0
8010620f:	6a 76                	push   $0x76
80106211:	e9 f1 f6 ff ff       	jmp    80105907 <alltraps>

80106216 <vector119>:
80106216:	6a 00                	push   $0x0
80106218:	6a 77                	push   $0x77
8010621a:	e9 e8 f6 ff ff       	jmp    80105907 <alltraps>

8010621f <vector120>:
8010621f:	6a 00                	push   $0x0
80106221:	6a 78                	push   $0x78
80106223:	e9 df f6 ff ff       	jmp    80105907 <alltraps>

80106228 <vector121>:
80106228:	6a 00                	push   $0x0
8010622a:	6a 79                	push   $0x79
8010622c:	e9 d6 f6 ff ff       	jmp    80105907 <alltraps>

80106231 <vector122>:
80106231:	6a 00                	push   $0x0
80106233:	6a 7a                	push   $0x7a
80106235:	e9 cd f6 ff ff       	jmp    80105907 <alltraps>

8010623a <vector123>:
8010623a:	6a 00                	push   $0x0
8010623c:	6a 7b                	push   $0x7b
8010623e:	e9 c4 f6 ff ff       	jmp    80105907 <alltraps>

80106243 <vector124>:
80106243:	6a 00                	push   $0x0
80106245:	6a 7c                	push   $0x7c
80106247:	e9 bb f6 ff ff       	jmp    80105907 <alltraps>

8010624c <vector125>:
8010624c:	6a 00                	push   $0x0
8010624e:	6a 7d                	push   $0x7d
80106250:	e9 b2 f6 ff ff       	jmp    80105907 <alltraps>

80106255 <vector126>:
80106255:	6a 00                	push   $0x0
80106257:	6a 7e                	push   $0x7e
80106259:	e9 a9 f6 ff ff       	jmp    80105907 <alltraps>

8010625e <vector127>:
8010625e:	6a 00                	push   $0x0
80106260:	6a 7f                	push   $0x7f
80106262:	e9 a0 f6 ff ff       	jmp    80105907 <alltraps>

80106267 <vector128>:
80106267:	6a 00                	push   $0x0
80106269:	68 80 00 00 00       	push   $0x80
8010626e:	e9 94 f6 ff ff       	jmp    80105907 <alltraps>

80106273 <vector129>:
80106273:	6a 00                	push   $0x0
80106275:	68 81 00 00 00       	push   $0x81
8010627a:	e9 88 f6 ff ff       	jmp    80105907 <alltraps>

8010627f <vector130>:
8010627f:	6a 00                	push   $0x0
80106281:	68 82 00 00 00       	push   $0x82
80106286:	e9 7c f6 ff ff       	jmp    80105907 <alltraps>

8010628b <vector131>:
8010628b:	6a 00                	push   $0x0
8010628d:	68 83 00 00 00       	push   $0x83
80106292:	e9 70 f6 ff ff       	jmp    80105907 <alltraps>

80106297 <vector132>:
80106297:	6a 00                	push   $0x0
80106299:	68 84 00 00 00       	push   $0x84
8010629e:	e9 64 f6 ff ff       	jmp    80105907 <alltraps>

801062a3 <vector133>:
801062a3:	6a 00                	push   $0x0
801062a5:	68 85 00 00 00       	push   $0x85
801062aa:	e9 58 f6 ff ff       	jmp    80105907 <alltraps>

801062af <vector134>:
801062af:	6a 00                	push   $0x0
801062b1:	68 86 00 00 00       	push   $0x86
801062b6:	e9 4c f6 ff ff       	jmp    80105907 <alltraps>

801062bb <vector135>:
801062bb:	6a 00                	push   $0x0
801062bd:	68 87 00 00 00       	push   $0x87
801062c2:	e9 40 f6 ff ff       	jmp    80105907 <alltraps>

801062c7 <vector136>:
801062c7:	6a 00                	push   $0x0
801062c9:	68 88 00 00 00       	push   $0x88
801062ce:	e9 34 f6 ff ff       	jmp    80105907 <alltraps>

801062d3 <vector137>:
801062d3:	6a 00                	push   $0x0
801062d5:	68 89 00 00 00       	push   $0x89
801062da:	e9 28 f6 ff ff       	jmp    80105907 <alltraps>

801062df <vector138>:
801062df:	6a 00                	push   $0x0
801062e1:	68 8a 00 00 00       	push   $0x8a
801062e6:	e9 1c f6 ff ff       	jmp    80105907 <alltraps>

801062eb <vector139>:
801062eb:	6a 00                	push   $0x0
801062ed:	68 8b 00 00 00       	push   $0x8b
801062f2:	e9 10 f6 ff ff       	jmp    80105907 <alltraps>

801062f7 <vector140>:
801062f7:	6a 00                	push   $0x0
801062f9:	68 8c 00 00 00       	push   $0x8c
801062fe:	e9 04 f6 ff ff       	jmp    80105907 <alltraps>

80106303 <vector141>:
80106303:	6a 00                	push   $0x0
80106305:	68 8d 00 00 00       	push   $0x8d
8010630a:	e9 f8 f5 ff ff       	jmp    80105907 <alltraps>

8010630f <vector142>:
8010630f:	6a 00                	push   $0x0
80106311:	68 8e 00 00 00       	push   $0x8e
80106316:	e9 ec f5 ff ff       	jmp    80105907 <alltraps>

8010631b <vector143>:
8010631b:	6a 00                	push   $0x0
8010631d:	68 8f 00 00 00       	push   $0x8f
80106322:	e9 e0 f5 ff ff       	jmp    80105907 <alltraps>

80106327 <vector144>:
80106327:	6a 00                	push   $0x0
80106329:	68 90 00 00 00       	push   $0x90
8010632e:	e9 d4 f5 ff ff       	jmp    80105907 <alltraps>

80106333 <vector145>:
80106333:	6a 00                	push   $0x0
80106335:	68 91 00 00 00       	push   $0x91
8010633a:	e9 c8 f5 ff ff       	jmp    80105907 <alltraps>

8010633f <vector146>:
8010633f:	6a 00                	push   $0x0
80106341:	68 92 00 00 00       	push   $0x92
80106346:	e9 bc f5 ff ff       	jmp    80105907 <alltraps>

8010634b <vector147>:
8010634b:	6a 00                	push   $0x0
8010634d:	68 93 00 00 00       	push   $0x93
80106352:	e9 b0 f5 ff ff       	jmp    80105907 <alltraps>

80106357 <vector148>:
80106357:	6a 00                	push   $0x0
80106359:	68 94 00 00 00       	push   $0x94
8010635e:	e9 a4 f5 ff ff       	jmp    80105907 <alltraps>

80106363 <vector149>:
80106363:	6a 00                	push   $0x0
80106365:	68 95 00 00 00       	push   $0x95
8010636a:	e9 98 f5 ff ff       	jmp    80105907 <alltraps>

8010636f <vector150>:
8010636f:	6a 00                	push   $0x0
80106371:	68 96 00 00 00       	push   $0x96
80106376:	e9 8c f5 ff ff       	jmp    80105907 <alltraps>

8010637b <vector151>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 97 00 00 00       	push   $0x97
80106382:	e9 80 f5 ff ff       	jmp    80105907 <alltraps>

80106387 <vector152>:
80106387:	6a 00                	push   $0x0
80106389:	68 98 00 00 00       	push   $0x98
8010638e:	e9 74 f5 ff ff       	jmp    80105907 <alltraps>

80106393 <vector153>:
80106393:	6a 00                	push   $0x0
80106395:	68 99 00 00 00       	push   $0x99
8010639a:	e9 68 f5 ff ff       	jmp    80105907 <alltraps>

8010639f <vector154>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 9a 00 00 00       	push   $0x9a
801063a6:	e9 5c f5 ff ff       	jmp    80105907 <alltraps>

801063ab <vector155>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 9b 00 00 00       	push   $0x9b
801063b2:	e9 50 f5 ff ff       	jmp    80105907 <alltraps>

801063b7 <vector156>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 9c 00 00 00       	push   $0x9c
801063be:	e9 44 f5 ff ff       	jmp    80105907 <alltraps>

801063c3 <vector157>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 9d 00 00 00       	push   $0x9d
801063ca:	e9 38 f5 ff ff       	jmp    80105907 <alltraps>

801063cf <vector158>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 9e 00 00 00       	push   $0x9e
801063d6:	e9 2c f5 ff ff       	jmp    80105907 <alltraps>

801063db <vector159>:
801063db:	6a 00                	push   $0x0
801063dd:	68 9f 00 00 00       	push   $0x9f
801063e2:	e9 20 f5 ff ff       	jmp    80105907 <alltraps>

801063e7 <vector160>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 a0 00 00 00       	push   $0xa0
801063ee:	e9 14 f5 ff ff       	jmp    80105907 <alltraps>

801063f3 <vector161>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 a1 00 00 00       	push   $0xa1
801063fa:	e9 08 f5 ff ff       	jmp    80105907 <alltraps>

801063ff <vector162>:
801063ff:	6a 00                	push   $0x0
80106401:	68 a2 00 00 00       	push   $0xa2
80106406:	e9 fc f4 ff ff       	jmp    80105907 <alltraps>

8010640b <vector163>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 a3 00 00 00       	push   $0xa3
80106412:	e9 f0 f4 ff ff       	jmp    80105907 <alltraps>

80106417 <vector164>:
80106417:	6a 00                	push   $0x0
80106419:	68 a4 00 00 00       	push   $0xa4
8010641e:	e9 e4 f4 ff ff       	jmp    80105907 <alltraps>

80106423 <vector165>:
80106423:	6a 00                	push   $0x0
80106425:	68 a5 00 00 00       	push   $0xa5
8010642a:	e9 d8 f4 ff ff       	jmp    80105907 <alltraps>

8010642f <vector166>:
8010642f:	6a 00                	push   $0x0
80106431:	68 a6 00 00 00       	push   $0xa6
80106436:	e9 cc f4 ff ff       	jmp    80105907 <alltraps>

8010643b <vector167>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 a7 00 00 00       	push   $0xa7
80106442:	e9 c0 f4 ff ff       	jmp    80105907 <alltraps>

80106447 <vector168>:
80106447:	6a 00                	push   $0x0
80106449:	68 a8 00 00 00       	push   $0xa8
8010644e:	e9 b4 f4 ff ff       	jmp    80105907 <alltraps>

80106453 <vector169>:
80106453:	6a 00                	push   $0x0
80106455:	68 a9 00 00 00       	push   $0xa9
8010645a:	e9 a8 f4 ff ff       	jmp    80105907 <alltraps>

8010645f <vector170>:
8010645f:	6a 00                	push   $0x0
80106461:	68 aa 00 00 00       	push   $0xaa
80106466:	e9 9c f4 ff ff       	jmp    80105907 <alltraps>

8010646b <vector171>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 ab 00 00 00       	push   $0xab
80106472:	e9 90 f4 ff ff       	jmp    80105907 <alltraps>

80106477 <vector172>:
80106477:	6a 00                	push   $0x0
80106479:	68 ac 00 00 00       	push   $0xac
8010647e:	e9 84 f4 ff ff       	jmp    80105907 <alltraps>

80106483 <vector173>:
80106483:	6a 00                	push   $0x0
80106485:	68 ad 00 00 00       	push   $0xad
8010648a:	e9 78 f4 ff ff       	jmp    80105907 <alltraps>

8010648f <vector174>:
8010648f:	6a 00                	push   $0x0
80106491:	68 ae 00 00 00       	push   $0xae
80106496:	e9 6c f4 ff ff       	jmp    80105907 <alltraps>

8010649b <vector175>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 af 00 00 00       	push   $0xaf
801064a2:	e9 60 f4 ff ff       	jmp    80105907 <alltraps>

801064a7 <vector176>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 b0 00 00 00       	push   $0xb0
801064ae:	e9 54 f4 ff ff       	jmp    80105907 <alltraps>

801064b3 <vector177>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 b1 00 00 00       	push   $0xb1
801064ba:	e9 48 f4 ff ff       	jmp    80105907 <alltraps>

801064bf <vector178>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 b2 00 00 00       	push   $0xb2
801064c6:	e9 3c f4 ff ff       	jmp    80105907 <alltraps>

801064cb <vector179>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 b3 00 00 00       	push   $0xb3
801064d2:	e9 30 f4 ff ff       	jmp    80105907 <alltraps>

801064d7 <vector180>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 b4 00 00 00       	push   $0xb4
801064de:	e9 24 f4 ff ff       	jmp    80105907 <alltraps>

801064e3 <vector181>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 b5 00 00 00       	push   $0xb5
801064ea:	e9 18 f4 ff ff       	jmp    80105907 <alltraps>

801064ef <vector182>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 b6 00 00 00       	push   $0xb6
801064f6:	e9 0c f4 ff ff       	jmp    80105907 <alltraps>

801064fb <vector183>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 b7 00 00 00       	push   $0xb7
80106502:	e9 00 f4 ff ff       	jmp    80105907 <alltraps>

80106507 <vector184>:
80106507:	6a 00                	push   $0x0
80106509:	68 b8 00 00 00       	push   $0xb8
8010650e:	e9 f4 f3 ff ff       	jmp    80105907 <alltraps>

80106513 <vector185>:
80106513:	6a 00                	push   $0x0
80106515:	68 b9 00 00 00       	push   $0xb9
8010651a:	e9 e8 f3 ff ff       	jmp    80105907 <alltraps>

8010651f <vector186>:
8010651f:	6a 00                	push   $0x0
80106521:	68 ba 00 00 00       	push   $0xba
80106526:	e9 dc f3 ff ff       	jmp    80105907 <alltraps>

8010652b <vector187>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 bb 00 00 00       	push   $0xbb
80106532:	e9 d0 f3 ff ff       	jmp    80105907 <alltraps>

80106537 <vector188>:
80106537:	6a 00                	push   $0x0
80106539:	68 bc 00 00 00       	push   $0xbc
8010653e:	e9 c4 f3 ff ff       	jmp    80105907 <alltraps>

80106543 <vector189>:
80106543:	6a 00                	push   $0x0
80106545:	68 bd 00 00 00       	push   $0xbd
8010654a:	e9 b8 f3 ff ff       	jmp    80105907 <alltraps>

8010654f <vector190>:
8010654f:	6a 00                	push   $0x0
80106551:	68 be 00 00 00       	push   $0xbe
80106556:	e9 ac f3 ff ff       	jmp    80105907 <alltraps>

8010655b <vector191>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 bf 00 00 00       	push   $0xbf
80106562:	e9 a0 f3 ff ff       	jmp    80105907 <alltraps>

80106567 <vector192>:
80106567:	6a 00                	push   $0x0
80106569:	68 c0 00 00 00       	push   $0xc0
8010656e:	e9 94 f3 ff ff       	jmp    80105907 <alltraps>

80106573 <vector193>:
80106573:	6a 00                	push   $0x0
80106575:	68 c1 00 00 00       	push   $0xc1
8010657a:	e9 88 f3 ff ff       	jmp    80105907 <alltraps>

8010657f <vector194>:
8010657f:	6a 00                	push   $0x0
80106581:	68 c2 00 00 00       	push   $0xc2
80106586:	e9 7c f3 ff ff       	jmp    80105907 <alltraps>

8010658b <vector195>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 c3 00 00 00       	push   $0xc3
80106592:	e9 70 f3 ff ff       	jmp    80105907 <alltraps>

80106597 <vector196>:
80106597:	6a 00                	push   $0x0
80106599:	68 c4 00 00 00       	push   $0xc4
8010659e:	e9 64 f3 ff ff       	jmp    80105907 <alltraps>

801065a3 <vector197>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 c5 00 00 00       	push   $0xc5
801065aa:	e9 58 f3 ff ff       	jmp    80105907 <alltraps>

801065af <vector198>:
801065af:	6a 00                	push   $0x0
801065b1:	68 c6 00 00 00       	push   $0xc6
801065b6:	e9 4c f3 ff ff       	jmp    80105907 <alltraps>

801065bb <vector199>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 c7 00 00 00       	push   $0xc7
801065c2:	e9 40 f3 ff ff       	jmp    80105907 <alltraps>

801065c7 <vector200>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 c8 00 00 00       	push   $0xc8
801065ce:	e9 34 f3 ff ff       	jmp    80105907 <alltraps>

801065d3 <vector201>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 c9 00 00 00       	push   $0xc9
801065da:	e9 28 f3 ff ff       	jmp    80105907 <alltraps>

801065df <vector202>:
801065df:	6a 00                	push   $0x0
801065e1:	68 ca 00 00 00       	push   $0xca
801065e6:	e9 1c f3 ff ff       	jmp    80105907 <alltraps>

801065eb <vector203>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 cb 00 00 00       	push   $0xcb
801065f2:	e9 10 f3 ff ff       	jmp    80105907 <alltraps>

801065f7 <vector204>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 cc 00 00 00       	push   $0xcc
801065fe:	e9 04 f3 ff ff       	jmp    80105907 <alltraps>

80106603 <vector205>:
80106603:	6a 00                	push   $0x0
80106605:	68 cd 00 00 00       	push   $0xcd
8010660a:	e9 f8 f2 ff ff       	jmp    80105907 <alltraps>

8010660f <vector206>:
8010660f:	6a 00                	push   $0x0
80106611:	68 ce 00 00 00       	push   $0xce
80106616:	e9 ec f2 ff ff       	jmp    80105907 <alltraps>

8010661b <vector207>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 cf 00 00 00       	push   $0xcf
80106622:	e9 e0 f2 ff ff       	jmp    80105907 <alltraps>

80106627 <vector208>:
80106627:	6a 00                	push   $0x0
80106629:	68 d0 00 00 00       	push   $0xd0
8010662e:	e9 d4 f2 ff ff       	jmp    80105907 <alltraps>

80106633 <vector209>:
80106633:	6a 00                	push   $0x0
80106635:	68 d1 00 00 00       	push   $0xd1
8010663a:	e9 c8 f2 ff ff       	jmp    80105907 <alltraps>

8010663f <vector210>:
8010663f:	6a 00                	push   $0x0
80106641:	68 d2 00 00 00       	push   $0xd2
80106646:	e9 bc f2 ff ff       	jmp    80105907 <alltraps>

8010664b <vector211>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 d3 00 00 00       	push   $0xd3
80106652:	e9 b0 f2 ff ff       	jmp    80105907 <alltraps>

80106657 <vector212>:
80106657:	6a 00                	push   $0x0
80106659:	68 d4 00 00 00       	push   $0xd4
8010665e:	e9 a4 f2 ff ff       	jmp    80105907 <alltraps>

80106663 <vector213>:
80106663:	6a 00                	push   $0x0
80106665:	68 d5 00 00 00       	push   $0xd5
8010666a:	e9 98 f2 ff ff       	jmp    80105907 <alltraps>

8010666f <vector214>:
8010666f:	6a 00                	push   $0x0
80106671:	68 d6 00 00 00       	push   $0xd6
80106676:	e9 8c f2 ff ff       	jmp    80105907 <alltraps>

8010667b <vector215>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 d7 00 00 00       	push   $0xd7
80106682:	e9 80 f2 ff ff       	jmp    80105907 <alltraps>

80106687 <vector216>:
80106687:	6a 00                	push   $0x0
80106689:	68 d8 00 00 00       	push   $0xd8
8010668e:	e9 74 f2 ff ff       	jmp    80105907 <alltraps>

80106693 <vector217>:
80106693:	6a 00                	push   $0x0
80106695:	68 d9 00 00 00       	push   $0xd9
8010669a:	e9 68 f2 ff ff       	jmp    80105907 <alltraps>

8010669f <vector218>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 da 00 00 00       	push   $0xda
801066a6:	e9 5c f2 ff ff       	jmp    80105907 <alltraps>

801066ab <vector219>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 db 00 00 00       	push   $0xdb
801066b2:	e9 50 f2 ff ff       	jmp    80105907 <alltraps>

801066b7 <vector220>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 dc 00 00 00       	push   $0xdc
801066be:	e9 44 f2 ff ff       	jmp    80105907 <alltraps>

801066c3 <vector221>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 dd 00 00 00       	push   $0xdd
801066ca:	e9 38 f2 ff ff       	jmp    80105907 <alltraps>

801066cf <vector222>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 de 00 00 00       	push   $0xde
801066d6:	e9 2c f2 ff ff       	jmp    80105907 <alltraps>

801066db <vector223>:
801066db:	6a 00                	push   $0x0
801066dd:	68 df 00 00 00       	push   $0xdf
801066e2:	e9 20 f2 ff ff       	jmp    80105907 <alltraps>

801066e7 <vector224>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 e0 00 00 00       	push   $0xe0
801066ee:	e9 14 f2 ff ff       	jmp    80105907 <alltraps>

801066f3 <vector225>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 e1 00 00 00       	push   $0xe1
801066fa:	e9 08 f2 ff ff       	jmp    80105907 <alltraps>

801066ff <vector226>:
801066ff:	6a 00                	push   $0x0
80106701:	68 e2 00 00 00       	push   $0xe2
80106706:	e9 fc f1 ff ff       	jmp    80105907 <alltraps>

8010670b <vector227>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 e3 00 00 00       	push   $0xe3
80106712:	e9 f0 f1 ff ff       	jmp    80105907 <alltraps>

80106717 <vector228>:
80106717:	6a 00                	push   $0x0
80106719:	68 e4 00 00 00       	push   $0xe4
8010671e:	e9 e4 f1 ff ff       	jmp    80105907 <alltraps>

80106723 <vector229>:
80106723:	6a 00                	push   $0x0
80106725:	68 e5 00 00 00       	push   $0xe5
8010672a:	e9 d8 f1 ff ff       	jmp    80105907 <alltraps>

8010672f <vector230>:
8010672f:	6a 00                	push   $0x0
80106731:	68 e6 00 00 00       	push   $0xe6
80106736:	e9 cc f1 ff ff       	jmp    80105907 <alltraps>

8010673b <vector231>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 e7 00 00 00       	push   $0xe7
80106742:	e9 c0 f1 ff ff       	jmp    80105907 <alltraps>

80106747 <vector232>:
80106747:	6a 00                	push   $0x0
80106749:	68 e8 00 00 00       	push   $0xe8
8010674e:	e9 b4 f1 ff ff       	jmp    80105907 <alltraps>

80106753 <vector233>:
80106753:	6a 00                	push   $0x0
80106755:	68 e9 00 00 00       	push   $0xe9
8010675a:	e9 a8 f1 ff ff       	jmp    80105907 <alltraps>

8010675f <vector234>:
8010675f:	6a 00                	push   $0x0
80106761:	68 ea 00 00 00       	push   $0xea
80106766:	e9 9c f1 ff ff       	jmp    80105907 <alltraps>

8010676b <vector235>:
8010676b:	6a 00                	push   $0x0
8010676d:	68 eb 00 00 00       	push   $0xeb
80106772:	e9 90 f1 ff ff       	jmp    80105907 <alltraps>

80106777 <vector236>:
80106777:	6a 00                	push   $0x0
80106779:	68 ec 00 00 00       	push   $0xec
8010677e:	e9 84 f1 ff ff       	jmp    80105907 <alltraps>

80106783 <vector237>:
80106783:	6a 00                	push   $0x0
80106785:	68 ed 00 00 00       	push   $0xed
8010678a:	e9 78 f1 ff ff       	jmp    80105907 <alltraps>

8010678f <vector238>:
8010678f:	6a 00                	push   $0x0
80106791:	68 ee 00 00 00       	push   $0xee
80106796:	e9 6c f1 ff ff       	jmp    80105907 <alltraps>

8010679b <vector239>:
8010679b:	6a 00                	push   $0x0
8010679d:	68 ef 00 00 00       	push   $0xef
801067a2:	e9 60 f1 ff ff       	jmp    80105907 <alltraps>

801067a7 <vector240>:
801067a7:	6a 00                	push   $0x0
801067a9:	68 f0 00 00 00       	push   $0xf0
801067ae:	e9 54 f1 ff ff       	jmp    80105907 <alltraps>

801067b3 <vector241>:
801067b3:	6a 00                	push   $0x0
801067b5:	68 f1 00 00 00       	push   $0xf1
801067ba:	e9 48 f1 ff ff       	jmp    80105907 <alltraps>

801067bf <vector242>:
801067bf:	6a 00                	push   $0x0
801067c1:	68 f2 00 00 00       	push   $0xf2
801067c6:	e9 3c f1 ff ff       	jmp    80105907 <alltraps>

801067cb <vector243>:
801067cb:	6a 00                	push   $0x0
801067cd:	68 f3 00 00 00       	push   $0xf3
801067d2:	e9 30 f1 ff ff       	jmp    80105907 <alltraps>

801067d7 <vector244>:
801067d7:	6a 00                	push   $0x0
801067d9:	68 f4 00 00 00       	push   $0xf4
801067de:	e9 24 f1 ff ff       	jmp    80105907 <alltraps>

801067e3 <vector245>:
801067e3:	6a 00                	push   $0x0
801067e5:	68 f5 00 00 00       	push   $0xf5
801067ea:	e9 18 f1 ff ff       	jmp    80105907 <alltraps>

801067ef <vector246>:
801067ef:	6a 00                	push   $0x0
801067f1:	68 f6 00 00 00       	push   $0xf6
801067f6:	e9 0c f1 ff ff       	jmp    80105907 <alltraps>

801067fb <vector247>:
801067fb:	6a 00                	push   $0x0
801067fd:	68 f7 00 00 00       	push   $0xf7
80106802:	e9 00 f1 ff ff       	jmp    80105907 <alltraps>

80106807 <vector248>:
80106807:	6a 00                	push   $0x0
80106809:	68 f8 00 00 00       	push   $0xf8
8010680e:	e9 f4 f0 ff ff       	jmp    80105907 <alltraps>

80106813 <vector249>:
80106813:	6a 00                	push   $0x0
80106815:	68 f9 00 00 00       	push   $0xf9
8010681a:	e9 e8 f0 ff ff       	jmp    80105907 <alltraps>

8010681f <vector250>:
8010681f:	6a 00                	push   $0x0
80106821:	68 fa 00 00 00       	push   $0xfa
80106826:	e9 dc f0 ff ff       	jmp    80105907 <alltraps>

8010682b <vector251>:
8010682b:	6a 00                	push   $0x0
8010682d:	68 fb 00 00 00       	push   $0xfb
80106832:	e9 d0 f0 ff ff       	jmp    80105907 <alltraps>

80106837 <vector252>:
80106837:	6a 00                	push   $0x0
80106839:	68 fc 00 00 00       	push   $0xfc
8010683e:	e9 c4 f0 ff ff       	jmp    80105907 <alltraps>

80106843 <vector253>:
80106843:	6a 00                	push   $0x0
80106845:	68 fd 00 00 00       	push   $0xfd
8010684a:	e9 b8 f0 ff ff       	jmp    80105907 <alltraps>

8010684f <vector254>:
8010684f:	6a 00                	push   $0x0
80106851:	68 fe 00 00 00       	push   $0xfe
80106856:	e9 ac f0 ff ff       	jmp    80105907 <alltraps>

8010685b <vector255>:
8010685b:	6a 00                	push   $0x0
8010685d:	68 ff 00 00 00       	push   $0xff
80106862:	e9 a0 f0 ff ff       	jmp    80105907 <alltraps>
80106867:	66 90                	xchg   %ax,%ax
80106869:	66 90                	xchg   %ax,%ax
8010686b:	66 90                	xchg   %ax,%ax
8010686d:	66 90                	xchg   %ax,%ax
8010686f:	90                   	nop

80106870 <deallocuvm.part.0>:
80106870:	55                   	push   %ebp
80106871:	89 e5                	mov    %esp,%ebp
80106873:	57                   	push   %edi
80106874:	56                   	push   %esi
80106875:	53                   	push   %ebx
80106876:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010687c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106882:	83 ec 1c             	sub    $0x1c,%esp
80106885:	39 d3                	cmp    %edx,%ebx
80106887:	73 56                	jae    801068df <deallocuvm.part.0+0x6f>
80106889:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010688c:	89 c6                	mov    %eax,%esi
8010688e:	89 d7                	mov    %edx,%edi
80106890:	eb 12                	jmp    801068a4 <deallocuvm.part.0+0x34>
80106892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106898:	83 c2 01             	add    $0x1,%edx
8010689b:	89 d3                	mov    %edx,%ebx
8010689d:	c1 e3 16             	shl    $0x16,%ebx
801068a0:	39 fb                	cmp    %edi,%ebx
801068a2:	73 38                	jae    801068dc <deallocuvm.part.0+0x6c>
801068a4:	89 da                	mov    %ebx,%edx
801068a6:	c1 ea 16             	shr    $0x16,%edx
801068a9:	8b 04 96             	mov    (%esi,%edx,4),%eax
801068ac:	a8 01                	test   $0x1,%al
801068ae:	74 e8                	je     80106898 <deallocuvm.part.0+0x28>
801068b0:	89 d9                	mov    %ebx,%ecx
801068b2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801068b7:	c1 e9 0a             	shr    $0xa,%ecx
801068ba:	81 e1 fc 0f 00 00    	and    $0xffc,%ecx
801068c0:	8d 84 08 00 00 00 80 	lea    -0x80000000(%eax,%ecx,1),%eax
801068c7:	85 c0                	test   %eax,%eax
801068c9:	74 cd                	je     80106898 <deallocuvm.part.0+0x28>
801068cb:	8b 10                	mov    (%eax),%edx
801068cd:	f6 c2 01             	test   $0x1,%dl
801068d0:	75 1e                	jne    801068f0 <deallocuvm.part.0+0x80>
801068d2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068d8:	39 fb                	cmp    %edi,%ebx
801068da:	72 c8                	jb     801068a4 <deallocuvm.part.0+0x34>
801068dc:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801068df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068e2:	89 c8                	mov    %ecx,%eax
801068e4:	5b                   	pop    %ebx
801068e5:	5e                   	pop    %esi
801068e6:	5f                   	pop    %edi
801068e7:	5d                   	pop    %ebp
801068e8:	c3                   	ret
801068e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068f0:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068f6:	74 26                	je     8010691e <deallocuvm.part.0+0xae>
801068f8:	83 ec 0c             	sub    $0xc,%esp
801068fb:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106901:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106904:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010690a:	52                   	push   %edx
8010690b:	e8 b0 bb ff ff       	call   801024c0 <kfree>
80106910:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106913:	83 c4 10             	add    $0x10,%esp
80106916:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010691c:	eb 82                	jmp    801068a0 <deallocuvm.part.0+0x30>
8010691e:	83 ec 0c             	sub    $0xc,%esp
80106921:	68 86 74 10 80       	push   $0x80107486
80106926:	e8 55 9a ff ff       	call   80100380 <panic>
8010692b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80106930 <mappages>:
80106930:	55                   	push   %ebp
80106931:	89 e5                	mov    %esp,%ebp
80106933:	57                   	push   %edi
80106934:	56                   	push   %esi
80106935:	53                   	push   %ebx
80106936:	89 d3                	mov    %edx,%ebx
80106938:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010693e:	83 ec 1c             	sub    $0x1c,%esp
80106941:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106944:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106948:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010694d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106950:	8b 45 08             	mov    0x8(%ebp),%eax
80106953:	29 d8                	sub    %ebx,%eax
80106955:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106958:	eb 3f                	jmp    80106999 <mappages+0x69>
8010695a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106960:	89 da                	mov    %ebx,%edx
80106962:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106967:	c1 ea 0a             	shr    $0xa,%edx
8010696a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106970:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
80106977:	85 c0                	test   %eax,%eax
80106979:	74 75                	je     801069f0 <mappages+0xc0>
8010697b:	f6 00 01             	testb  $0x1,(%eax)
8010697e:	0f 85 86 00 00 00    	jne    80106a0a <mappages+0xda>
80106984:	0b 75 0c             	or     0xc(%ebp),%esi
80106987:	83 ce 01             	or     $0x1,%esi
8010698a:	89 30                	mov    %esi,(%eax)
8010698c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010698f:	39 c3                	cmp    %eax,%ebx
80106991:	74 6d                	je     80106a00 <mappages+0xd0>
80106993:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106999:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010699c:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010699f:	8d 34 03             	lea    (%ebx,%eax,1),%esi
801069a2:	89 d8                	mov    %ebx,%eax
801069a4:	c1 e8 16             	shr    $0x16,%eax
801069a7:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
801069aa:	8b 07                	mov    (%edi),%eax
801069ac:	a8 01                	test   $0x1,%al
801069ae:	75 b0                	jne    80106960 <mappages+0x30>
801069b0:	e8 cb bc ff ff       	call   80102680 <kalloc>
801069b5:	85 c0                	test   %eax,%eax
801069b7:	74 37                	je     801069f0 <mappages+0xc0>
801069b9:	83 ec 04             	sub    $0x4,%esp
801069bc:	68 00 10 00 00       	push   $0x1000
801069c1:	6a 00                	push   $0x0
801069c3:	50                   	push   %eax
801069c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
801069c7:	e8 24 dd ff ff       	call   801046f0 <memset>
801069cc:	8b 55 d8             	mov    -0x28(%ebp),%edx
801069cf:	83 c4 10             	add    $0x10,%esp
801069d2:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
801069d8:	83 c8 07             	or     $0x7,%eax
801069db:	89 07                	mov    %eax,(%edi)
801069dd:	89 d8                	mov    %ebx,%eax
801069df:	c1 e8 0a             	shr    $0xa,%eax
801069e2:	25 fc 0f 00 00       	and    $0xffc,%eax
801069e7:	01 d0                	add    %edx,%eax
801069e9:	eb 90                	jmp    8010697b <mappages+0x4b>
801069eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801069f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801069f8:	5b                   	pop    %ebx
801069f9:	5e                   	pop    %esi
801069fa:	5f                   	pop    %edi
801069fb:	5d                   	pop    %ebp
801069fc:	c3                   	ret
801069fd:	8d 76 00             	lea    0x0(%esi),%esi
80106a00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a03:	31 c0                	xor    %eax,%eax
80106a05:	5b                   	pop    %ebx
80106a06:	5e                   	pop    %esi
80106a07:	5f                   	pop    %edi
80106a08:	5d                   	pop    %ebp
80106a09:	c3                   	ret
80106a0a:	83 ec 0c             	sub    $0xc,%esp
80106a0d:	68 14 79 10 80       	push   $0x80107914
80106a12:	e8 69 99 ff ff       	call   80100380 <panic>
80106a17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106a1e:	00 
80106a1f:	90                   	nop

80106a20 <seginit>:
80106a20:	55                   	push   %ebp
80106a21:	89 e5                	mov    %esp,%ebp
80106a23:	83 ec 18             	sub    $0x18,%esp
80106a26:	e8 75 ce ff ff       	call   801038a0 <cpuid>
80106a2b:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106a30:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106a36:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106a3a:	c7 80 f8 c1 11 80 ff 	movl   $0xffff,-0x7fee3e08(%eax)
80106a41:	ff 00 00 
80106a44:	c7 80 fc c1 11 80 00 	movl   $0xcf9a00,-0x7fee3e04(%eax)
80106a4b:	9a cf 00 
80106a4e:	c7 80 00 c2 11 80 ff 	movl   $0xffff,-0x7fee3e00(%eax)
80106a55:	ff 00 00 
80106a58:	c7 80 04 c2 11 80 00 	movl   $0xcf9200,-0x7fee3dfc(%eax)
80106a5f:	92 cf 00 
80106a62:	c7 80 08 c2 11 80 ff 	movl   $0xffff,-0x7fee3df8(%eax)
80106a69:	ff 00 00 
80106a6c:	c7 80 0c c2 11 80 00 	movl   $0xcffa00,-0x7fee3df4(%eax)
80106a73:	fa cf 00 
80106a76:	c7 80 10 c2 11 80 ff 	movl   $0xffff,-0x7fee3df0(%eax)
80106a7d:	ff 00 00 
80106a80:	c7 80 14 c2 11 80 00 	movl   $0xcff200,-0x7fee3dec(%eax)
80106a87:	f2 cf 00 
80106a8a:	05 f0 c1 11 80       	add    $0x8011c1f0,%eax
80106a8f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106a93:	c1 e8 10             	shr    $0x10,%eax
80106a96:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106a9a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106a9d:	0f 01 10             	lgdtl  (%eax)
80106aa0:	c9                   	leave
80106aa1:	c3                   	ret
80106aa2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106aa9:	00 
80106aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106ab0 <switchkvm>:
80106ab0:	a1 a4 ef 11 80       	mov    0x8011efa4,%eax
80106ab5:	05 00 00 00 80       	add    $0x80000000,%eax
80106aba:	0f 22 d8             	mov    %eax,%cr3
80106abd:	c3                   	ret
80106abe:	66 90                	xchg   %ax,%ax

80106ac0 <switchuvm>:
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	57                   	push   %edi
80106ac4:	56                   	push   %esi
80106ac5:	53                   	push   %ebx
80106ac6:	83 ec 1c             	sub    $0x1c,%esp
80106ac9:	8b 75 08             	mov    0x8(%ebp),%esi
80106acc:	85 f6                	test   %esi,%esi
80106ace:	0f 84 cb 00 00 00    	je     80106b9f <switchuvm+0xdf>
80106ad4:	8b 46 08             	mov    0x8(%esi),%eax
80106ad7:	85 c0                	test   %eax,%eax
80106ad9:	0f 84 da 00 00 00    	je     80106bb9 <switchuvm+0xf9>
80106adf:	8b 46 04             	mov    0x4(%esi),%eax
80106ae2:	85 c0                	test   %eax,%eax
80106ae4:	0f 84 c2 00 00 00    	je     80106bac <switchuvm+0xec>
80106aea:	e8 01 da ff ff       	call   801044f0 <pushcli>
80106aef:	e8 4c cd ff ff       	call   80103840 <mycpu>
80106af4:	89 c3                	mov    %eax,%ebx
80106af6:	e8 45 cd ff ff       	call   80103840 <mycpu>
80106afb:	89 c7                	mov    %eax,%edi
80106afd:	e8 3e cd ff ff       	call   80103840 <mycpu>
80106b02:	83 c7 08             	add    $0x8,%edi
80106b05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106b08:	e8 33 cd ff ff       	call   80103840 <mycpu>
80106b0d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106b10:	ba 67 00 00 00       	mov    $0x67,%edx
80106b15:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106b1c:	83 c0 08             	add    $0x8,%eax
80106b1f:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106b26:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106b2b:	83 c1 08             	add    $0x8,%ecx
80106b2e:	c1 e8 18             	shr    $0x18,%eax
80106b31:	c1 e9 10             	shr    $0x10,%ecx
80106b34:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106b3a:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106b40:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106b45:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
80106b4c:	bb 10 00 00 00       	mov    $0x10,%ebx
80106b51:	e8 ea cc ff ff       	call   80103840 <mycpu>
80106b56:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106b5d:	e8 de cc ff ff       	call   80103840 <mycpu>
80106b62:	66 89 58 10          	mov    %bx,0x10(%eax)
80106b66:	8b 5e 08             	mov    0x8(%esi),%ebx
80106b69:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b6f:	e8 cc cc ff ff       	call   80103840 <mycpu>
80106b74:	89 58 0c             	mov    %ebx,0xc(%eax)
80106b77:	e8 c4 cc ff ff       	call   80103840 <mycpu>
80106b7c:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106b80:	b8 28 00 00 00       	mov    $0x28,%eax
80106b85:	0f 00 d8             	ltr    %ax
80106b88:	8b 46 04             	mov    0x4(%esi),%eax
80106b8b:	05 00 00 00 80       	add    $0x80000000,%eax
80106b90:	0f 22 d8             	mov    %eax,%cr3
80106b93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b96:	5b                   	pop    %ebx
80106b97:	5e                   	pop    %esi
80106b98:	5f                   	pop    %edi
80106b99:	5d                   	pop    %ebp
80106b9a:	e9 a1 da ff ff       	jmp    80104640 <popcli>
80106b9f:	83 ec 0c             	sub    $0xc,%esp
80106ba2:	68 1a 79 10 80       	push   $0x8010791a
80106ba7:	e8 d4 97 ff ff       	call   80100380 <panic>
80106bac:	83 ec 0c             	sub    $0xc,%esp
80106baf:	68 45 79 10 80       	push   $0x80107945
80106bb4:	e8 c7 97 ff ff       	call   80100380 <panic>
80106bb9:	83 ec 0c             	sub    $0xc,%esp
80106bbc:	68 30 79 10 80       	push   $0x80107930
80106bc1:	e8 ba 97 ff ff       	call   80100380 <panic>
80106bc6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106bcd:	00 
80106bce:	66 90                	xchg   %ax,%ax

80106bd0 <inituvm>:
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	57                   	push   %edi
80106bd4:	56                   	push   %esi
80106bd5:	53                   	push   %ebx
80106bd6:	83 ec 1c             	sub    $0x1c,%esp
80106bd9:	8b 45 08             	mov    0x8(%ebp),%eax
80106bdc:	8b 75 10             	mov    0x10(%ebp),%esi
80106bdf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106be2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106be5:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106beb:	77 49                	ja     80106c36 <inituvm+0x66>
80106bed:	e8 8e ba ff ff       	call   80102680 <kalloc>
80106bf2:	83 ec 04             	sub    $0x4,%esp
80106bf5:	68 00 10 00 00       	push   $0x1000
80106bfa:	89 c3                	mov    %eax,%ebx
80106bfc:	6a 00                	push   $0x0
80106bfe:	50                   	push   %eax
80106bff:	e8 ec da ff ff       	call   801046f0 <memset>
80106c04:	58                   	pop    %eax
80106c05:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106c0b:	5a                   	pop    %edx
80106c0c:	6a 06                	push   $0x6
80106c0e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c13:	31 d2                	xor    %edx,%edx
80106c15:	50                   	push   %eax
80106c16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c19:	e8 12 fd ff ff       	call   80106930 <mappages>
80106c1e:	89 75 10             	mov    %esi,0x10(%ebp)
80106c21:	83 c4 10             	add    $0x10,%esp
80106c24:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106c27:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106c2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c2d:	5b                   	pop    %ebx
80106c2e:	5e                   	pop    %esi
80106c2f:	5f                   	pop    %edi
80106c30:	5d                   	pop    %ebp
80106c31:	e9 4a db ff ff       	jmp    80104780 <memmove>
80106c36:	83 ec 0c             	sub    $0xc,%esp
80106c39:	68 59 79 10 80       	push   $0x80107959
80106c3e:	e8 3d 97 ff ff       	call   80100380 <panic>
80106c43:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106c4a:	00 
80106c4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80106c50 <loaduvm>:
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	57                   	push   %edi
80106c54:	56                   	push   %esi
80106c55:	53                   	push   %ebx
80106c56:	83 ec 0c             	sub    $0xc,%esp
80106c59:	8b 75 0c             	mov    0xc(%ebp),%esi
80106c5c:	8b 7d 18             	mov    0x18(%ebp),%edi
80106c5f:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106c65:	0f 85 a2 00 00 00    	jne    80106d0d <loaduvm+0xbd>
80106c6b:	85 ff                	test   %edi,%edi
80106c6d:	74 7d                	je     80106cec <loaduvm+0x9c>
80106c6f:	90                   	nop
80106c70:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c73:	8b 55 08             	mov    0x8(%ebp),%edx
80106c76:	01 f0                	add    %esi,%eax
80106c78:	89 c1                	mov    %eax,%ecx
80106c7a:	c1 e9 16             	shr    $0x16,%ecx
80106c7d:	8b 0c 8a             	mov    (%edx,%ecx,4),%ecx
80106c80:	f6 c1 01             	test   $0x1,%cl
80106c83:	75 13                	jne    80106c98 <loaduvm+0x48>
80106c85:	83 ec 0c             	sub    $0xc,%esp
80106c88:	68 73 79 10 80       	push   $0x80107973
80106c8d:	e8 ee 96 ff ff       	call   80100380 <panic>
80106c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c98:	c1 e8 0a             	shr    $0xa,%eax
80106c9b:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
80106ca1:	25 fc 0f 00 00       	and    $0xffc,%eax
80106ca6:	8d 8c 01 00 00 00 80 	lea    -0x80000000(%ecx,%eax,1),%ecx
80106cad:	85 c9                	test   %ecx,%ecx
80106caf:	74 d4                	je     80106c85 <loaduvm+0x35>
80106cb1:	89 fb                	mov    %edi,%ebx
80106cb3:	b8 00 10 00 00       	mov    $0x1000,%eax
80106cb8:	29 f3                	sub    %esi,%ebx
80106cba:	39 c3                	cmp    %eax,%ebx
80106cbc:	0f 47 d8             	cmova  %eax,%ebx
80106cbf:	53                   	push   %ebx
80106cc0:	8b 45 14             	mov    0x14(%ebp),%eax
80106cc3:	01 f0                	add    %esi,%eax
80106cc5:	50                   	push   %eax
80106cc6:	8b 01                	mov    (%ecx),%eax
80106cc8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ccd:	05 00 00 00 80       	add    $0x80000000,%eax
80106cd2:	50                   	push   %eax
80106cd3:	ff 75 10             	push   0x10(%ebp)
80106cd6:	e8 f5 ad ff ff       	call   80101ad0 <readi>
80106cdb:	83 c4 10             	add    $0x10,%esp
80106cde:	39 d8                	cmp    %ebx,%eax
80106ce0:	75 1e                	jne    80106d00 <loaduvm+0xb0>
80106ce2:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ce8:	39 fe                	cmp    %edi,%esi
80106cea:	72 84                	jb     80106c70 <loaduvm+0x20>
80106cec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cef:	31 c0                	xor    %eax,%eax
80106cf1:	5b                   	pop    %ebx
80106cf2:	5e                   	pop    %esi
80106cf3:	5f                   	pop    %edi
80106cf4:	5d                   	pop    %ebp
80106cf5:	c3                   	ret
80106cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106cfd:	00 
80106cfe:	66 90                	xchg   %ax,%ax
80106d00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d03:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106d08:	5b                   	pop    %ebx
80106d09:	5e                   	pop    %esi
80106d0a:	5f                   	pop    %edi
80106d0b:	5d                   	pop    %ebp
80106d0c:	c3                   	ret
80106d0d:	83 ec 0c             	sub    $0xc,%esp
80106d10:	68 14 7a 10 80       	push   $0x80107a14
80106d15:	e8 66 96 ff ff       	call   80100380 <panic>
80106d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d20 <allocuvm>:
80106d20:	55                   	push   %ebp
80106d21:	89 e5                	mov    %esp,%ebp
80106d23:	57                   	push   %edi
80106d24:	56                   	push   %esi
80106d25:	53                   	push   %ebx
80106d26:	83 ec 1c             	sub    $0x1c,%esp
80106d29:	8b 75 10             	mov    0x10(%ebp),%esi
80106d2c:	85 f6                	test   %esi,%esi
80106d2e:	0f 88 98 00 00 00    	js     80106dcc <allocuvm+0xac>
80106d34:	89 f2                	mov    %esi,%edx
80106d36:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106d39:	0f 82 a1 00 00 00    	jb     80106de0 <allocuvm+0xc0>
80106d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d42:	05 ff 0f 00 00       	add    $0xfff,%eax
80106d47:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d4c:	89 c7                	mov    %eax,%edi
80106d4e:	39 f0                	cmp    %esi,%eax
80106d50:	0f 83 8d 00 00 00    	jae    80106de3 <allocuvm+0xc3>
80106d56:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80106d59:	eb 44                	jmp    80106d9f <allocuvm+0x7f>
80106d5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80106d60:	83 ec 04             	sub    $0x4,%esp
80106d63:	68 00 10 00 00       	push   $0x1000
80106d68:	6a 00                	push   $0x0
80106d6a:	50                   	push   %eax
80106d6b:	e8 80 d9 ff ff       	call   801046f0 <memset>
80106d70:	58                   	pop    %eax
80106d71:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d77:	5a                   	pop    %edx
80106d78:	6a 06                	push   $0x6
80106d7a:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d7f:	89 fa                	mov    %edi,%edx
80106d81:	50                   	push   %eax
80106d82:	8b 45 08             	mov    0x8(%ebp),%eax
80106d85:	e8 a6 fb ff ff       	call   80106930 <mappages>
80106d8a:	83 c4 10             	add    $0x10,%esp
80106d8d:	85 c0                	test   %eax,%eax
80106d8f:	78 5f                	js     80106df0 <allocuvm+0xd0>
80106d91:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106d97:	39 f7                	cmp    %esi,%edi
80106d99:	0f 83 89 00 00 00    	jae    80106e28 <allocuvm+0x108>
80106d9f:	e8 dc b8 ff ff       	call   80102680 <kalloc>
80106da4:	89 c3                	mov    %eax,%ebx
80106da6:	85 c0                	test   %eax,%eax
80106da8:	75 b6                	jne    80106d60 <allocuvm+0x40>
80106daa:	83 ec 0c             	sub    $0xc,%esp
80106dad:	68 91 79 10 80       	push   $0x80107991
80106db2:	e8 f9 98 ff ff       	call   801006b0 <cprintf>
80106db7:	83 c4 10             	add    $0x10,%esp
80106dba:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106dbd:	74 0d                	je     80106dcc <allocuvm+0xac>
80106dbf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dc2:	8b 45 08             	mov    0x8(%ebp),%eax
80106dc5:	89 f2                	mov    %esi,%edx
80106dc7:	e8 a4 fa ff ff       	call   80106870 <deallocuvm.part.0>
80106dcc:	31 d2                	xor    %edx,%edx
80106dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dd1:	89 d0                	mov    %edx,%eax
80106dd3:	5b                   	pop    %ebx
80106dd4:	5e                   	pop    %esi
80106dd5:	5f                   	pop    %edi
80106dd6:	5d                   	pop    %ebp
80106dd7:	c3                   	ret
80106dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106ddf:	00 
80106de0:	8b 55 0c             	mov    0xc(%ebp),%edx
80106de3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106de6:	89 d0                	mov    %edx,%eax
80106de8:	5b                   	pop    %ebx
80106de9:	5e                   	pop    %esi
80106dea:	5f                   	pop    %edi
80106deb:	5d                   	pop    %ebp
80106dec:	c3                   	ret
80106ded:	8d 76 00             	lea    0x0(%esi),%esi
80106df0:	83 ec 0c             	sub    $0xc,%esp
80106df3:	68 a9 79 10 80       	push   $0x801079a9
80106df8:	e8 b3 98 ff ff       	call   801006b0 <cprintf>
80106dfd:	83 c4 10             	add    $0x10,%esp
80106e00:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106e03:	74 0d                	je     80106e12 <allocuvm+0xf2>
80106e05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106e08:	8b 45 08             	mov    0x8(%ebp),%eax
80106e0b:	89 f2                	mov    %esi,%edx
80106e0d:	e8 5e fa ff ff       	call   80106870 <deallocuvm.part.0>
80106e12:	83 ec 0c             	sub    $0xc,%esp
80106e15:	53                   	push   %ebx
80106e16:	e8 a5 b6 ff ff       	call   801024c0 <kfree>
80106e1b:	83 c4 10             	add    $0x10,%esp
80106e1e:	31 d2                	xor    %edx,%edx
80106e20:	eb ac                	jmp    80106dce <allocuvm+0xae>
80106e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e28:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106e2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e2e:	5b                   	pop    %ebx
80106e2f:	5e                   	pop    %esi
80106e30:	89 d0                	mov    %edx,%eax
80106e32:	5f                   	pop    %edi
80106e33:	5d                   	pop    %ebp
80106e34:	c3                   	ret
80106e35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106e3c:	00 
80106e3d:	8d 76 00             	lea    0x0(%esi),%esi

80106e40 <deallocuvm>:
80106e40:	55                   	push   %ebp
80106e41:	89 e5                	mov    %esp,%ebp
80106e43:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e46:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106e49:	8b 45 08             	mov    0x8(%ebp),%eax
80106e4c:	39 d1                	cmp    %edx,%ecx
80106e4e:	73 10                	jae    80106e60 <deallocuvm+0x20>
80106e50:	5d                   	pop    %ebp
80106e51:	e9 1a fa ff ff       	jmp    80106870 <deallocuvm.part.0>
80106e56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106e5d:	00 
80106e5e:	66 90                	xchg   %ax,%ax
80106e60:	89 d0                	mov    %edx,%eax
80106e62:	5d                   	pop    %ebp
80106e63:	c3                   	ret
80106e64:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106e6b:	00 
80106e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e70 <freevm>:
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
80106e76:	83 ec 0c             	sub    $0xc,%esp
80106e79:	8b 75 08             	mov    0x8(%ebp),%esi
80106e7c:	85 f6                	test   %esi,%esi
80106e7e:	74 59                	je     80106ed9 <freevm+0x69>
80106e80:	31 c9                	xor    %ecx,%ecx
80106e82:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106e87:	89 f0                	mov    %esi,%eax
80106e89:	89 f3                	mov    %esi,%ebx
80106e8b:	e8 e0 f9 ff ff       	call   80106870 <deallocuvm.part.0>
80106e90:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106e96:	eb 0f                	jmp    80106ea7 <freevm+0x37>
80106e98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106e9f:	00 
80106ea0:	83 c3 04             	add    $0x4,%ebx
80106ea3:	39 fb                	cmp    %edi,%ebx
80106ea5:	74 23                	je     80106eca <freevm+0x5a>
80106ea7:	8b 03                	mov    (%ebx),%eax
80106ea9:	a8 01                	test   $0x1,%al
80106eab:	74 f3                	je     80106ea0 <freevm+0x30>
80106ead:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106eb2:	83 ec 0c             	sub    $0xc,%esp
80106eb5:	83 c3 04             	add    $0x4,%ebx
80106eb8:	05 00 00 00 80       	add    $0x80000000,%eax
80106ebd:	50                   	push   %eax
80106ebe:	e8 fd b5 ff ff       	call   801024c0 <kfree>
80106ec3:	83 c4 10             	add    $0x10,%esp
80106ec6:	39 fb                	cmp    %edi,%ebx
80106ec8:	75 dd                	jne    80106ea7 <freevm+0x37>
80106eca:	89 75 08             	mov    %esi,0x8(%ebp)
80106ecd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ed0:	5b                   	pop    %ebx
80106ed1:	5e                   	pop    %esi
80106ed2:	5f                   	pop    %edi
80106ed3:	5d                   	pop    %ebp
80106ed4:	e9 e7 b5 ff ff       	jmp    801024c0 <kfree>
80106ed9:	83 ec 0c             	sub    $0xc,%esp
80106edc:	68 c5 79 10 80       	push   $0x801079c5
80106ee1:	e8 9a 94 ff ff       	call   80100380 <panic>
80106ee6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106eed:	00 
80106eee:	66 90                	xchg   %ax,%ax

80106ef0 <setupkvm>:
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	56                   	push   %esi
80106ef4:	53                   	push   %ebx
80106ef5:	e8 86 b7 ff ff       	call   80102680 <kalloc>
80106efa:	85 c0                	test   %eax,%eax
80106efc:	74 5e                	je     80106f5c <setupkvm+0x6c>
80106efe:	83 ec 04             	sub    $0x4,%esp
80106f01:	89 c6                	mov    %eax,%esi
80106f03:	bb 20 94 10 80       	mov    $0x80109420,%ebx
80106f08:	68 00 10 00 00       	push   $0x1000
80106f0d:	6a 00                	push   $0x0
80106f0f:	50                   	push   %eax
80106f10:	e8 db d7 ff ff       	call   801046f0 <memset>
80106f15:	83 c4 10             	add    $0x10,%esp
80106f18:	8b 43 04             	mov    0x4(%ebx),%eax
80106f1b:	83 ec 08             	sub    $0x8,%esp
80106f1e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106f21:	8b 13                	mov    (%ebx),%edx
80106f23:	ff 73 0c             	push   0xc(%ebx)
80106f26:	50                   	push   %eax
80106f27:	29 c1                	sub    %eax,%ecx
80106f29:	89 f0                	mov    %esi,%eax
80106f2b:	e8 00 fa ff ff       	call   80106930 <mappages>
80106f30:	83 c4 10             	add    $0x10,%esp
80106f33:	85 c0                	test   %eax,%eax
80106f35:	78 19                	js     80106f50 <setupkvm+0x60>
80106f37:	83 c3 10             	add    $0x10,%ebx
80106f3a:	81 fb 60 94 10 80    	cmp    $0x80109460,%ebx
80106f40:	75 d6                	jne    80106f18 <setupkvm+0x28>
80106f42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106f45:	89 f0                	mov    %esi,%eax
80106f47:	5b                   	pop    %ebx
80106f48:	5e                   	pop    %esi
80106f49:	5d                   	pop    %ebp
80106f4a:	c3                   	ret
80106f4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80106f50:	83 ec 0c             	sub    $0xc,%esp
80106f53:	56                   	push   %esi
80106f54:	e8 17 ff ff ff       	call   80106e70 <freevm>
80106f59:	83 c4 10             	add    $0x10,%esp
80106f5c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106f5f:	31 f6                	xor    %esi,%esi
80106f61:	89 f0                	mov    %esi,%eax
80106f63:	5b                   	pop    %ebx
80106f64:	5e                   	pop    %esi
80106f65:	5d                   	pop    %ebp
80106f66:	c3                   	ret
80106f67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106f6e:	00 
80106f6f:	90                   	nop

80106f70 <kvmalloc>:
80106f70:	55                   	push   %ebp
80106f71:	89 e5                	mov    %esp,%ebp
80106f73:	83 ec 08             	sub    $0x8,%esp
80106f76:	e8 75 ff ff ff       	call   80106ef0 <setupkvm>
80106f7b:	a3 a4 ef 11 80       	mov    %eax,0x8011efa4
80106f80:	05 00 00 00 80       	add    $0x80000000,%eax
80106f85:	0f 22 d8             	mov    %eax,%cr3
80106f88:	c9                   	leave
80106f89:	c3                   	ret
80106f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f90 <clearpteu>:
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	83 ec 08             	sub    $0x8,%esp
80106f96:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f99:	8b 55 08             	mov    0x8(%ebp),%edx
80106f9c:	89 c1                	mov    %eax,%ecx
80106f9e:	c1 e9 16             	shr    $0x16,%ecx
80106fa1:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80106fa4:	f6 c2 01             	test   $0x1,%dl
80106fa7:	75 17                	jne    80106fc0 <clearpteu+0x30>
80106fa9:	83 ec 0c             	sub    $0xc,%esp
80106fac:	68 d6 79 10 80       	push   $0x801079d6
80106fb1:	e8 ca 93 ff ff       	call   80100380 <panic>
80106fb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106fbd:	00 
80106fbe:	66 90                	xchg   %ax,%ax
80106fc0:	c1 e8 0a             	shr    $0xa,%eax
80106fc3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106fc9:	25 fc 0f 00 00       	and    $0xffc,%eax
80106fce:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
80106fd5:	85 c0                	test   %eax,%eax
80106fd7:	74 d0                	je     80106fa9 <clearpteu+0x19>
80106fd9:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106fdc:	c9                   	leave
80106fdd:	c3                   	ret
80106fde:	66 90                	xchg   %ax,%ax

80106fe0 <copyuvm>:
80106fe0:	55                   	push   %ebp
80106fe1:	89 e5                	mov    %esp,%ebp
80106fe3:	57                   	push   %edi
80106fe4:	56                   	push   %esi
80106fe5:	53                   	push   %ebx
80106fe6:	83 ec 1c             	sub    $0x1c,%esp
80106fe9:	e8 02 ff ff ff       	call   80106ef0 <setupkvm>
80106fee:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106ff1:	85 c0                	test   %eax,%eax
80106ff3:	0f 84 dd 00 00 00    	je     801070d6 <copyuvm+0xf6>
80106ff9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ffc:	85 c9                	test   %ecx,%ecx
80106ffe:	0f 84 b3 00 00 00    	je     801070b7 <copyuvm+0xd7>
80107004:	31 f6                	xor    %esi,%esi
80107006:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010700d:	00 
8010700e:	66 90                	xchg   %ax,%ax
80107010:	8b 4d 08             	mov    0x8(%ebp),%ecx
80107013:	89 f0                	mov    %esi,%eax
80107015:	c1 e8 16             	shr    $0x16,%eax
80107018:	8b 04 81             	mov    (%ecx,%eax,4),%eax
8010701b:	a8 01                	test   $0x1,%al
8010701d:	75 11                	jne    80107030 <copyuvm+0x50>
8010701f:	83 ec 0c             	sub    $0xc,%esp
80107022:	68 e0 79 10 80       	push   $0x801079e0
80107027:	e8 54 93 ff ff       	call   80100380 <panic>
8010702c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107030:	89 f2                	mov    %esi,%edx
80107032:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107037:	c1 ea 0a             	shr    $0xa,%edx
8010703a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80107040:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
80107047:	85 c0                	test   %eax,%eax
80107049:	74 d4                	je     8010701f <copyuvm+0x3f>
8010704b:	8b 18                	mov    (%eax),%ebx
8010704d:	f6 c3 01             	test   $0x1,%bl
80107050:	0f 84 92 00 00 00    	je     801070e8 <copyuvm+0x108>
80107056:	89 df                	mov    %ebx,%edi
80107058:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
8010705e:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80107064:	e8 17 b6 ff ff       	call   80102680 <kalloc>
80107069:	85 c0                	test   %eax,%eax
8010706b:	74 5b                	je     801070c8 <copyuvm+0xe8>
8010706d:	83 ec 04             	sub    $0x4,%esp
80107070:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107076:	68 00 10 00 00       	push   $0x1000
8010707b:	57                   	push   %edi
8010707c:	50                   	push   %eax
8010707d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107080:	e8 fb d6 ff ff       	call   80104780 <memmove>
80107085:	58                   	pop    %eax
80107086:	5a                   	pop    %edx
80107087:	53                   	push   %ebx
80107088:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010708b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107090:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80107096:	52                   	push   %edx
80107097:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010709a:	89 f2                	mov    %esi,%edx
8010709c:	e8 8f f8 ff ff       	call   80106930 <mappages>
801070a1:	83 c4 10             	add    $0x10,%esp
801070a4:	85 c0                	test   %eax,%eax
801070a6:	78 20                	js     801070c8 <copyuvm+0xe8>
801070a8:	81 c6 00 10 00 00    	add    $0x1000,%esi
801070ae:	3b 75 0c             	cmp    0xc(%ebp),%esi
801070b1:	0f 82 59 ff ff ff    	jb     80107010 <copyuvm+0x30>
801070b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070bd:	5b                   	pop    %ebx
801070be:	5e                   	pop    %esi
801070bf:	5f                   	pop    %edi
801070c0:	5d                   	pop    %ebp
801070c1:	c3                   	ret
801070c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070c8:	83 ec 0c             	sub    $0xc,%esp
801070cb:	ff 75 e0             	push   -0x20(%ebp)
801070ce:	e8 9d fd ff ff       	call   80106e70 <freevm>
801070d3:	83 c4 10             	add    $0x10,%esp
801070d6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
801070dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070e3:	5b                   	pop    %ebx
801070e4:	5e                   	pop    %esi
801070e5:	5f                   	pop    %edi
801070e6:	5d                   	pop    %ebp
801070e7:	c3                   	ret
801070e8:	83 ec 0c             	sub    $0xc,%esp
801070eb:	68 fa 79 10 80       	push   $0x801079fa
801070f0:	e8 8b 92 ff ff       	call   80100380 <panic>
801070f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801070fc:	00 
801070fd:	8d 76 00             	lea    0x0(%esi),%esi

80107100 <uva2ka>:
80107100:	55                   	push   %ebp
80107101:	89 e5                	mov    %esp,%ebp
80107103:	8b 45 0c             	mov    0xc(%ebp),%eax
80107106:	8b 55 08             	mov    0x8(%ebp),%edx
80107109:	89 c1                	mov    %eax,%ecx
8010710b:	c1 e9 16             	shr    $0x16,%ecx
8010710e:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107111:	f6 c2 01             	test   $0x1,%dl
80107114:	0f 84 f8 00 00 00    	je     80107212 <uva2ka.cold>
8010711a:	c1 e8 0c             	shr    $0xc,%eax
8010711d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80107123:	5d                   	pop    %ebp
80107124:	25 ff 03 00 00       	and    $0x3ff,%eax
80107129:	8b 94 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%edx
80107130:	89 d0                	mov    %edx,%eax
80107132:	f7 d2                	not    %edx
80107134:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107139:	05 00 00 00 80       	add    $0x80000000,%eax
8010713e:	83 e2 05             	and    $0x5,%edx
80107141:	ba 00 00 00 00       	mov    $0x0,%edx
80107146:	0f 45 c2             	cmovne %edx,%eax
80107149:	c3                   	ret
8010714a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107150 <copyout>:
80107150:	55                   	push   %ebp
80107151:	89 e5                	mov    %esp,%ebp
80107153:	57                   	push   %edi
80107154:	56                   	push   %esi
80107155:	53                   	push   %ebx
80107156:	83 ec 0c             	sub    $0xc,%esp
80107159:	8b 75 14             	mov    0x14(%ebp),%esi
8010715c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010715f:	8b 55 10             	mov    0x10(%ebp),%edx
80107162:	85 f6                	test   %esi,%esi
80107164:	75 51                	jne    801071b7 <copyout+0x67>
80107166:	e9 9d 00 00 00       	jmp    80107208 <copyout+0xb8>
8010716b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80107170:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80107176:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
8010717c:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
80107182:	74 74                	je     801071f8 <copyout+0xa8>
80107184:	89 fb                	mov    %edi,%ebx
80107186:	29 c3                	sub    %eax,%ebx
80107188:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010718e:	39 f3                	cmp    %esi,%ebx
80107190:	0f 47 de             	cmova  %esi,%ebx
80107193:	29 f8                	sub    %edi,%eax
80107195:	83 ec 04             	sub    $0x4,%esp
80107198:	01 c1                	add    %eax,%ecx
8010719a:	53                   	push   %ebx
8010719b:	52                   	push   %edx
8010719c:	89 55 10             	mov    %edx,0x10(%ebp)
8010719f:	51                   	push   %ecx
801071a0:	e8 db d5 ff ff       	call   80104780 <memmove>
801071a5:	8b 55 10             	mov    0x10(%ebp),%edx
801071a8:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
801071ae:	83 c4 10             	add    $0x10,%esp
801071b1:	01 da                	add    %ebx,%edx
801071b3:	29 de                	sub    %ebx,%esi
801071b5:	74 51                	je     80107208 <copyout+0xb8>
801071b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801071ba:	89 c1                	mov    %eax,%ecx
801071bc:	89 c7                	mov    %eax,%edi
801071be:	c1 e9 16             	shr    $0x16,%ecx
801071c1:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
801071c7:	8b 0c 8b             	mov    (%ebx,%ecx,4),%ecx
801071ca:	f6 c1 01             	test   $0x1,%cl
801071cd:	0f 84 46 00 00 00    	je     80107219 <copyout.cold>
801071d3:	89 fb                	mov    %edi,%ebx
801071d5:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
801071db:	c1 eb 0c             	shr    $0xc,%ebx
801071de:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
801071e4:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
801071eb:	89 d9                	mov    %ebx,%ecx
801071ed:	f7 d1                	not    %ecx
801071ef:	83 e1 05             	and    $0x5,%ecx
801071f2:	0f 84 78 ff ff ff    	je     80107170 <copyout+0x20>
801071f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107200:	5b                   	pop    %ebx
80107201:	5e                   	pop    %esi
80107202:	5f                   	pop    %edi
80107203:	5d                   	pop    %ebp
80107204:	c3                   	ret
80107205:	8d 76 00             	lea    0x0(%esi),%esi
80107208:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010720b:	31 c0                	xor    %eax,%eax
8010720d:	5b                   	pop    %ebx
8010720e:	5e                   	pop    %esi
8010720f:	5f                   	pop    %edi
80107210:	5d                   	pop    %ebp
80107211:	c3                   	ret

80107212 <uva2ka.cold>:
80107212:	a1 00 00 00 00       	mov    0x0,%eax
80107217:	0f 0b                	ud2

80107219 <copyout.cold>:
80107219:	a1 00 00 00 00       	mov    0x0,%eax
8010721e:	0f 0b                	ud2
