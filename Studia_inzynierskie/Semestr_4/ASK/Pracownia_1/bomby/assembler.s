
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000000d78 <_init>:
 d78:	48 83 ec 08          	sub    $0x8,%rsp
 d7c:	48 8b 05 5d 32 20 00 	mov    0x20325d(%rip),%rax        # 203fe0 <__gmon_start__>
 d83:	48 85 c0             	test   %rax,%rax
 d86:	74 02                	je     d8a <_init+0x12>
 d88:	ff d0                	callq  *%rax
 d8a:	48 83 c4 08          	add    $0x8,%rsp
 d8e:	c3                   	retq   

Disassembly of section .plt:

0000000000000d90 <.plt>:
 d90:	ff 35 72 32 20 00    	pushq  0x203272(%rip)        # 204008 <_GLOBAL_OFFSET_TABLE_+0x8>
 d96:	ff 25 74 32 20 00    	jmpq   *0x203274(%rip)        # 204010 <_GLOBAL_OFFSET_TABLE_+0x10>
 d9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000da0 <getenv@plt>:
 da0:	ff 25 72 32 20 00    	jmpq   *0x203272(%rip)        # 204018 <getenv@GLIBC_2.2.5>
 da6:	68 00 00 00 00       	pushq  $0x0
 dab:	e9 e0 ff ff ff       	jmpq   d90 <.plt>

0000000000000db0 <__errno_location@plt>:
 db0:	ff 25 6a 32 20 00    	jmpq   *0x20326a(%rip)        # 204020 <__errno_location@GLIBC_2.2.5>
 db6:	68 01 00 00 00       	pushq  $0x1
 dbb:	e9 d0 ff ff ff       	jmpq   d90 <.plt>

0000000000000dc0 <strcpy@plt>:
 dc0:	ff 25 62 32 20 00    	jmpq   *0x203262(%rip)        # 204028 <strcpy@GLIBC_2.2.5>
 dc6:	68 02 00 00 00       	pushq  $0x2
 dcb:	e9 c0 ff ff ff       	jmpq   d90 <.plt>

0000000000000dd0 <puts@plt>:
 dd0:	ff 25 5a 32 20 00    	jmpq   *0x20325a(%rip)        # 204030 <puts@GLIBC_2.2.5>
 dd6:	68 03 00 00 00       	pushq  $0x3
 ddb:	e9 b0 ff ff ff       	jmpq   d90 <.plt>

0000000000000de0 <write@plt>:
 de0:	ff 25 52 32 20 00    	jmpq   *0x203252(%rip)        # 204038 <write@GLIBC_2.2.5>
 de6:	68 04 00 00 00       	pushq  $0x4
 deb:	e9 a0 ff ff ff       	jmpq   d90 <.plt>

0000000000000df0 <printf@plt>:
 df0:	ff 25 4a 32 20 00    	jmpq   *0x20324a(%rip)        # 204040 <printf@GLIBC_2.2.5>
 df6:	68 05 00 00 00       	pushq  $0x5
 dfb:	e9 90 ff ff ff       	jmpq   d90 <.plt>

0000000000000e00 <alarm@plt>:
 e00:	ff 25 42 32 20 00    	jmpq   *0x203242(%rip)        # 204048 <alarm@GLIBC_2.2.5>
 e06:	68 06 00 00 00       	pushq  $0x6
 e0b:	e9 80 ff ff ff       	jmpq   d90 <.plt>

0000000000000e10 <close@plt>:
 e10:	ff 25 3a 32 20 00    	jmpq   *0x20323a(%rip)        # 204050 <close@GLIBC_2.2.5>
 e16:	68 07 00 00 00       	pushq  $0x7
 e1b:	e9 70 ff ff ff       	jmpq   d90 <.plt>

0000000000000e20 <read@plt>:
 e20:	ff 25 32 32 20 00    	jmpq   *0x203232(%rip)        # 204058 <read@GLIBC_2.2.5>
 e26:	68 08 00 00 00       	pushq  $0x8
 e2b:	e9 60 ff ff ff       	jmpq   d90 <.plt>

0000000000000e30 <fgets@plt>:
 e30:	ff 25 2a 32 20 00    	jmpq   *0x20322a(%rip)        # 204060 <fgets@GLIBC_2.2.5>
 e36:	68 09 00 00 00       	pushq  $0x9
 e3b:	e9 50 ff ff ff       	jmpq   d90 <.plt>

0000000000000e40 <signal@plt>:
 e40:	ff 25 22 32 20 00    	jmpq   *0x203222(%rip)        # 204068 <signal@GLIBC_2.2.5>
 e46:	68 0a 00 00 00       	pushq  $0xa
 e4b:	e9 40 ff ff ff       	jmpq   d90 <.plt>

0000000000000e50 <gethostbyname@plt>:
 e50:	ff 25 1a 32 20 00    	jmpq   *0x20321a(%rip)        # 204070 <gethostbyname@GLIBC_2.2.5>
 e56:	68 0b 00 00 00       	pushq  $0xb
 e5b:	e9 30 ff ff ff       	jmpq   d90 <.plt>

0000000000000e60 <fprintf@plt>:
 e60:	ff 25 12 32 20 00    	jmpq   *0x203212(%rip)        # 204078 <fprintf@GLIBC_2.2.5>
 e66:	68 0c 00 00 00       	pushq  $0xc
 e6b:	e9 20 ff ff ff       	jmpq   d90 <.plt>

0000000000000e70 <strtol@plt>:
 e70:	ff 25 0a 32 20 00    	jmpq   *0x20320a(%rip)        # 204080 <strtol@GLIBC_2.2.5>
 e76:	68 0d 00 00 00       	pushq  $0xd
 e7b:	e9 10 ff ff ff       	jmpq   d90 <.plt>

0000000000000e80 <fflush@plt>:
 e80:	ff 25 02 32 20 00    	jmpq   *0x203202(%rip)        # 204088 <fflush@GLIBC_2.2.5>
 e86:	68 0e 00 00 00       	pushq  $0xe
 e8b:	e9 00 ff ff ff       	jmpq   d90 <.plt>

0000000000000e90 <__isoc99_sscanf@plt>:
 e90:	ff 25 fa 31 20 00    	jmpq   *0x2031fa(%rip)        # 204090 <__isoc99_sscanf@GLIBC_2.7>
 e96:	68 0f 00 00 00       	pushq  $0xf
 e9b:	e9 f0 fe ff ff       	jmpq   d90 <.plt>

0000000000000ea0 <bcopy@plt>:
 ea0:	ff 25 f2 31 20 00    	jmpq   *0x2031f2(%rip)        # 204098 <bcopy@GLIBC_2.2.5>
 ea6:	68 10 00 00 00       	pushq  $0x10
 eab:	e9 e0 fe ff ff       	jmpq   d90 <.plt>

0000000000000eb0 <fopen@plt>:
 eb0:	ff 25 ea 31 20 00    	jmpq   *0x2031ea(%rip)        # 2040a0 <fopen@GLIBC_2.2.5>
 eb6:	68 11 00 00 00       	pushq  $0x11
 ebb:	e9 d0 fe ff ff       	jmpq   d90 <.plt>

0000000000000ec0 <sprintf@plt>:
 ec0:	ff 25 e2 31 20 00    	jmpq   *0x2031e2(%rip)        # 2040a8 <sprintf@GLIBC_2.2.5>
 ec6:	68 12 00 00 00       	pushq  $0x12
 ecb:	e9 c0 fe ff ff       	jmpq   d90 <.plt>

0000000000000ed0 <exit@plt>:
 ed0:	ff 25 da 31 20 00    	jmpq   *0x2031da(%rip)        # 2040b0 <exit@GLIBC_2.2.5>
 ed6:	68 13 00 00 00       	pushq  $0x13
 edb:	e9 b0 fe ff ff       	jmpq   d90 <.plt>

0000000000000ee0 <connect@plt>:
 ee0:	ff 25 d2 31 20 00    	jmpq   *0x2031d2(%rip)        # 2040b8 <connect@GLIBC_2.2.5>
 ee6:	68 14 00 00 00       	pushq  $0x14
 eeb:	e9 a0 fe ff ff       	jmpq   d90 <.plt>

0000000000000ef0 <sleep@plt>:
 ef0:	ff 25 ca 31 20 00    	jmpq   *0x2031ca(%rip)        # 2040c0 <sleep@GLIBC_2.2.5>
 ef6:	68 15 00 00 00       	pushq  $0x15
 efb:	e9 90 fe ff ff       	jmpq   d90 <.plt>

0000000000000f00 <__ctype_b_loc@plt>:
 f00:	ff 25 c2 31 20 00    	jmpq   *0x2031c2(%rip)        # 2040c8 <__ctype_b_loc@GLIBC_2.3>
 f06:	68 16 00 00 00       	pushq  $0x16
 f0b:	e9 80 fe ff ff       	jmpq   d90 <.plt>

0000000000000f10 <socket@plt>:
 f10:	ff 25 ba 31 20 00    	jmpq   *0x2031ba(%rip)        # 2040d0 <socket@GLIBC_2.2.5>
 f16:	68 17 00 00 00       	pushq  $0x17
 f1b:	e9 70 fe ff ff       	jmpq   d90 <.plt>

Disassembly of section .plt.got:

0000000000000f20 <__cxa_finalize@plt>:
 f20:	ff 25 d2 30 20 00    	jmpq   *0x2030d2(%rip)        # 203ff8 <__cxa_finalize@GLIBC_2.2.5>
 f26:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000f30 <_start>:
     f30:	31 ed                	xor    %ebp,%ebp
     f32:	49 89 d1             	mov    %rdx,%r9
     f35:	5e                   	pop    %rsi
     f36:	48 89 e2             	mov    %rsp,%rdx
     f39:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
     f3d:	50                   	push   %rax
     f3e:	54                   	push   %rsp
     f3f:	4c 8d 05 7a 15 00 00 	lea    0x157a(%rip),%r8        # 24c0 <__libc_csu_fini>
     f46:	48 8d 0d 03 15 00 00 	lea    0x1503(%rip),%rcx        # 2450 <__libc_csu_init>
     f4d:	48 8d 3d 0c 01 00 00 	lea    0x10c(%rip),%rdi        # 1060 <main>
     f54:	ff 15 7e 30 20 00    	callq  *0x20307e(%rip)        # 203fd8 <__libc_start_main@GLIBC_2.2.5>
     f5a:	f4                   	hlt    
     f5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000f60 <deregister_tm_clones>:
     f60:	48 8d 3d d9 37 20 00 	lea    0x2037d9(%rip),%rdi        # 204740 <stdout@@GLIBC_2.2.5>
     f67:	48 8d 05 d9 37 20 00 	lea    0x2037d9(%rip),%rax        # 204747 <__TMC_END__+0x7>
     f6e:	55                   	push   %rbp
     f6f:	48 29 f8             	sub    %rdi,%rax
     f72:	48 89 e5             	mov    %rsp,%rbp
     f75:	48 83 f8 0e          	cmp    $0xe,%rax
     f79:	76 15                	jbe    f90 <deregister_tm_clones+0x30>
     f7b:	48 8b 05 4e 30 20 00 	mov    0x20304e(%rip),%rax        # 203fd0 <_ITM_deregisterTMCloneTable>
     f82:	48 85 c0             	test   %rax,%rax
     f85:	74 09                	je     f90 <deregister_tm_clones+0x30>
     f87:	5d                   	pop    %rbp
     f88:	ff e0                	jmpq   *%rax
     f8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     f90:	5d                   	pop    %rbp
     f91:	c3                   	retq   
     f92:	0f 1f 40 00          	nopl   0x0(%rax)
     f96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     f9d:	00 00 00 

