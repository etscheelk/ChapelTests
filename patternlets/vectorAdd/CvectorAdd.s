
CvectorAdd:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 52 2f 00 00    	pushq  0x2f52(%rip)        # 3f78 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 53 2f 00 00 	bnd jmpq *0x2f53(%rip)        # 3f80 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop

Disassembly of section .plt.got:

00000000000010d0 <__cxa_finalize@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 1d 2f 00 00 	bnd jmpq *0x2f1d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010e0 <free@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 9d 2e 00 00 	bnd jmpq *0x2e9d(%rip)        # 3f88 <free@GLIBC_2.2.5>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <omp_get_wtime@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 95 2e 00 00 	bnd jmpq *0x2e95(%rip)        # 3f90 <omp_get_wtime@OMP_2.0>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <omp_get_thread_num@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 8d 2e 00 00 	bnd jmpq *0x2e8d(%rip)        # 3f98 <omp_get_thread_num@OMP_1.0>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <__stack_chk_fail@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 85 2e 00 00 	bnd jmpq *0x2e85(%rip)        # 3fa0 <__stack_chk_fail@GLIBC_2.4>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <printf@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 7d 2e 00 00 	bnd jmpq *0x2e7d(%rip)        # 3fa8 <printf@GLIBC_2.2.5>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <omp_get_num_threads@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 75 2e 00 00 	bnd jmpq *0x2e75(%rip)        # 3fb0 <omp_get_num_threads@OMP_1.0>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <malloc@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 6d 2e 00 00 	bnd jmpq *0x2e6d(%rip)        # 3fb8 <malloc@GLIBC_2.2.5>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <atoi@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 65 2e 00 00 	bnd jmpq *0x2e65(%rip)        # 3fc0 <atoi@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <exit@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 5d 2e 00 00 	bnd jmpq *0x2e5d(%rip)        # 3fc8 <exit@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <GOMP_parallel@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 55 2e 00 00 	bnd jmpq *0x2e55(%rip)        # 3fd0 <GOMP_parallel@GOMP_4.0>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001180 <_start>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	31 ed                	xor    %ebp,%ebp
    1186:	49 89 d1             	mov    %rdx,%r9
    1189:	5e                   	pop    %rsi
    118a:	48 89 e2             	mov    %rsp,%rdx
    118d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1191:	50                   	push   %rax
    1192:	54                   	push   %rsp
    1193:	4c 8d 05 26 04 00 00 	lea    0x426(%rip),%r8        # 15c0 <__libc_csu_fini>
    119a:	48 8d 0d af 03 00 00 	lea    0x3af(%rip),%rcx        # 1550 <__libc_csu_init>
    11a1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1269 <main>
    11a8:	ff 15 32 2e 00 00    	callq  *0x2e32(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    11ae:	f4                   	hlt    
    11af:	90                   	nop

00000000000011b0 <deregister_tm_clones>:
    11b0:	48 8d 3d 59 2e 00 00 	lea    0x2e59(%rip),%rdi        # 4010 <__TMC_END__>
    11b7:	48 8d 05 52 2e 00 00 	lea    0x2e52(%rip),%rax        # 4010 <__TMC_END__>
    11be:	48 39 f8             	cmp    %rdi,%rax
    11c1:	74 15                	je     11d8 <deregister_tm_clones+0x28>
    11c3:	48 8b 05 0e 2e 00 00 	mov    0x2e0e(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    11ca:	48 85 c0             	test   %rax,%rax
    11cd:	74 09                	je     11d8 <deregister_tm_clones+0x28>
    11cf:	ff e0                	jmpq   *%rax
    11d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11d8:	c3                   	retq   
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011e0 <register_tm_clones>:
    11e0:	48 8d 3d 29 2e 00 00 	lea    0x2e29(%rip),%rdi        # 4010 <__TMC_END__>
    11e7:	48 8d 35 22 2e 00 00 	lea    0x2e22(%rip),%rsi        # 4010 <__TMC_END__>
    11ee:	48 29 fe             	sub    %rdi,%rsi
    11f1:	48 89 f0             	mov    %rsi,%rax
    11f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11f8:	48 c1 f8 03          	sar    $0x3,%rax
    11fc:	48 01 c6             	add    %rax,%rsi
    11ff:	48 d1 fe             	sar    %rsi
    1202:	74 14                	je     1218 <register_tm_clones+0x38>
    1204:	48 8b 05 e5 2d 00 00 	mov    0x2de5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    120b:	48 85 c0             	test   %rax,%rax
    120e:	74 08                	je     1218 <register_tm_clones+0x38>
    1210:	ff e0                	jmpq   *%rax
    1212:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1218:	c3                   	retq   
    1219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001220 <__do_global_dtors_aux>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	80 3d e5 2d 00 00 00 	cmpb   $0x0,0x2de5(%rip)        # 4010 <__TMC_END__>
    122b:	75 2b                	jne    1258 <__do_global_dtors_aux+0x38>
    122d:	55                   	push   %rbp
    122e:	48 83 3d c2 2d 00 00 	cmpq   $0x0,0x2dc2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1235:	00 
    1236:	48 89 e5             	mov    %rsp,%rbp
    1239:	74 0c                	je     1247 <__do_global_dtors_aux+0x27>
    123b:	48 8b 3d c6 2d 00 00 	mov    0x2dc6(%rip),%rdi        # 4008 <__dso_handle>
    1242:	e8 89 fe ff ff       	callq  10d0 <__cxa_finalize@plt>
    1247:	e8 64 ff ff ff       	callq  11b0 <deregister_tm_clones>
    124c:	c6 05 bd 2d 00 00 01 	movb   $0x1,0x2dbd(%rip)        # 4010 <__TMC_END__>
    1253:	5d                   	pop    %rbp
    1254:	c3                   	retq   
    1255:	0f 1f 00             	nopl   (%rax)
    1258:	c3                   	retq   
    1259:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001260 <frame_dummy>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	e9 77 ff ff ff       	jmpq   11e0 <register_tm_clones>

0000000000001269 <main>:
    1269:	f3 0f 1e fa          	endbr64 
    126d:	55                   	push   %rbp
    126e:	48 89 e5             	mov    %rsp,%rbp
    1271:	48 83 ec 70          	sub    $0x70,%rsp
    1275:	89 7d 9c             	mov    %edi,-0x64(%rbp)
    1278:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
    127c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1283:	00 00 
    1285:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1289:	31 c0                	xor    %eax,%eax
    128b:	c7 45 a0 a0 86 01 00 	movl   $0x186a0,-0x60(%rbp)
    1292:	83 7d 9c 01          	cmpl   $0x1,-0x64(%rbp)
    1296:	7e 16                	jle    12ae <main+0x45>
    1298:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    129c:	48 83 c0 08          	add    $0x8,%rax
    12a0:	48 8b 00             	mov    (%rax),%rax
    12a3:	48 89 c7             	mov    %rax,%rdi
    12a6:	e8 a5 fe ff ff       	callq  1150 <atoi@plt>
    12ab:	89 45 a0             	mov    %eax,-0x60(%rbp)
    12ae:	8b 45 a0             	mov    -0x60(%rbp),%eax
    12b1:	48 c1 e0 03          	shl    $0x3,%rax
    12b5:	48 89 c7             	mov    %rax,%rdi
    12b8:	e8 83 fe ff ff       	callq  1140 <malloc@plt>
    12bd:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    12c1:	8b 45 a0             	mov    -0x60(%rbp),%eax
    12c4:	48 c1 e0 03          	shl    $0x3,%rax
    12c8:	48 89 c7             	mov    %rax,%rdi
    12cb:	e8 70 fe ff ff       	callq  1140 <malloc@plt>
    12d0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    12d4:	8b 45 a0             	mov    -0x60(%rbp),%eax
    12d7:	48 c1 e0 03          	shl    $0x3,%rax
    12db:	48 89 c7             	mov    %rax,%rdi
    12de:	e8 5d fe ff ff       	callq  1140 <malloc@plt>
    12e3:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    12e7:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
    12ec:	74 16                	je     1304 <main+0x9b>
    12ee:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
    12f3:	0f 94 c2             	sete   %dl
    12f6:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
    12fb:	0f 94 c0             	sete   %al
    12fe:	09 d0                	or     %edx,%eax
    1300:	84 c0                	test   %al,%al
    1302:	74 2e                	je     1332 <main+0xc9>
    1304:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1308:	48 89 c7             	mov    %rax,%rdi
    130b:	e8 d0 fd ff ff       	callq  10e0 <free@plt>
    1310:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1314:	48 89 c7             	mov    %rax,%rdi
    1317:	e8 c4 fd ff ff       	callq  10e0 <free@plt>
    131c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1320:	48 89 c7             	mov    %rax,%rdi
    1323:	e8 b8 fd ff ff       	callq  10e0 <free@plt>
    1328:	bf 01 00 00 00       	mov    $0x1,%edi
    132d:	e8 2e fe ff ff       	callq  1160 <exit@plt>
    1332:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
    1339:	eb 60                	jmp    139b <main+0x132>
    133b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    133e:	48 98                	cltq   
    1340:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1347:	00 
    1348:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    134c:	48 01 d0             	add    %rdx,%rax
    134f:	f2 0f 10 05 d9 0c 00 	movsd  0xcd9(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    1356:	00 
    1357:	f2 0f 11 00          	movsd  %xmm0,(%rax)
    135b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    135e:	48 98                	cltq   
    1360:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1367:	00 
    1368:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    136c:	48 01 d0             	add    %rdx,%rax
    136f:	f2 0f 10 05 c1 0c 00 	movsd  0xcc1(%rip),%xmm0        # 2038 <_IO_stdin_used+0x38>
    1376:	00 
    1377:	f2 0f 11 00          	movsd  %xmm0,(%rax)
    137b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    137e:	48 98                	cltq   
    1380:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1387:	00 
    1388:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    138c:	48 01 d0             	add    %rdx,%rax
    138f:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1393:	f2 0f 11 00          	movsd  %xmm0,(%rax)
    1397:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
    139b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    139e:	39 45 a0             	cmp    %eax,-0x60(%rbp)
    13a1:	77 98                	ja     133b <main+0xd2>
    13a3:	e8 48 fd ff ff       	callq  10f0 <omp_get_wtime@plt>
    13a8:	66 48 0f 7e c0       	movq   %xmm0,%rax
    13ad:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    13b1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    13b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13b9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    13bd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    13c1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    13c5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    13c9:	8b 45 a0             	mov    -0x60(%rbp),%eax
    13cc:	89 45 e8             	mov    %eax,-0x18(%rbp)
    13cf:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    13d3:	b9 00 00 00 00       	mov    $0x0,%ecx
    13d8:	ba 00 00 00 00       	mov    $0x0,%edx
    13dd:	48 89 c6             	mov    %rax,%rsi
    13e0:	48 8d 3d 7d 00 00 00 	lea    0x7d(%rip),%rdi        # 1464 <main._omp_fn.0>
    13e7:	e8 84 fd ff ff       	callq  1170 <GOMP_parallel@plt>
    13ec:	e8 ff fc ff ff       	callq  10f0 <omp_get_wtime@plt>
    13f1:	66 48 0f 7e c0       	movq   %xmm0,%rax
    13f6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    13fa:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
    13ff:	66 0f 28 c8          	movapd %xmm0,%xmm1
    1403:	f2 0f 5c 4d c0       	subsd  -0x40(%rbp),%xmm1
    1408:	f2 0f 10 05 30 0c 00 	movsd  0xc30(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    140f:	00 
    1410:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
    1414:	48 8d 3d ed 0b 00 00 	lea    0xbed(%rip),%rdi        # 2008 <_IO_stdin_used+0x8>
    141b:	b8 01 00 00 00       	mov    $0x1,%eax
    1420:	e8 fb fc ff ff       	callq  1120 <printf@plt>
    1425:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1429:	48 89 c7             	mov    %rax,%rdi
    142c:	e8 af fc ff ff       	callq  10e0 <free@plt>
    1431:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1435:	48 89 c7             	mov    %rax,%rdi
    1438:	e8 a3 fc ff ff       	callq  10e0 <free@plt>
    143d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1441:	48 89 c7             	mov    %rax,%rdi
    1444:	e8 97 fc ff ff       	callq  10e0 <free@plt>
    1449:	b8 00 00 00 00       	mov    $0x0,%eax
    144e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1452:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1459:	00 00 
    145b:	74 05                	je     1462 <main+0x1f9>
    145d:	e8 ae fc ff ff       	callq  1110 <__stack_chk_fail@plt>
    1462:	c9                   	leaveq 
    1463:	c3                   	retq   

0000000000001464 <main._omp_fn.0>:
    1464:	f3 0f 1e fa          	endbr64 
    1468:	55                   	push   %rbp
    1469:	48 89 e5             	mov    %rsp,%rbp
    146c:	41 54                	push   %r12
    146e:	53                   	push   %rbx
    146f:	48 83 ec 30          	sub    $0x30,%rsp
    1473:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    1477:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    147b:	48 8b 40 10          	mov    0x10(%rax),%rax
    147f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1483:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1487:	48 8b 40 08          	mov    0x8(%rax),%rax
    148b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    148f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1493:	48 8b 00             	mov    (%rax),%rax
    1496:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    149a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    149e:	8b 40 18             	mov    0x18(%rax),%eax
    14a1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    14a4:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
    14a7:	e8 84 fc ff ff       	callq  1130 <omp_get_num_threads@plt>
    14ac:	41 89 c4             	mov    %eax,%r12d
    14af:	e8 4c fc ff ff       	callq  1100 <omp_get_thread_num@plt>
    14b4:	89 c6                	mov    %eax,%esi
    14b6:	89 d8                	mov    %ebx,%eax
    14b8:	99                   	cltd   
    14b9:	41 f7 fc             	idiv   %r12d
    14bc:	89 c1                	mov    %eax,%ecx
    14be:	89 d8                	mov    %ebx,%eax
    14c0:	99                   	cltd   
    14c1:	41 f7 fc             	idiv   %r12d
    14c4:	89 d0                	mov    %edx,%eax
    14c6:	39 c6                	cmp    %eax,%esi
    14c8:	7c 68                	jl     1532 <main._omp_fn.0+0xce>
    14ca:	0f af f1             	imul   %ecx,%esi
    14cd:	89 f2                	mov    %esi,%edx
    14cf:	01 d0                	add    %edx,%eax
    14d1:	8d 14 08             	lea    (%rax,%rcx,1),%edx
    14d4:	39 d0                	cmp    %edx,%eax
    14d6:	7d 64                	jge    153c <main._omp_fn.0+0xd8>
    14d8:	89 45 d0             	mov    %eax,-0x30(%rbp)
    14db:	8b 45 d0             	mov    -0x30(%rbp),%eax
    14de:	48 98                	cltq   
    14e0:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
    14e7:	00 
    14e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14ec:	48 01 c8             	add    %rcx,%rax
    14ef:	f2 0f 10 08          	movsd  (%rax),%xmm1
    14f3:	8b 45 d0             	mov    -0x30(%rbp),%eax
    14f6:	48 98                	cltq   
    14f8:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
    14ff:	00 
    1500:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1504:	48 01 c8             	add    %rcx,%rax
    1507:	f2 0f 10 00          	movsd  (%rax),%xmm0
    150b:	8b 45 d0             	mov    -0x30(%rbp),%eax
    150e:	48 98                	cltq   
    1510:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
    1517:	00 
    1518:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    151c:	48 01 c8             	add    %rcx,%rax
    151f:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    1523:	f2 0f 11 00          	movsd  %xmm0,(%rax)
    1527:	83 45 d0 01          	addl   $0x1,-0x30(%rbp)
    152b:	39 55 d0             	cmp    %edx,-0x30(%rbp)
    152e:	7c ab                	jl     14db <main._omp_fn.0+0x77>
    1530:	eb 0a                	jmp    153c <main._omp_fn.0+0xd8>
    1532:	b8 00 00 00 00       	mov    $0x0,%eax
    1537:	83 c1 01             	add    $0x1,%ecx
    153a:	eb 8e                	jmp    14ca <main._omp_fn.0+0x66>
    153c:	48 83 c4 30          	add    $0x30,%rsp
    1540:	5b                   	pop    %rbx
    1541:	41 5c                	pop    %r12
    1543:	5d                   	pop    %rbp
    1544:	c3                   	retq   
    1545:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    154c:	00 00 00 
    154f:	90                   	nop

0000000000001550 <__libc_csu_init>:
    1550:	f3 0f 1e fa          	endbr64 
    1554:	41 57                	push   %r15
    1556:	4c 8d 3d 03 28 00 00 	lea    0x2803(%rip),%r15        # 3d60 <__frame_dummy_init_array_entry>
    155d:	41 56                	push   %r14
    155f:	49 89 d6             	mov    %rdx,%r14
    1562:	41 55                	push   %r13
    1564:	49 89 f5             	mov    %rsi,%r13
    1567:	41 54                	push   %r12
    1569:	41 89 fc             	mov    %edi,%r12d
    156c:	55                   	push   %rbp
    156d:	48 8d 2d f4 27 00 00 	lea    0x27f4(%rip),%rbp        # 3d68 <__do_global_dtors_aux_fini_array_entry>
    1574:	53                   	push   %rbx
    1575:	4c 29 fd             	sub    %r15,%rbp
    1578:	48 83 ec 08          	sub    $0x8,%rsp
    157c:	e8 7f fa ff ff       	callq  1000 <_init>
    1581:	48 c1 fd 03          	sar    $0x3,%rbp
    1585:	74 1f                	je     15a6 <__libc_csu_init+0x56>
    1587:	31 db                	xor    %ebx,%ebx
    1589:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1590:	4c 89 f2             	mov    %r14,%rdx
    1593:	4c 89 ee             	mov    %r13,%rsi
    1596:	44 89 e7             	mov    %r12d,%edi
    1599:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    159d:	48 83 c3 01          	add    $0x1,%rbx
    15a1:	48 39 dd             	cmp    %rbx,%rbp
    15a4:	75 ea                	jne    1590 <__libc_csu_init+0x40>
    15a6:	48 83 c4 08          	add    $0x8,%rsp
    15aa:	5b                   	pop    %rbx
    15ab:	5d                   	pop    %rbp
    15ac:	41 5c                	pop    %r12
    15ae:	41 5d                	pop    %r13
    15b0:	41 5e                	pop    %r14
    15b2:	41 5f                	pop    %r15
    15b4:	c3                   	retq   
    15b5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    15bc:	00 00 00 00 

00000000000015c0 <__libc_csu_fini>:
    15c0:	f3 0f 1e fa          	endbr64 
    15c4:	c3                   	retq   

Disassembly of section .fini:

00000000000015c8 <_fini>:
    15c8:	f3 0f 1e fa          	endbr64 
    15cc:	48 83 ec 08          	sub    $0x8,%rsp
    15d0:	48 83 c4 08          	add    $0x8,%rsp
    15d4:	c3                   	retq   
