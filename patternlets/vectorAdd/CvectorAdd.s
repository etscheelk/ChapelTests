
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
    1020:	ff 35 4a 2f 00 00    	pushq  0x2f4a(%rip)        # 3f70 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 4b 2f 00 00 	bnd jmpq *0x2f4b(%rip)        # 3f78 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop

Disassembly of section .plt.got:

00000000000010e0 <__cxa_finalize@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 0d 2f 00 00 	bnd jmpq *0x2f0d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010f0 <free@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 85 2e 00 00 	bnd jmpq *0x2e85(%rip)        # 3f80 <free@GLIBC_2.2.5>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <omp_get_wtime@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 7d 2e 00 00 	bnd jmpq *0x2e7d(%rip)        # 3f88 <omp_get_wtime@OMP_2.0>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <omp_get_thread_num@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 75 2e 00 00 	bnd jmpq *0x2e75(%rip)        # 3f90 <omp_get_thread_num@OMP_1.0>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <__stack_chk_fail@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 6d 2e 00 00 	bnd jmpq *0x2e6d(%rip)        # 3f98 <__stack_chk_fail@GLIBC_2.4>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <memset@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 65 2e 00 00 	bnd jmpq *0x2e65(%rip)        # 3fa0 <memset@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <omp_get_num_threads@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 5d 2e 00 00 	bnd jmpq *0x2e5d(%rip)        # 3fa8 <omp_get_num_threads@OMP_1.0>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <strtol@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 55 2e 00 00 	bnd jmpq *0x2e55(%rip)        # 3fb0 <strtol@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <malloc@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 4d 2e 00 00 	bnd jmpq *0x2e4d(%rip)        # 3fb8 <malloc@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <__printf_chk@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 45 2e 00 00 	bnd jmpq *0x2e45(%rip)        # 3fc0 <__printf_chk@GLIBC_2.3.4>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001180 <exit@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 3d 2e 00 00 	bnd jmpq *0x2e3d(%rip)        # 3fc8 <exit@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001190 <GOMP_parallel@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 35 2e 00 00 	bnd jmpq *0x2e35(%rip)        # 3fd0 <GOMP_parallel@GOMP_4.0>
    119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000011a0 <main>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	41 55                	push   %r13
    11a6:	41 54                	push   %r12
    11a8:	55                   	push   %rbp
    11a9:	53                   	push   %rbx
    11aa:	bb a0 86 01 00       	mov    $0x186a0,%ebx
    11af:	48 83 ec 58          	sub    $0x58,%rsp
    11b3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    11ba:	00 00 
    11bc:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    11c1:	31 c0                	xor    %eax,%eax
    11c3:	83 ff 01             	cmp    $0x1,%edi
    11c6:	7e 12                	jle    11da <main+0x3a>
    11c8:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    11cc:	ba 0a 00 00 00       	mov    $0xa,%edx
    11d1:	31 f6                	xor    %esi,%esi
    11d3:	e8 78 ff ff ff       	callq  1150 <strtol@plt>
    11d8:	89 c3                	mov    %eax,%ebx
    11da:	41 89 dd             	mov    %ebx,%r13d
    11dd:	49 c1 e5 03          	shl    $0x3,%r13
    11e1:	4c 89 ef             	mov    %r13,%rdi
    11e4:	e8 77 ff ff ff       	callq  1160 <malloc@plt>
    11e9:	4c 89 ef             	mov    %r13,%rdi
    11ec:	49 89 c4             	mov    %rax,%r12
    11ef:	e8 6c ff ff ff       	callq  1160 <malloc@plt>
    11f4:	4c 89 ef             	mov    %r13,%rdi
    11f7:	48 89 c5             	mov    %rax,%rbp
    11fa:	e8 61 ff ff ff       	callq  1160 <malloc@plt>
    11ff:	49 89 c5             	mov    %rax,%r13
    1202:	4d 85 e4             	test   %r12,%r12
    1205:	0f 84 7b 01 00 00    	je     1386 <main+0x1e6>
    120b:	48 85 ed             	test   %rbp,%rbp
    120e:	0f 84 72 01 00 00    	je     1386 <main+0x1e6>
    1214:	48 85 c0             	test   %rax,%rax
    1217:	0f 84 69 01 00 00    	je     1386 <main+0x1e6>
    121d:	85 db                	test   %ebx,%ebx
    121f:	0f 84 a4 00 00 00    	je     12c9 <main+0x129>
    1225:	83 fb 01             	cmp    $0x1,%ebx
    1228:	0f 84 51 01 00 00    	je     137f <main+0x1df>
    122e:	89 da                	mov    %ebx,%edx
    1230:	66 0f 28 05 f8 0d 00 	movapd 0xdf8(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    1237:	00 
    1238:	4c 89 e0             	mov    %r12,%rax
    123b:	d1 ea                	shr    %edx
    123d:	48 c1 e2 04          	shl    $0x4,%rdx
    1241:	4c 01 e2             	add    %r12,%rdx
    1244:	0f 1f 40 00          	nopl   0x0(%rax)
    1248:	0f 11 00             	movups %xmm0,(%rax)
    124b:	48 83 c0 10          	add    $0x10,%rax
    124f:	48 39 d0             	cmp    %rdx,%rax
    1252:	75 f4                	jne    1248 <main+0xa8>
    1254:	89 d8                	mov    %ebx,%eax
    1256:	83 e0 fe             	and    $0xfffffffe,%eax
    1259:	f6 c3 01             	test   $0x1,%bl
    125c:	74 16                	je     1274 <main+0xd4>
    125e:	48 8b 0d eb 0d 00 00 	mov    0xdeb(%rip),%rcx        # 2050 <_IO_stdin_used+0x50>
    1265:	48 98                	cltq   
    1267:	49 89 0c c4          	mov    %rcx,(%r12,%rax,8)
    126b:	83 fb 01             	cmp    $0x1,%ebx
    126e:	0f 84 04 01 00 00    	je     1378 <main+0x1d8>
    1274:	89 da                	mov    %ebx,%edx
    1276:	66 0f 28 05 c2 0d 00 	movapd 0xdc2(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    127d:	00 
    127e:	48 89 e8             	mov    %rbp,%rax
    1281:	d1 ea                	shr    %edx
    1283:	48 c1 e2 04          	shl    $0x4,%rdx
    1287:	48 01 ea             	add    %rbp,%rdx
    128a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1290:	0f 11 00             	movups %xmm0,(%rax)
    1293:	48 83 c0 10          	add    $0x10,%rax
    1297:	48 39 d0             	cmp    %rdx,%rax
    129a:	75 f4                	jne    1290 <main+0xf0>
    129c:	89 d8                	mov    %ebx,%eax
    129e:	83 e0 fe             	and    $0xfffffffe,%eax
    12a1:	f6 c3 01             	test   $0x1,%bl
    12a4:	74 0e                	je     12b4 <main+0x114>
    12a6:	48 8b 35 ab 0d 00 00 	mov    0xdab(%rip),%rsi        # 2058 <_IO_stdin_used+0x58>
    12ad:	48 98                	cltq   
    12af:	48 89 74 c5 00       	mov    %rsi,0x0(%rbp,%rax,8)
    12b4:	8d 43 ff             	lea    -0x1(%rbx),%eax
    12b7:	31 f6                	xor    %esi,%esi
    12b9:	4c 89 ef             	mov    %r13,%rdi
    12bc:	48 8d 14 c5 08 00 00 	lea    0x8(,%rax,8),%rdx
    12c3:	00 
    12c4:	e8 67 fe ff ff       	callq  1130 <memset@plt>
    12c9:	66 48 0f 6e d5       	movq   %rbp,%xmm2
    12ce:	66 49 0f 6e cc       	movq   %r12,%xmm1
    12d3:	66 0f 6c ca          	punpcklqdq %xmm2,%xmm1
    12d7:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
    12dc:	e8 1f fe ff ff       	callq  1100 <omp_get_wtime@plt>
    12e1:	31 c9                	xor    %ecx,%ecx
    12e3:	ba 04 00 00 00       	mov    $0x4,%edx
    12e8:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
    12ec:	66 0f 6f 4c 24 10    	movdqa 0x10(%rsp),%xmm1
    12f2:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
    12f7:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
    12fc:	48 8d 3d 9d 01 00 00 	lea    0x19d(%rip),%rdi        # 14a0 <main._omp_fn.0>
    1303:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
    1309:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
    130e:	e8 7d fe ff ff       	callq  1190 <GOMP_parallel@plt>
    1313:	e8 e8 fd ff ff       	callq  1100 <omp_get_wtime@plt>
    1318:	f2 0f 5c 44 24 08    	subsd  0x8(%rsp),%xmm0
    131e:	bf 01 00 00 00       	mov    $0x1,%edi
    1323:	48 8d 35 de 0c 00 00 	lea    0xcde(%rip),%rsi        # 2008 <_IO_stdin_used+0x8>
    132a:	f2 0f 59 05 2e 0d 00 	mulsd  0xd2e(%rip),%xmm0        # 2060 <_IO_stdin_used+0x60>
    1331:	00 
    1332:	b8 01 00 00 00       	mov    $0x1,%eax
    1337:	e8 34 fe ff ff       	callq  1170 <__printf_chk@plt>
    133c:	4c 89 e7             	mov    %r12,%rdi
    133f:	e8 ac fd ff ff       	callq  10f0 <free@plt>
    1344:	48 89 ef             	mov    %rbp,%rdi
    1347:	e8 a4 fd ff ff       	callq  10f0 <free@plt>
    134c:	4c 89 ef             	mov    %r13,%rdi
    134f:	e8 9c fd ff ff       	callq  10f0 <free@plt>
    1354:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    1359:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1360:	00 00 
    1362:	75 44                	jne    13a8 <main+0x208>
    1364:	48 83 c4 58          	add    $0x58,%rsp
    1368:	31 c0                	xor    %eax,%eax
    136a:	5b                   	pop    %rbx
    136b:	5d                   	pop    %rbp
    136c:	41 5c                	pop    %r12
    136e:	41 5d                	pop    %r13
    1370:	c3                   	retq   
    1371:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1378:	31 c0                	xor    %eax,%eax
    137a:	e9 27 ff ff ff       	jmpq   12a6 <main+0x106>
    137f:	31 c0                	xor    %eax,%eax
    1381:	e9 d8 fe ff ff       	jmpq   125e <main+0xbe>
    1386:	4c 89 e7             	mov    %r12,%rdi
    1389:	e8 62 fd ff ff       	callq  10f0 <free@plt>
    138e:	48 89 ef             	mov    %rbp,%rdi
    1391:	e8 5a fd ff ff       	callq  10f0 <free@plt>
    1396:	4c 89 ef             	mov    %r13,%rdi
    1399:	e8 52 fd ff ff       	callq  10f0 <free@plt>
    139e:	bf 01 00 00 00       	mov    $0x1,%edi
    13a3:	e8 d8 fd ff ff       	callq  1180 <exit@plt>
    13a8:	e8 73 fd ff ff       	callq  1120 <__stack_chk_fail@plt>
    13ad:	0f 1f 00             	nopl   (%rax)

00000000000013b0 <_start>:
    13b0:	f3 0f 1e fa          	endbr64 
    13b4:	31 ed                	xor    %ebp,%ebp
    13b6:	49 89 d1             	mov    %rdx,%r9
    13b9:	5e                   	pop    %rsi
    13ba:	48 89 e2             	mov    %rsp,%rdx
    13bd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13c1:	50                   	push   %rax
    13c2:	54                   	push   %rsp
    13c3:	4c 8d 05 76 02 00 00 	lea    0x276(%rip),%r8        # 1640 <__libc_csu_fini>
    13ca:	48 8d 0d ff 01 00 00 	lea    0x1ff(%rip),%rcx        # 15d0 <__libc_csu_init>
    13d1:	48 8d 3d c8 fd ff ff 	lea    -0x238(%rip),%rdi        # 11a0 <main>
    13d8:	ff 15 02 2c 00 00    	callq  *0x2c02(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    13de:	f4                   	hlt    
    13df:	90                   	nop

00000000000013e0 <deregister_tm_clones>:
    13e0:	48 8d 3d 29 2c 00 00 	lea    0x2c29(%rip),%rdi        # 4010 <__TMC_END__>
    13e7:	48 8d 05 22 2c 00 00 	lea    0x2c22(%rip),%rax        # 4010 <__TMC_END__>
    13ee:	48 39 f8             	cmp    %rdi,%rax
    13f1:	74 15                	je     1408 <deregister_tm_clones+0x28>
    13f3:	48 8b 05 de 2b 00 00 	mov    0x2bde(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    13fa:	48 85 c0             	test   %rax,%rax
    13fd:	74 09                	je     1408 <deregister_tm_clones+0x28>
    13ff:	ff e0                	jmpq   *%rax
    1401:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1408:	c3                   	retq   
    1409:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001410 <register_tm_clones>:
    1410:	48 8d 3d f9 2b 00 00 	lea    0x2bf9(%rip),%rdi        # 4010 <__TMC_END__>
    1417:	48 8d 35 f2 2b 00 00 	lea    0x2bf2(%rip),%rsi        # 4010 <__TMC_END__>
    141e:	48 29 fe             	sub    %rdi,%rsi
    1421:	48 89 f0             	mov    %rsi,%rax
    1424:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1428:	48 c1 f8 03          	sar    $0x3,%rax
    142c:	48 01 c6             	add    %rax,%rsi
    142f:	48 d1 fe             	sar    %rsi
    1432:	74 14                	je     1448 <register_tm_clones+0x38>
    1434:	48 8b 05 b5 2b 00 00 	mov    0x2bb5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    143b:	48 85 c0             	test   %rax,%rax
    143e:	74 08                	je     1448 <register_tm_clones+0x38>
    1440:	ff e0                	jmpq   *%rax
    1442:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1448:	c3                   	retq   
    1449:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001450 <__do_global_dtors_aux>:
    1450:	f3 0f 1e fa          	endbr64 
    1454:	80 3d b5 2b 00 00 00 	cmpb   $0x0,0x2bb5(%rip)        # 4010 <__TMC_END__>
    145b:	75 2b                	jne    1488 <__do_global_dtors_aux+0x38>
    145d:	55                   	push   %rbp
    145e:	48 83 3d 92 2b 00 00 	cmpq   $0x0,0x2b92(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1465:	00 
    1466:	48 89 e5             	mov    %rsp,%rbp
    1469:	74 0c                	je     1477 <__do_global_dtors_aux+0x27>
    146b:	48 8b 3d 96 2b 00 00 	mov    0x2b96(%rip),%rdi        # 4008 <__dso_handle>
    1472:	e8 69 fc ff ff       	callq  10e0 <__cxa_finalize@plt>
    1477:	e8 64 ff ff ff       	callq  13e0 <deregister_tm_clones>
    147c:	c6 05 8d 2b 00 00 01 	movb   $0x1,0x2b8d(%rip)        # 4010 <__TMC_END__>
    1483:	5d                   	pop    %rbp
    1484:	c3                   	retq   
    1485:	0f 1f 00             	nopl   (%rax)
    1488:	c3                   	retq   
    1489:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001490 <frame_dummy>:
    1490:	f3 0f 1e fa          	endbr64 
    1494:	e9 77 ff ff ff       	jmpq   1410 <register_tm_clones>
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <main._omp_fn.0>:
    14a0:	f3 0f 1e fa          	endbr64 
    14a4:	41 56                	push   %r14
    14a6:	41 55                	push   %r13
    14a8:	41 54                	push   %r12
    14aa:	55                   	push   %rbp
    14ab:	53                   	push   %rbx
    14ac:	48 89 fb             	mov    %rdi,%rbx
    14af:	e8 8c fc ff ff       	callq  1140 <omp_get_num_threads@plt>
    14b4:	89 c5                	mov    %eax,%ebp
    14b6:	e8 55 fc ff ff       	callq  1110 <omp_get_thread_num@plt>
    14bb:	89 c1                	mov    %eax,%ecx
    14bd:	8b 43 18             	mov    0x18(%rbx),%eax
    14c0:	99                   	cltd   
    14c1:	f7 fd                	idiv   %ebp
    14c3:	39 d1                	cmp    %edx,%ecx
    14c5:	0f 8c ed 00 00 00    	jl     15b8 <main._omp_fn.0+0x118>
    14cb:	0f af c8             	imul   %eax,%ecx
    14ce:	01 ca                	add    %ecx,%edx
    14d0:	8d 2c 10             	lea    (%rax,%rdx,1),%ebp
    14d3:	39 ea                	cmp    %ebp,%edx
    14d5:	0f 8d b0 00 00 00    	jge    158b <main._omp_fn.0+0xeb>
    14db:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    14df:	4c 8b 43 08          	mov    0x8(%rbx),%r8
    14e3:	48 63 ca             	movslq %edx,%rcx
    14e6:	4c 8b 0b             	mov    (%rbx),%r9
    14e9:	4c 8d 14 cd 10 00 00 	lea    0x10(,%rcx,8),%r10
    14f0:	00 
    14f1:	48 8d 34 cd 00 00 00 	lea    0x0(,%rcx,8),%rsi
    14f8:	00 
    14f9:	4c 8d 1c 37          	lea    (%rdi,%rsi,1),%r11
    14fd:	4f 8d 24 10          	lea    (%r8,%r10,1),%r12
    1501:	4e 8d 2c 17          	lea    (%rdi,%r10,1),%r13
    1505:	49 8d 1c 30          	lea    (%r8,%rsi,1),%rbx
    1509:	4c 01 ce             	add    %r9,%rsi
    150c:	4d 39 e3             	cmp    %r12,%r11
    150f:	41 0f 93 c6          	setae  %r14b
    1513:	4c 39 eb             	cmp    %r13,%rbx
    1516:	41 0f 93 c4          	setae  %r12b
    151a:	4d 01 ca             	add    %r9,%r10
    151d:	45 09 f4             	or     %r14d,%r12d
    1520:	4d 39 d3             	cmp    %r10,%r11
    1523:	41 0f 93 c2          	setae  %r10b
    1527:	49 39 f5             	cmp    %rsi,%r13
    152a:	41 0f 96 c5          	setbe  %r13b
    152e:	45 09 ea             	or     %r13d,%r10d
    1531:	45 84 d4             	test   %r10b,%r12b
    1534:	74 62                	je     1598 <main._omp_fn.0+0xf8>
    1536:	44 8d 50 ff          	lea    -0x1(%rax),%r10d
    153a:	41 83 fa 02          	cmp    $0x2,%r10d
    153e:	76 58                	jbe    1598 <main._omp_fn.0+0xf8>
    1540:	41 89 c2             	mov    %eax,%r10d
    1543:	31 c9                	xor    %ecx,%ecx
    1545:	41 d1 ea             	shr    %r10d
    1548:	49 c1 e2 04          	shl    $0x4,%r10
    154c:	0f 1f 40 00          	nopl   0x0(%rax)
    1550:	66 0f 10 04 0e       	movupd (%rsi,%rcx,1),%xmm0
    1555:	66 0f 10 0c 0b       	movupd (%rbx,%rcx,1),%xmm1
    155a:	66 0f 58 c1          	addpd  %xmm1,%xmm0
    155e:	41 0f 11 04 0b       	movups %xmm0,(%r11,%rcx,1)
    1563:	48 83 c1 10          	add    $0x10,%rcx
    1567:	4c 39 d1             	cmp    %r10,%rcx
    156a:	75 e4                	jne    1550 <main._omp_fn.0+0xb0>
    156c:	89 c1                	mov    %eax,%ecx
    156e:	83 e1 fe             	and    $0xfffffffe,%ecx
    1571:	01 ca                	add    %ecx,%edx
    1573:	39 c8                	cmp    %ecx,%eax
    1575:	74 14                	je     158b <main._omp_fn.0+0xeb>
    1577:	48 63 d2             	movslq %edx,%rdx
    157a:	f2 41 0f 10 04 d1    	movsd  (%r9,%rdx,8),%xmm0
    1580:	f2 41 0f 58 04 d0    	addsd  (%r8,%rdx,8),%xmm0
    1586:	f2 0f 11 04 d7       	movsd  %xmm0,(%rdi,%rdx,8)
    158b:	5b                   	pop    %rbx
    158c:	5d                   	pop    %rbp
    158d:	41 5c                	pop    %r12
    158f:	41 5d                	pop    %r13
    1591:	41 5e                	pop    %r14
    1593:	c3                   	retq   
    1594:	0f 1f 40 00          	nopl   0x0(%rax)
    1598:	f2 41 0f 10 04 c9    	movsd  (%r9,%rcx,8),%xmm0
    159e:	f2 41 0f 58 04 c8    	addsd  (%r8,%rcx,8),%xmm0
    15a4:	f2 0f 11 04 cf       	movsd  %xmm0,(%rdi,%rcx,8)
    15a9:	48 83 c1 01          	add    $0x1,%rcx
    15ad:	39 cd                	cmp    %ecx,%ebp
    15af:	7f e7                	jg     1598 <main._omp_fn.0+0xf8>
    15b1:	eb d8                	jmp    158b <main._omp_fn.0+0xeb>
    15b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    15b8:	83 c0 01             	add    $0x1,%eax
    15bb:	31 d2                	xor    %edx,%edx
    15bd:	e9 09 ff ff ff       	jmpq   14cb <main._omp_fn.0+0x2b>
    15c2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    15c9:	00 00 00 
    15cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000015d0 <__libc_csu_init>:
    15d0:	f3 0f 1e fa          	endbr64 
    15d4:	41 57                	push   %r15
    15d6:	4c 8d 3d 7b 27 00 00 	lea    0x277b(%rip),%r15        # 3d58 <__frame_dummy_init_array_entry>
    15dd:	41 56                	push   %r14
    15df:	49 89 d6             	mov    %rdx,%r14
    15e2:	41 55                	push   %r13
    15e4:	49 89 f5             	mov    %rsi,%r13
    15e7:	41 54                	push   %r12
    15e9:	41 89 fc             	mov    %edi,%r12d
    15ec:	55                   	push   %rbp
    15ed:	48 8d 2d 6c 27 00 00 	lea    0x276c(%rip),%rbp        # 3d60 <__do_global_dtors_aux_fini_array_entry>
    15f4:	53                   	push   %rbx
    15f5:	4c 29 fd             	sub    %r15,%rbp
    15f8:	48 83 ec 08          	sub    $0x8,%rsp
    15fc:	e8 ff f9 ff ff       	callq  1000 <_init>
    1601:	48 c1 fd 03          	sar    $0x3,%rbp
    1605:	74 1f                	je     1626 <__libc_csu_init+0x56>
    1607:	31 db                	xor    %ebx,%ebx
    1609:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1610:	4c 89 f2             	mov    %r14,%rdx
    1613:	4c 89 ee             	mov    %r13,%rsi
    1616:	44 89 e7             	mov    %r12d,%edi
    1619:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    161d:	48 83 c3 01          	add    $0x1,%rbx
    1621:	48 39 dd             	cmp    %rbx,%rbp
    1624:	75 ea                	jne    1610 <__libc_csu_init+0x40>
    1626:	48 83 c4 08          	add    $0x8,%rsp
    162a:	5b                   	pop    %rbx
    162b:	5d                   	pop    %rbp
    162c:	41 5c                	pop    %r12
    162e:	41 5d                	pop    %r13
    1630:	41 5e                	pop    %r14
    1632:	41 5f                	pop    %r15
    1634:	c3                   	retq   
    1635:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    163c:	00 00 00 00 

0000000000001640 <__libc_csu_fini>:
    1640:	f3 0f 1e fa          	endbr64 
    1644:	c3                   	retq   

Disassembly of section .fini:

0000000000001648 <_fini>:
    1648:	f3 0f 1e fa          	endbr64 
    164c:	48 83 ec 08          	sub    $0x8,%rsp
    1650:	48 83 c4 08          	add    $0x8,%rsp
    1654:	c3                   	retq   