0000000000000fa0 <register_tm_clones>:
     fa0:	48 8d 3d 99 37 20 00 	lea    0x203799(%rip),%rdi        # 204740 <stdout@@GLIBC_2.2.5>
     fa7:	48 8d 35 92 37 20 00 	lea    0x203792(%rip),%rsi        # 204740 <stdout@@GLIBC_2.2.5>
     fae:	55                   	push   %rbp
     faf:	48 29 fe             	sub    %rdi,%rsi
     fb2:	48 89 e5             	mov    %rsp,%rbp
     fb5:	48 c1 fe 03          	sar    $0x3,%rsi
     fb9:	48 89 f0             	mov    %rsi,%rax
     fbc:	48 c1 e8 3f          	shr    $0x3f,%rax
     fc0:	48 01 c6             	add    %rax,%rsi
     fc3:	48 d1 fe             	sar    %rsi
     fc6:	74 18                	je     fe0 <register_tm_clones+0x40>
     fc8:	48 8b 05 21 30 20 00 	mov    0x203021(%rip),%rax        # 203ff0 <_ITM_registerTMCloneTable>
     fcf:	48 85 c0             	test   %rax,%rax
     fd2:	74 0c                	je     fe0 <register_tm_clones+0x40>
     fd4:	5d                   	pop    %rbp
     fd5:	ff e0                	jmpq   *%rax
     fd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     fde:	00 00 
     fe0:	5d                   	pop    %rbp
     fe1:	c3                   	retq   
     fe2:	0f 1f 40 00          	nopl   0x0(%rax)
     fe6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     fed:	00 00 00 

0000000000000ff0 <__do_global_dtors_aux>:
     ff0:	80 3d 71 37 20 00 00 	cmpb   $0x0,0x203771(%rip)        # 204768 <completed.6972>
     ff7:	75 27                	jne    1020 <__do_global_dtors_aux+0x30>
     ff9:	48 83 3d f7 2f 20 00 	cmpq   $0x0,0x202ff7(%rip)        # 203ff8 <__cxa_finalize@GLIBC_2.2.5>
    1000:	00 
    1001:	55                   	push   %rbp
    1002:	48 89 e5             	mov    %rsp,%rbp
    1005:	74 0c                	je     1013 <__do_global_dtors_aux+0x23>
    1007:	48 8b 3d da 30 20 00 	mov    0x2030da(%rip),%rdi        # 2040e8 <__dso_handle>
    100e:	e8 0d ff ff ff       	callq  f20 <__cxa_finalize@plt>
    1013:	e8 48 ff ff ff       	callq  f60 <deregister_tm_clones>
    1018:	5d                   	pop    %rbp
    1019:	c6 05 48 37 20 00 01 	movb   $0x1,0x203748(%rip)        # 204768 <completed.6972>
    1020:	f3 c3                	repz retq 
    1022:	0f 1f 40 00          	nopl   0x0(%rax)
    1026:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    102d:	00 00 00 

0000000000001030 <frame_dummy>:
    1030:	48 8d 3d b1 2d 20 00 	lea    0x202db1(%rip),%rdi        # 203de8 <__JCR_END__>
    1037:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    103b:	75 0b                	jne    1048 <frame_dummy+0x18>
    103d:	e9 5e ff ff ff       	jmpq   fa0 <register_tm_clones>
    1042:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1048:	48 8b 05 99 2f 20 00 	mov    0x202f99(%rip),%rax        # 203fe8 <_Jv_RegisterClasses>
    104f:	48 85 c0             	test   %rax,%rax
    1052:	74 e9                	je     103d <frame_dummy+0xd>
    1054:	55                   	push   %rbp
    1055:	48 89 e5             	mov    %rsp,%rbp
    1058:	ff d0                	callq  *%rax
    105a:	5d                   	pop    %rbp
    105b:	e9 40 ff ff ff       	jmpq   fa0 <register_tm_clones>

0000000000001060 <main>:
    1060:	53                   	push   %rbx
    1061:	83 ff 01             	cmp    $0x1,%edi
    1064:	0f 84 f8 00 00 00    	je     1162 <main+0x102>
    106a:	48 89 f3             	mov    %rsi,%rbx
    106d:	83 ff 02             	cmp    $0x2,%edi
    1070:	0f 85 1c 01 00 00    	jne    1192 <main+0x132>
    1076:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    107a:	48 8d 35 53 14 00 00 	lea    0x1453(%rip),%rsi        # 24d4 <_IO_stdin_used+0x4>
    1081:	e8 2a fe ff ff       	callq  eb0 <fopen@plt>
    1086:	48 89 05 e3 36 20 00 	mov    %rax,0x2036e3(%rip)        # 204770 <infile>
    108d:	48 85 c0             	test   %rax,%rax
    1090:	0f 84 df 00 00 00    	je     1175 <main+0x115>
    1096:	e8 88 05 00 00       	callq  1623 <initialize_bomb>
    109b:	48 8d 3d b6 14 00 00 	lea    0x14b6(%rip),%rdi        # 2558 <_IO_stdin_used+0x88>
    10a2:	e8 29 fd ff ff       	callq  dd0 <puts@plt>
    10a7:	48 8d 3d ea 14 00 00 	lea    0x14ea(%rip),%rdi        # 2598 <_IO_stdin_used+0xc8>
    10ae:	e8 1d fd ff ff       	callq  dd0 <puts@plt>
    10b3:	e8 77 06 00 00       	callq  172f <read_line>
    10b8:	48 89 c7             	mov    %rax,%rdi
    10bb:	e8 f0 00 00 00       	callq  11b0 <phase_1>
    10c0:	e8 af 07 00 00       	callq  1874 <phase_defused>
    10c5:	48 8d 3d fc 14 00 00 	lea    0x14fc(%rip),%rdi        # 25c8 <_IO_stdin_used+0xf8>
    10cc:	e8 ff fc ff ff       	callq  dd0 <puts@plt>
    10d1:	e8 59 06 00 00       	callq  172f <read_line>
    10d6:	48 89 c7             	mov    %rax,%rdi
    10d9:	e8 f2 00 00 00       	callq  11d0 <phase_2>
    10de:	e8 91 07 00 00       	callq  1874 <phase_defused>
    10e3:	48 8d 3d 23 14 00 00 	lea    0x1423(%rip),%rdi        # 250d <_IO_stdin_used+0x3d>
    10ea:	e8 e1 fc ff ff       	callq  dd0 <puts@plt>
    10ef:	e8 3b 06 00 00       	callq  172f <read_line>
    10f4:	48 89 c7             	mov    %rax,%rdi
    10f7:	e8 1d 01 00 00       	callq  1219 <phase_3>
    10fc:	e8 73 07 00 00       	callq  1874 <phase_defused>
    1101:	48 8d 3d 23 14 00 00 	lea    0x1423(%rip),%rdi        # 252b <_IO_stdin_used+0x5b>
    1108:	e8 c3 fc ff ff       	callq  dd0 <puts@plt>
    110d:	e8 1d 06 00 00       	callq  172f <read_line>
    1112:	48 89 c7             	mov    %rax,%rdi
    1115:	e8 cb 01 00 00       	callq  12e5 <phase_4>
    111a:	e8 55 07 00 00       	callq  1874 <phase_defused>
    111f:	48 8d 3d d2 14 00 00 	lea    0x14d2(%rip),%rdi        # 25f8 <_IO_stdin_used+0x128>
    1126:	e8 a5 fc ff ff       	callq  dd0 <puts@plt>
    112b:	e8 ff 05 00 00       	callq  172f <read_line>
    1130:	48 89 c7             	mov    %rax,%rdi
    1133:	e8 0a 02 00 00       	callq  1342 <phase_5>
    1138:	e8 37 07 00 00       	callq  1874 <phase_defused>
    113d:	48 8d 3d f6 13 00 00 	lea    0x13f6(%rip),%rdi        # 253a <_IO_stdin_used+0x6a>
    1144:	e8 87 fc ff ff       	callq  dd0 <puts@plt>
    1149:	e8 e1 05 00 00       	callq  172f <read_line>
    114e:	48 89 c7             	mov    %rax,%rdi
    1151:	e8 4f 02 00 00       	callq  13a5 <phase_6>
    1156:	e8 19 07 00 00       	callq  1874 <phase_defused>
    115b:	b8 00 00 00 00       	mov    $0x0,%eax
    1160:	5b                   	pop    %rbx
    1161:	c3                   	retq   
    1162:	48 8b 05 e7 35 20 00 	mov    0x2035e7(%rip),%rax        # 204750 <stdin@@GLIBC_2.2.5>
    1169:	48 89 05 00 36 20 00 	mov    %rax,0x203600(%rip)        # 204770 <infile>
    1170:	e9 21 ff ff ff       	jmpq   1096 <main+0x36>
    1175:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    1179:	48 8b 33             	mov    (%rbx),%rsi
    117c:	48 8d 3d 53 13 00 00 	lea    0x1353(%rip),%rdi        # 24d6 <_IO_stdin_used+0x6>
    1183:	e8 68 fc ff ff       	callq  df0 <printf@plt>
    1188:	bf 08 00 00 00       	mov    $0x8,%edi
    118d:	e8 3e fd ff ff       	callq  ed0 <exit@plt>
    1192:	48 8b 36             	mov    (%rsi),%rsi
    1195:	48 8d 3d 57 13 00 00 	lea    0x1357(%rip),%rdi        # 24f3 <_IO_stdin_used+0x23>
    119c:	b8 00 00 00 00       	mov    $0x0,%eax
    11a1:	e8 4a fc ff ff       	callq  df0 <printf@plt>
    11a6:	bf 08 00 00 00       	mov    $0x8,%edi
    11ab:	e8 20 fd ff ff       	callq  ed0 <exit@plt>

00000000000011b0 <phase_1>:
    11b0:	48 83 ec 08          	sub    $0x8,%rsp
    11b4:	48 8d 35 65 14 00 00 	lea    0x1465(%rip),%rsi        # 2620 <_IO_stdin_used+0x150>
    11bb:	e8 fc 03 00 00       	callq  15bc <strings_not_equal>
    11c0:	85 c0                	test   %eax,%eax
    11c2:	75 05                	jne    11c9 <phase_1+0x19>
    11c4:	48 83 c4 08          	add    $0x8,%rsp
    11c8:	c3                   	retq   
    11c9:	e8 fa 04 00 00       	callq  16c8 <explode_bomb>
    11ce:	eb f4                	jmp    11c4 <phase_1+0x14>

00000000000011d0 <phase_2>:
    11d0:	55                   	push   %rbp
    11d1:	53                   	push   %rbx
    11d2:	48 83 ec 28          	sub    $0x28,%rsp
    11d6:	48 89 e6             	mov    %rsp,%rsi
    11d9:	e8 10 05 00 00       	callq  16ee <read_six_numbers>
    11de:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    11e2:	78 0a                	js     11ee <phase_2+0x1e>
    11e4:	48 89 e5             	mov    %rsp,%rbp
    11e7:	bb 01 00 00 00       	mov    $0x1,%ebx
    11ec:	eb 13                	jmp    1201 <phase_2+0x31>
    11ee:	e8 d5 04 00 00       	callq  16c8 <explode_bomb>
    11f3:	eb ef                	jmp    11e4 <phase_2+0x14>
    11f5:	83 c3 01             	add    $0x1,%ebx
    11f8:	48 83 c5 04          	add    $0x4,%rbp
    11fc:	83 fb 06             	cmp    $0x6,%ebx
    11ff:	74 11                	je     1212 <phase_2+0x42>
    1201:	89 d8                	mov    %ebx,%eax
    1203:	03 45 00             	add    0x0(%rbp),%eax
    1206:	39 45 04             	cmp    %eax,0x4(%rbp)
    1209:	74 ea                	je     11f5 <phase_2+0x25>
    120b:	e8 b8 04 00 00       	callq  16c8 <explode_bomb>
    1210:	eb e3                	jmp    11f5 <phase_2+0x25>
    1212:	48 83 c4 28          	add    $0x28,%rsp
    1216:	5b                   	pop    %rbx
    1217:	5d                   	pop    %rbp
    1218:	c3                   	retq   

