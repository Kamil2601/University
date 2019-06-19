
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bb0 <_init>:
  400bb0:	48 83 ec 08          	sub    $0x8,%rsp
  400bb4:	48 8b 05 3d 34 20 00 	mov    0x20343d(%rip),%rax        # 603ff8 <__gmon_start__>
  400bbb:	48 85 c0             	test   %rax,%rax
  400bbe:	74 02                	je     400bc2 <_init+0x12>
  400bc0:	ff d0                	callq  *%rax
  400bc2:	48 83 c4 08          	add    $0x8,%rsp
  400bc6:	c3                   	retq   

Disassembly of section .plt:

0000000000400bd0 <.plt>:
  400bd0:	ff 35 32 34 20 00    	pushq  0x203432(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bd6:	ff 25 34 34 20 00    	jmpq   *0x203434(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400be0 <strcasecmp@plt>:
  400be0:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 604018 <strcasecmp@GLIBC_2.2.5>
  400be6:	68 00 00 00 00       	pushq  $0x0
  400beb:	e9 e0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400bf0 <__errno_location@plt>:
  400bf0:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 604020 <__errno_location@GLIBC_2.2.5>
  400bf6:	68 01 00 00 00       	pushq  $0x1
  400bfb:	e9 d0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c00 <srandom@plt>:
  400c00:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 604028 <srandom@GLIBC_2.2.5>
  400c06:	68 02 00 00 00       	pushq  $0x2
  400c0b:	e9 c0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c10 <strncmp@plt>:
  400c10:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 604030 <strncmp@GLIBC_2.2.5>
  400c16:	68 03 00 00 00       	pushq  $0x3
  400c1b:	e9 b0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c20 <strcpy@plt>:
  400c20:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 604038 <strcpy@GLIBC_2.2.5>
  400c26:	68 04 00 00 00       	pushq  $0x4
  400c2b:	e9 a0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c30 <puts@plt>:
  400c30:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 604040 <puts@GLIBC_2.2.5>
  400c36:	68 05 00 00 00       	pushq  $0x5
  400c3b:	e9 90 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c40 <write@plt>:
  400c40:	ff 25 02 34 20 00    	jmpq   *0x203402(%rip)        # 604048 <write@GLIBC_2.2.5>
  400c46:	68 06 00 00 00       	pushq  $0x6
  400c4b:	e9 80 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c50 <mmap@plt>:
  400c50:	ff 25 fa 33 20 00    	jmpq   *0x2033fa(%rip)        # 604050 <mmap@GLIBC_2.2.5>
  400c56:	68 07 00 00 00       	pushq  $0x7
  400c5b:	e9 70 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c60 <printf@plt>:
  400c60:	ff 25 f2 33 20 00    	jmpq   *0x2033f2(%rip)        # 604058 <printf@GLIBC_2.2.5>
  400c66:	68 08 00 00 00       	pushq  $0x8
  400c6b:	e9 60 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c70 <memset@plt>:
  400c70:	ff 25 ea 33 20 00    	jmpq   *0x2033ea(%rip)        # 604060 <memset@GLIBC_2.2.5>
  400c76:	68 09 00 00 00       	pushq  $0x9
  400c7b:	e9 50 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c80 <alarm@plt>:
  400c80:	ff 25 e2 33 20 00    	jmpq   *0x2033e2(%rip)        # 604068 <alarm@GLIBC_2.2.5>
  400c86:	68 0a 00 00 00       	pushq  $0xa
  400c8b:	e9 40 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c90 <close@plt>:
  400c90:	ff 25 da 33 20 00    	jmpq   *0x2033da(%rip)        # 604070 <close@GLIBC_2.2.5>
  400c96:	68 0b 00 00 00       	pushq  $0xb
  400c9b:	e9 30 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400ca0 <read@plt>:
  400ca0:	ff 25 d2 33 20 00    	jmpq   *0x2033d2(%rip)        # 604078 <read@GLIBC_2.2.5>
  400ca6:	68 0c 00 00 00       	pushq  $0xc
  400cab:	e9 20 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cb0 <signal@plt>:
  400cb0:	ff 25 ca 33 20 00    	jmpq   *0x2033ca(%rip)        # 604080 <signal@GLIBC_2.2.5>
  400cb6:	68 0d 00 00 00       	pushq  $0xd
  400cbb:	e9 10 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cc0 <gethostbyname@plt>:
  400cc0:	ff 25 c2 33 20 00    	jmpq   *0x2033c2(%rip)        # 604088 <gethostbyname@GLIBC_2.2.5>
  400cc6:	68 0e 00 00 00       	pushq  $0xe
  400ccb:	e9 00 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cd0 <fprintf@plt>:
  400cd0:	ff 25 ba 33 20 00    	jmpq   *0x2033ba(%rip)        # 604090 <fprintf@GLIBC_2.2.5>
  400cd6:	68 0f 00 00 00       	pushq  $0xf
  400cdb:	e9 f0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400ce0 <strtol@plt>:
  400ce0:	ff 25 b2 33 20 00    	jmpq   *0x2033b2(%rip)        # 604098 <strtol@GLIBC_2.2.5>
  400ce6:	68 10 00 00 00       	pushq  $0x10
  400ceb:	e9 e0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400cf0 <memcpy@plt>:
  400cf0:	ff 25 aa 33 20 00    	jmpq   *0x2033aa(%rip)        # 6040a0 <memcpy@GLIBC_2.14>
  400cf6:	68 11 00 00 00       	pushq  $0x11
  400cfb:	e9 d0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d00 <time@plt>:
  400d00:	ff 25 a2 33 20 00    	jmpq   *0x2033a2(%rip)        # 6040a8 <time@GLIBC_2.2.5>
  400d06:	68 12 00 00 00       	pushq  $0x12
  400d0b:	e9 c0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d10 <random@plt>:
  400d10:	ff 25 9a 33 20 00    	jmpq   *0x20339a(%rip)        # 6040b0 <random@GLIBC_2.2.5>
  400d16:	68 13 00 00 00       	pushq  $0x13
  400d1b:	e9 b0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d20 <_IO_getc@plt>:
  400d20:	ff 25 92 33 20 00    	jmpq   *0x203392(%rip)        # 6040b8 <_IO_getc@GLIBC_2.2.5>
  400d26:	68 14 00 00 00       	pushq  $0x14
  400d2b:	e9 a0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d30 <__isoc99_sscanf@plt>:
  400d30:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 6040c0 <__isoc99_sscanf@GLIBC_2.7>
  400d36:	68 15 00 00 00       	pushq  $0x15
  400d3b:	e9 90 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d40 <munmap@plt>:
  400d40:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 6040c8 <munmap@GLIBC_2.2.5>
  400d46:	68 16 00 00 00       	pushq  $0x16
  400d4b:	e9 80 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d50 <bcopy@plt>:
  400d50:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 6040d0 <bcopy@GLIBC_2.2.5>
  400d56:	68 17 00 00 00       	pushq  $0x17
  400d5b:	e9 70 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d60 <fopen@plt>:
  400d60:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 6040d8 <fopen@GLIBC_2.2.5>
  400d66:	68 18 00 00 00       	pushq  $0x18
  400d6b:	e9 60 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d70 <getopt@plt>:
  400d70:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 6040e0 <getopt@GLIBC_2.2.5>
  400d76:	68 19 00 00 00       	pushq  $0x19
  400d7b:	e9 50 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d80 <strtoul@plt>:
  400d80:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 6040e8 <strtoul@GLIBC_2.2.5>
  400d86:	68 1a 00 00 00       	pushq  $0x1a
  400d8b:	e9 40 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d90 <gethostname@plt>:
  400d90:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 6040f0 <gethostname@GLIBC_2.2.5>
  400d96:	68 1b 00 00 00       	pushq  $0x1b
  400d9b:	e9 30 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400da0 <sprintf@plt>:
  400da0:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 6040f8 <sprintf@GLIBC_2.2.5>
  400da6:	68 1c 00 00 00       	pushq  $0x1c
  400dab:	e9 20 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400db0 <exit@plt>:
  400db0:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 604100 <exit@GLIBC_2.2.5>
  400db6:	68 1d 00 00 00       	pushq  $0x1d
  400dbb:	e9 10 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dc0 <connect@plt>:
  400dc0:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 604108 <connect@GLIBC_2.2.5>
  400dc6:	68 1e 00 00 00       	pushq  $0x1e
  400dcb:	e9 00 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dd0 <socket@plt>:
  400dd0:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 604110 <socket@GLIBC_2.2.5>
  400dd6:	68 1f 00 00 00       	pushq  $0x1f
  400ddb:	e9 f0 fd ff ff       	jmpq   400bd0 <.plt>

Disassembly of section .text:

0000000000400de0 <_start>:
  400de0:	31 ed                	xor    %ebp,%ebp
  400de2:	49 89 d1             	mov    %rdx,%r9
  400de5:	5e                   	pop    %rsi
  400de6:	48 89 e2             	mov    %rsp,%rdx
  400de9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400ded:	50                   	push   %rax
  400dee:	54                   	push   %rsp
  400def:	49 c7 c0 10 2c 40 00 	mov    $0x402c10,%r8
  400df6:	48 c7 c1 a0 2b 40 00 	mov    $0x402ba0,%rcx
  400dfd:	48 c7 c7 ba 10 40 00 	mov    $0x4010ba,%rdi
  400e04:	ff 15 e6 31 20 00    	callq  *0x2031e6(%rip)        # 603ff0 <__libc_start_main@GLIBC_2.2.5>
  400e0a:	f4                   	hlt    
  400e0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400e10 <deregister_tm_clones>:
  400e10:	b8 97 44 60 00       	mov    $0x604497,%eax
  400e15:	55                   	push   %rbp
  400e16:	48 2d 90 44 60 00    	sub    $0x604490,%rax
  400e1c:	48 83 f8 0e          	cmp    $0xe,%rax
  400e20:	48 89 e5             	mov    %rsp,%rbp
  400e23:	76 1b                	jbe    400e40 <deregister_tm_clones+0x30>
  400e25:	b8 00 00 00 00       	mov    $0x0,%eax
  400e2a:	48 85 c0             	test   %rax,%rax
  400e2d:	74 11                	je     400e40 <deregister_tm_clones+0x30>
  400e2f:	5d                   	pop    %rbp
  400e30:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e35:	ff e0                	jmpq   *%rax
  400e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e3e:	00 00 
  400e40:	5d                   	pop    %rbp
  400e41:	c3                   	retq   
  400e42:	0f 1f 40 00          	nopl   0x0(%rax)
  400e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e4d:	00 00 00 

0000000000400e50 <register_tm_clones>:
  400e50:	be 90 44 60 00       	mov    $0x604490,%esi
  400e55:	55                   	push   %rbp
  400e56:	48 81 ee 90 44 60 00 	sub    $0x604490,%rsi
  400e5d:	48 c1 fe 03          	sar    $0x3,%rsi
  400e61:	48 89 e5             	mov    %rsp,%rbp
  400e64:	48 89 f0             	mov    %rsi,%rax
  400e67:	48 c1 e8 3f          	shr    $0x3f,%rax
  400e6b:	48 01 c6             	add    %rax,%rsi
  400e6e:	48 d1 fe             	sar    %rsi
  400e71:	74 15                	je     400e88 <register_tm_clones+0x38>
  400e73:	b8 00 00 00 00       	mov    $0x0,%eax
  400e78:	48 85 c0             	test   %rax,%rax
  400e7b:	74 0b                	je     400e88 <register_tm_clones+0x38>
  400e7d:	5d                   	pop    %rbp
  400e7e:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e83:	ff e0                	jmpq   *%rax
  400e85:	0f 1f 00             	nopl   (%rax)
  400e88:	5d                   	pop    %rbp
  400e89:	c3                   	retq   
  400e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e90 <__do_global_dtors_aux>:
  400e90:	80 3d 31 36 20 00 00 	cmpb   $0x0,0x203631(%rip)        # 6044c8 <completed.6972>
  400e97:	75 11                	jne    400eaa <__do_global_dtors_aux+0x1a>
  400e99:	55                   	push   %rbp
  400e9a:	48 89 e5             	mov    %rsp,%rbp
  400e9d:	e8 6e ff ff ff       	callq  400e10 <deregister_tm_clones>
  400ea2:	5d                   	pop    %rbp
  400ea3:	c6 05 1e 36 20 00 01 	movb   $0x1,0x20361e(%rip)        # 6044c8 <completed.6972>
  400eaa:	f3 c3                	repz retq 
  400eac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400eb0 <frame_dummy>:
  400eb0:	bf 18 3e 60 00       	mov    $0x603e18,%edi
  400eb5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400eb9:	75 05                	jne    400ec0 <frame_dummy+0x10>
  400ebb:	eb 93                	jmp    400e50 <register_tm_clones>
  400ebd:	0f 1f 00             	nopl   (%rax)
  400ec0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ec5:	48 85 c0             	test   %rax,%rax
  400ec8:	74 f1                	je     400ebb <frame_dummy+0xb>
  400eca:	55                   	push   %rbp
  400ecb:	48 89 e5             	mov    %rsp,%rbp
  400ece:	ff d0                	callq  *%rax
  400ed0:	5d                   	pop    %rbp
  400ed1:	e9 7a ff ff ff       	jmpq   400e50 <register_tm_clones>

0000000000400ed6 <usage>:
  400ed6:	48 83 ec 08          	sub    $0x8,%rsp
  400eda:	48 89 fe             	mov    %rdi,%rsi
  400edd:	83 3d 24 36 20 00 00 	cmpl   $0x0,0x203624(%rip)        # 604508 <is_checker>
  400ee4:	74 4b                	je     400f31 <usage+0x5b>
  400ee6:	48 8d 3d 3b 1d 00 00 	lea    0x1d3b(%rip),%rdi        # 402c28 <_IO_stdin_used+0x8>
  400eed:	b8 00 00 00 00       	mov    $0x0,%eax
  400ef2:	e8 69 fd ff ff       	callq  400c60 <printf@plt>
  400ef7:	48 8d 3d 62 1d 00 00 	lea    0x1d62(%rip),%rdi        # 402c60 <_IO_stdin_used+0x40>
  400efe:	e8 2d fd ff ff       	callq  400c30 <puts@plt>
  400f03:	48 8d 3d ce 1e 00 00 	lea    0x1ece(%rip),%rdi        # 402dd8 <_IO_stdin_used+0x1b8>
  400f0a:	e8 21 fd ff ff       	callq  400c30 <puts@plt>
  400f0f:	48 8d 3d 72 1d 00 00 	lea    0x1d72(%rip),%rdi        # 402c88 <_IO_stdin_used+0x68>
  400f16:	e8 15 fd ff ff       	callq  400c30 <puts@plt>
  400f1b:	48 8d 3d d0 1e 00 00 	lea    0x1ed0(%rip),%rdi        # 402df2 <_IO_stdin_used+0x1d2>
  400f22:	e8 09 fd ff ff       	callq  400c30 <puts@plt>
  400f27:	bf 00 00 00 00       	mov    $0x0,%edi
  400f2c:	e8 7f fe ff ff       	callq  400db0 <exit@plt>
  400f31:	48 8d 3d d6 1e 00 00 	lea    0x1ed6(%rip),%rdi        # 402e0e <_IO_stdin_used+0x1ee>
  400f38:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3d:	e8 1e fd ff ff       	callq  400c60 <printf@plt>
  400f42:	48 8d 3d 67 1d 00 00 	lea    0x1d67(%rip),%rdi        # 402cb0 <_IO_stdin_used+0x90>
  400f49:	e8 e2 fc ff ff       	callq  400c30 <puts@plt>
  400f4e:	48 8d 3d 83 1d 00 00 	lea    0x1d83(%rip),%rdi        # 402cd8 <_IO_stdin_used+0xb8>
  400f55:	e8 d6 fc ff ff       	callq  400c30 <puts@plt>
  400f5a:	48 8d 3d cb 1e 00 00 	lea    0x1ecb(%rip),%rdi        # 402e2c <_IO_stdin_used+0x20c>
  400f61:	e8 ca fc ff ff       	callq  400c30 <puts@plt>
  400f66:	eb bf                	jmp    400f27 <usage+0x51>

0000000000400f68 <initialize_target>:
  400f68:	55                   	push   %rbp
  400f69:	53                   	push   %rbx
  400f6a:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400f71:	89 f5                	mov    %esi,%ebp
  400f73:	89 3d 7f 35 20 00    	mov    %edi,0x20357f(%rip)        # 6044f8 <check_level>
  400f79:	8b 3d b1 31 20 00    	mov    0x2031b1(%rip),%edi        # 604130 <target_id>
  400f7f:	e8 f6 1b 00 00       	callq  402b7a <gencookie>
  400f84:	89 05 7a 35 20 00    	mov    %eax,0x20357a(%rip)        # 604504 <cookie>
  400f8a:	89 c7                	mov    %eax,%edi
  400f8c:	e8 e9 1b 00 00       	callq  402b7a <gencookie>
  400f91:	89 05 69 35 20 00    	mov    %eax,0x203569(%rip)        # 604500 <authkey>
  400f97:	8b 05 93 31 20 00    	mov    0x203193(%rip),%eax        # 604130 <target_id>
  400f9d:	8d 78 01             	lea    0x1(%rax),%edi
  400fa0:	e8 5b fc ff ff       	callq  400c00 <srandom@plt>
  400fa5:	e8 66 fd ff ff       	callq  400d10 <random@plt>
  400faa:	89 c7                	mov    %eax,%edi
  400fac:	e8 f0 02 00 00       	callq  4012a1 <scramble>
  400fb1:	89 c3                	mov    %eax,%ebx
  400fb3:	85 ed                	test   %ebp,%ebp
  400fb5:	75 3d                	jne    400ff4 <initialize_target+0x8c>
  400fb7:	b8 00 00 00 00       	mov    $0x0,%eax
  400fbc:	01 d8                	add    %ebx,%eax
  400fbe:	0f b7 c0             	movzwl %ax,%eax
  400fc1:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  400fc8:	89 c0                	mov    %eax,%eax
  400fca:	48 89 05 af 34 20 00 	mov    %rax,0x2034af(%rip)        # 604480 <buf_offset>
  400fd1:	c6 05 50 41 20 00 63 	movb   $0x63,0x204150(%rip)        # 605128 <target_prefix>
  400fd8:	83 3d a9 34 20 00 00 	cmpl   $0x0,0x2034a9(%rip)        # 604488 <notify>
  400fdf:	74 09                	je     400fea <initialize_target+0x82>
  400fe1:	83 3d 20 35 20 00 00 	cmpl   $0x0,0x203520(%rip)        # 604508 <is_checker>
  400fe8:	74 22                	je     40100c <initialize_target+0xa4>
  400fea:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  400ff1:	5b                   	pop    %rbx
  400ff2:	5d                   	pop    %rbp
  400ff3:	c3                   	retq   
  400ff4:	bf 00 00 00 00       	mov    $0x0,%edi
  400ff9:	e8 02 fd ff ff       	callq  400d00 <time@plt>
  400ffe:	89 c7                	mov    %eax,%edi
  401000:	e8 fb fb ff ff       	callq  400c00 <srandom@plt>
  401005:	e8 06 fd ff ff       	callq  400d10 <random@plt>
  40100a:	eb b0                	jmp    400fbc <initialize_target+0x54>
  40100c:	48 89 e7             	mov    %rsp,%rdi
  40100f:	be 00 01 00 00       	mov    $0x100,%esi
  401014:	e8 77 fd ff ff       	callq  400d90 <gethostname@plt>
  401019:	89 c5                	mov    %eax,%ebp
  40101b:	85 c0                	test   %eax,%eax
  40101d:	75 26                	jne    401045 <initialize_target+0xdd>
  40101f:	89 c3                	mov    %eax,%ebx
  401021:	48 63 c3             	movslq %ebx,%rax
  401024:	48 8d 15 35 31 20 00 	lea    0x203135(%rip),%rdx        # 604160 <host_table>
  40102b:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40102f:	48 85 ff             	test   %rdi,%rdi
  401032:	74 2c                	je     401060 <initialize_target+0xf8>
  401034:	48 89 e6             	mov    %rsp,%rsi
  401037:	e8 a4 fb ff ff       	callq  400be0 <strcasecmp@plt>
  40103c:	85 c0                	test   %eax,%eax
  40103e:	74 1b                	je     40105b <initialize_target+0xf3>
  401040:	83 c3 01             	add    $0x1,%ebx
  401043:	eb dc                	jmp    401021 <initialize_target+0xb9>
  401045:	48 8d 3d bc 1c 00 00 	lea    0x1cbc(%rip),%rdi        # 402d08 <_IO_stdin_used+0xe8>
  40104c:	e8 df fb ff ff       	callq  400c30 <puts@plt>
  401051:	bf 08 00 00 00       	mov    $0x8,%edi
  401056:	e8 55 fd ff ff       	callq  400db0 <exit@plt>
  40105b:	bd 01 00 00 00       	mov    $0x1,%ebp
  401060:	85 ed                	test   %ebp,%ebp
  401062:	74 38                	je     40109c <initialize_target+0x134>
  401064:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40106b:	00 
  40106c:	e8 8e 18 00 00       	callq  4028ff <init_driver>
  401071:	85 c0                	test   %eax,%eax
  401073:	0f 89 71 ff ff ff    	jns    400fea <initialize_target+0x82>
  401079:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401080:	00 
  401081:	48 8d 3d f8 1c 00 00 	lea    0x1cf8(%rip),%rdi        # 402d80 <_IO_stdin_used+0x160>
  401088:	b8 00 00 00 00       	mov    $0x0,%eax
  40108d:	e8 ce fb ff ff       	callq  400c60 <printf@plt>
  401092:	bf 08 00 00 00       	mov    $0x8,%edi
  401097:	e8 14 fd ff ff       	callq  400db0 <exit@plt>
  40109c:	48 89 e6             	mov    %rsp,%rsi
  40109f:	48 8d 3d 9a 1c 00 00 	lea    0x1c9a(%rip),%rdi        # 402d40 <_IO_stdin_used+0x120>
  4010a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ab:	e8 b0 fb ff ff       	callq  400c60 <printf@plt>
  4010b0:	bf 08 00 00 00       	mov    $0x8,%edi
  4010b5:	e8 f6 fc ff ff       	callq  400db0 <exit@plt>

00000000004010ba <main>:
  4010ba:	41 56                	push   %r14
  4010bc:	41 55                	push   %r13
  4010be:	41 54                	push   %r12
  4010c0:	55                   	push   %rbp
  4010c1:	53                   	push   %rbx
  4010c2:	41 89 fc             	mov    %edi,%r12d
  4010c5:	48 89 f3             	mov    %rsi,%rbx
  4010c8:	48 c7 c6 a5 1c 40 00 	mov    $0x401ca5,%rsi
  4010cf:	bf 0b 00 00 00       	mov    $0xb,%edi
  4010d4:	e8 d7 fb ff ff       	callq  400cb0 <signal@plt>
  4010d9:	48 c7 c6 51 1c 40 00 	mov    $0x401c51,%rsi
  4010e0:	bf 07 00 00 00       	mov    $0x7,%edi
  4010e5:	e8 c6 fb ff ff       	callq  400cb0 <signal@plt>
  4010ea:	48 c7 c6 f9 1c 40 00 	mov    $0x401cf9,%rsi
  4010f1:	bf 04 00 00 00       	mov    $0x4,%edi
  4010f6:	e8 b5 fb ff ff       	callq  400cb0 <signal@plt>
  4010fb:	83 3d 06 34 20 00 00 	cmpl   $0x0,0x203406(%rip)        # 604508 <is_checker>
  401102:	75 58                	jne    40115c <main+0xa2>
  401104:	48 8d 2d 3a 1d 00 00 	lea    0x1d3a(%rip),%rbp        # 402e45 <_IO_stdin_used+0x225>
  40110b:	48 8b 05 8e 33 20 00 	mov    0x20338e(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  401112:	48 89 05 d7 33 20 00 	mov    %rax,0x2033d7(%rip)        # 6044f0 <infile>
  401119:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40111f:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401125:	48 89 ea             	mov    %rbp,%rdx
  401128:	48 89 de             	mov    %rbx,%rsi
  40112b:	44 89 e7             	mov    %r12d,%edi
  40112e:	e8 3d fc ff ff       	callq  400d70 <getopt@plt>
  401133:	3c ff                	cmp    $0xff,%al
  401135:	0f 84 f8 00 00 00    	je     401233 <main+0x179>
  40113b:	0f be f0             	movsbl %al,%esi
  40113e:	83 e8 61             	sub    $0x61,%eax
  401141:	3c 10                	cmp    $0x10,%al
  401143:	0f 87 d1 00 00 00    	ja     40121a <main+0x160>
  401149:	0f b6 c0             	movzbl %al,%eax
  40114c:	48 8d 15 3d 1d 00 00 	lea    0x1d3d(%rip),%rdx        # 402e90 <_IO_stdin_used+0x270>
  401153:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  401157:	48 01 d0             	add    %rdx,%rax
  40115a:	ff e0                	jmpq   *%rax
  40115c:	48 c7 c6 4d 1d 40 00 	mov    $0x401d4d,%rsi
  401163:	bf 0e 00 00 00       	mov    $0xe,%edi
  401168:	e8 43 fb ff ff       	callq  400cb0 <signal@plt>
  40116d:	bf 05 00 00 00       	mov    $0x5,%edi
  401172:	e8 09 fb ff ff       	callq  400c80 <alarm@plt>
  401177:	48 8d 2d cc 1c 00 00 	lea    0x1ccc(%rip),%rbp        # 402e4a <_IO_stdin_used+0x22a>
  40117e:	eb 8b                	jmp    40110b <main+0x51>
  401180:	48 8b 3b             	mov    (%rbx),%rdi
  401183:	e8 4e fd ff ff       	callq  400ed6 <usage>
  401188:	48 8d 35 3e 1f 00 00 	lea    0x1f3e(%rip),%rsi        # 4030cd <_IO_stdin_used+0x4ad>
  40118f:	48 8b 3d 12 33 20 00 	mov    0x203312(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  401196:	e8 c5 fb ff ff       	callq  400d60 <fopen@plt>
  40119b:	48 89 05 4e 33 20 00 	mov    %rax,0x20334e(%rip)        # 6044f0 <infile>
  4011a2:	48 85 c0             	test   %rax,%rax
  4011a5:	0f 85 7a ff ff ff    	jne    401125 <main+0x6b>
  4011ab:	48 8b 15 f6 32 20 00 	mov    0x2032f6(%rip),%rdx        # 6044a8 <optarg@@GLIBC_2.2.5>
  4011b2:	48 8d 35 99 1c 00 00 	lea    0x1c99(%rip),%rsi        # 402e52 <_IO_stdin_used+0x232>
  4011b9:	48 8b 3d 00 33 20 00 	mov    0x203300(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  4011c0:	e8 0b fb ff ff       	callq  400cd0 <fprintf@plt>
  4011c5:	b8 01 00 00 00       	mov    $0x1,%eax
  4011ca:	e9 c9 00 00 00       	jmpq   401298 <main+0x1de>
  4011cf:	ba 10 00 00 00       	mov    $0x10,%edx
  4011d4:	be 00 00 00 00       	mov    $0x0,%esi
  4011d9:	48 8b 3d c8 32 20 00 	mov    0x2032c8(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4011e0:	e8 9b fb ff ff       	callq  400d80 <strtoul@plt>
  4011e5:	41 89 c6             	mov    %eax,%r14d
  4011e8:	e9 38 ff ff ff       	jmpq   401125 <main+0x6b>
  4011ed:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011f2:	be 00 00 00 00       	mov    $0x0,%esi
  4011f7:	48 8b 3d aa 32 20 00 	mov    0x2032aa(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4011fe:	e8 dd fa ff ff       	callq  400ce0 <strtol@plt>
  401203:	41 89 c5             	mov    %eax,%r13d
  401206:	e9 1a ff ff ff       	jmpq   401125 <main+0x6b>
  40120b:	c7 05 73 32 20 00 00 	movl   $0x0,0x203273(%rip)        # 604488 <notify>
  401212:	00 00 00 
  401215:	e9 0b ff ff ff       	jmpq   401125 <main+0x6b>
  40121a:	48 8d 3d 4e 1c 00 00 	lea    0x1c4e(%rip),%rdi        # 402e6f <_IO_stdin_used+0x24f>
  401221:	b8 00 00 00 00       	mov    $0x0,%eax
  401226:	e8 35 fa ff ff       	callq  400c60 <printf@plt>
  40122b:	48 8b 3b             	mov    (%rbx),%rdi
  40122e:	e8 a3 fc ff ff       	callq  400ed6 <usage>
  401233:	be 00 00 00 00       	mov    $0x0,%esi
  401238:	44 89 ef             	mov    %r13d,%edi
  40123b:	e8 28 fd ff ff       	callq  400f68 <initialize_target>
  401240:	83 3d c1 32 20 00 00 	cmpl   $0x0,0x2032c1(%rip)        # 604508 <is_checker>
  401247:	74 27                	je     401270 <main+0x1b6>
  401249:	44 3b 35 b0 32 20 00 	cmp    0x2032b0(%rip),%r14d        # 604500 <authkey>
  401250:	74 1e                	je     401270 <main+0x1b6>
  401252:	44 89 f6             	mov    %r14d,%esi
  401255:	48 8d 3d 4c 1b 00 00 	lea    0x1b4c(%rip),%rdi        # 402da8 <_IO_stdin_used+0x188>
  40125c:	b8 00 00 00 00       	mov    $0x0,%eax
  401261:	e8 fa f9 ff ff       	callq  400c60 <printf@plt>
  401266:	b8 00 00 00 00       	mov    $0x0,%eax
  40126b:	e8 b1 06 00 00       	callq  401921 <check_fail>
  401270:	8b 35 8e 32 20 00    	mov    0x20328e(%rip),%esi        # 604504 <cookie>
  401276:	48 8d 3d 05 1c 00 00 	lea    0x1c05(%rip),%rdi        # 402e82 <_IO_stdin_used+0x262>
  40127d:	b8 00 00 00 00       	mov    $0x0,%eax
  401282:	e8 d9 f9 ff ff       	callq  400c60 <printf@plt>
  401287:	48 8b 3d f2 31 20 00 	mov    0x2031f2(%rip),%rdi        # 604480 <buf_offset>
  40128e:	e8 95 0b 00 00       	callq  401e28 <stable_launch>
  401293:	b8 00 00 00 00       	mov    $0x0,%eax
  401298:	5b                   	pop    %rbx
  401299:	5d                   	pop    %rbp
  40129a:	41 5c                	pop    %r12
  40129c:	41 5d                	pop    %r13
  40129e:	41 5e                	pop    %r14
  4012a0:	c3                   	retq   

00000000004012a1 <scramble>:
  4012a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a6:	eb 11                	jmp    4012b9 <scramble+0x18>
  4012a8:	69 d0 49 03 00 00    	imul   $0x349,%eax,%edx
  4012ae:	01 fa                	add    %edi,%edx
  4012b0:	89 c1                	mov    %eax,%ecx
  4012b2:	89 54 8c d0          	mov    %edx,-0x30(%rsp,%rcx,4)
  4012b6:	83 c0 01             	add    $0x1,%eax
  4012b9:	83 f8 09             	cmp    $0x9,%eax
  4012bc:	76 ea                	jbe    4012a8 <scramble+0x7>
  4012be:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4012c2:	69 c0 b6 3a 00 00    	imul   $0x3ab6,%eax,%eax
  4012c8:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4012cc:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4012d0:	69 c0 35 60 00 00    	imul   $0x6035,%eax,%eax
  4012d6:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4012da:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4012de:	69 c0 70 5d 00 00    	imul   $0x5d70,%eax,%eax
  4012e4:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4012e8:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4012ec:	69 c0 87 e1 00 00    	imul   $0xe187,%eax,%eax
  4012f2:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4012f6:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4012fa:	69 c0 82 37 00 00    	imul   $0x3782,%eax,%eax
  401300:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401304:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401308:	69 c0 80 8c 00 00    	imul   $0x8c80,%eax,%eax
  40130e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401312:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401316:	69 c0 9f e0 00 00    	imul   $0xe09f,%eax,%eax
  40131c:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401320:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401324:	69 c0 b3 2a 00 00    	imul   $0x2ab3,%eax,%eax
  40132a:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40132e:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401332:	69 c0 d9 de 00 00    	imul   $0xded9,%eax,%eax
  401338:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40133c:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401340:	69 c0 2b dc 00 00    	imul   $0xdc2b,%eax,%eax
  401346:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40134a:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40134e:	69 c0 bd 5a 00 00    	imul   $0x5abd,%eax,%eax
  401354:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401358:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40135c:	69 c0 65 5e 00 00    	imul   $0x5e65,%eax,%eax
  401362:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401366:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40136a:	69 c0 c4 f2 00 00    	imul   $0xf2c4,%eax,%eax
  401370:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401374:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401378:	69 c0 63 a5 00 00    	imul   $0xa563,%eax,%eax
  40137e:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401382:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401386:	69 c0 3a db 00 00    	imul   $0xdb3a,%eax,%eax
  40138c:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401390:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401394:	69 c0 f7 51 00 00    	imul   $0x51f7,%eax,%eax
  40139a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40139e:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4013a2:	69 c0 d6 7c 00 00    	imul   $0x7cd6,%eax,%eax
  4013a8:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4013ac:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4013b0:	69 c0 91 09 00 00    	imul   $0x991,%eax,%eax
  4013b6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4013ba:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4013be:	69 c0 a2 97 00 00    	imul   $0x97a2,%eax,%eax
  4013c4:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4013c8:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4013cc:	69 c0 c0 3e 00 00    	imul   $0x3ec0,%eax,%eax
  4013d2:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4013d6:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4013da:	69 c0 dd 16 00 00    	imul   $0x16dd,%eax,%eax
  4013e0:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4013e4:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4013e8:	69 c0 b0 85 00 00    	imul   $0x85b0,%eax,%eax
  4013ee:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4013f2:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4013f6:	69 c0 07 e7 00 00    	imul   $0xe707,%eax,%eax
  4013fc:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401400:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401404:	69 c0 62 d8 00 00    	imul   $0xd862,%eax,%eax
  40140a:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40140e:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401412:	69 c0 8b 71 00 00    	imul   $0x718b,%eax,%eax
  401418:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40141c:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401420:	69 c0 86 ba 00 00    	imul   $0xba86,%eax,%eax
  401426:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40142a:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40142e:	69 c0 21 5a 00 00    	imul   $0x5a21,%eax,%eax
  401434:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401438:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40143c:	69 c0 82 8d 00 00    	imul   $0x8d82,%eax,%eax
  401442:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401446:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40144a:	69 c0 b1 6f 00 00    	imul   $0x6fb1,%eax,%eax
  401450:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401454:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401458:	69 c0 93 9b 00 00    	imul   $0x9b93,%eax,%eax
  40145e:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401462:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401466:	69 c0 eb 2b 00 00    	imul   $0x2beb,%eax,%eax
  40146c:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401470:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401474:	69 c0 dc 60 00 00    	imul   $0x60dc,%eax,%eax
  40147a:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40147e:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401482:	69 c0 b6 9f 00 00    	imul   $0x9fb6,%eax,%eax
  401488:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40148c:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401490:	69 c0 09 83 00 00    	imul   $0x8309,%eax,%eax
  401496:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40149a:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40149e:	69 c0 86 55 00 00    	imul   $0x5586,%eax,%eax
  4014a4:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4014a8:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4014ac:	69 c0 7c 06 00 00    	imul   $0x67c,%eax,%eax
  4014b2:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4014b6:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4014ba:	69 c0 0a 8d 00 00    	imul   $0x8d0a,%eax,%eax
  4014c0:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4014c4:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4014c8:	69 c0 df 63 00 00    	imul   $0x63df,%eax,%eax
  4014ce:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4014d2:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4014d6:	69 c0 90 3c 00 00    	imul   $0x3c90,%eax,%eax
  4014dc:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4014e0:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4014e4:	69 c0 f2 39 00 00    	imul   $0x39f2,%eax,%eax
  4014ea:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4014ee:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4014f2:	69 c0 cf f0 00 00    	imul   $0xf0cf,%eax,%eax
  4014f8:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4014fc:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401500:	69 c0 64 7a 00 00    	imul   $0x7a64,%eax,%eax
  401506:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40150a:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40150e:	69 c0 64 0d 00 00    	imul   $0xd64,%eax,%eax
  401514:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401518:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40151c:	69 c0 d5 97 00 00    	imul   $0x97d5,%eax,%eax
  401522:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401526:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40152a:	69 c0 cb 3a 00 00    	imul   $0x3acb,%eax,%eax
  401530:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401534:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401538:	69 c0 01 c8 00 00    	imul   $0xc801,%eax,%eax
  40153e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401542:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401546:	69 c0 f2 20 00 00    	imul   $0x20f2,%eax,%eax
  40154c:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401550:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401554:	69 c0 78 0f 00 00    	imul   $0xf78,%eax,%eax
  40155a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40155e:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401562:	69 c0 4a 93 00 00    	imul   $0x934a,%eax,%eax
  401568:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40156c:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401570:	69 c0 01 f8 00 00    	imul   $0xf801,%eax,%eax
  401576:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40157a:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40157e:	69 c0 4b 54 00 00    	imul   $0x544b,%eax,%eax
  401584:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401588:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40158c:	69 c0 33 55 00 00    	imul   $0x5533,%eax,%eax
  401592:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401596:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40159a:	69 c0 ab 8a 00 00    	imul   $0x8aab,%eax,%eax
  4015a0:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4015a4:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015a8:	69 c0 67 55 00 00    	imul   $0x5567,%eax,%eax
  4015ae:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015b2:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015b6:	69 c0 54 f5 00 00    	imul   $0xf554,%eax,%eax
  4015bc:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015c0:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4015c4:	69 c0 57 75 00 00    	imul   $0x7557,%eax,%eax
  4015ca:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4015ce:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015d2:	69 c0 d1 83 00 00    	imul   $0x83d1,%eax,%eax
  4015d8:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015dc:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015e0:	69 c0 14 31 00 00    	imul   $0x3114,%eax,%eax
  4015e6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015ea:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015ee:	69 c0 a1 f7 00 00    	imul   $0xf7a1,%eax,%eax
  4015f4:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015f8:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4015fc:	69 c0 4b 0e 00 00    	imul   $0xe4b,%eax,%eax
  401602:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401606:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40160a:	69 c0 52 fc 00 00    	imul   $0xfc52,%eax,%eax
  401610:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401614:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401618:	69 c0 22 99 00 00    	imul   $0x9922,%eax,%eax
  40161e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401622:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401626:	69 c0 29 ff 00 00    	imul   $0xff29,%eax,%eax
  40162c:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401630:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401634:	69 c0 ed dd 00 00    	imul   $0xdded,%eax,%eax
  40163a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40163e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401642:	69 c0 1c 3b 00 00    	imul   $0x3b1c,%eax,%eax
  401648:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40164c:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401650:	69 c0 44 7b 00 00    	imul   $0x7b44,%eax,%eax
  401656:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40165a:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40165e:	69 c0 6d d4 00 00    	imul   $0xd46d,%eax,%eax
  401664:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401668:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40166c:	69 c0 bd 70 00 00    	imul   $0x70bd,%eax,%eax
  401672:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401676:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40167a:	69 c0 8a 89 00 00    	imul   $0x898a,%eax,%eax
  401680:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401684:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401688:	69 c0 53 26 00 00    	imul   $0x2653,%eax,%eax
  40168e:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401692:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401696:	69 c0 7d 55 00 00    	imul   $0x557d,%eax,%eax
  40169c:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4016a0:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4016a4:	69 c0 01 65 00 00    	imul   $0x6501,%eax,%eax
  4016aa:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4016ae:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016b2:	69 c0 65 8b 00 00    	imul   $0x8b65,%eax,%eax
  4016b8:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4016bc:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4016c0:	69 c0 84 6a 00 00    	imul   $0x6a84,%eax,%eax
  4016c6:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4016ca:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4016ce:	69 c0 ff 5e 00 00    	imul   $0x5eff,%eax,%eax
  4016d4:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4016d8:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4016dc:	69 c0 72 b5 00 00    	imul   $0xb572,%eax,%eax
  4016e2:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4016e6:	ba 00 00 00 00       	mov    $0x0,%edx
  4016eb:	b8 00 00 00 00       	mov    $0x0,%eax
  4016f0:	eb 0b                	jmp    4016fd <scramble+0x45c>
  4016f2:	89 d1                	mov    %edx,%ecx
  4016f4:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  4016f8:	01 c8                	add    %ecx,%eax
  4016fa:	83 c2 01             	add    $0x1,%edx
  4016fd:	83 fa 09             	cmp    $0x9,%edx
  401700:	76 f0                	jbe    4016f2 <scramble+0x451>
  401702:	f3 c3                	repz retq 

0000000000401704 <getbuf>:
  401704:	48 83 ec 28          	sub    $0x28,%rsp
  401708:	48 89 e7             	mov    %rsp,%rdi
  40170b:	e8 44 02 00 00       	callq  401954 <Gets>
  401710:	b8 01 00 00 00       	mov    $0x1,%eax
  401715:	48 83 c4 28          	add    $0x28,%rsp
  401719:	c3                   	retq   

000000000040171a <touch1>:
  40171a:	48 83 ec 08          	sub    $0x8,%rsp
  40171e:	c7 05 d4 2d 20 00 01 	movl   $0x1,0x202dd4(%rip)        # 6044fc <vlevel>
  401725:	00 00 00 
  401728:	48 8d 3d f3 17 00 00 	lea    0x17f3(%rip),%rdi        # 402f22 <_IO_stdin_used+0x302>
  40172f:	e8 fc f4 ff ff       	callq  400c30 <puts@plt>
  401734:	bf 01 00 00 00       	mov    $0x1,%edi
  401739:	e8 2d 04 00 00       	callq  401b6b <validate>
  40173e:	bf 00 00 00 00       	mov    $0x0,%edi
  401743:	e8 68 f6 ff ff       	callq  400db0 <exit@plt>

0000000000401748 <touch2>:
  401748:	48 83 ec 08          	sub    $0x8,%rsp
  40174c:	89 fe                	mov    %edi,%esi
  40174e:	c7 05 a4 2d 20 00 02 	movl   $0x2,0x202da4(%rip)        # 6044fc <vlevel>
  401755:	00 00 00 
  401758:	39 3d a6 2d 20 00    	cmp    %edi,0x202da6(%rip)        # 604504 <cookie>
  40175e:	74 25                	je     401785 <touch2+0x3d>
  401760:	48 8d 3d 09 18 00 00 	lea    0x1809(%rip),%rdi        # 402f70 <_IO_stdin_used+0x350>
  401767:	b8 00 00 00 00       	mov    $0x0,%eax
  40176c:	e8 ef f4 ff ff       	callq  400c60 <printf@plt>
  401771:	bf 02 00 00 00       	mov    $0x2,%edi
  401776:	e8 ae 04 00 00       	callq  401c29 <fail>
  40177b:	bf 00 00 00 00       	mov    $0x0,%edi
  401780:	e8 2b f6 ff ff       	callq  400db0 <exit@plt>
  401785:	48 8d 3d bc 17 00 00 	lea    0x17bc(%rip),%rdi        # 402f48 <_IO_stdin_used+0x328>
  40178c:	b8 00 00 00 00       	mov    $0x0,%eax
  401791:	e8 ca f4 ff ff       	callq  400c60 <printf@plt>
  401796:	bf 02 00 00 00       	mov    $0x2,%edi
  40179b:	e8 cb 03 00 00       	callq  401b6b <validate>
  4017a0:	eb d9                	jmp    40177b <touch2+0x33>

00000000004017a2 <hexmatch>:
  4017a2:	41 54                	push   %r12
  4017a4:	55                   	push   %rbp
  4017a5:	53                   	push   %rbx
  4017a6:	48 83 ec 70          	sub    $0x70,%rsp
  4017aa:	89 fd                	mov    %edi,%ebp
  4017ac:	48 89 f3             	mov    %rsi,%rbx
  4017af:	e8 5c f5 ff ff       	callq  400d10 <random@plt>
  4017b4:	48 89 c1             	mov    %rax,%rcx
  4017b7:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  4017be:	0a d7 a3 
  4017c1:	48 f7 ea             	imul   %rdx
  4017c4:	48 01 ca             	add    %rcx,%rdx
  4017c7:	48 c1 fa 06          	sar    $0x6,%rdx
  4017cb:	48 89 c8             	mov    %rcx,%rax
  4017ce:	48 c1 f8 3f          	sar    $0x3f,%rax
  4017d2:	48 29 c2             	sub    %rax,%rdx
  4017d5:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  4017d9:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  4017dd:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  4017e4:	00 
  4017e5:	48 29 c1             	sub    %rax,%rcx
  4017e8:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  4017ec:	89 ea                	mov    %ebp,%edx
  4017ee:	48 8d 35 4a 17 00 00 	lea    0x174a(%rip),%rsi        # 402f3f <_IO_stdin_used+0x31f>
  4017f5:	4c 89 e7             	mov    %r12,%rdi
  4017f8:	b8 00 00 00 00       	mov    $0x0,%eax
  4017fd:	e8 9e f5 ff ff       	callq  400da0 <sprintf@plt>
  401802:	ba 09 00 00 00       	mov    $0x9,%edx
  401807:	4c 89 e6             	mov    %r12,%rsi
  40180a:	48 89 df             	mov    %rbx,%rdi
  40180d:	e8 fe f3 ff ff       	callq  400c10 <strncmp@plt>
  401812:	85 c0                	test   %eax,%eax
  401814:	0f 94 c0             	sete   %al
  401817:	0f b6 c0             	movzbl %al,%eax
  40181a:	48 83 c4 70          	add    $0x70,%rsp
  40181e:	5b                   	pop    %rbx
  40181f:	5d                   	pop    %rbp
  401820:	41 5c                	pop    %r12
  401822:	c3                   	retq   

0000000000401823 <touch3>:
  401823:	53                   	push   %rbx
  401824:	48 89 fb             	mov    %rdi,%rbx
  401827:	c7 05 cb 2c 20 00 03 	movl   $0x3,0x202ccb(%rip)        # 6044fc <vlevel>
  40182e:	00 00 00 
  401831:	48 89 fe             	mov    %rdi,%rsi
  401834:	8b 3d ca 2c 20 00    	mov    0x202cca(%rip),%edi        # 604504 <cookie>
  40183a:	e8 63 ff ff ff       	callq  4017a2 <hexmatch>
  40183f:	85 c0                	test   %eax,%eax
  401841:	74 28                	je     40186b <touch3+0x48>
  401843:	48 89 de             	mov    %rbx,%rsi
  401846:	48 8d 3d 4b 17 00 00 	lea    0x174b(%rip),%rdi        # 402f98 <_IO_stdin_used+0x378>
  40184d:	b8 00 00 00 00       	mov    $0x0,%eax
  401852:	e8 09 f4 ff ff       	callq  400c60 <printf@plt>
  401857:	bf 03 00 00 00       	mov    $0x3,%edi
  40185c:	e8 0a 03 00 00       	callq  401b6b <validate>
  401861:	bf 00 00 00 00       	mov    $0x0,%edi
  401866:	e8 45 f5 ff ff       	callq  400db0 <exit@plt>
  40186b:	48 89 de             	mov    %rbx,%rsi
  40186e:	48 8d 3d 4b 17 00 00 	lea    0x174b(%rip),%rdi        # 402fc0 <_IO_stdin_used+0x3a0>
  401875:	b8 00 00 00 00       	mov    $0x0,%eax
  40187a:	e8 e1 f3 ff ff       	callq  400c60 <printf@plt>
  40187f:	bf 03 00 00 00       	mov    $0x3,%edi
  401884:	e8 a0 03 00 00       	callq  401c29 <fail>
  401889:	eb d6                	jmp    401861 <touch3+0x3e>

000000000040188b <test>:
  40188b:	48 83 ec 08          	sub    $0x8,%rsp
  40188f:	b8 00 00 00 00       	mov    $0x0,%eax
  401894:	e8 6b fe ff ff       	callq  401704 <getbuf>
  401899:	89 c6                	mov    %eax,%esi
  40189b:	48 8d 3d 46 17 00 00 	lea    0x1746(%rip),%rdi        # 402fe8 <_IO_stdin_used+0x3c8>
  4018a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a7:	e8 b4 f3 ff ff       	callq  400c60 <printf@plt>
  4018ac:	48 83 c4 08          	add    $0x8,%rsp
  4018b0:	c3                   	retq   

00000000004018b1 <save_char>:
  4018b1:	8b 05 6d 38 20 00    	mov    0x20386d(%rip),%eax        # 605124 <gets_cnt>
  4018b7:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  4018bc:	7f 4a                	jg     401908 <save_char+0x57>
  4018be:	8d 14 40             	lea    (%rax,%rax,2),%edx
  4018c1:	89 f9                	mov    %edi,%ecx
  4018c3:	c0 e9 04             	shr    $0x4,%cl
  4018c6:	4c 8d 05 43 1a 00 00 	lea    0x1a43(%rip),%r8        # 403310 <trans_char>
  4018cd:	83 e1 0f             	and    $0xf,%ecx
  4018d0:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  4018d5:	48 8d 0d 44 2c 20 00 	lea    0x202c44(%rip),%rcx        # 604520 <gets_buf>
  4018dc:	48 63 f2             	movslq %edx,%rsi
  4018df:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  4018e3:	8d 72 01             	lea    0x1(%rdx),%esi
  4018e6:	83 e7 0f             	and    $0xf,%edi
  4018e9:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  4018ee:	48 63 f6             	movslq %esi,%rsi
  4018f1:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  4018f5:	83 c2 02             	add    $0x2,%edx
  4018f8:	48 63 d2             	movslq %edx,%rdx
  4018fb:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  4018ff:	83 c0 01             	add    $0x1,%eax
  401902:	89 05 1c 38 20 00    	mov    %eax,0x20381c(%rip)        # 605124 <gets_cnt>
  401908:	f3 c3                	repz retq 

000000000040190a <save_term>:
  40190a:	8b 05 14 38 20 00    	mov    0x203814(%rip),%eax        # 605124 <gets_cnt>
  401910:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401913:	48 98                	cltq   
  401915:	48 8d 15 04 2c 20 00 	lea    0x202c04(%rip),%rdx        # 604520 <gets_buf>
  40191c:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  401920:	c3                   	retq   

0000000000401921 <check_fail>:
  401921:	48 83 ec 08          	sub    $0x8,%rsp
  401925:	0f be 35 fc 37 20 00 	movsbl 0x2037fc(%rip),%esi        # 605128 <target_prefix>
  40192c:	48 8d 0d ed 2b 20 00 	lea    0x202bed(%rip),%rcx        # 604520 <gets_buf>
  401933:	8b 15 bf 2b 20 00    	mov    0x202bbf(%rip),%edx        # 6044f8 <check_level>
  401939:	48 8d 3d cb 16 00 00 	lea    0x16cb(%rip),%rdi        # 40300b <_IO_stdin_used+0x3eb>
  401940:	b8 00 00 00 00       	mov    $0x0,%eax
  401945:	e8 16 f3 ff ff       	callq  400c60 <printf@plt>
  40194a:	bf 01 00 00 00       	mov    $0x1,%edi
  40194f:	e8 5c f4 ff ff       	callq  400db0 <exit@plt>

0000000000401954 <Gets>:
  401954:	41 54                	push   %r12
  401956:	55                   	push   %rbp
  401957:	53                   	push   %rbx
  401958:	49 89 fc             	mov    %rdi,%r12
  40195b:	c7 05 bf 37 20 00 00 	movl   $0x0,0x2037bf(%rip)        # 605124 <gets_cnt>
  401962:	00 00 00 
  401965:	48 89 fb             	mov    %rdi,%rbx
  401968:	eb 11                	jmp    40197b <Gets+0x27>
  40196a:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  40196e:	88 03                	mov    %al,(%rbx)
  401970:	0f b6 f8             	movzbl %al,%edi
  401973:	e8 39 ff ff ff       	callq  4018b1 <save_char>
  401978:	48 89 eb             	mov    %rbp,%rbx
  40197b:	48 8b 3d 6e 2b 20 00 	mov    0x202b6e(%rip),%rdi        # 6044f0 <infile>
  401982:	e8 99 f3 ff ff       	callq  400d20 <_IO_getc@plt>
  401987:	83 f8 ff             	cmp    $0xffffffff,%eax
  40198a:	74 05                	je     401991 <Gets+0x3d>
  40198c:	83 f8 0a             	cmp    $0xa,%eax
  40198f:	75 d9                	jne    40196a <Gets+0x16>
  401991:	c6 03 00             	movb   $0x0,(%rbx)
  401994:	b8 00 00 00 00       	mov    $0x0,%eax
  401999:	e8 6c ff ff ff       	callq  40190a <save_term>
  40199e:	4c 89 e0             	mov    %r12,%rax
  4019a1:	5b                   	pop    %rbx
  4019a2:	5d                   	pop    %rbp
  4019a3:	41 5c                	pop    %r12
  4019a5:	c3                   	retq   

00000000004019a6 <notify_server>:
  4019a6:	83 3d 5b 2b 20 00 00 	cmpl   $0x0,0x202b5b(%rip)        # 604508 <is_checker>
  4019ad:	0f 85 de 00 00 00    	jne    401a91 <notify_server+0xeb>
  4019b3:	55                   	push   %rbp
  4019b4:	53                   	push   %rbx
  4019b5:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  4019bc:	89 fb                	mov    %edi,%ebx
  4019be:	8b 05 60 37 20 00    	mov    0x203760(%rip),%eax        # 605124 <gets_cnt>
  4019c4:	83 c0 64             	add    $0x64,%eax
  4019c7:	3d 00 20 00 00       	cmp    $0x2000,%eax
  4019cc:	0f 8f c1 00 00 00    	jg     401a93 <notify_server+0xed>
  4019d2:	44 0f be 0d 4e 37 20 	movsbl 0x20374e(%rip),%r9d        # 605128 <target_prefix>
  4019d9:	00 
  4019da:	83 3d a7 2a 20 00 00 	cmpl   $0x0,0x202aa7(%rip)        # 604488 <notify>
  4019e1:	0f 84 c7 00 00 00    	je     401aae <notify_server+0x108>
  4019e7:	44 8b 05 12 2b 20 00 	mov    0x202b12(%rip),%r8d        # 604500 <authkey>
  4019ee:	85 db                	test   %ebx,%ebx
  4019f0:	0f 84 c3 00 00 00    	je     401ab9 <notify_server+0x113>
  4019f6:	48 8d 2d 24 16 00 00 	lea    0x1624(%rip),%rbp        # 403021 <_IO_stdin_used+0x401>
  4019fd:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401a04:	00 
  401a05:	48 8d 05 14 2b 20 00 	lea    0x202b14(%rip),%rax        # 604520 <gets_buf>
  401a0c:	50                   	push   %rax
  401a0d:	56                   	push   %rsi
  401a0e:	48 89 e9             	mov    %rbp,%rcx
  401a11:	8b 15 19 27 20 00    	mov    0x202719(%rip),%edx        # 604130 <target_id>
  401a17:	48 8d 35 0d 16 00 00 	lea    0x160d(%rip),%rsi        # 40302b <_IO_stdin_used+0x40b>
  401a1e:	b8 00 00 00 00       	mov    $0x0,%eax
  401a23:	e8 78 f3 ff ff       	callq  400da0 <sprintf@plt>
  401a28:	48 83 c4 10          	add    $0x10,%rsp
  401a2c:	83 3d 55 2a 20 00 00 	cmpl   $0x0,0x202a55(%rip)        # 604488 <notify>
  401a33:	0f 84 b8 00 00 00    	je     401af1 <notify_server+0x14b>
  401a39:	85 db                	test   %ebx,%ebx
  401a3b:	0f 84 a2 00 00 00    	je     401ae3 <notify_server+0x13d>
  401a41:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  401a48:	00 
  401a49:	49 89 e1             	mov    %rsp,%r9
  401a4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401a52:	48 8b 15 ef 26 20 00 	mov    0x2026ef(%rip),%rdx        # 604148 <lab>
  401a59:	48 8b 35 f0 26 20 00 	mov    0x2026f0(%rip),%rsi        # 604150 <course>
  401a60:	48 8b 3d d9 26 20 00 	mov    0x2026d9(%rip),%rdi        # 604140 <user_id>
  401a67:	e8 6e 10 00 00       	callq  402ada <driver_post>
  401a6c:	85 c0                	test   %eax,%eax
  401a6e:	78 55                	js     401ac5 <notify_server+0x11f>
  401a70:	48 8d 3d f9 16 00 00 	lea    0x16f9(%rip),%rdi        # 403170 <_IO_stdin_used+0x550>
  401a77:	e8 b4 f1 ff ff       	callq  400c30 <puts@plt>
  401a7c:	48 8d 3d d0 15 00 00 	lea    0x15d0(%rip),%rdi        # 403053 <_IO_stdin_used+0x433>
  401a83:	e8 a8 f1 ff ff       	callq  400c30 <puts@plt>
  401a88:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401a8f:	5b                   	pop    %rbx
  401a90:	5d                   	pop    %rbp
  401a91:	f3 c3                	repz retq 
  401a93:	48 8d 3d a6 16 00 00 	lea    0x16a6(%rip),%rdi        # 403140 <_IO_stdin_used+0x520>
  401a9a:	b8 00 00 00 00       	mov    $0x0,%eax
  401a9f:	e8 bc f1 ff ff       	callq  400c60 <printf@plt>
  401aa4:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa9:	e8 02 f3 ff ff       	callq  400db0 <exit@plt>
  401aae:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401ab4:	e9 35 ff ff ff       	jmpq   4019ee <notify_server+0x48>
  401ab9:	48 8d 2d 66 15 00 00 	lea    0x1566(%rip),%rbp        # 403026 <_IO_stdin_used+0x406>
  401ac0:	e9 38 ff ff ff       	jmpq   4019fd <notify_server+0x57>
  401ac5:	48 89 e6             	mov    %rsp,%rsi
  401ac8:	48 8d 3d 78 15 00 00 	lea    0x1578(%rip),%rdi        # 403047 <_IO_stdin_used+0x427>
  401acf:	b8 00 00 00 00       	mov    $0x0,%eax
  401ad4:	e8 87 f1 ff ff       	callq  400c60 <printf@plt>
  401ad9:	bf 01 00 00 00       	mov    $0x1,%edi
  401ade:	e8 cd f2 ff ff       	callq  400db0 <exit@plt>
  401ae3:	48 8d 3d 73 15 00 00 	lea    0x1573(%rip),%rdi        # 40305d <_IO_stdin_used+0x43d>
  401aea:	e8 41 f1 ff ff       	callq  400c30 <puts@plt>
  401aef:	eb 97                	jmp    401a88 <notify_server+0xe2>
  401af1:	48 89 ee             	mov    %rbp,%rsi
  401af4:	48 8d 3d ad 16 00 00 	lea    0x16ad(%rip),%rdi        # 4031a8 <_IO_stdin_used+0x588>
  401afb:	b8 00 00 00 00       	mov    $0x0,%eax
  401b00:	e8 5b f1 ff ff       	callq  400c60 <printf@plt>
  401b05:	48 8b 35 34 26 20 00 	mov    0x202634(%rip),%rsi        # 604140 <user_id>
  401b0c:	48 8d 3d 51 15 00 00 	lea    0x1551(%rip),%rdi        # 403064 <_IO_stdin_used+0x444>
  401b13:	b8 00 00 00 00       	mov    $0x0,%eax
  401b18:	e8 43 f1 ff ff       	callq  400c60 <printf@plt>
  401b1d:	48 8b 35 2c 26 20 00 	mov    0x20262c(%rip),%rsi        # 604150 <course>
  401b24:	48 8d 3d 46 15 00 00 	lea    0x1546(%rip),%rdi        # 403071 <_IO_stdin_used+0x451>
  401b2b:	b8 00 00 00 00       	mov    $0x0,%eax
  401b30:	e8 2b f1 ff ff       	callq  400c60 <printf@plt>
  401b35:	48 8b 35 0c 26 20 00 	mov    0x20260c(%rip),%rsi        # 604148 <lab>
  401b3c:	48 8d 3d 3a 15 00 00 	lea    0x153a(%rip),%rdi        # 40307d <_IO_stdin_used+0x45d>
  401b43:	b8 00 00 00 00       	mov    $0x0,%eax
  401b48:	e8 13 f1 ff ff       	callq  400c60 <printf@plt>
  401b4d:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401b54:	00 
  401b55:	48 8d 3d 2a 15 00 00 	lea    0x152a(%rip),%rdi        # 403086 <_IO_stdin_used+0x466>
  401b5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b61:	e8 fa f0 ff ff       	callq  400c60 <printf@plt>
  401b66:	e9 1d ff ff ff       	jmpq   401a88 <notify_server+0xe2>

0000000000401b6b <validate>:
  401b6b:	53                   	push   %rbx
  401b6c:	89 fb                	mov    %edi,%ebx
  401b6e:	83 3d 93 29 20 00 00 	cmpl   $0x0,0x202993(%rip)        # 604508 <is_checker>
  401b75:	74 68                	je     401bdf <validate+0x74>
  401b77:	39 3d 7f 29 20 00    	cmp    %edi,0x20297f(%rip)        # 6044fc <vlevel>
  401b7d:	75 2d                	jne    401bac <validate+0x41>
  401b7f:	8b 35 73 29 20 00    	mov    0x202973(%rip),%esi        # 6044f8 <check_level>
  401b85:	39 f7                	cmp    %esi,%edi
  401b87:	75 39                	jne    401bc2 <validate+0x57>
  401b89:	0f be 35 98 35 20 00 	movsbl 0x203598(%rip),%esi        # 605128 <target_prefix>
  401b90:	48 8d 0d 89 29 20 00 	lea    0x202989(%rip),%rcx        # 604520 <gets_buf>
  401b97:	89 fa                	mov    %edi,%edx
  401b99:	48 8d 3d 10 15 00 00 	lea    0x1510(%rip),%rdi        # 4030b0 <_IO_stdin_used+0x490>
  401ba0:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba5:	e8 b6 f0 ff ff       	callq  400c60 <printf@plt>
  401baa:	5b                   	pop    %rbx
  401bab:	c3                   	retq   
  401bac:	48 8d 3d df 14 00 00 	lea    0x14df(%rip),%rdi        # 403092 <_IO_stdin_used+0x472>
  401bb3:	e8 78 f0 ff ff       	callq  400c30 <puts@plt>
  401bb8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbd:	e8 5f fd ff ff       	callq  401921 <check_fail>
  401bc2:	89 fa                	mov    %edi,%edx
  401bc4:	48 8d 3d 05 16 00 00 	lea    0x1605(%rip),%rdi        # 4031d0 <_IO_stdin_used+0x5b0>
  401bcb:	b8 00 00 00 00       	mov    $0x0,%eax
  401bd0:	e8 8b f0 ff ff       	callq  400c60 <printf@plt>
  401bd5:	b8 00 00 00 00       	mov    $0x0,%eax
  401bda:	e8 42 fd ff ff       	callq  401921 <check_fail>
  401bdf:	3b 3d 17 29 20 00    	cmp    0x202917(%rip),%edi        # 6044fc <vlevel>
  401be5:	74 1a                	je     401c01 <validate+0x96>
  401be7:	48 8d 3d a4 14 00 00 	lea    0x14a4(%rip),%rdi        # 403092 <_IO_stdin_used+0x472>
  401bee:	e8 3d f0 ff ff       	callq  400c30 <puts@plt>
  401bf3:	89 de                	mov    %ebx,%esi
  401bf5:	bf 00 00 00 00       	mov    $0x0,%edi
  401bfa:	e8 a7 fd ff ff       	callq  4019a6 <notify_server>
  401bff:	eb a9                	jmp    401baa <validate+0x3f>
  401c01:	0f be 15 20 35 20 00 	movsbl 0x203520(%rip),%edx        # 605128 <target_prefix>
  401c08:	89 fe                	mov    %edi,%esi
  401c0a:	48 8d 3d e7 15 00 00 	lea    0x15e7(%rip),%rdi        # 4031f8 <_IO_stdin_used+0x5d8>
  401c11:	b8 00 00 00 00       	mov    $0x0,%eax
  401c16:	e8 45 f0 ff ff       	callq  400c60 <printf@plt>
  401c1b:	89 de                	mov    %ebx,%esi
  401c1d:	bf 01 00 00 00       	mov    $0x1,%edi
  401c22:	e8 7f fd ff ff       	callq  4019a6 <notify_server>
  401c27:	eb 81                	jmp    401baa <validate+0x3f>

0000000000401c29 <fail>:
  401c29:	48 83 ec 08          	sub    $0x8,%rsp
  401c2d:	83 3d d4 28 20 00 00 	cmpl   $0x0,0x2028d4(%rip)        # 604508 <is_checker>
  401c34:	75 11                	jne    401c47 <fail+0x1e>
  401c36:	89 fe                	mov    %edi,%esi
  401c38:	bf 00 00 00 00       	mov    $0x0,%edi
  401c3d:	e8 64 fd ff ff       	callq  4019a6 <notify_server>
  401c42:	48 83 c4 08          	add    $0x8,%rsp
  401c46:	c3                   	retq   
  401c47:	b8 00 00 00 00       	mov    $0x0,%eax
  401c4c:	e8 d0 fc ff ff       	callq  401921 <check_fail>

0000000000401c51 <bushandler>:
  401c51:	48 83 ec 08          	sub    $0x8,%rsp
  401c55:	83 3d ac 28 20 00 00 	cmpl   $0x0,0x2028ac(%rip)        # 604508 <is_checker>
  401c5c:	74 16                	je     401c74 <bushandler+0x23>
  401c5e:	48 8d 3d 60 14 00 00 	lea    0x1460(%rip),%rdi        # 4030c5 <_IO_stdin_used+0x4a5>
  401c65:	e8 c6 ef ff ff       	callq  400c30 <puts@plt>
  401c6a:	b8 00 00 00 00       	mov    $0x0,%eax
  401c6f:	e8 ad fc ff ff       	callq  401921 <check_fail>
  401c74:	48 8d 3d b5 15 00 00 	lea    0x15b5(%rip),%rdi        # 403230 <_IO_stdin_used+0x610>
  401c7b:	e8 b0 ef ff ff       	callq  400c30 <puts@plt>
  401c80:	48 8d 3d 48 14 00 00 	lea    0x1448(%rip),%rdi        # 4030cf <_IO_stdin_used+0x4af>
  401c87:	e8 a4 ef ff ff       	callq  400c30 <puts@plt>
  401c8c:	be 00 00 00 00       	mov    $0x0,%esi
  401c91:	bf 00 00 00 00       	mov    $0x0,%edi
  401c96:	e8 0b fd ff ff       	callq  4019a6 <notify_server>
  401c9b:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca0:	e8 0b f1 ff ff       	callq  400db0 <exit@plt>

0000000000401ca5 <seghandler>:
  401ca5:	48 83 ec 08          	sub    $0x8,%rsp
  401ca9:	83 3d 58 28 20 00 00 	cmpl   $0x0,0x202858(%rip)        # 604508 <is_checker>
  401cb0:	74 16                	je     401cc8 <seghandler+0x23>
  401cb2:	48 8d 3d 2c 14 00 00 	lea    0x142c(%rip),%rdi        # 4030e5 <_IO_stdin_used+0x4c5>
  401cb9:	e8 72 ef ff ff       	callq  400c30 <puts@plt>
  401cbe:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc3:	e8 59 fc ff ff       	callq  401921 <check_fail>
  401cc8:	48 8d 3d 81 15 00 00 	lea    0x1581(%rip),%rdi        # 403250 <_IO_stdin_used+0x630>
  401ccf:	e8 5c ef ff ff       	callq  400c30 <puts@plt>
  401cd4:	48 8d 3d f4 13 00 00 	lea    0x13f4(%rip),%rdi        # 4030cf <_IO_stdin_used+0x4af>
  401cdb:	e8 50 ef ff ff       	callq  400c30 <puts@plt>
  401ce0:	be 00 00 00 00       	mov    $0x0,%esi
  401ce5:	bf 00 00 00 00       	mov    $0x0,%edi
  401cea:	e8 b7 fc ff ff       	callq  4019a6 <notify_server>
  401cef:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf4:	e8 b7 f0 ff ff       	callq  400db0 <exit@plt>

0000000000401cf9 <illegalhandler>:
  401cf9:	48 83 ec 08          	sub    $0x8,%rsp
  401cfd:	83 3d 04 28 20 00 00 	cmpl   $0x0,0x202804(%rip)        # 604508 <is_checker>
  401d04:	74 16                	je     401d1c <illegalhandler+0x23>
  401d06:	48 8d 3d eb 13 00 00 	lea    0x13eb(%rip),%rdi        # 4030f8 <_IO_stdin_used+0x4d8>
  401d0d:	e8 1e ef ff ff       	callq  400c30 <puts@plt>
  401d12:	b8 00 00 00 00       	mov    $0x0,%eax
  401d17:	e8 05 fc ff ff       	callq  401921 <check_fail>
  401d1c:	48 8d 3d 55 15 00 00 	lea    0x1555(%rip),%rdi        # 403278 <_IO_stdin_used+0x658>
  401d23:	e8 08 ef ff ff       	callq  400c30 <puts@plt>
  401d28:	48 8d 3d a0 13 00 00 	lea    0x13a0(%rip),%rdi        # 4030cf <_IO_stdin_used+0x4af>
  401d2f:	e8 fc ee ff ff       	callq  400c30 <puts@plt>
  401d34:	be 00 00 00 00       	mov    $0x0,%esi
  401d39:	bf 00 00 00 00       	mov    $0x0,%edi
  401d3e:	e8 63 fc ff ff       	callq  4019a6 <notify_server>
  401d43:	bf 01 00 00 00       	mov    $0x1,%edi
  401d48:	e8 63 f0 ff ff       	callq  400db0 <exit@plt>

0000000000401d4d <sigalrmhandler>:
  401d4d:	48 83 ec 08          	sub    $0x8,%rsp
  401d51:	83 3d b0 27 20 00 00 	cmpl   $0x0,0x2027b0(%rip)        # 604508 <is_checker>
  401d58:	74 16                	je     401d70 <sigalrmhandler+0x23>
  401d5a:	48 8d 3d ab 13 00 00 	lea    0x13ab(%rip),%rdi        # 40310c <_IO_stdin_used+0x4ec>
  401d61:	e8 ca ee ff ff       	callq  400c30 <puts@plt>
  401d66:	b8 00 00 00 00       	mov    $0x0,%eax
  401d6b:	e8 b1 fb ff ff       	callq  401921 <check_fail>
  401d70:	be 05 00 00 00       	mov    $0x5,%esi
  401d75:	48 8d 3d 2c 15 00 00 	lea    0x152c(%rip),%rdi        # 4032a8 <_IO_stdin_used+0x688>
  401d7c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d81:	e8 da ee ff ff       	callq  400c60 <printf@plt>
  401d86:	be 00 00 00 00       	mov    $0x0,%esi
  401d8b:	bf 00 00 00 00       	mov    $0x0,%edi
  401d90:	e8 11 fc ff ff       	callq  4019a6 <notify_server>
  401d95:	bf 01 00 00 00       	mov    $0x1,%edi
  401d9a:	e8 11 f0 ff ff       	callq  400db0 <exit@plt>

0000000000401d9f <launch>:
  401d9f:	55                   	push   %rbp
  401da0:	48 89 e5             	mov    %rsp,%rbp
  401da3:	48 89 fa             	mov    %rdi,%rdx
  401da6:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401daa:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401dae:	48 29 c4             	sub    %rax,%rsp
  401db1:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401db6:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401dba:	be f4 00 00 00       	mov    $0xf4,%esi
  401dbf:	e8 ac ee ff ff       	callq  400c70 <memset@plt>
  401dc4:	48 8b 05 d5 26 20 00 	mov    0x2026d5(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  401dcb:	48 39 05 1e 27 20 00 	cmp    %rax,0x20271e(%rip)        # 6044f0 <infile>
  401dd2:	74 2b                	je     401dff <launch+0x60>
  401dd4:	c7 05 1e 27 20 00 00 	movl   $0x0,0x20271e(%rip)        # 6044fc <vlevel>
  401ddb:	00 00 00 
  401dde:	b8 00 00 00 00       	mov    $0x0,%eax
  401de3:	e8 a3 fa ff ff       	callq  40188b <test>
  401de8:	83 3d 19 27 20 00 00 	cmpl   $0x0,0x202719(%rip)        # 604508 <is_checker>
  401def:	75 21                	jne    401e12 <launch+0x73>
  401df1:	48 8d 3d 34 13 00 00 	lea    0x1334(%rip),%rdi        # 40312c <_IO_stdin_used+0x50c>
  401df8:	e8 33 ee ff ff       	callq  400c30 <puts@plt>
  401dfd:	c9                   	leaveq 
  401dfe:	c3                   	retq   
  401dff:	48 8d 3d 0e 13 00 00 	lea    0x130e(%rip),%rdi        # 403114 <_IO_stdin_used+0x4f4>
  401e06:	b8 00 00 00 00       	mov    $0x0,%eax
  401e0b:	e8 50 ee ff ff       	callq  400c60 <printf@plt>
  401e10:	eb c2                	jmp    401dd4 <launch+0x35>
  401e12:	48 8d 3d 08 13 00 00 	lea    0x1308(%rip),%rdi        # 403121 <_IO_stdin_used+0x501>
  401e19:	e8 12 ee ff ff       	callq  400c30 <puts@plt>
  401e1e:	b8 00 00 00 00       	mov    $0x0,%eax
  401e23:	e8 f9 fa ff ff       	callq  401921 <check_fail>

0000000000401e28 <stable_launch>:
  401e28:	53                   	push   %rbx
  401e29:	48 89 3d b8 26 20 00 	mov    %rdi,0x2026b8(%rip)        # 6044e8 <global_offset>
  401e30:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401e36:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401e3c:	b9 32 01 00 00       	mov    $0x132,%ecx
  401e41:	ba 07 00 00 00       	mov    $0x7,%edx
  401e46:	be 00 00 10 00       	mov    $0x100000,%esi
  401e4b:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401e50:	e8 fb ed ff ff       	callq  400c50 <mmap@plt>
  401e55:	48 89 c3             	mov    %rax,%rbx
  401e58:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401e5e:	75 43                	jne    401ea3 <stable_launch+0x7b>
  401e60:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401e67:	48 89 15 c2 32 20 00 	mov    %rdx,0x2032c2(%rip)        # 605130 <stack_top>
  401e6e:	48 89 e0             	mov    %rsp,%rax
  401e71:	48 89 d4             	mov    %rdx,%rsp
  401e74:	48 89 c2             	mov    %rax,%rdx
  401e77:	48 89 15 62 26 20 00 	mov    %rdx,0x202662(%rip)        # 6044e0 <global_save_stack>
  401e7e:	48 8b 3d 63 26 20 00 	mov    0x202663(%rip),%rdi        # 6044e8 <global_offset>
  401e85:	e8 15 ff ff ff       	callq  401d9f <launch>
  401e8a:	48 8b 05 4f 26 20 00 	mov    0x20264f(%rip),%rax        # 6044e0 <global_save_stack>
  401e91:	48 89 c4             	mov    %rax,%rsp
  401e94:	be 00 00 10 00       	mov    $0x100000,%esi
  401e99:	48 89 df             	mov    %rbx,%rdi
  401e9c:	e8 9f ee ff ff       	callq  400d40 <munmap@plt>
  401ea1:	5b                   	pop    %rbx
  401ea2:	c3                   	retq   
  401ea3:	be 00 00 10 00       	mov    $0x100000,%esi
  401ea8:	48 89 c7             	mov    %rax,%rdi
  401eab:	e8 90 ee ff ff       	callq  400d40 <munmap@plt>
  401eb0:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401eb5:	48 8d 35 24 14 00 00 	lea    0x1424(%rip),%rsi        # 4032e0 <_IO_stdin_used+0x6c0>
  401ebc:	48 8b 3d fd 25 20 00 	mov    0x2025fd(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401ec3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ec8:	e8 03 ee ff ff       	callq  400cd0 <fprintf@plt>
  401ecd:	bf 01 00 00 00       	mov    $0x1,%edi
  401ed2:	e8 d9 ee ff ff       	callq  400db0 <exit@plt>

0000000000401ed7 <rio_readinitb>:
  401ed7:	89 37                	mov    %esi,(%rdi)
  401ed9:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401ee0:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401ee4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401ee8:	c3                   	retq   

0000000000401ee9 <sigalrm_handler>:
  401ee9:	48 83 ec 08          	sub    $0x8,%rsp
  401eed:	ba 00 00 00 00       	mov    $0x0,%edx
  401ef2:	48 8d 35 27 14 00 00 	lea    0x1427(%rip),%rsi        # 403320 <trans_char+0x10>
  401ef9:	48 8b 3d c0 25 20 00 	mov    0x2025c0(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401f00:	b8 00 00 00 00       	mov    $0x0,%eax
  401f05:	e8 c6 ed ff ff       	callq  400cd0 <fprintf@plt>
  401f0a:	bf 01 00 00 00       	mov    $0x1,%edi
  401f0f:	e8 9c ee ff ff       	callq  400db0 <exit@plt>

0000000000401f14 <urlencode>:
  401f14:	41 54                	push   %r12
  401f16:	55                   	push   %rbp
  401f17:	53                   	push   %rbx
  401f18:	48 83 ec 10          	sub    $0x10,%rsp
  401f1c:	48 89 fb             	mov    %rdi,%rbx
  401f1f:	48 89 f5             	mov    %rsi,%rbp
  401f22:	b8 00 00 00 00       	mov    $0x0,%eax
  401f27:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401f2e:	f2 ae                	repnz scas %es:(%rdi),%al
  401f30:	48 f7 d1             	not    %rcx
  401f33:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401f36:	eb 0e                	jmp    401f46 <urlencode+0x32>
  401f38:	88 55 00             	mov    %dl,0x0(%rbp)
  401f3b:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401f3f:	48 83 c3 01          	add    $0x1,%rbx
  401f43:	44 89 e0             	mov    %r12d,%eax
  401f46:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  401f4a:	85 c0                	test   %eax,%eax
  401f4c:	0f 84 95 00 00 00    	je     401fe7 <urlencode+0xd3>
  401f52:	0f b6 13             	movzbl (%rbx),%edx
  401f55:	80 fa 2a             	cmp    $0x2a,%dl
  401f58:	0f 94 c1             	sete   %cl
  401f5b:	80 fa 2d             	cmp    $0x2d,%dl
  401f5e:	0f 94 c0             	sete   %al
  401f61:	08 c1                	or     %al,%cl
  401f63:	75 d3                	jne    401f38 <urlencode+0x24>
  401f65:	80 fa 2e             	cmp    $0x2e,%dl
  401f68:	74 ce                	je     401f38 <urlencode+0x24>
  401f6a:	80 fa 5f             	cmp    $0x5f,%dl
  401f6d:	74 c9                	je     401f38 <urlencode+0x24>
  401f6f:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401f72:	3c 09                	cmp    $0x9,%al
  401f74:	76 c2                	jbe    401f38 <urlencode+0x24>
  401f76:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401f79:	3c 19                	cmp    $0x19,%al
  401f7b:	76 bb                	jbe    401f38 <urlencode+0x24>
  401f7d:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401f80:	3c 19                	cmp    $0x19,%al
  401f82:	76 b4                	jbe    401f38 <urlencode+0x24>
  401f84:	80 fa 20             	cmp    $0x20,%dl
  401f87:	74 4c                	je     401fd5 <urlencode+0xc1>
  401f89:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401f8c:	3c 5f                	cmp    $0x5f,%al
  401f8e:	0f 96 c1             	setbe  %cl
  401f91:	80 fa 09             	cmp    $0x9,%dl
  401f94:	0f 94 c0             	sete   %al
  401f97:	08 c1                	or     %al,%cl
  401f99:	74 47                	je     401fe2 <urlencode+0xce>
  401f9b:	0f b6 d2             	movzbl %dl,%edx
  401f9e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  401fa3:	48 8d 35 0e 14 00 00 	lea    0x140e(%rip),%rsi        # 4033b8 <trans_char+0xa8>
  401faa:	b8 00 00 00 00       	mov    $0x0,%eax
  401faf:	e8 ec ed ff ff       	callq  400da0 <sprintf@plt>
  401fb4:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  401fb9:	88 45 00             	mov    %al,0x0(%rbp)
  401fbc:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  401fc1:	88 45 01             	mov    %al,0x1(%rbp)
  401fc4:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  401fc9:	88 45 02             	mov    %al,0x2(%rbp)
  401fcc:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  401fd0:	e9 6a ff ff ff       	jmpq   401f3f <urlencode+0x2b>
  401fd5:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401fd9:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401fdd:	e9 5d ff ff ff       	jmpq   401f3f <urlencode+0x2b>
  401fe2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fe7:	48 83 c4 10          	add    $0x10,%rsp
  401feb:	5b                   	pop    %rbx
  401fec:	5d                   	pop    %rbp
  401fed:	41 5c                	pop    %r12
  401fef:	c3                   	retq   

0000000000401ff0 <rio_writen>:
  401ff0:	41 55                	push   %r13
  401ff2:	41 54                	push   %r12
  401ff4:	55                   	push   %rbp
  401ff5:	53                   	push   %rbx
  401ff6:	48 83 ec 08          	sub    $0x8,%rsp
  401ffa:	41 89 fc             	mov    %edi,%r12d
  401ffd:	49 89 d5             	mov    %rdx,%r13
  402000:	48 89 f5             	mov    %rsi,%rbp
  402003:	48 89 d3             	mov    %rdx,%rbx
  402006:	eb 06                	jmp    40200e <rio_writen+0x1e>
  402008:	48 29 c3             	sub    %rax,%rbx
  40200b:	48 01 c5             	add    %rax,%rbp
  40200e:	48 85 db             	test   %rbx,%rbx
  402011:	74 24                	je     402037 <rio_writen+0x47>
  402013:	48 89 da             	mov    %rbx,%rdx
  402016:	48 89 ee             	mov    %rbp,%rsi
  402019:	44 89 e7             	mov    %r12d,%edi
  40201c:	e8 1f ec ff ff       	callq  400c40 <write@plt>
  402021:	48 85 c0             	test   %rax,%rax
  402024:	7f e2                	jg     402008 <rio_writen+0x18>
  402026:	e8 c5 eb ff ff       	callq  400bf0 <__errno_location@plt>
  40202b:	83 38 04             	cmpl   $0x4,(%rax)
  40202e:	75 15                	jne    402045 <rio_writen+0x55>
  402030:	b8 00 00 00 00       	mov    $0x0,%eax
  402035:	eb d1                	jmp    402008 <rio_writen+0x18>
  402037:	4c 89 e8             	mov    %r13,%rax
  40203a:	48 83 c4 08          	add    $0x8,%rsp
  40203e:	5b                   	pop    %rbx
  40203f:	5d                   	pop    %rbp
  402040:	41 5c                	pop    %r12
  402042:	41 5d                	pop    %r13
  402044:	c3                   	retq   
  402045:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40204c:	eb ec                	jmp    40203a <rio_writen+0x4a>

000000000040204e <rio_read>:
  40204e:	41 55                	push   %r13
  402050:	41 54                	push   %r12
  402052:	55                   	push   %rbp
  402053:	53                   	push   %rbx
  402054:	48 83 ec 08          	sub    $0x8,%rsp
  402058:	48 89 fb             	mov    %rdi,%rbx
  40205b:	49 89 f5             	mov    %rsi,%r13
  40205e:	49 89 d4             	mov    %rdx,%r12
  402061:	eb 0a                	jmp    40206d <rio_read+0x1f>
  402063:	e8 88 eb ff ff       	callq  400bf0 <__errno_location@plt>
  402068:	83 38 04             	cmpl   $0x4,(%rax)
  40206b:	75 5c                	jne    4020c9 <rio_read+0x7b>
  40206d:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402070:	85 ed                	test   %ebp,%ebp
  402072:	7f 24                	jg     402098 <rio_read+0x4a>
  402074:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  402078:	ba 00 20 00 00       	mov    $0x2000,%edx
  40207d:	48 89 ee             	mov    %rbp,%rsi
  402080:	8b 3b                	mov    (%rbx),%edi
  402082:	e8 19 ec ff ff       	callq  400ca0 <read@plt>
  402087:	89 43 04             	mov    %eax,0x4(%rbx)
  40208a:	85 c0                	test   %eax,%eax
  40208c:	78 d5                	js     402063 <rio_read+0x15>
  40208e:	85 c0                	test   %eax,%eax
  402090:	74 40                	je     4020d2 <rio_read+0x84>
  402092:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402096:	eb d5                	jmp    40206d <rio_read+0x1f>
  402098:	89 e8                	mov    %ebp,%eax
  40209a:	49 39 c4             	cmp    %rax,%r12
  40209d:	77 03                	ja     4020a2 <rio_read+0x54>
  40209f:	44 89 e5             	mov    %r12d,%ebp
  4020a2:	4c 63 e5             	movslq %ebp,%r12
  4020a5:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4020a9:	4c 89 e2             	mov    %r12,%rdx
  4020ac:	4c 89 ef             	mov    %r13,%rdi
  4020af:	e8 3c ec ff ff       	callq  400cf0 <memcpy@plt>
  4020b4:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4020b8:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4020bb:	4c 89 e0             	mov    %r12,%rax
  4020be:	48 83 c4 08          	add    $0x8,%rsp
  4020c2:	5b                   	pop    %rbx
  4020c3:	5d                   	pop    %rbp
  4020c4:	41 5c                	pop    %r12
  4020c6:	41 5d                	pop    %r13
  4020c8:	c3                   	retq   
  4020c9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4020d0:	eb ec                	jmp    4020be <rio_read+0x70>
  4020d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d7:	eb e5                	jmp    4020be <rio_read+0x70>

00000000004020d9 <rio_readlineb>:
  4020d9:	41 55                	push   %r13
  4020db:	41 54                	push   %r12
  4020dd:	55                   	push   %rbp
  4020de:	53                   	push   %rbx
  4020df:	48 83 ec 18          	sub    $0x18,%rsp
  4020e3:	49 89 fd             	mov    %rdi,%r13
  4020e6:	49 89 d4             	mov    %rdx,%r12
  4020e9:	48 89 f5             	mov    %rsi,%rbp
  4020ec:	bb 01 00 00 00       	mov    $0x1,%ebx
  4020f1:	4c 39 e3             	cmp    %r12,%rbx
  4020f4:	73 47                	jae    40213d <rio_readlineb+0x64>
  4020f6:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4020fb:	ba 01 00 00 00       	mov    $0x1,%edx
  402100:	4c 89 ef             	mov    %r13,%rdi
  402103:	e8 46 ff ff ff       	callq  40204e <rio_read>
  402108:	83 f8 01             	cmp    $0x1,%eax
  40210b:	75 1c                	jne    402129 <rio_readlineb+0x50>
  40210d:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402111:	0f b6 54 24 0f       	movzbl 0xf(%rsp),%edx
  402116:	88 55 00             	mov    %dl,0x0(%rbp)
  402119:	80 7c 24 0f 0a       	cmpb   $0xa,0xf(%rsp)
  40211e:	74 1a                	je     40213a <rio_readlineb+0x61>
  402120:	48 83 c3 01          	add    $0x1,%rbx
  402124:	48 89 c5             	mov    %rax,%rbp
  402127:	eb c8                	jmp    4020f1 <rio_readlineb+0x18>
  402129:	85 c0                	test   %eax,%eax
  40212b:	75 22                	jne    40214f <rio_readlineb+0x76>
  40212d:	48 83 fb 01          	cmp    $0x1,%rbx
  402131:	75 0a                	jne    40213d <rio_readlineb+0x64>
  402133:	b8 00 00 00 00       	mov    $0x0,%eax
  402138:	eb 0a                	jmp    402144 <rio_readlineb+0x6b>
  40213a:	48 89 c5             	mov    %rax,%rbp
  40213d:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402141:	48 89 d8             	mov    %rbx,%rax
  402144:	48 83 c4 18          	add    $0x18,%rsp
  402148:	5b                   	pop    %rbx
  402149:	5d                   	pop    %rbp
  40214a:	41 5c                	pop    %r12
  40214c:	41 5d                	pop    %r13
  40214e:	c3                   	retq   
  40214f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402156:	eb ec                	jmp    402144 <rio_readlineb+0x6b>

0000000000402158 <submitr>:
  402158:	41 57                	push   %r15
  40215a:	41 56                	push   %r14
  40215c:	41 55                	push   %r13
  40215e:	41 54                	push   %r12
  402160:	55                   	push   %rbp
  402161:	53                   	push   %rbx
  402162:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402169:	49 89 fd             	mov    %rdi,%r13
  40216c:	89 74 24 14          	mov    %esi,0x14(%rsp)
  402170:	49 89 d7             	mov    %rdx,%r15
  402173:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  402178:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  40217d:	4d 89 ce             	mov    %r9,%r14
  402180:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  402187:	00 
  402188:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  40218f:	00 00 00 00 
  402193:	ba 00 00 00 00       	mov    $0x0,%edx
  402198:	be 01 00 00 00       	mov    $0x1,%esi
  40219d:	bf 02 00 00 00       	mov    $0x2,%edi
  4021a2:	e8 29 ec ff ff       	callq  400dd0 <socket@plt>
  4021a7:	85 c0                	test   %eax,%eax
  4021a9:	0f 88 ca 01 00 00    	js     402379 <submitr+0x221>
  4021af:	89 c5                	mov    %eax,%ebp
  4021b1:	4c 89 ef             	mov    %r13,%rdi
  4021b4:	e8 07 eb ff ff       	callq  400cc0 <gethostbyname@plt>
  4021b9:	48 85 c0             	test   %rax,%rax
  4021bc:	0f 84 05 02 00 00    	je     4023c7 <submitr+0x26f>
  4021c2:	4c 8d a4 24 40 a0 00 	lea    0xa040(%rsp),%r12
  4021c9:	00 
  4021ca:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  4021d1:	00 00 00 00 00 
  4021d6:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  4021dd:	00 00 00 00 00 
  4021e2:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  4021e9:	00 02 00 
  4021ec:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4021f0:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4021f4:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  4021fb:	00 
  4021fc:	48 8b 39             	mov    (%rcx),%rdi
  4021ff:	e8 4c eb ff ff       	callq  400d50 <bcopy@plt>
  402204:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  402209:	66 c1 c8 08          	ror    $0x8,%ax
  40220d:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  402214:	00 
  402215:	ba 10 00 00 00       	mov    $0x10,%edx
  40221a:	4c 89 e6             	mov    %r12,%rsi
  40221d:	89 ef                	mov    %ebp,%edi
  40221f:	e8 9c eb ff ff       	callq  400dc0 <connect@plt>
  402224:	85 c0                	test   %eax,%eax
  402226:	0f 88 02 02 00 00    	js     40242e <submitr+0x2d6>
  40222c:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402233:	b8 00 00 00 00       	mov    $0x0,%eax
  402238:	48 89 f1             	mov    %rsi,%rcx
  40223b:	4c 89 f7             	mov    %r14,%rdi
  40223e:	f2 ae                	repnz scas %es:(%rdi),%al
  402240:	48 f7 d1             	not    %rcx
  402243:	48 89 ca             	mov    %rcx,%rdx
  402246:	48 89 f1             	mov    %rsi,%rcx
  402249:	4c 89 ff             	mov    %r15,%rdi
  40224c:	f2 ae                	repnz scas %es:(%rdi),%al
  40224e:	48 f7 d1             	not    %rcx
  402251:	49 89 c8             	mov    %rcx,%r8
  402254:	48 89 f1             	mov    %rsi,%rcx
  402257:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  40225c:	f2 ae                	repnz scas %es:(%rdi),%al
  40225e:	48 f7 d1             	not    %rcx
  402261:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402266:	48 89 f1             	mov    %rsi,%rcx
  402269:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  40226e:	f2 ae                	repnz scas %es:(%rdi),%al
  402270:	48 89 c8             	mov    %rcx,%rax
  402273:	48 f7 d0             	not    %rax
  402276:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  40227b:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402280:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  402287:	00 
  402288:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  40228e:	0f 87 f3 01 00 00    	ja     402487 <submitr+0x32f>
  402294:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  40229b:	00 
  40229c:	b9 00 04 00 00       	mov    $0x400,%ecx
  4022a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4022a6:	48 89 f7             	mov    %rsi,%rdi
  4022a9:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4022ac:	4c 89 f7             	mov    %r14,%rdi
  4022af:	e8 60 fc ff ff       	callq  401f14 <urlencode>
  4022b4:	85 c0                	test   %eax,%eax
  4022b6:	0f 88 3d 02 00 00    	js     4024f9 <submitr+0x3a1>
  4022bc:	4c 8d a4 24 30 60 00 	lea    0x6030(%rsp),%r12
  4022c3:	00 
  4022c4:	4d 89 e9             	mov    %r13,%r9
  4022c7:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  4022ce:	00 
  4022cf:	4c 89 f9             	mov    %r15,%rcx
  4022d2:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  4022d7:	48 8d 35 6a 10 00 00 	lea    0x106a(%rip),%rsi        # 403348 <trans_char+0x38>
  4022de:	4c 89 e7             	mov    %r12,%rdi
  4022e1:	b8 00 00 00 00       	mov    $0x0,%eax
  4022e6:	e8 b5 ea ff ff       	callq  400da0 <sprintf@plt>
  4022eb:	b8 00 00 00 00       	mov    $0x0,%eax
  4022f0:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022f7:	4c 89 e7             	mov    %r12,%rdi
  4022fa:	f2 ae                	repnz scas %es:(%rdi),%al
  4022fc:	48 f7 d1             	not    %rcx
  4022ff:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402303:	4c 89 e6             	mov    %r12,%rsi
  402306:	89 ef                	mov    %ebp,%edi
  402308:	e8 e3 fc ff ff       	callq  401ff0 <rio_writen>
  40230d:	48 85 c0             	test   %rax,%rax
  402310:	0f 88 6d 02 00 00    	js     402583 <submitr+0x42b>
  402316:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  40231d:	00 
  40231e:	89 ee                	mov    %ebp,%esi
  402320:	4c 89 e7             	mov    %r12,%rdi
  402323:	e8 af fb ff ff       	callq  401ed7 <rio_readinitb>
  402328:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40232f:	00 
  402330:	ba 00 20 00 00       	mov    $0x2000,%edx
  402335:	4c 89 e7             	mov    %r12,%rdi
  402338:	e8 9c fd ff ff       	callq  4020d9 <rio_readlineb>
  40233d:	48 85 c0             	test   %rax,%rax
  402340:	0f 8e ab 02 00 00    	jle    4025f1 <submitr+0x499>
  402346:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  40234d:	00 
  40234e:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  402355:	00 
  402356:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  40235d:	00 
  40235e:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  402363:	48 8d 35 55 10 00 00 	lea    0x1055(%rip),%rsi        # 4033bf <trans_char+0xaf>
  40236a:	b8 00 00 00 00       	mov    $0x0,%eax
  40236f:	e8 bc e9 ff ff       	callq  400d30 <__isoc99_sscanf@plt>
  402374:	e9 9f 03 00 00       	jmpq   402718 <submitr+0x5c0>
  402379:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402380:	3a 20 43 
  402383:	48 89 03             	mov    %rax,(%rbx)
  402386:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40238d:	20 75 6e 
  402390:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402394:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40239b:	74 6f 20 
  40239e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023a2:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4023a9:	65 20 73 
  4023ac:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023b0:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  4023b7:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  4023bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023c2:	e9 18 03 00 00       	jmpq   4026df <submitr+0x587>
  4023c7:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4023ce:	3a 20 44 
  4023d1:	48 89 03             	mov    %rax,(%rbx)
  4023d4:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4023db:	20 75 6e 
  4023de:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023e2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4023e9:	74 6f 20 
  4023ec:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023f0:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4023f7:	76 65 20 
  4023fa:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023fe:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402405:	72 20 61 
  402408:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40240c:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  402413:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  402419:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  40241d:	89 ef                	mov    %ebp,%edi
  40241f:	e8 6c e8 ff ff       	callq  400c90 <close@plt>
  402424:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402429:	e9 b1 02 00 00       	jmpq   4026df <submitr+0x587>
  40242e:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402435:	3a 20 55 
  402438:	48 89 03             	mov    %rax,(%rbx)
  40243b:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402442:	20 74 6f 
  402445:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402449:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402450:	65 63 74 
  402453:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402457:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40245e:	68 65 20 
  402461:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402465:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40246c:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402472:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402476:	89 ef                	mov    %ebp,%edi
  402478:	e8 13 e8 ff ff       	callq  400c90 <close@plt>
  40247d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402482:	e9 58 02 00 00       	jmpq   4026df <submitr+0x587>
  402487:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40248e:	3a 20 52 
  402491:	48 89 03             	mov    %rax,(%rbx)
  402494:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40249b:	20 73 74 
  40249e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024a2:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4024a9:	74 6f 6f 
  4024ac:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024b0:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4024b7:	65 2e 20 
  4024ba:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024be:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  4024c5:	61 73 65 
  4024c8:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024cc:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  4024d3:	49 54 52 
  4024d6:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4024da:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4024e1:	55 46 00 
  4024e4:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4024e8:	89 ef                	mov    %ebp,%edi
  4024ea:	e8 a1 e7 ff ff       	callq  400c90 <close@plt>
  4024ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024f4:	e9 e6 01 00 00       	jmpq   4026df <submitr+0x587>
  4024f9:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402500:	3a 20 52 
  402503:	48 89 03             	mov    %rax,(%rbx)
  402506:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40250d:	20 73 74 
  402510:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402514:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  40251b:	63 6f 6e 
  40251e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402522:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402529:	20 61 6e 
  40252c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402530:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402537:	67 61 6c 
  40253a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40253e:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402545:	6e 70 72 
  402548:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40254c:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402553:	6c 65 20 
  402556:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40255a:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402561:	63 74 65 
  402564:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402568:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  40256e:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402572:	89 ef                	mov    %ebp,%edi
  402574:	e8 17 e7 ff ff       	callq  400c90 <close@plt>
  402579:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40257e:	e9 5c 01 00 00       	jmpq   4026df <submitr+0x587>
  402583:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40258a:	3a 20 43 
  40258d:	48 89 03             	mov    %rax,(%rbx)
  402590:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402597:	20 75 6e 
  40259a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40259e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025a5:	74 6f 20 
  4025a8:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025ac:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4025b3:	20 74 6f 
  4025b6:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025ba:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4025c1:	72 65 73 
  4025c4:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025c8:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4025cf:	65 72 76 
  4025d2:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025d6:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4025dc:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4025e0:	89 ef                	mov    %ebp,%edi
  4025e2:	e8 a9 e6 ff ff       	callq  400c90 <close@plt>
  4025e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025ec:	e9 ee 00 00 00       	jmpq   4026df <submitr+0x587>
  4025f1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4025f8:	3a 20 43 
  4025fb:	48 89 03             	mov    %rax,(%rbx)
  4025fe:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402605:	20 75 6e 
  402608:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40260c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402613:	74 6f 20 
  402616:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40261a:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402621:	66 69 72 
  402624:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402628:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  40262f:	61 64 65 
  402632:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402636:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  40263d:	6d 20 72 
  402640:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402644:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  40264b:	20 73 65 
  40264e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402652:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  402659:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  40265d:	89 ef                	mov    %ebp,%edi
  40265f:	e8 2c e6 ff ff       	callq  400c90 <close@plt>
  402664:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402669:	eb 74                	jmp    4026df <submitr+0x587>
  40266b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402672:	3a 20 43 
  402675:	48 89 03             	mov    %rax,(%rbx)
  402678:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40267f:	20 75 6e 
  402682:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402686:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40268d:	74 6f 20 
  402690:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402694:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  40269b:	68 65 61 
  40269e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026a2:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4026a9:	66 72 6f 
  4026ac:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026b0:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  4026b7:	20 72 65 
  4026ba:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026be:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4026c5:	73 65 72 
  4026c8:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4026cc:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  4026d3:	89 ef                	mov    %ebp,%edi
  4026d5:	e8 b6 e5 ff ff       	callq  400c90 <close@plt>
  4026da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026df:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  4026e6:	5b                   	pop    %rbx
  4026e7:	5d                   	pop    %rbp
  4026e8:	41 5c                	pop    %r12
  4026ea:	41 5d                	pop    %r13
  4026ec:	41 5e                	pop    %r14
  4026ee:	41 5f                	pop    %r15
  4026f0:	c3                   	retq   
  4026f1:	85 c0                	test   %eax,%eax
  4026f3:	74 51                	je     402746 <submitr+0x5ee>
  4026f5:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4026fc:	00 
  4026fd:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402704:	00 
  402705:	ba 00 20 00 00       	mov    $0x2000,%edx
  40270a:	e8 ca f9 ff ff       	callq  4020d9 <rio_readlineb>
  40270f:	48 85 c0             	test   %rax,%rax
  402712:	0f 8e 53 ff ff ff    	jle    40266b <submitr+0x513>
  402718:	0f b6 94 24 30 60 00 	movzbl 0x6030(%rsp),%edx
  40271f:	00 
  402720:	b8 0d 00 00 00       	mov    $0xd,%eax
  402725:	29 d0                	sub    %edx,%eax
  402727:	75 c8                	jne    4026f1 <submitr+0x599>
  402729:	0f b6 94 24 31 60 00 	movzbl 0x6031(%rsp),%edx
  402730:	00 
  402731:	b8 0a 00 00 00       	mov    $0xa,%eax
  402736:	29 d0                	sub    %edx,%eax
  402738:	75 b7                	jne    4026f1 <submitr+0x599>
  40273a:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  402741:	00 
  402742:	f7 d8                	neg    %eax
  402744:	eb ab                	jmp    4026f1 <submitr+0x599>
  402746:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40274d:	00 
  40274e:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402755:	00 
  402756:	ba 00 20 00 00       	mov    $0x2000,%edx
  40275b:	e8 79 f9 ff ff       	callq  4020d9 <rio_readlineb>
  402760:	48 85 c0             	test   %rax,%rax
  402763:	7e 67                	jle    4027cc <submitr+0x674>
  402765:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  40276c:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402772:	0f 85 d7 00 00 00    	jne    40284f <submitr+0x6f7>
  402778:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40277f:	00 
  402780:	48 89 df             	mov    %rbx,%rdi
  402783:	e8 98 e4 ff ff       	callq  400c20 <strcpy@plt>
  402788:	89 ef                	mov    %ebp,%edi
  40278a:	e8 01 e5 ff ff       	callq  400c90 <close@plt>
  40278f:	0f b6 03             	movzbl (%rbx),%eax
  402792:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402797:	29 c2                	sub    %eax,%edx
  402799:	0f 85 da 00 00 00    	jne    402879 <submitr+0x721>
  40279f:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  4027a3:	b8 4b 00 00 00       	mov    $0x4b,%eax
  4027a8:	29 c8                	sub    %ecx,%eax
  4027aa:	0f 85 cb 00 00 00    	jne    40287b <submitr+0x723>
  4027b0:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  4027b4:	b8 0a 00 00 00       	mov    $0xa,%eax
  4027b9:	29 c8                	sub    %ecx,%eax
  4027bb:	0f 85 ba 00 00 00    	jne    40287b <submitr+0x723>
  4027c1:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  4027c5:	f7 d8                	neg    %eax
  4027c7:	e9 af 00 00 00       	jmpq   40287b <submitr+0x723>
  4027cc:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027d3:	3a 20 43 
  4027d6:	48 89 03             	mov    %rax,(%rbx)
  4027d9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027e0:	20 75 6e 
  4027e3:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027e7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027ee:	74 6f 20 
  4027f1:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027f5:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4027fc:	73 74 61 
  4027ff:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402803:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  40280a:	65 73 73 
  40280d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402811:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402818:	72 6f 6d 
  40281b:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40281f:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402826:	6c 74 20 
  402829:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40282d:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402834:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  40283a:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  40283e:	89 ef                	mov    %ebp,%edi
  402840:	e8 4b e4 ff ff       	callq  400c90 <close@plt>
  402845:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40284a:	e9 90 fe ff ff       	jmpq   4026df <submitr+0x587>
  40284f:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402854:	48 8d 35 2d 0b 00 00 	lea    0xb2d(%rip),%rsi        # 403388 <trans_char+0x78>
  40285b:	48 89 df             	mov    %rbx,%rdi
  40285e:	b8 00 00 00 00       	mov    $0x0,%eax
  402863:	e8 38 e5 ff ff       	callq  400da0 <sprintf@plt>
  402868:	89 ef                	mov    %ebp,%edi
  40286a:	e8 21 e4 ff ff       	callq  400c90 <close@plt>
  40286f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402874:	e9 66 fe ff ff       	jmpq   4026df <submitr+0x587>
  402879:	89 d0                	mov    %edx,%eax
  40287b:	f7 d8                	neg    %eax
  40287d:	0f 84 5c fe ff ff    	je     4026df <submitr+0x587>
  402883:	b9 05 00 00 00       	mov    $0x5,%ecx
  402888:	48 8d 3d 41 0b 00 00 	lea    0xb41(%rip),%rdi        # 4033d0 <trans_char+0xc0>
  40288f:	48 89 de             	mov    %rbx,%rsi
  402892:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402894:	0f 97 c0             	seta   %al
  402897:	0f 92 c1             	setb   %cl
  40289a:	29 c8                	sub    %ecx,%eax
  40289c:	0f be c0             	movsbl %al,%eax
  40289f:	85 c0                	test   %eax,%eax
  4028a1:	0f 84 38 fe ff ff    	je     4026df <submitr+0x587>
  4028a7:	85 d2                	test   %edx,%edx
  4028a9:	75 13                	jne    4028be <submitr+0x766>
  4028ab:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  4028af:	ba 4b 00 00 00       	mov    $0x4b,%edx
  4028b4:	29 c2                	sub    %eax,%edx
  4028b6:	75 06                	jne    4028be <submitr+0x766>
  4028b8:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  4028bc:	f7 da                	neg    %edx
  4028be:	89 d0                	mov    %edx,%eax
  4028c0:	f7 d8                	neg    %eax
  4028c2:	0f 84 17 fe ff ff    	je     4026df <submitr+0x587>
  4028c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028cd:	e9 0d fe ff ff       	jmpq   4026df <submitr+0x587>

00000000004028d2 <init_timeout>:
  4028d2:	85 ff                	test   %edi,%edi
  4028d4:	74 20                	je     4028f6 <init_timeout+0x24>
  4028d6:	53                   	push   %rbx
  4028d7:	89 fb                	mov    %edi,%ebx
  4028d9:	85 ff                	test   %edi,%edi
  4028db:	78 1b                	js     4028f8 <init_timeout+0x26>
  4028dd:	48 8d 35 05 f6 ff ff 	lea    -0x9fb(%rip),%rsi        # 401ee9 <sigalrm_handler>
  4028e4:	bf 0e 00 00 00       	mov    $0xe,%edi
  4028e9:	e8 c2 e3 ff ff       	callq  400cb0 <signal@plt>
  4028ee:	89 df                	mov    %ebx,%edi
  4028f0:	e8 8b e3 ff ff       	callq  400c80 <alarm@plt>
  4028f5:	5b                   	pop    %rbx
  4028f6:	f3 c3                	repz retq 
  4028f8:	bb 00 00 00 00       	mov    $0x0,%ebx
  4028fd:	eb de                	jmp    4028dd <init_timeout+0xb>

00000000004028ff <init_driver>:
  4028ff:	41 54                	push   %r12
  402901:	55                   	push   %rbp
  402902:	53                   	push   %rbx
  402903:	48 83 ec 10          	sub    $0x10,%rsp
  402907:	48 89 fd             	mov    %rdi,%rbp
  40290a:	be 01 00 00 00       	mov    $0x1,%esi
  40290f:	bf 0d 00 00 00       	mov    $0xd,%edi
  402914:	e8 97 e3 ff ff       	callq  400cb0 <signal@plt>
  402919:	be 01 00 00 00       	mov    $0x1,%esi
  40291e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402923:	e8 88 e3 ff ff       	callq  400cb0 <signal@plt>
  402928:	be 01 00 00 00       	mov    $0x1,%esi
  40292d:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402932:	e8 79 e3 ff ff       	callq  400cb0 <signal@plt>
  402937:	ba 00 00 00 00       	mov    $0x0,%edx
  40293c:	be 01 00 00 00       	mov    $0x1,%esi
  402941:	bf 02 00 00 00       	mov    $0x2,%edi
  402946:	e8 85 e4 ff ff       	callq  400dd0 <socket@plt>
  40294b:	85 c0                	test   %eax,%eax
  40294d:	0f 88 80 00 00 00    	js     4029d3 <init_driver+0xd4>
  402953:	89 c3                	mov    %eax,%ebx
  402955:	48 8d 3d 79 0a 00 00 	lea    0xa79(%rip),%rdi        # 4033d5 <trans_char+0xc5>
  40295c:	e8 5f e3 ff ff       	callq  400cc0 <gethostbyname@plt>
  402961:	48 85 c0             	test   %rax,%rax
  402964:	0f 84 b5 00 00 00    	je     402a1f <init_driver+0x120>
  40296a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402971:	00 
  402972:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402979:	00 00 
  40297b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402981:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402985:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402989:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  40298e:	48 8b 39             	mov    (%rcx),%rdi
  402991:	e8 ba e3 ff ff       	callq  400d50 <bcopy@plt>
  402996:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  40299d:	ba 10 00 00 00       	mov    $0x10,%edx
  4029a2:	48 89 e6             	mov    %rsp,%rsi
  4029a5:	89 df                	mov    %ebx,%edi
  4029a7:	e8 14 e4 ff ff       	callq  400dc0 <connect@plt>
  4029ac:	85 c0                	test   %eax,%eax
  4029ae:	0f 88 d3 00 00 00    	js     402a87 <init_driver+0x188>
  4029b4:	89 df                	mov    %ebx,%edi
  4029b6:	e8 d5 e2 ff ff       	callq  400c90 <close@plt>
  4029bb:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4029c1:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4029c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4029ca:	48 83 c4 10          	add    $0x10,%rsp
  4029ce:	5b                   	pop    %rbx
  4029cf:	5d                   	pop    %rbp
  4029d0:	41 5c                	pop    %r12
  4029d2:	c3                   	retq   
  4029d3:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029da:	3a 20 43 
  4029dd:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4029e1:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029e8:	20 75 6e 
  4029eb:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4029ef:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029f6:	74 6f 20 
  4029f9:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029fd:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402a04:	65 20 73 
  402a07:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a0b:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402a12:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a1d:	eb ab                	jmp    4029ca <init_driver+0xcb>
  402a1f:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402a26:	3a 20 44 
  402a29:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a2d:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402a34:	20 75 6e 
  402a37:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402a3b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a42:	74 6f 20 
  402a45:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a49:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402a50:	76 65 20 
  402a53:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a57:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402a5e:	72 20 61 
  402a61:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402a65:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402a6c:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402a72:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402a76:	89 df                	mov    %ebx,%edi
  402a78:	e8 13 e2 ff ff       	callq  400c90 <close@plt>
  402a7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a82:	e9 43 ff ff ff       	jmpq   4029ca <init_driver+0xcb>
  402a87:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402a8e:	3a 20 55 
  402a91:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a95:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402a9c:	20 74 6f 
  402a9f:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402aa3:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402aaa:	65 63 74 
  402aad:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ab1:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402ab8:	65 72 76 
  402abb:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402abf:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402ac5:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402ac9:	89 df                	mov    %ebx,%edi
  402acb:	e8 c0 e1 ff ff       	callq  400c90 <close@plt>
  402ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ad5:	e9 f0 fe ff ff       	jmpq   4029ca <init_driver+0xcb>

0000000000402ada <driver_post>:
  402ada:	53                   	push   %rbx
  402adb:	4c 89 cb             	mov    %r9,%rbx
  402ade:	45 85 c0             	test   %r8d,%r8d
  402ae1:	75 18                	jne    402afb <driver_post+0x21>
  402ae3:	48 85 ff             	test   %rdi,%rdi
  402ae6:	74 05                	je     402aed <driver_post+0x13>
  402ae8:	80 3f 00             	cmpb   $0x0,(%rdi)
  402aeb:	75 32                	jne    402b1f <driver_post+0x45>
  402aed:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402af2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402af6:	44 89 c0             	mov    %r8d,%eax
  402af9:	5b                   	pop    %rbx
  402afa:	c3                   	retq   
  402afb:	48 89 ce             	mov    %rcx,%rsi
  402afe:	48 8d 3d e8 08 00 00 	lea    0x8e8(%rip),%rdi        # 4033ed <trans_char+0xdd>
  402b05:	b8 00 00 00 00       	mov    $0x0,%eax
  402b0a:	e8 51 e1 ff ff       	callq  400c60 <printf@plt>
  402b0f:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402b14:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402b18:	b8 00 00 00 00       	mov    $0x0,%eax
  402b1d:	eb da                	jmp    402af9 <driver_post+0x1f>
  402b1f:	48 83 ec 08          	sub    $0x8,%rsp
  402b23:	41 51                	push   %r9
  402b25:	49 89 c9             	mov    %rcx,%r9
  402b28:	49 89 d0             	mov    %rdx,%r8
  402b2b:	48 89 f9             	mov    %rdi,%rcx
  402b2e:	48 89 f2             	mov    %rsi,%rdx
  402b31:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402b36:	48 8d 3d 98 08 00 00 	lea    0x898(%rip),%rdi        # 4033d5 <trans_char+0xc5>
  402b3d:	e8 16 f6 ff ff       	callq  402158 <submitr>
  402b42:	48 83 c4 10          	add    $0x10,%rsp
  402b46:	eb b1                	jmp    402af9 <driver_post+0x1f>

0000000000402b48 <check>:
  402b48:	89 f8                	mov    %edi,%eax
  402b4a:	c1 e8 1c             	shr    $0x1c,%eax
  402b4d:	85 c0                	test   %eax,%eax
  402b4f:	74 1d                	je     402b6e <check+0x26>
  402b51:	b9 00 00 00 00       	mov    $0x0,%ecx
  402b56:	83 f9 1f             	cmp    $0x1f,%ecx
  402b59:	7f 0d                	jg     402b68 <check+0x20>
  402b5b:	89 f8                	mov    %edi,%eax
  402b5d:	d3 e8                	shr    %cl,%eax
  402b5f:	3c 0a                	cmp    $0xa,%al
  402b61:	74 11                	je     402b74 <check+0x2c>
  402b63:	83 c1 08             	add    $0x8,%ecx
  402b66:	eb ee                	jmp    402b56 <check+0xe>
  402b68:	b8 01 00 00 00       	mov    $0x1,%eax
  402b6d:	c3                   	retq   
  402b6e:	b8 00 00 00 00       	mov    $0x0,%eax
  402b73:	c3                   	retq   
  402b74:	b8 00 00 00 00       	mov    $0x0,%eax
  402b79:	c3                   	retq   

0000000000402b7a <gencookie>:
  402b7a:	53                   	push   %rbx
  402b7b:	83 c7 01             	add    $0x1,%edi
  402b7e:	e8 7d e0 ff ff       	callq  400c00 <srandom@plt>
  402b83:	e8 88 e1 ff ff       	callq  400d10 <random@plt>
  402b88:	89 c3                	mov    %eax,%ebx
  402b8a:	89 c7                	mov    %eax,%edi
  402b8c:	e8 b7 ff ff ff       	callq  402b48 <check>
  402b91:	85 c0                	test   %eax,%eax
  402b93:	74 ee                	je     402b83 <gencookie+0x9>
  402b95:	89 d8                	mov    %ebx,%eax
  402b97:	5b                   	pop    %rbx
  402b98:	c3                   	retq   
  402b99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402ba0 <__libc_csu_init>:
  402ba0:	41 57                	push   %r15
  402ba2:	41 56                	push   %r14
  402ba4:	41 89 ff             	mov    %edi,%r15d
  402ba7:	41 55                	push   %r13
  402ba9:	41 54                	push   %r12
  402bab:	4c 8d 25 56 12 20 00 	lea    0x201256(%rip),%r12        # 603e08 <__frame_dummy_init_array_entry>
  402bb2:	55                   	push   %rbp
  402bb3:	48 8d 2d 56 12 20 00 	lea    0x201256(%rip),%rbp        # 603e10 <__init_array_end>
  402bba:	53                   	push   %rbx
  402bbb:	49 89 f6             	mov    %rsi,%r14
  402bbe:	49 89 d5             	mov    %rdx,%r13
  402bc1:	4c 29 e5             	sub    %r12,%rbp
  402bc4:	48 83 ec 08          	sub    $0x8,%rsp
  402bc8:	48 c1 fd 03          	sar    $0x3,%rbp
  402bcc:	e8 df df ff ff       	callq  400bb0 <_init>
  402bd1:	48 85 ed             	test   %rbp,%rbp
  402bd4:	74 20                	je     402bf6 <__libc_csu_init+0x56>
  402bd6:	31 db                	xor    %ebx,%ebx
  402bd8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402bdf:	00 
  402be0:	4c 89 ea             	mov    %r13,%rdx
  402be3:	4c 89 f6             	mov    %r14,%rsi
  402be6:	44 89 ff             	mov    %r15d,%edi
  402be9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402bed:	48 83 c3 01          	add    $0x1,%rbx
  402bf1:	48 39 dd             	cmp    %rbx,%rbp
  402bf4:	75 ea                	jne    402be0 <__libc_csu_init+0x40>
  402bf6:	48 83 c4 08          	add    $0x8,%rsp
  402bfa:	5b                   	pop    %rbx
  402bfb:	5d                   	pop    %rbp
  402bfc:	41 5c                	pop    %r12
  402bfe:	41 5d                	pop    %r13
  402c00:	41 5e                	pop    %r14
  402c02:	41 5f                	pop    %r15
  402c04:	c3                   	retq   
  402c05:	90                   	nop
  402c06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402c0d:	00 00 00 

0000000000402c10 <__libc_csu_fini>:
  402c10:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402c14 <_fini>:
  402c14:	48 83 ec 08          	sub    $0x8,%rsp
  402c18:	48 83 c4 08          	add    $0x8,%rsp
  402c1c:	c3                   	retq   