0000000000001219 <phase_3>:
    1219:	48 83 ec 18          	sub    $0x18,%rsp
    121d:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1222:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1227:	48 8d 35 a1 15 00 00 	lea    0x15a1(%rip),%rsi        # 27cf <array.3094+0x11f>
    122e:	b8 00 00 00 00       	mov    $0x0,%eax
    1233:	e8 58 fc ff ff       	callq  e90 <__isoc99_sscanf@plt>
    1238:	83 f8 01             	cmp    $0x1,%eax
    123b:	7e 1b                	jle    1258 <phase_3+0x3f>
    123d:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
    1242:	77 4c                	ja     1290 <phase_3+0x77>
    1244:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1248:	48 8d 15 41 14 00 00 	lea    0x1441(%rip),%rdx        # 2690 <_IO_stdin_used+0x1c0>
    124f:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    1253:	48 01 d0             	add    %rdx,%rax
    1256:	ff e0                	jmpq   *%rax
    1258:	e8 6b 04 00 00       	callq  16c8 <explode_bomb>
    125d:	eb de                	jmp    123d <phase_3+0x24>
    125f:	b8 8a 01 00 00       	mov    $0x18a,%eax
    1264:	eb 3b                	jmp    12a1 <phase_3+0x88>
    1266:	b8 81 00 00 00       	mov    $0x81,%eax
    126b:	eb 34                	jmp    12a1 <phase_3+0x88>
    126d:	b8 61 03 00 00       	mov    $0x361,%eax
    1272:	eb 2d                	jmp    12a1 <phase_3+0x88>
    1274:	b8 f7 00 00 00       	mov    $0xf7,%eax
    1279:	eb 26                	jmp    12a1 <phase_3+0x88>
    127b:	b8 a3 00 00 00       	mov    $0xa3,%eax
    1280:	eb 1f                	jmp    12a1 <phase_3+0x88>
    1282:	b8 5a 03 00 00       	mov    $0x35a,%eax
    1287:	eb 18                	jmp    12a1 <phase_3+0x88>
    1289:	b8 45 02 00 00       	mov    $0x245,%eax
    128e:	eb 11                	jmp    12a1 <phase_3+0x88>
    1290:	e8 33 04 00 00       	callq  16c8 <explode_bomb>
    1295:	b8 00 00 00 00       	mov    $0x0,%eax
    129a:	eb 05                	jmp    12a1 <phase_3+0x88>
    129c:	b8 b1 03 00 00       	mov    $0x3b1,%eax
    12a1:	3b 44 24 08          	cmp    0x8(%rsp),%eax
    12a5:	74 05                	je     12ac <phase_3+0x93>
    12a7:	e8 1c 04 00 00       	callq  16c8 <explode_bomb>
    12ac:	48 83 c4 18          	add    $0x18,%rsp
    12b0:	c3                   	retq   

00000000000012b1 <func4>:
    12b1:	53                   	push   %rbx
    12b2:	89 d0                	mov    %edx,%eax
    12b4:	29 f0                	sub    %esi,%eax
    12b6:	89 c3                	mov    %eax,%ebx
    12b8:	c1 eb 1f             	shr    $0x1f,%ebx
    12bb:	01 c3                	add    %eax,%ebx
    12bd:	d1 fb                	sar    %ebx
    12bf:	01 f3                	add    %esi,%ebx
    12c1:	39 fb                	cmp    %edi,%ebx
    12c3:	7f 08                	jg     12cd <func4+0x1c>
    12c5:	39 fb                	cmp    %edi,%ebx
    12c7:	7c 10                	jl     12d9 <func4+0x28>
    12c9:	89 d8                	mov    %ebx,%eax
    12cb:	5b                   	pop    %rbx
    12cc:	c3                   	retq   
    12cd:	8d 53 ff             	lea    -0x1(%rbx),%edx
    12d0:	e8 dc ff ff ff       	callq  12b1 <func4>
    12d5:	01 c3                	add    %eax,%ebx
    12d7:	eb f0                	jmp    12c9 <func4+0x18>
    12d9:	8d 73 01             	lea    0x1(%rbx),%esi
    12dc:	e8 d0 ff ff ff       	callq  12b1 <func4>
    12e1:	01 c3                	add    %eax,%ebx
    12e3:	eb e4                	jmp    12c9 <func4+0x18>

00000000000012e5 <phase_4>:
    12e5:	48 83 ec 18          	sub    $0x18,%rsp
    12e9:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    12ee:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    12f3:	48 8d 35 d5 14 00 00 	lea    0x14d5(%rip),%rsi        # 27cf <array.3094+0x11f>
    12fa:	b8 00 00 00 00       	mov    $0x0,%eax
    12ff:	e8 8c fb ff ff       	callq  e90 <__isoc99_sscanf@plt>
    1304:	83 f8 02             	cmp    $0x2,%eax
    1307:	74 27                	je     1330 <phase_4+0x4b>
    1309:	e8 ba 03 00 00       	callq  16c8 <explode_bomb>
    130e:	ba 0e 00 00 00       	mov    $0xe,%edx
    1313:	be 00 00 00 00       	mov    $0x0,%esi
    1318:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    131c:	e8 90 ff ff ff       	callq  12b1 <func4>
    1321:	83 f8 12             	cmp    $0x12,%eax
    1324:	74 13                	je     1339 <phase_4+0x54>
    1326:	e8 9d 03 00 00       	callq  16c8 <explode_bomb>
    132b:	48 83 c4 18          	add    $0x18,%rsp
    132f:	c3                   	retq   
    1330:	83 7c 24 0c 0e       	cmpl   $0xe,0xc(%rsp)
    1335:	76 d7                	jbe    130e <phase_4+0x29>
    1337:	eb d0                	jmp    1309 <phase_4+0x24>
    1339:	83 7c 24 08 12       	cmpl   $0x12,0x8(%rsp)
    133e:	75 e6                	jne    1326 <phase_4+0x41>
    1340:	eb e9                	jmp    132b <phase_4+0x46>

0000000000001342 <phase_5>:
    1342:	53                   	push   %rbx
    1343:	48 83 ec 10          	sub    $0x10,%rsp
    1347:	48 89 fb             	mov    %rdi,%rbx
    134a:	e8 4f 02 00 00       	callq  159e <string_length>
    134f:	83 f8 06             	cmp    $0x6,%eax
    1352:	74 05                	je     1359 <phase_5+0x17>
    1354:	e8 6f 03 00 00       	callq  16c8 <explode_bomb>
    1359:	b8 00 00 00 00       	mov    $0x0,%eax
    135e:	48 8d 0d 4b 13 00 00 	lea    0x134b(%rip),%rcx        # 26b0 <array.3094>
    1365:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    1369:	83 e2 0f             	and    $0xf,%edx
    136c:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
    1370:	88 54 04 09          	mov    %dl,0x9(%rsp,%rax,1)
    1374:	48 83 c0 01          	add    $0x1,%rax
    1378:	48 83 f8 06          	cmp    $0x6,%rax
    137c:	75 e7                	jne    1365 <phase_5+0x23>
    137e:	c6 44 24 0f 00       	movb   $0x0,0xf(%rsp)
    1383:	48 8d 7c 24 09       	lea    0x9(%rsp),%rdi
    1388:	48 8d 35 ef 12 00 00 	lea    0x12ef(%rip),%rsi        # 267e <_IO_stdin_used+0x1ae>
    138f:	e8 28 02 00 00       	callq  15bc <strings_not_equal>
    1394:	85 c0                	test   %eax,%eax
    1396:	75 06                	jne    139e <phase_5+0x5c>
    1398:	48 83 c4 10          	add    $0x10,%rsp
    139c:	5b                   	pop    %rbx
    139d:	c3                   	retq   
    139e:	e8 25 03 00 00       	callq  16c8 <explode_bomb>
    13a3:	eb f3                	jmp    1398 <phase_5+0x56>

00000000000013a5 <phase_6>:
    13a5:	41 55                	push   %r13
    13a7:	41 54                	push   %r12
    13a9:	55                   	push   %rbp
    13aa:	53                   	push   %rbx
    13ab:	48 83 ec 58          	sub    $0x58,%rsp
    13af:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
    13b4:	4c 89 e6             	mov    %r12,%rsi
    13b7:	e8 32 03 00 00       	callq  16ee <read_six_numbers>
    13bc:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    13c2:	eb 25                	jmp    13e9 <phase_6+0x44>
    13c4:	41 83 c5 01          	add    $0x1,%r13d
    13c8:	41 83 fd 06          	cmp    $0x6,%r13d
    13cc:	74 38                	je     1406 <phase_6+0x61>
    13ce:	44 89 eb             	mov    %r13d,%ebx
    13d1:	48 63 c3             	movslq %ebx,%rax
    13d4:	8b 44 84 30          	mov    0x30(%rsp,%rax,4),%eax
    13d8:	39 45 00             	cmp    %eax,0x0(%rbp)
    13db:	74 22                	je     13ff <phase_6+0x5a>
    13dd:	83 c3 01             	add    $0x1,%ebx
    13e0:	83 fb 05             	cmp    $0x5,%ebx
    13e3:	7e ec                	jle    13d1 <phase_6+0x2c>
    13e5:	49 83 c4 04          	add    $0x4,%r12
    13e9:	4c 89 e5             	mov    %r12,%rbp
    13ec:	41 8b 04 24          	mov    (%r12),%eax
    13f0:	83 e8 01             	sub    $0x1,%eax
    13f3:	83 f8 05             	cmp    $0x5,%eax
    13f6:	76 cc                	jbe    13c4 <phase_6+0x1f>
    13f8:	e8 cb 02 00 00       	callq  16c8 <explode_bomb>
    13fd:	eb c5                	jmp    13c4 <phase_6+0x1f>
    13ff:	e8 c4 02 00 00       	callq  16c8 <explode_bomb>
    1404:	eb d7                	jmp    13dd <phase_6+0x38>
    1406:	be 00 00 00 00       	mov    $0x0,%esi
    140b:	8b 4c 34 30          	mov    0x30(%rsp,%rsi,1),%ecx
    140f:	b8 01 00 00 00       	mov    $0x1,%eax
    1414:	48 8d 15 d5 2e 20 00 	lea    0x202ed5(%rip),%rdx        # 2042f0 <node1>
    141b:	83 f9 01             	cmp    $0x1,%ecx
    141e:	7e 0b                	jle    142b <phase_6+0x86>
    1420:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    1424:	83 c0 01             	add    $0x1,%eax
    1427:	39 c8                	cmp    %ecx,%eax
    1429:	75 f5                	jne    1420 <phase_6+0x7b>
    142b:	48 89 14 74          	mov    %rdx,(%rsp,%rsi,2)
    142f:	48 83 c6 04          	add    $0x4,%rsi
    1433:	48 83 fe 18          	cmp    $0x18,%rsi
    1437:	75 d2                	jne    140b <phase_6+0x66>
    1439:	48 8b 1c 24          	mov    (%rsp),%rbx
    143d:	48 89 e0             	mov    %rsp,%rax
    1440:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
    1445:	48 89 d9             	mov    %rbx,%rcx
    1448:	48 8b 50 08          	mov    0x8(%rax),%rdx
    144c:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    1450:	48 83 c0 08          	add    $0x8,%rax
    1454:	48 89 d1             	mov    %rdx,%rcx
    1457:	48 39 c6             	cmp    %rax,%rsi
    145a:	75 ec                	jne    1448 <phase_6+0xa3>
    145c:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
    1463:	00 
    1464:	bd 05 00 00 00       	mov    $0x5,%ebp
    1469:	eb 09                	jmp    1474 <phase_6+0xcf>
    146b:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    146f:	83 ed 01             	sub    $0x1,%ebp
    1472:	74 11                	je     1485 <phase_6+0xe0>
    1474:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1478:	8b 00                	mov    (%rax),%eax
    147a:	39 03                	cmp    %eax,(%rbx)
    147c:	7d ed                	jge    146b <phase_6+0xc6>
    147e:	e8 45 02 00 00       	callq  16c8 <explode_bomb>
    1483:	eb e6                	jmp    146b <phase_6+0xc6>
    1485:	48 83 c4 58          	add    $0x58,%rsp
    1489:	5b                   	pop    %rbx
    148a:	5d                   	pop    %rbp
    148b:	41 5c                	pop    %r12
    148d:	41 5d                	pop    %r13
    148f:	c3                   	retq   

0000000000001490 <fun7>:
    1490:	48 85 ff             	test   %rdi,%rdi
    1493:	74 32                	je     14c7 <fun7+0x37>
    1495:	48 83 ec 08          	sub    $0x8,%rsp
    1499:	8b 17                	mov    (%rdi),%edx
    149b:	39 f2                	cmp    %esi,%edx
    149d:	7f 1b                	jg     14ba <fun7+0x2a>
    149f:	b8 00 00 00 00       	mov    $0x0,%eax
    14a4:	39 f2                	cmp    %esi,%edx
    14a6:	74 0d                	je     14b5 <fun7+0x25>
    14a8:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    14ac:	e8 df ff ff ff       	callq  1490 <fun7>
    14b1:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    14b5:	48 83 c4 08          	add    $0x8,%rsp
    14b9:	c3                   	retq   
    14ba:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    14be:	e8 cd ff ff ff       	callq  1490 <fun7>
    14c3:	01 c0                	add    %eax,%eax
    14c5:	eb ee                	jmp    14b5 <fun7+0x25>
    14c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14cc:	c3                   	retq   

00000000000014cd <secret_phase>:
    14cd:	53                   	push   %rbx
    14ce:	e8 5c 02 00 00       	callq  172f <read_line>
    14d3:	ba 0a 00 00 00       	mov    $0xa,%edx
    14d8:	be 00 00 00 00       	mov    $0x0,%esi
    14dd:	48 89 c7             	mov    %rax,%rdi
    14e0:	e8 8b f9 ff ff       	callq  e70 <strtol@plt>
    14e5:	48 89 c3             	mov    %rax,%rbx
    14e8:	8d 40 ff             	lea    -0x1(%rax),%eax
    14eb:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    14f0:	77 25                	ja     1517 <secret_phase+0x4a>
    14f2:	89 de                	mov    %ebx,%esi
    14f4:	48 8d 3d 15 2d 20 00 	lea    0x202d15(%rip),%rdi        # 204210 <n1>
    14fb:	e8 90 ff ff ff       	callq  1490 <fun7>
    1500:	85 c0                	test   %eax,%eax
    1502:	75 1a                	jne    151e <secret_phase+0x51>
    1504:	48 8d 3d 4d 11 00 00 	lea    0x114d(%rip),%rdi        # 2658 <_IO_stdin_used+0x188>
    150b:	e8 c0 f8 ff ff       	callq  dd0 <puts@plt>
    1510:	e8 5f 03 00 00       	callq  1874 <phase_defused>
    1515:	5b                   	pop    %rbx
    1516:	c3                   	retq   
    1517:	e8 ac 01 00 00       	callq  16c8 <explode_bomb>
    151c:	eb d4                	jmp    14f2 <secret_phase+0x25>
    151e:	e8 a5 01 00 00       	callq  16c8 <explode_bomb>
    1523:	eb df                	jmp    1504 <secret_phase+0x37>

0000000000001525 <sig_handler>:
    1525:	48 83 ec 08          	sub    $0x8,%rsp
    1529:	48 8d 3d 90 11 00 00 	lea    0x1190(%rip),%rdi        # 26c0 <array.3094+0x10>
    1530:	e8 9b f8 ff ff       	callq  dd0 <puts@plt>
    1535:	bf 03 00 00 00       	mov    $0x3,%edi
    153a:	e8 b1 f9 ff ff       	callq  ef0 <sleep@plt>
    153f:	48 8d 3d 3c 12 00 00 	lea    0x123c(%rip),%rdi        # 2782 <array.3094+0xd2>
    1546:	b8 00 00 00 00       	mov    $0x0,%eax
    154b:	e8 a0 f8 ff ff       	callq  df0 <printf@plt>
    1550:	48 8b 3d e9 31 20 00 	mov    0x2031e9(%rip),%rdi        # 204740 <stdout@@GLIBC_2.2.5>
    1557:	e8 24 f9 ff ff       	callq  e80 <fflush@plt>
    155c:	bf 01 00 00 00       	mov    $0x1,%edi
    1561:	e8 8a f9 ff ff       	callq  ef0 <sleep@plt>
    1566:	48 8d 3d 1d 12 00 00 	lea    0x121d(%rip),%rdi        # 278a <array.3094+0xda>
    156d:	e8 5e f8 ff ff       	callq  dd0 <puts@plt>
    1572:	bf 10 00 00 00       	mov    $0x10,%edi
    1577:	e8 54 f9 ff ff       	callq  ed0 <exit@plt>

000000000000157c <invalid_phase>:
    157c:	48 83 ec 08          	sub    $0x8,%rsp
    1580:	48 89 fe             	mov    %rdi,%rsi
    1583:	48 8d 3d 08 12 00 00 	lea    0x1208(%rip),%rdi        # 2792 <array.3094+0xe2>
    158a:	b8 00 00 00 00       	mov    $0x0,%eax
    158f:	e8 5c f8 ff ff       	callq  df0 <printf@plt>
    1594:	bf 08 00 00 00       	mov    $0x8,%edi
    1599:	e8 32 f9 ff ff       	callq  ed0 <exit@plt>

000000000000159e <string_length>:
    159e:	80 3f 00             	cmpb   $0x0,(%rdi)
    15a1:	74 13                	je     15b6 <string_length+0x18>
    15a3:	b8 00 00 00 00       	mov    $0x0,%eax
    15a8:	48 83 c7 01          	add    $0x1,%rdi
    15ac:	83 c0 01             	add    $0x1,%eax
    15af:	80 3f 00             	cmpb   $0x0,(%rdi)
    15b2:	75 f4                	jne    15a8 <string_length+0xa>
    15b4:	f3 c3                	repz retq 
    15b6:	b8 00 00 00 00       	mov    $0x0,%eax
    15bb:	c3                   	retq   

00000000000015bc <strings_not_equal>:
    15bc:	41 54                	push   %r12
    15be:	55                   	push   %rbp
    15bf:	53                   	push   %rbx
    15c0:	48 89 fb             	mov    %rdi,%rbx
    15c3:	48 89 f5             	mov    %rsi,%rbp
    15c6:	e8 d3 ff ff ff       	callq  159e <string_length>
    15cb:	41 89 c4             	mov    %eax,%r12d
    15ce:	48 89 ef             	mov    %rbp,%rdi
    15d1:	e8 c8 ff ff ff       	callq  159e <string_length>
    15d6:	ba 01 00 00 00       	mov    $0x1,%edx
    15db:	41 39 c4             	cmp    %eax,%r12d
    15de:	74 07                	je     15e7 <strings_not_equal+0x2b>
    15e0:	89 d0                	mov    %edx,%eax
    15e2:	5b                   	pop    %rbx
    15e3:	5d                   	pop    %rbp
    15e4:	41 5c                	pop    %r12
    15e6:	c3                   	retq   
    15e7:	0f b6 03             	movzbl (%rbx),%eax
    15ea:	84 c0                	test   %al,%al
    15ec:	74 27                	je     1615 <strings_not_equal+0x59>
    15ee:	3a 45 00             	cmp    0x0(%rbp),%al
    15f1:	75 29                	jne    161c <strings_not_equal+0x60>
    15f3:	48 83 c3 01          	add    $0x1,%rbx
    15f7:	48 83 c5 01          	add    $0x1,%rbp
    15fb:	0f b6 03             	movzbl (%rbx),%eax
    15fe:	84 c0                	test   %al,%al
    1600:	74 0c                	je     160e <strings_not_equal+0x52>
    1602:	3a 45 00             	cmp    0x0(%rbp),%al
    1605:	74 ec                	je     15f3 <strings_not_equal+0x37>
    1607:	ba 01 00 00 00       	mov    $0x1,%edx
    160c:	eb d2                	jmp    15e0 <strings_not_equal+0x24>
    160e:	ba 00 00 00 00       	mov    $0x0,%edx
    1613:	eb cb                	jmp    15e0 <strings_not_equal+0x24>
    1615:	ba 00 00 00 00       	mov    $0x0,%edx
    161a:	eb c4                	jmp    15e0 <strings_not_equal+0x24>
    161c:	ba 01 00 00 00       	mov    $0x1,%edx
    1621:	eb bd                	jmp    15e0 <strings_not_equal+0x24>

0000000000001623 <initialize_bomb>:
    1623:	48 83 ec 08          	sub    $0x8,%rsp
    1627:	48 8d 35 f7 fe ff ff 	lea    -0x109(%rip),%rsi        # 1525 <sig_handler>
    162e:	bf 02 00 00 00       	mov    $0x2,%edi
    1633:	e8 08 f8 ff ff       	callq  e40 <signal@plt>
    1638:	48 83 c4 08          	add    $0x8,%rsp
    163c:	c3                   	retq   

000000000000163d <initialize_bomb_solve>:
    163d:	f3 c3                	repz retq 

000000000000163f <blank_line>:
    163f:	55                   	push   %rbp
    1640:	53                   	push   %rbx
    1641:	48 83 ec 08          	sub    $0x8,%rsp
    1645:	48 89 fd             	mov    %rdi,%rbp
    1648:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    164c:	84 db                	test   %bl,%bl
    164e:	74 1e                	je     166e <blank_line+0x2f>
    1650:	e8 ab f8 ff ff       	callq  f00 <__ctype_b_loc@plt>
    1655:	48 83 c5 01          	add    $0x1,%rbp
    1659:	48 0f be db          	movsbq %bl,%rbx
    165d:	48 8b 00             	mov    (%rax),%rax
    1660:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1665:	75 e1                	jne    1648 <blank_line+0x9>
    1667:	b8 00 00 00 00       	mov    $0x0,%eax
    166c:	eb 05                	jmp    1673 <blank_line+0x34>
    166e:	b8 01 00 00 00       	mov    $0x1,%eax
    1673:	48 83 c4 08          	add    $0x8,%rsp
    1677:	5b                   	pop    %rbx
    1678:	5d                   	pop    %rbp
    1679:	c3                   	retq   

000000000000167a <skip>:
    167a:	55                   	push   %rbp
    167b:	53                   	push   %rbx
    167c:	48 83 ec 08          	sub    $0x8,%rsp
    1680:	48 8d 2d f9 30 20 00 	lea    0x2030f9(%rip),%rbp        # 204780 <input_strings>
    1687:	48 63 05 de 30 20 00 	movslq 0x2030de(%rip),%rax        # 20476c <num_input_strings>
    168e:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    1692:	48 c1 e7 04          	shl    $0x4,%rdi
    1696:	48 01 ef             	add    %rbp,%rdi
    1699:	48 8b 15 d0 30 20 00 	mov    0x2030d0(%rip),%rdx        # 204770 <infile>
    16a0:	be 50 00 00 00       	mov    $0x50,%esi
    16a5:	e8 86 f7 ff ff       	callq  e30 <fgets@plt>
    16aa:	48 89 c3             	mov    %rax,%rbx
    16ad:	48 85 c0             	test   %rax,%rax
    16b0:	74 0c                	je     16be <skip+0x44>
    16b2:	48 89 c7             	mov    %rax,%rdi
    16b5:	e8 85 ff ff ff       	callq  163f <blank_line>
    16ba:	85 c0                	test   %eax,%eax
    16bc:	75 c9                	jne    1687 <skip+0xd>
    16be:	48 89 d8             	mov    %rbx,%rax
    16c1:	48 83 c4 08          	add    $0x8,%rsp
    16c5:	5b                   	pop    %rbx
    16c6:	5d                   	pop    %rbp
    16c7:	c3                   	retq   

00000000000016c8 <explode_bomb>:
    16c8:	48 83 ec 08          	sub    $0x8,%rsp
    16cc:	48 8d 3d d0 10 00 00 	lea    0x10d0(%rip),%rdi        # 27a3 <array.3094+0xf3>
    16d3:	e8 f8 f6 ff ff       	callq  dd0 <puts@plt>
    16d8:	48 8d 3d cd 10 00 00 	lea    0x10cd(%rip),%rdi        # 27ac <array.3094+0xfc>
    16df:	e8 ec f6 ff ff       	callq  dd0 <puts@plt>
    16e4:	bf 08 00 00 00       	mov    $0x8,%edi
    16e9:	e8 e2 f7 ff ff       	callq  ed0 <exit@plt>

00000000000016ee <read_six_numbers>:
    16ee:	48 83 ec 08          	sub    $0x8,%rsp
    16f2:	48 89 f2             	mov    %rsi,%rdx
    16f5:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    16f9:	48 8d 46 14          	lea    0x14(%rsi),%rax
    16fd:	50                   	push   %rax
    16fe:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1702:	50                   	push   %rax
    1703:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1707:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    170b:	48 8d 35 b1 10 00 00 	lea    0x10b1(%rip),%rsi        # 27c3 <array.3094+0x113>
    1712:	b8 00 00 00 00       	mov    $0x0,%eax
    1717:	e8 74 f7 ff ff       	callq  e90 <__isoc99_sscanf@plt>
    171c:	48 83 c4 10          	add    $0x10,%rsp
    1720:	83 f8 05             	cmp    $0x5,%eax
    1723:	7e 05                	jle    172a <read_six_numbers+0x3c>
    1725:	48 83 c4 08          	add    $0x8,%rsp
    1729:	c3                   	retq   
    172a:	e8 99 ff ff ff       	callq  16c8 <explode_bomb>

000000000000172f <read_line>:
    172f:	48 83 ec 08          	sub    $0x8,%rsp
    1733:	b8 00 00 00 00       	mov    $0x0,%eax
    1738:	e8 3d ff ff ff       	callq  167a <skip>
    173d:	48 85 c0             	test   %rax,%rax
    1740:	74 6f                	je     17b1 <read_line+0x82>
    1742:	8b 35 24 30 20 00    	mov    0x203024(%rip),%esi        # 20476c <num_input_strings>
    1748:	48 63 c6             	movslq %esi,%rax
    174b:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    174f:	48 c1 e2 04          	shl    $0x4,%rdx
    1753:	48 8d 05 26 30 20 00 	lea    0x203026(%rip),%rax        # 204780 <input_strings>
    175a:	48 01 c2             	add    %rax,%rdx
    175d:	b8 00 00 00 00       	mov    $0x0,%eax
    1762:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1769:	48 89 d7             	mov    %rdx,%rdi
    176c:	f2 ae                	repnz scas %es:(%rdi),%al
    176e:	48 f7 d1             	not    %rcx
    1771:	48 83 e9 01          	sub    $0x1,%rcx
    1775:	83 f9 4e             	cmp    $0x4e,%ecx
    1778:	0f 8f ab 00 00 00    	jg     1829 <read_line+0xfa>
    177e:	83 e9 01             	sub    $0x1,%ecx
    1781:	48 63 c9             	movslq %ecx,%rcx
    1784:	48 63 c6             	movslq %esi,%rax
    1787:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    178b:	48 c1 e0 04          	shl    $0x4,%rax
    178f:	48 89 c7             	mov    %rax,%rdi
    1792:	48 8d 05 e7 2f 20 00 	lea    0x202fe7(%rip),%rax        # 204780 <input_strings>
    1799:	48 01 f8             	add    %rdi,%rax
    179c:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    17a0:	83 c6 01             	add    $0x1,%esi
    17a3:	89 35 c3 2f 20 00    	mov    %esi,0x202fc3(%rip)        # 20476c <num_input_strings>
    17a9:	48 89 d0             	mov    %rdx,%rax
    17ac:	48 83 c4 08          	add    $0x8,%rsp
    17b0:	c3                   	retq   
    17b1:	48 8b 05 98 2f 20 00 	mov    0x202f98(%rip),%rax        # 204750 <stdin@@GLIBC_2.2.5>
    17b8:	48 39 05 b1 2f 20 00 	cmp    %rax,0x202fb1(%rip)        # 204770 <infile>
    17bf:	74 48                	je     1809 <read_line+0xda>
    17c1:	48 8d 3d 2b 10 00 00 	lea    0x102b(%rip),%rdi        # 27f3 <array.3094+0x143>
    17c8:	e8 d3 f5 ff ff       	callq  da0 <getenv@plt>
    17cd:	48 85 c0             	test   %rax,%rax
    17d0:	75 4d                	jne    181f <read_line+0xf0>
    17d2:	48 8b 05 77 2f 20 00 	mov    0x202f77(%rip),%rax        # 204750 <stdin@@GLIBC_2.2.5>
    17d9:	48 89 05 90 2f 20 00 	mov    %rax,0x202f90(%rip)        # 204770 <infile>
    17e0:	b8 00 00 00 00       	mov    $0x0,%eax
    17e5:	e8 90 fe ff ff       	callq  167a <skip>
    17ea:	48 85 c0             	test   %rax,%rax
    17ed:	0f 85 4f ff ff ff    	jne    1742 <read_line+0x13>
    17f3:	48 8d 3d db 0f 00 00 	lea    0xfdb(%rip),%rdi        # 27d5 <array.3094+0x125>
    17fa:	e8 d1 f5 ff ff       	callq  dd0 <puts@plt>
    17ff:	bf 00 00 00 00       	mov    $0x0,%edi
    1804:	e8 c7 f6 ff ff       	callq  ed0 <exit@plt>
    1809:	48 8d 3d c5 0f 00 00 	lea    0xfc5(%rip),%rdi        # 27d5 <array.3094+0x125>
    1810:	e8 bb f5 ff ff       	callq  dd0 <puts@plt>
    1815:	bf 08 00 00 00       	mov    $0x8,%edi
    181a:	e8 b1 f6 ff ff       	callq  ed0 <exit@plt>
    181f:	bf 00 00 00 00       	mov    $0x0,%edi
    1824:	e8 a7 f6 ff ff       	callq  ed0 <exit@plt>
    1829:	48 8d 3d ce 0f 00 00 	lea    0xfce(%rip),%rdi        # 27fe <array.3094+0x14e>
    1830:	e8 9b f5 ff ff       	callq  dd0 <puts@plt>
    1835:	8b 05 31 2f 20 00    	mov    0x202f31(%rip),%eax        # 20476c <num_input_strings>
    183b:	8d 50 01             	lea    0x1(%rax),%edx
    183e:	89 15 28 2f 20 00    	mov    %edx,0x202f28(%rip)        # 20476c <num_input_strings>
    1844:	48 98                	cltq   
    1846:	48 6b c0 50          	imul   $0x50,%rax,%rax
    184a:	48 8d 15 2f 2f 20 00 	lea    0x202f2f(%rip),%rdx        # 204780 <input_strings>
    1851:	48 01 d0             	add    %rdx,%rax
    1854:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
    185b:	75 6e 63 
    185e:	48 89 38             	mov    %rdi,(%rax)
    1861:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    1868:	2a 2a 00 
    186b:	48 89 78 08          	mov    %rdi,0x8(%rax)
    186f:	e8 54 fe ff ff       	callq  16c8 <explode_bomb>

0000000000001874 <phase_defused>:
    1874:	83 3d f1 2e 20 00 06 	cmpl   $0x6,0x202ef1(%rip)        # 20476c <num_input_strings>
    187b:	74 02                	je     187f <phase_defused+0xb>
    187d:	f3 c3                	repz retq 
    187f:	48 83 ec 68          	sub    $0x68,%rsp
    1883:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1888:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    188d:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1892:	48 8d 35 80 0f 00 00 	lea    0xf80(%rip),%rsi        # 2819 <array.3094+0x169>
    1899:	48 8d 3d d0 2f 20 00 	lea    0x202fd0(%rip),%rdi        # 204870 <input_strings+0xf0>
    18a0:	b8 00 00 00 00       	mov    $0x0,%eax
    18a5:	e8 e6 f5 ff ff       	callq  e90 <__isoc99_sscanf@plt>
    18aa:	83 f8 03             	cmp    $0x3,%eax
    18ad:	74 12                	je     18c1 <phase_defused+0x4d>
    18af:	48 8d 3d a2 0e 00 00 	lea    0xea2(%rip),%rdi        # 2758 <array.3094+0xa8>
    18b6:	e8 15 f5 ff ff       	callq  dd0 <puts@plt>
    18bb:	48 83 c4 68          	add    $0x68,%rsp
    18bf:	eb bc                	jmp    187d <phase_defused+0x9>
    18c1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    18c6:	48 8d 35 55 0f 00 00 	lea    0xf55(%rip),%rsi        # 2822 <array.3094+0x172>
    18cd:	e8 ea fc ff ff       	callq  15bc <strings_not_equal>
    18d2:	85 c0                	test   %eax,%eax
    18d4:	75 d9                	jne    18af <phase_defused+0x3b>
    18d6:	48 8d 3d 1b 0e 00 00 	lea    0xe1b(%rip),%rdi        # 26f8 <array.3094+0x48>
    18dd:	e8 ee f4 ff ff       	callq  dd0 <puts@plt>
    18e2:	48 8d 3d 37 0e 00 00 	lea    0xe37(%rip),%rdi        # 2720 <array.3094+0x70>
    18e9:	e8 e2 f4 ff ff       	callq  dd0 <puts@plt>
    18ee:	b8 00 00 00 00       	mov    $0x0,%eax
    18f3:	e8 d5 fb ff ff       	callq  14cd <secret_phase>
    18f8:	eb b5                	jmp    18af <phase_defused+0x3b>

00000000000018fa <sigalrm_handler>:
    18fa:	48 83 ec 08          	sub    $0x8,%rsp
    18fe:	ba 00 00 00 00       	mov    $0x0,%edx
    1903:	48 8d 35 86 0f 00 00 	lea    0xf86(%rip),%rsi        # 2890 <array.3094+0x1e0>
    190a:	48 8b 3d 4f 2e 20 00 	mov    0x202e4f(%rip),%rdi        # 204760 <stderr@@GLIBC_2.2.5>
    1911:	b8 00 00 00 00       	mov    $0x0,%eax
    1916:	e8 45 f5 ff ff       	callq  e60 <fprintf@plt>
    191b:	bf 01 00 00 00       	mov    $0x1,%edi
    1920:	e8 ab f5 ff ff       	callq  ed0 <exit@plt>

0000000000001925 <rio_readlineb>:
    1925:	41 56                	push   %r14
    1927:	41 55                	push   %r13
    1929:	41 54                	push   %r12
    192b:	55                   	push   %rbp
    192c:	53                   	push   %rbx
    192d:	48 89 fb             	mov    %rdi,%rbx
    1930:	49 89 d6             	mov    %rdx,%r14
    1933:	49 89 f5             	mov    %rsi,%r13
    1936:	41 bc 01 00 00 00    	mov    $0x1,%r12d
    193c:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
    1940:	48 83 fa 01          	cmp    $0x1,%rdx
    1944:	77 0c                	ja     1952 <rio_readlineb+0x2d>
    1946:	eb 5f                	jmp    19a7 <rio_readlineb+0x82>
    1948:	e8 63 f4 ff ff       	callq  db0 <__errno_location@plt>
    194d:	83 38 04             	cmpl   $0x4,(%rax)
    1950:	75 66                	jne    19b8 <rio_readlineb+0x93>
    1952:	8b 43 04             	mov    0x4(%rbx),%eax
    1955:	85 c0                	test   %eax,%eax
    1957:	7f 20                	jg     1979 <rio_readlineb+0x54>
    1959:	ba 00 20 00 00       	mov    $0x2000,%edx
    195e:	48 89 ee             	mov    %rbp,%rsi
    1961:	8b 3b                	mov    (%rbx),%edi
    1963:	e8 b8 f4 ff ff       	callq  e20 <read@plt>
    1968:	89 43 04             	mov    %eax,0x4(%rbx)
    196b:	85 c0                	test   %eax,%eax
    196d:	78 d9                	js     1948 <rio_readlineb+0x23>
    196f:	85 c0                	test   %eax,%eax
    1971:	74 4e                	je     19c1 <rio_readlineb+0x9c>
    1973:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    1977:	eb d9                	jmp    1952 <rio_readlineb+0x2d>
    1979:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    197d:	0f b6 0a             	movzbl (%rdx),%ecx
    1980:	48 83 c2 01          	add    $0x1,%rdx
    1984:	48 89 53 08          	mov    %rdx,0x8(%rbx)
    1988:	83 e8 01             	sub    $0x1,%eax
    198b:	89 43 04             	mov    %eax,0x4(%rbx)
    198e:	49 83 c5 01          	add    $0x1,%r13
    1992:	41 88 4d ff          	mov    %cl,-0x1(%r13)
    1996:	80 f9 0a             	cmp    $0xa,%cl
    1999:	74 0c                	je     19a7 <rio_readlineb+0x82>
    199b:	41 83 c4 01          	add    $0x1,%r12d
    199f:	49 63 c4             	movslq %r12d,%rax
    19a2:	4c 39 f0             	cmp    %r14,%rax
    19a5:	72 ab                	jb     1952 <rio_readlineb+0x2d>
    19a7:	41 c6 45 00 00       	movb   $0x0,0x0(%r13)
    19ac:	49 63 c4             	movslq %r12d,%rax
    19af:	5b                   	pop    %rbx
    19b0:	5d                   	pop    %rbp
    19b1:	41 5c                	pop    %r12
    19b3:	41 5d                	pop    %r13
    19b5:	41 5e                	pop    %r14
    19b7:	c3                   	retq   
    19b8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    19bf:	eb 05                	jmp    19c6 <rio_readlineb+0xa1>
    19c1:	b8 00 00 00 00       	mov    $0x0,%eax
    19c6:	85 c0                	test   %eax,%eax
    19c8:	75 0d                	jne    19d7 <rio_readlineb+0xb2>
    19ca:	41 83 fc 01          	cmp    $0x1,%r12d
    19ce:	75 d7                	jne    19a7 <rio_readlineb+0x82>
    19d0:	b8 00 00 00 00       	mov    $0x0,%eax
    19d5:	eb d8                	jmp    19af <rio_readlineb+0x8a>
    19d7:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    19de:	eb cf                	jmp    19af <rio_readlineb+0x8a>

00000000000019e0 <submitr>:
    19e0:	41 57                	push   %r15
    19e2:	41 56                	push   %r14
    19e4:	41 55                	push   %r13
    19e6:	41 54                	push   %r12
    19e8:	55                   	push   %rbp
    19e9:	53                   	push   %rbx
    19ea:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
    19f1:	49 89 fd             	mov    %rdi,%r13
    19f4:	89 f5                	mov    %esi,%ebp
    19f6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    19fb:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    1a00:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
    1a05:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    1a0a:	48 8b 9c 24 b0 a0 00 	mov    0xa0b0(%rsp),%rbx
    1a11:	00 
    1a12:	4c 8b bc 24 b8 a0 00 	mov    0xa0b8(%rsp),%r15
    1a19:	00 
    1a1a:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
    1a21:	00 00 00 00 
    1a25:	ba 00 00 00 00       	mov    $0x0,%edx
    1a2a:	be 01 00 00 00       	mov    $0x1,%esi
    1a2f:	bf 02 00 00 00       	mov    $0x2,%edi
    1a34:	e8 d7 f4 ff ff       	callq  f10 <socket@plt>
    1a39:	85 c0                	test   %eax,%eax
    1a3b:	0f 88 31 01 00 00    	js     1b72 <submitr+0x192>
    1a41:	41 89 c4             	mov    %eax,%r12d
    1a44:	4c 89 ef             	mov    %r13,%rdi
    1a47:	e8 04 f4 ff ff       	callq  e50 <gethostbyname@plt>
    1a4c:	48 85 c0             	test   %rax,%rax
    1a4f:	0f 84 6d 01 00 00    	je     1bc2 <submitr+0x1e2>
    1a55:	4c 8d ac 24 60 a0 00 	lea    0xa060(%rsp),%r13
    1a5c:	00 
    1a5d:	48 c7 84 24 60 a0 00 	movq   $0x0,0xa060(%rsp)
    1a64:	00 00 00 00 00 
    1a69:	48 c7 84 24 68 a0 00 	movq   $0x0,0xa068(%rsp)
    1a70:	00 00 00 00 00 
    1a75:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
    1a7c:	00 02 00 
    1a7f:	48 63 50 14          	movslq 0x14(%rax),%rdx
    1a83:	48 8d b4 24 64 a0 00 	lea    0xa064(%rsp),%rsi
    1a8a:	00 
    1a8b:	48 8b 40 18          	mov    0x18(%rax),%rax
    1a8f:	48 8b 38             	mov    (%rax),%rdi
    1a92:	e8 09 f4 ff ff       	callq  ea0 <bcopy@plt>
    1a97:	66 c1 cd 08          	ror    $0x8,%bp
    1a9b:	66 89 ac 24 62 a0 00 	mov    %bp,0xa062(%rsp)
    1aa2:	00 
    1aa3:	ba 10 00 00 00       	mov    $0x10,%edx
    1aa8:	4c 89 ee             	mov    %r13,%rsi
    1aab:	44 89 e7             	mov    %r12d,%edi
    1aae:	e8 2d f4 ff ff       	callq  ee0 <connect@plt>
    1ab3:	85 c0                	test   %eax,%eax
    1ab5:	0f 88 72 01 00 00    	js     1c2d <submitr+0x24d>
    1abb:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    1ac2:	b8 00 00 00 00       	mov    $0x0,%eax
    1ac7:	4c 89 c9             	mov    %r9,%rcx
    1aca:	48 89 df             	mov    %rbx,%rdi
    1acd:	f2 ae                	repnz scas %es:(%rdi),%al
    1acf:	48 89 ce             	mov    %rcx,%rsi
    1ad2:	48 f7 d6             	not    %rsi
    1ad5:	4c 89 c9             	mov    %r9,%rcx
    1ad8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1add:	f2 ae                	repnz scas %es:(%rdi),%al
    1adf:	49 89 c8             	mov    %rcx,%r8
    1ae2:	4c 89 c9             	mov    %r9,%rcx
    1ae5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1aea:	f2 ae                	repnz scas %es:(%rdi),%al
    1aec:	48 f7 d1             	not    %rcx
    1aef:	48 89 ca             	mov    %rcx,%rdx
    1af2:	4c 89 c9             	mov    %r9,%rcx
    1af5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    1afa:	f2 ae                	repnz scas %es:(%rdi),%al
    1afc:	4c 29 c2             	sub    %r8,%rdx
    1aff:	48 29 ca             	sub    %rcx,%rdx
    1b02:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
    1b07:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
    1b0c:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    1b12:	0f 87 72 01 00 00    	ja     1c8a <submitr+0x2aa>
    1b18:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
    1b1f:	00 
    1b20:	b9 00 04 00 00       	mov    $0x400,%ecx
    1b25:	b8 00 00 00 00       	mov    $0x0,%eax
    1b2a:	48 89 d7             	mov    %rdx,%rdi
    1b2d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    1b30:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1b37:	48 89 df             	mov    %rbx,%rdi
    1b3a:	f2 ae                	repnz scas %es:(%rdi),%al
    1b3c:	48 89 c8             	mov    %rcx,%rax
    1b3f:	48 f7 d0             	not    %rax
    1b42:	48 83 e8 01          	sub    $0x1,%rax
    1b46:	85 c0                	test   %eax,%eax
    1b48:	0f 84 34 06 00 00    	je     2182 <submitr+0x7a2>
    1b4e:	8d 40 ff             	lea    -0x1(%rax),%eax
    1b51:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
    1b56:	48 89 d5             	mov    %rdx,%rbp
    1b59:	48 8d 44 24 38       	lea    0x38(%rsp),%rax
    1b5e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    1b63:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
    1b6a:	00 20 00 
    1b6d:	e9 a5 01 00 00       	jmpq   1d17 <submitr+0x337>
    1b72:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1b79:	3a 20 43 
    1b7c:	49 89 07             	mov    %rax,(%r15)
    1b7f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    1b86:	20 75 6e 
    1b89:	49 89 47 08          	mov    %rax,0x8(%r15)
    1b8d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1b94:	74 6f 20 
    1b97:	49 89 47 10          	mov    %rax,0x10(%r15)
    1b9b:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
    1ba2:	65 20 73 
    1ba5:	49 89 47 18          	mov    %rax,0x18(%r15)
    1ba9:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    1bb0:	65 
    1bb1:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    1bb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1bbd:	e9 ae 04 00 00       	jmpq   2070 <submitr+0x690>
    1bc2:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    1bc9:	3a 20 44 
    1bcc:	49 89 07             	mov    %rax,(%r15)
    1bcf:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
    1bd6:	20 75 6e 
    1bd9:	49 89 47 08          	mov    %rax,0x8(%r15)
    1bdd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1be4:	74 6f 20 
    1be7:	49 89 47 10          	mov    %rax,0x10(%r15)
    1beb:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
    1bf2:	76 65 20 
    1bf5:	49 89 47 18          	mov    %rax,0x18(%r15)
    1bf9:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    1c00:	72 20 61 
    1c03:	49 89 47 20          	mov    %rax,0x20(%r15)
    1c07:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    1c0e:	65 
    1c0f:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    1c16:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    1c1b:	44 89 e7             	mov    %r12d,%edi
    1c1e:	e8 ed f1 ff ff       	callq  e10 <close@plt>
    1c23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1c28:	e9 43 04 00 00       	jmpq   2070 <submitr+0x690>
    1c2d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    1c34:	3a 20 55 
    1c37:	49 89 07             	mov    %rax,(%r15)
    1c3a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
    1c41:	20 74 6f 
    1c44:	49 89 47 08          	mov    %rax,0x8(%r15)
    1c48:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    1c4f:	65 63 74 
    1c52:	49 89 47 10          	mov    %rax,0x10(%r15)
    1c56:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
    1c5d:	68 65 20 
    1c60:	49 89 47 18          	mov    %rax,0x18(%r15)
    1c64:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    1c6b:	76 
    1c6c:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    1c73:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    1c78:	44 89 e7             	mov    %r12d,%edi
    1c7b:	e8 90 f1 ff ff       	callq  e10 <close@plt>
    1c80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1c85:	e9 e6 03 00 00       	jmpq   2070 <submitr+0x690>
    1c8a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    1c91:	3a 20 52 
    1c94:	49 89 07             	mov    %rax,(%r15)
    1c97:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
    1c9e:	20 73 74 
    1ca1:	49 89 47 08          	mov    %rax,0x8(%r15)
    1ca5:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    1cac:	74 6f 6f 
    1caf:	49 89 47 10          	mov    %rax,0x10(%r15)
    1cb3:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
    1cba:	65 2e 20 
    1cbd:	49 89 47 18          	mov    %rax,0x18(%r15)
    1cc1:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    1cc8:	61 73 65 
    1ccb:	49 89 47 20          	mov    %rax,0x20(%r15)
    1ccf:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
    1cd6:	49 54 52 
    1cd9:	49 89 47 28          	mov    %rax,0x28(%r15)
    1cdd:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    1ce4:	55 46 00 
    1ce7:	49 89 47 30          	mov    %rax,0x30(%r15)
    1ceb:	44 89 e7             	mov    %r12d,%edi
    1cee:	e8 1d f1 ff ff       	callq  e10 <close@plt>
    1cf3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1cf8:	e9 73 03 00 00       	jmpq   2070 <submitr+0x690>
    1cfd:	49 0f a3 c5          	bt     %rax,%r13
    1d01:	73 1e                	jae    1d21 <submitr+0x341>
    1d03:	88 55 00             	mov    %dl,0x0(%rbp)
    1d06:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    1d0a:	48 83 c3 01          	add    $0x1,%rbx
    1d0e:	49 39 de             	cmp    %rbx,%r14
    1d11:	0f 84 6b 04 00 00    	je     2182 <submitr+0x7a2>
    1d17:	0f b6 13             	movzbl (%rbx),%edx
    1d1a:	8d 42 d6             	lea    -0x2a(%rdx),%eax
    1d1d:	3c 35                	cmp    $0x35,%al
    1d1f:	76 dc                	jbe    1cfd <submitr+0x31d>
    1d21:	89 d0                	mov    %edx,%eax
    1d23:	83 e0 df             	and    $0xffffffdf,%eax
    1d26:	83 e8 41             	sub    $0x41,%eax
    1d29:	3c 19                	cmp    $0x19,%al
    1d2b:	76 d6                	jbe    1d03 <submitr+0x323>
    1d2d:	80 fa 20             	cmp    $0x20,%dl
    1d30:	74 47                	je     1d79 <submitr+0x399>
    1d32:	8d 42 e0             	lea    -0x20(%rdx),%eax
    1d35:	3c 5f                	cmp    $0x5f,%al
    1d37:	76 09                	jbe    1d42 <submitr+0x362>
    1d39:	80 fa 09             	cmp    $0x9,%dl
    1d3c:	0f 85 b3 03 00 00    	jne    20f5 <submitr+0x715>
    1d42:	0f b6 d2             	movzbl %dl,%edx
    1d45:	48 8d 35 1c 0c 00 00 	lea    0xc1c(%rip),%rsi        # 2968 <array.3094+0x2b8>
    1d4c:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    1d51:	b8 00 00 00 00       	mov    $0x0,%eax
    1d56:	e8 65 f1 ff ff       	callq  ec0 <sprintf@plt>
    1d5b:	0f b6 44 24 38       	movzbl 0x38(%rsp),%eax
    1d60:	88 45 00             	mov    %al,0x0(%rbp)
    1d63:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
    1d68:	88 45 01             	mov    %al,0x1(%rbp)
    1d6b:	0f b6 44 24 3a       	movzbl 0x3a(%rsp),%eax
    1d70:	88 45 02             	mov    %al,0x2(%rbp)
    1d73:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    1d77:	eb 91                	jmp    1d0a <submitr+0x32a>
    1d79:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    1d7d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    1d81:	eb 87                	jmp    1d0a <submitr+0x32a>
    1d83:	48 01 c5             	add    %rax,%rbp
    1d86:	48 29 c3             	sub    %rax,%rbx
    1d89:	74 26                	je     1db1 <submitr+0x3d1>
    1d8b:	48 89 da             	mov    %rbx,%rdx
    1d8e:	48 89 ee             	mov    %rbp,%rsi
    1d91:	44 89 e7             	mov    %r12d,%edi
    1d94:	e8 47 f0 ff ff       	callq  de0 <write@plt>
    1d99:	48 85 c0             	test   %rax,%rax
    1d9c:	7f e5                	jg     1d83 <submitr+0x3a3>
    1d9e:	e8 0d f0 ff ff       	callq  db0 <__errno_location@plt>
    1da3:	83 38 04             	cmpl   $0x4,(%rax)
    1da6:	0f 85 b0 00 00 00    	jne    1e5c <submitr+0x47c>
    1dac:	4c 89 f0             	mov    %r14,%rax
    1daf:	eb d2                	jmp    1d83 <submitr+0x3a3>
    1db1:	4d 85 ed             	test   %r13,%r13
    1db4:	0f 88 a2 00 00 00    	js     1e5c <submitr+0x47c>
    1dba:	44 89 a4 24 50 80 00 	mov    %r12d,0x8050(%rsp)
    1dc1:	00 
    1dc2:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
    1dc9:	00 00 00 00 
    1dcd:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    1dd4:	00 
    1dd5:	48 8d 47 10          	lea    0x10(%rdi),%rax
    1dd9:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
    1de0:	00 
    1de1:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
    1de8:	00 
    1de9:	ba 00 20 00 00       	mov    $0x2000,%edx
    1dee:	e8 32 fb ff ff       	callq  1925 <rio_readlineb>
    1df3:	48 85 c0             	test   %rax,%rax
    1df6:	0f 8e bf 00 00 00    	jle    1ebb <submitr+0x4db>
    1dfc:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
    1e03:	00 
    1e04:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
    1e0b:	00 
    1e0c:	48 8d bc 24 50 60 00 	lea    0x6050(%rsp),%rdi
    1e13:	00 
    1e14:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
    1e19:	48 8d 35 4f 0b 00 00 	lea    0xb4f(%rip),%rsi        # 296f <array.3094+0x2bf>
    1e20:	b8 00 00 00 00       	mov    $0x0,%eax
    1e25:	e8 66 f0 ff ff       	callq  e90 <__isoc99_sscanf@plt>
    1e2a:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
    1e31:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
    1e37:	0f 85 f2 00 00 00    	jne    1f2f <submitr+0x54f>
    1e3d:	bb 0d 00 00 00       	mov    $0xd,%ebx
    1e42:	bd 0a 00 00 00       	mov    $0xa,%ebp
    1e47:	4c 8d b4 24 50 60 00 	lea    0x6050(%rsp),%r14
    1e4e:	00 
    1e4f:	4c 8d ac 24 50 80 00 	lea    0x8050(%rsp),%r13
    1e56:	00 
    1e57:	e9 85 01 00 00       	jmpq   1fe1 <submitr+0x601>
    1e5c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1e63:	3a 20 43 
    1e66:	49 89 07             	mov    %rax,(%r15)
    1e69:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    1e70:	20 75 6e 
    1e73:	49 89 47 08          	mov    %rax,0x8(%r15)
    1e77:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1e7e:	74 6f 20 
    1e81:	49 89 47 10          	mov    %rax,0x10(%r15)
    1e85:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
    1e8c:	20 74 6f 
    1e8f:	49 89 47 18          	mov    %rax,0x18(%r15)
    1e93:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    1e9a:	73 65 72 
    1e9d:	49 89 47 20          	mov    %rax,0x20(%r15)
    1ea1:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    1ea8:	00 
    1ea9:	44 89 e7             	mov    %r12d,%edi
    1eac:	e8 5f ef ff ff       	callq  e10 <close@plt>
    1eb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1eb6:	e9 b5 01 00 00       	jmpq   2070 <submitr+0x690>
    1ebb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1ec2:	3a 20 43 
    1ec5:	49 89 07             	mov    %rax,(%r15)
    1ec8:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    1ecf:	20 75 6e 
    1ed2:	49 89 47 08          	mov    %rax,0x8(%r15)
    1ed6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1edd:	74 6f 20 
    1ee0:	49 89 47 10          	mov    %rax,0x10(%r15)
    1ee4:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
    1eeb:	66 69 72 
    1eee:	49 89 47 18          	mov    %rax,0x18(%r15)
    1ef2:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    1ef9:	61 64 65 
    1efc:	49 89 47 20          	mov    %rax,0x20(%r15)
    1f00:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
    1f07:	6d 20 73 
    1f0a:	49 89 47 28          	mov    %rax,0x28(%r15)
    1f0e:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    1f15:	65 
    1f16:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    1f1d:	44 89 e7             	mov    %r12d,%edi
    1f20:	e8 eb ee ff ff       	callq  e10 <close@plt>
    1f25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f2a:	e9 41 01 00 00       	jmpq   2070 <submitr+0x690>
    1f2f:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
    1f34:	48 8d 35 7d 09 00 00 	lea    0x97d(%rip),%rsi        # 28b8 <array.3094+0x208>
    1f3b:	4c 89 ff             	mov    %r15,%rdi
    1f3e:	b8 00 00 00 00       	mov    $0x0,%eax
    1f43:	e8 78 ef ff ff       	callq  ec0 <sprintf@plt>
    1f48:	44 89 e7             	mov    %r12d,%edi
    1f4b:	e8 c0 ee ff ff       	callq  e10 <close@plt>
    1f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f55:	e9 16 01 00 00       	jmpq   2070 <submitr+0x690>
    1f5a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1f61:	3a 20 43 
    1f64:	49 89 07             	mov    %rax,(%r15)
    1f67:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    1f6e:	20 75 6e 
    1f71:	49 89 47 08          	mov    %rax,0x8(%r15)
    1f75:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1f7c:	74 6f 20 
    1f7f:	49 89 47 10          	mov    %rax,0x10(%r15)
    1f83:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
    1f8a:	68 65 61 
    1f8d:	49 89 47 18          	mov    %rax,0x18(%r15)
    1f91:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    1f98:	66 72 6f 
    1f9b:	49 89 47 20          	mov    %rax,0x20(%r15)
    1f9f:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
    1fa6:	76 65 72 
    1fa9:	49 89 47 28          	mov    %rax,0x28(%r15)
    1fad:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    1fb2:	44 89 e7             	mov    %r12d,%edi
    1fb5:	e8 56 ee ff ff       	callq  e10 <close@plt>
    1fba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fbf:	e9 ac 00 00 00       	jmpq   2070 <submitr+0x690>
    1fc4:	85 c0                	test   %eax,%eax
    1fc6:	74 45                	je     200d <submitr+0x62d>
    1fc8:	ba 00 20 00 00       	mov    $0x2000,%edx
    1fcd:	4c 89 f6             	mov    %r14,%rsi
    1fd0:	4c 89 ef             	mov    %r13,%rdi
    1fd3:	e8 4d f9 ff ff       	callq  1925 <rio_readlineb>
    1fd8:	48 85 c0             	test   %rax,%rax
    1fdb:	0f 8e 79 ff ff ff    	jle    1f5a <submitr+0x57a>
    1fe1:	0f b6 84 24 50 60 00 	movzbl 0x6050(%rsp),%eax
    1fe8:	00 
    1fe9:	89 d9                	mov    %ebx,%ecx
    1feb:	29 c1                	sub    %eax,%ecx
    1fed:	89 c8                	mov    %ecx,%eax
    1fef:	75 d3                	jne    1fc4 <submitr+0x5e4>
    1ff1:	0f b6 84 24 51 60 00 	movzbl 0x6051(%rsp),%eax
    1ff8:	00 
    1ff9:	89 ee                	mov    %ebp,%esi
    1ffb:	29 c6                	sub    %eax,%esi
    1ffd:	89 f0                	mov    %esi,%eax
    1fff:	75 c3                	jne    1fc4 <submitr+0x5e4>
    2001:	0f b6 84 24 52 60 00 	movzbl 0x6052(%rsp),%eax
    2008:	00 
    2009:	f7 d8                	neg    %eax
    200b:	eb b7                	jmp    1fc4 <submitr+0x5e4>
    200d:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
    2014:	00 
    2015:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    201c:	00 
    201d:	ba 00 20 00 00       	mov    $0x2000,%edx
    2022:	e8 fe f8 ff ff       	callq  1925 <rio_readlineb>
    2027:	48 85 c0             	test   %rax,%rax
    202a:	7e 56                	jle    2082 <submitr+0x6a2>
    202c:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
    2033:	00 
    2034:	4c 89 ff             	mov    %r15,%rdi
    2037:	e8 84 ed ff ff       	callq  dc0 <strcpy@plt>
    203c:	44 89 e7             	mov    %r12d,%edi
    203f:	e8 cc ed ff ff       	callq  e10 <close@plt>
    2044:	41 0f b6 17          	movzbl (%r15),%edx
    2048:	b8 4f 00 00 00       	mov    $0x4f,%eax
    204d:	29 d0                	sub    %edx,%eax
    204f:	75 15                	jne    2066 <submitr+0x686>
    2051:	41 0f b6 57 01       	movzbl 0x1(%r15),%edx
    2056:	b8 4b 00 00 00       	mov    $0x4b,%eax
    205b:	29 d0                	sub    %edx,%eax
    205d:	75 07                	jne    2066 <submitr+0x686>
    205f:	41 0f b6 47 02       	movzbl 0x2(%r15),%eax
    2064:	f7 d8                	neg    %eax
    2066:	85 c0                	test   %eax,%eax
    2068:	0f 95 c0             	setne  %al
    206b:	0f b6 c0             	movzbl %al,%eax
    206e:	f7 d8                	neg    %eax
    2070:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
    2077:	5b                   	pop    %rbx
    2078:	5d                   	pop    %rbp
    2079:	41 5c                	pop    %r12
    207b:	41 5d                	pop    %r13
    207d:	41 5e                	pop    %r14
    207f:	41 5f                	pop    %r15
    2081:	c3                   	retq   
    2082:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2089:	3a 20 43 
    208c:	49 89 07             	mov    %rax,(%r15)
    208f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    2096:	20 75 6e 
    2099:	49 89 47 08          	mov    %rax,0x8(%r15)
    209d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    20a4:	74 6f 20 
    20a7:	49 89 47 10          	mov    %rax,0x10(%r15)
    20ab:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
    20b2:	73 74 61 
    20b5:	49 89 47 18          	mov    %rax,0x18(%r15)
    20b9:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    20c0:	65 73 73 
    20c3:	49 89 47 20          	mov    %rax,0x20(%r15)
    20c7:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
    20ce:	72 6f 6d 
    20d1:	49 89 47 28          	mov    %rax,0x28(%r15)
    20d5:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    20dc:	65 72 00 
    20df:	49 89 47 30          	mov    %rax,0x30(%r15)
    20e3:	44 89 e7             	mov    %r12d,%edi
    20e6:	e8 25 ed ff ff       	callq  e10 <close@plt>
    20eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    20f0:	e9 7b ff ff ff       	jmpq   2070 <submitr+0x690>
    20f5:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    20fc:	3a 20 52 
    20ff:	49 89 07             	mov    %rax,(%r15)
    2102:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
    2109:	20 73 74 
    210c:	49 89 47 08          	mov    %rax,0x8(%r15)
    2110:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    2117:	63 6f 6e 
    211a:	49 89 47 10          	mov    %rax,0x10(%r15)
    211e:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
    2125:	20 61 6e 
    2128:	49 89 47 18          	mov    %rax,0x18(%r15)
    212c:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2133:	67 61 6c 
    2136:	49 89 47 20          	mov    %rax,0x20(%r15)
    213a:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
    2141:	6e 70 72 
    2144:	49 89 47 28          	mov    %rax,0x28(%r15)
    2148:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    214f:	6c 65 20 
    2152:	49 89 47 30          	mov    %rax,0x30(%r15)
    2156:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
    215d:	63 74 65 
    2160:	49 89 47 38          	mov    %rax,0x38(%r15)
    2164:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    216b:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    2170:	44 89 e7             	mov    %r12d,%edi
    2173:	e8 98 ec ff ff       	callq  e10 <close@plt>
    2178:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    217d:	e9 ee fe ff ff       	jmpq   2070 <submitr+0x690>
    2182:	48 8d 9c 24 50 60 00 	lea    0x6050(%rsp),%rbx
    2189:	00 
    218a:	48 83 ec 08          	sub    $0x8,%rsp
    218e:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    2195:	00 
    2196:	50                   	push   %rax
    2197:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    219c:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
    21a1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    21a6:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    21ab:	48 8d 35 36 07 00 00 	lea    0x736(%rip),%rsi        # 28e8 <array.3094+0x238>
    21b2:	48 89 df             	mov    %rbx,%rdi
    21b5:	b8 00 00 00 00       	mov    $0x0,%eax
    21ba:	e8 01 ed ff ff       	callq  ec0 <sprintf@plt>
    21bf:	b8 00 00 00 00       	mov    $0x0,%eax
    21c4:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    21cb:	48 89 df             	mov    %rbx,%rdi
    21ce:	f2 ae                	repnz scas %es:(%rdi),%al
    21d0:	48 89 c8             	mov    %rcx,%rax
    21d3:	48 f7 d0             	not    %rax
    21d6:	4c 8d 68 ff          	lea    -0x1(%rax),%r13
    21da:	48 83 c4 10          	add    $0x10,%rsp
    21de:	4c 89 eb             	mov    %r13,%rbx
    21e1:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
    21e8:	00 
    21e9:	41 be 00 00 00 00    	mov    $0x0,%r14d
    21ef:	4d 85 ed             	test   %r13,%r13
    21f2:	0f 85 93 fb ff ff    	jne    1d8b <submitr+0x3ab>
    21f8:	e9 bd fb ff ff       	jmpq   1dba <submitr+0x3da>

00000000000021fd <init_timeout>:
    21fd:	85 ff                	test   %edi,%edi
    21ff:	74 24                	je     2225 <init_timeout+0x28>
    2201:	53                   	push   %rbx
    2202:	89 fb                	mov    %edi,%ebx
    2204:	48 8d 35 ef f6 ff ff 	lea    -0x911(%rip),%rsi        # 18fa <sigalrm_handler>
    220b:	bf 0e 00 00 00       	mov    $0xe,%edi
    2210:	e8 2b ec ff ff       	callq  e40 <signal@plt>
    2215:	85 db                	test   %ebx,%ebx
    2217:	bf 00 00 00 00       	mov    $0x0,%edi
    221c:	0f 49 fb             	cmovns %ebx,%edi
    221f:	e8 dc eb ff ff       	callq  e00 <alarm@plt>
    2224:	5b                   	pop    %rbx
    2225:	f3 c3                	repz retq 

0000000000002227 <init_driver>:
    2227:	41 54                	push   %r12
    2229:	55                   	push   %rbp
    222a:	53                   	push   %rbx
    222b:	48 83 ec 10          	sub    $0x10,%rsp
    222f:	48 89 fd             	mov    %rdi,%rbp
    2232:	be 01 00 00 00       	mov    $0x1,%esi
    2237:	bf 0d 00 00 00       	mov    $0xd,%edi
    223c:	e8 ff eb ff ff       	callq  e40 <signal@plt>
    2241:	be 01 00 00 00       	mov    $0x1,%esi
    2246:	bf 1d 00 00 00       	mov    $0x1d,%edi
    224b:	e8 f0 eb ff ff       	callq  e40 <signal@plt>
    2250:	be 01 00 00 00       	mov    $0x1,%esi
    2255:	bf 1d 00 00 00       	mov    $0x1d,%edi
    225a:	e8 e1 eb ff ff       	callq  e40 <signal@plt>
    225f:	ba 00 00 00 00       	mov    $0x0,%edx
    2264:	be 01 00 00 00       	mov    $0x1,%esi
    2269:	bf 02 00 00 00       	mov    $0x2,%edi
    226e:	e8 9d ec ff ff       	callq  f10 <socket@plt>
    2273:	85 c0                	test   %eax,%eax
    2275:	0f 88 80 00 00 00    	js     22fb <init_driver+0xd4>
    227b:	89 c3                	mov    %eax,%ebx
    227d:	48 8d 3d fc 06 00 00 	lea    0x6fc(%rip),%rdi        # 2980 <array.3094+0x2d0>
    2284:	e8 c7 eb ff ff       	callq  e50 <gethostbyname@plt>
    2289:	48 85 c0             	test   %rax,%rax
    228c:	0f 84 b5 00 00 00    	je     2347 <init_driver+0x120>
    2292:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2299:	00 
    229a:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    22a1:	00 00 
    22a3:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    22a9:	48 63 50 14          	movslq 0x14(%rax),%rdx
    22ad:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
    22b2:	48 8b 40 18          	mov    0x18(%rax),%rax
    22b6:	48 8b 38             	mov    (%rax),%rdi
    22b9:	e8 e2 eb ff ff       	callq  ea0 <bcopy@plt>
    22be:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
    22c5:	ba 10 00 00 00       	mov    $0x10,%edx
    22ca:	48 89 e6             	mov    %rsp,%rsi
    22cd:	89 df                	mov    %ebx,%edi
    22cf:	e8 0c ec ff ff       	callq  ee0 <connect@plt>
    22d4:	85 c0                	test   %eax,%eax
    22d6:	0f 88 d3 00 00 00    	js     23af <init_driver+0x188>
    22dc:	89 df                	mov    %ebx,%edi
    22de:	e8 2d eb ff ff       	callq  e10 <close@plt>
    22e3:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    22e9:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    22ed:	b8 00 00 00 00       	mov    $0x0,%eax
    22f2:	48 83 c4 10          	add    $0x10,%rsp
    22f6:	5b                   	pop    %rbx
    22f7:	5d                   	pop    %rbp
    22f8:	41 5c                	pop    %r12
    22fa:	c3                   	retq   
    22fb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2302:	3a 20 43 
    2305:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2309:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
    2310:	20 75 6e 
    2313:	48 89 45 08          	mov    %rax,0x8(%rbp)
    2317:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    231e:	74 6f 20 
    2321:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2325:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
    232c:	65 20 73 
    232f:	48 89 45 18          	mov    %rax,0x18(%rbp)
    2333:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    233a:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2345:	eb ab                	jmp    22f2 <init_driver+0xcb>
    2347:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    234e:	3a 20 44 
    2351:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2355:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
    235c:	20 75 6e 
    235f:	48 89 45 08          	mov    %rax,0x8(%rbp)
    2363:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    236a:	74 6f 20 
    236d:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2371:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
    2378:	76 65 20 
    237b:	48 89 45 18          	mov    %rax,0x18(%rbp)
    237f:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2386:	72 20 61 
    2389:	48 89 45 20          	mov    %rax,0x20(%rbp)
    238d:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    2394:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    239a:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    239e:	89 df                	mov    %ebx,%edi
    23a0:	e8 6b ea ff ff       	callq  e10 <close@plt>
    23a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    23aa:	e9 43 ff ff ff       	jmpq   22f2 <init_driver+0xcb>
    23af:	48 8d 15 ca 05 00 00 	lea    0x5ca(%rip),%rdx        # 2980 <array.3094+0x2d0>
    23b6:	48 8d 35 83 05 00 00 	lea    0x583(%rip),%rsi        # 2940 <array.3094+0x290>
    23bd:	48 89 ef             	mov    %rbp,%rdi
    23c0:	b8 00 00 00 00       	mov    $0x0,%eax
    23c5:	e8 f6 ea ff ff       	callq  ec0 <sprintf@plt>
    23ca:	89 df                	mov    %ebx,%edi
    23cc:	e8 3f ea ff ff       	callq  e10 <close@plt>
    23d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    23d6:	e9 17 ff ff ff       	jmpq   22f2 <init_driver+0xcb>

00000000000023db <driver_post>:
    23db:	53                   	push   %rbx
    23dc:	4c 89 c3             	mov    %r8,%rbx
    23df:	85 c9                	test   %ecx,%ecx
    23e1:	75 17                	jne    23fa <driver_post+0x1f>
    23e3:	48 85 ff             	test   %rdi,%rdi
    23e6:	74 05                	je     23ed <driver_post+0x12>
    23e8:	80 3f 00             	cmpb   $0x0,(%rdi)
    23eb:	75 31                	jne    241e <driver_post+0x43>
    23ed:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    23f2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    23f6:	89 c8                	mov    %ecx,%eax
    23f8:	5b                   	pop    %rbx
    23f9:	c3                   	retq   
    23fa:	48 89 d6             	mov    %rdx,%rsi
    23fd:	48 8d 3d 94 05 00 00 	lea    0x594(%rip),%rdi        # 2998 <array.3094+0x2e8>
    2404:	b8 00 00 00 00       	mov    $0x0,%eax
    2409:	e8 e2 e9 ff ff       	callq  df0 <printf@plt>
    240e:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2413:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2417:	b8 00 00 00 00       	mov    $0x0,%eax
    241c:	eb da                	jmp    23f8 <driver_post+0x1d>
    241e:	41 50                	push   %r8
    2420:	52                   	push   %rdx
    2421:	4c 8d 0d 87 05 00 00 	lea    0x587(%rip),%r9        # 29af <array.3094+0x2ff>
    2428:	49 89 f0             	mov    %rsi,%r8
    242b:	48 89 f9             	mov    %rdi,%rcx
    242e:	48 8d 15 82 05 00 00 	lea    0x582(%rip),%rdx        # 29b7 <array.3094+0x307>
    2435:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    243a:	48 8d 3d 3f 05 00 00 	lea    0x53f(%rip),%rdi        # 2980 <array.3094+0x2d0>
    2441:	e8 9a f5 ff ff       	callq  19e0 <submitr>
    2446:	48 83 c4 10          	add    $0x10,%rsp
    244a:	eb ac                	jmp    23f8 <driver_post+0x1d>
    244c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002450 <__libc_csu_init>:
    2450:	41 57                	push   %r15
    2452:	41 56                	push   %r14
    2454:	41 89 ff             	mov    %edi,%r15d
    2457:	41 55                	push   %r13
    2459:	41 54                	push   %r12
    245b:	4c 8d 25 76 19 20 00 	lea    0x201976(%rip),%r12        # 203dd8 <__frame_dummy_init_array_entry>
    2462:	55                   	push   %rbp
    2463:	48 8d 2d 76 19 20 00 	lea    0x201976(%rip),%rbp        # 203de0 <__init_array_end>
    246a:	53                   	push   %rbx
    246b:	49 89 f6             	mov    %rsi,%r14
    246e:	49 89 d5             	mov    %rdx,%r13
    2471:	4c 29 e5             	sub    %r12,%rbp
    2474:	48 83 ec 08          	sub    $0x8,%rsp
    2478:	48 c1 fd 03          	sar    $0x3,%rbp
    247c:	e8 f7 e8 ff ff       	callq  d78 <_init>
    2481:	48 85 ed             	test   %rbp,%rbp
    2484:	74 20                	je     24a6 <__libc_csu_init+0x56>
    2486:	31 db                	xor    %ebx,%ebx
    2488:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    248f:	00 
    2490:	4c 89 ea             	mov    %r13,%rdx
    2493:	4c 89 f6             	mov    %r14,%rsi
    2496:	44 89 ff             	mov    %r15d,%edi
    2499:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    249d:	48 83 c3 01          	add    $0x1,%rbx
    24a1:	48 39 dd             	cmp    %rbx,%rbp
    24a4:	75 ea                	jne    2490 <__libc_csu_init+0x40>
    24a6:	48 83 c4 08          	add    $0x8,%rsp
    24aa:	5b                   	pop    %rbx
    24ab:	5d                   	pop    %rbp
    24ac:	41 5c                	pop    %r12
    24ae:	41 5d                	pop    %r13
    24b0:	41 5e                	pop    %r14
    24b2:	41 5f                	pop    %r15
    24b4:	c3                   	retq   
    24b5:	90                   	nop
    24b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    24bd:	00 00 00 

00000000000024c0 <__libc_csu_fini>:
    24c0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000000024c4 <_fini>:
    24c4:	48 83 ec 08          	sub    $0x8,%rsp
    24c8:	48 83 c4 08          	add    $0x8,%rsp
    24cc:	c3                   	retq   
