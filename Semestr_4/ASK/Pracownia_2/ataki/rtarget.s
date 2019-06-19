
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bb0 <_init>:
  400bb0:	48 83 ec 08          	sub    $0x8,%rsp
  400bb4:	48 8b 05 3d 44 20 00 	mov    0x20443d(%rip),%rax        # 604ff8 <__gmon_start__>
  400bbb:	48 85 c0             	test   %rax,%rax
  400bbe:	74 02                	je     400bc2 <_init+0x12>
  400bc0:	ff d0                	callq  *%rax
  400bc2:	48 83 c4 08          	add    $0x8,%rsp
  400bc6:	c3                   	retq   

Disassembly of section .plt:

0000000000400bd0 <.plt>:
  400bd0:	ff 35 32 44 20 00    	pushq  0x204432(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bd6:	ff 25 34 44 20 00    	jmpq   *0x204434(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400be0 <strcasecmp@plt>:
  400be0:	ff 25 32 44 20 00    	jmpq   *0x204432(%rip)        # 605018 <strcasecmp@GLIBC_2.2.5>
  400be6:	68 00 00 00 00       	pushq  $0x0
  400beb:	e9 e0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400bf0 <__errno_location@plt>:
  400bf0:	ff 25 2a 44 20 00    	jmpq   *0x20442a(%rip)        # 605020 <__errno_location@GLIBC_2.2.5>
  400bf6:	68 01 00 00 00       	pushq  $0x1
  400bfb:	e9 d0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c00 <srandom@plt>:
  400c00:	ff 25 22 44 20 00    	jmpq   *0x204422(%rip)        # 605028 <srandom@GLIBC_2.2.5>
  400c06:	68 02 00 00 00       	pushq  $0x2
  400c0b:	e9 c0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c10 <strncmp@plt>:
  400c10:	ff 25 1a 44 20 00    	jmpq   *0x20441a(%rip)        # 605030 <strncmp@GLIBC_2.2.5>
  400c16:	68 03 00 00 00       	pushq  $0x3
  400c1b:	e9 b0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c20 <strcpy@plt>:
  400c20:	ff 25 12 44 20 00    	jmpq   *0x204412(%rip)        # 605038 <strcpy@GLIBC_2.2.5>
  400c26:	68 04 00 00 00       	pushq  $0x4
  400c2b:	e9 a0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c30 <puts@plt>:
  400c30:	ff 25 0a 44 20 00    	jmpq   *0x20440a(%rip)        # 605040 <puts@GLIBC_2.2.5>
  400c36:	68 05 00 00 00       	pushq  $0x5
  400c3b:	e9 90 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c40 <write@plt>:
  400c40:	ff 25 02 44 20 00    	jmpq   *0x204402(%rip)        # 605048 <write@GLIBC_2.2.5>
  400c46:	68 06 00 00 00       	pushq  $0x6
  400c4b:	e9 80 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c50 <mmap@plt>:
  400c50:	ff 25 fa 43 20 00    	jmpq   *0x2043fa(%rip)        # 605050 <mmap@GLIBC_2.2.5>
  400c56:	68 07 00 00 00       	pushq  $0x7
  400c5b:	e9 70 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c60 <printf@plt>:
  400c60:	ff 25 f2 43 20 00    	jmpq   *0x2043f2(%rip)        # 605058 <printf@GLIBC_2.2.5>
  400c66:	68 08 00 00 00       	pushq  $0x8
  400c6b:	e9 60 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c70 <memset@plt>:
  400c70:	ff 25 ea 43 20 00    	jmpq   *0x2043ea(%rip)        # 605060 <memset@GLIBC_2.2.5>
  400c76:	68 09 00 00 00       	pushq  $0x9
  400c7b:	e9 50 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c80 <alarm@plt>:
  400c80:	ff 25 e2 43 20 00    	jmpq   *0x2043e2(%rip)        # 605068 <alarm@GLIBC_2.2.5>
  400c86:	68 0a 00 00 00       	pushq  $0xa
  400c8b:	e9 40 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c90 <close@plt>:
  400c90:	ff 25 da 43 20 00    	jmpq   *0x2043da(%rip)        # 605070 <close@GLIBC_2.2.5>
  400c96:	68 0b 00 00 00       	pushq  $0xb
  400c9b:	e9 30 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400ca0 <read@plt>:
  400ca0:	ff 25 d2 43 20 00    	jmpq   *0x2043d2(%rip)        # 605078 <read@GLIBC_2.2.5>
  400ca6:	68 0c 00 00 00       	pushq  $0xc
  400cab:	e9 20 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cb0 <signal@plt>:
  400cb0:	ff 25 ca 43 20 00    	jmpq   *0x2043ca(%rip)        # 605080 <signal@GLIBC_2.2.5>
  400cb6:	68 0d 00 00 00       	pushq  $0xd
  400cbb:	e9 10 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cc0 <gethostbyname@plt>:
  400cc0:	ff 25 c2 43 20 00    	jmpq   *0x2043c2(%rip)        # 605088 <gethostbyname@GLIBC_2.2.5>
  400cc6:	68 0e 00 00 00       	pushq  $0xe
  400ccb:	e9 00 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cd0 <fprintf@plt>:
  400cd0:	ff 25 ba 43 20 00    	jmpq   *0x2043ba(%rip)        # 605090 <fprintf@GLIBC_2.2.5>
  400cd6:	68 0f 00 00 00       	pushq  $0xf
  400cdb:	e9 f0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400ce0 <strtol@plt>:
  400ce0:	ff 25 b2 43 20 00    	jmpq   *0x2043b2(%rip)        # 605098 <strtol@GLIBC_2.2.5>
  400ce6:	68 10 00 00 00       	pushq  $0x10
  400ceb:	e9 e0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400cf0 <memcpy@plt>:
  400cf0:	ff 25 aa 43 20 00    	jmpq   *0x2043aa(%rip)        # 6050a0 <memcpy@GLIBC_2.14>
  400cf6:	68 11 00 00 00       	pushq  $0x11
  400cfb:	e9 d0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d00 <time@plt>:
  400d00:	ff 25 a2 43 20 00    	jmpq   *0x2043a2(%rip)        # 6050a8 <time@GLIBC_2.2.5>
  400d06:	68 12 00 00 00       	pushq  $0x12
  400d0b:	e9 c0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d10 <random@plt>:
  400d10:	ff 25 9a 43 20 00    	jmpq   *0x20439a(%rip)        # 6050b0 <random@GLIBC_2.2.5>
  400d16:	68 13 00 00 00       	pushq  $0x13
  400d1b:	e9 b0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d20 <_IO_getc@plt>:
  400d20:	ff 25 92 43 20 00    	jmpq   *0x204392(%rip)        # 6050b8 <_IO_getc@GLIBC_2.2.5>
  400d26:	68 14 00 00 00       	pushq  $0x14
  400d2b:	e9 a0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d30 <__isoc99_sscanf@plt>:
  400d30:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 6050c0 <__isoc99_sscanf@GLIBC_2.7>
  400d36:	68 15 00 00 00       	pushq  $0x15
  400d3b:	e9 90 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d40 <munmap@plt>:
  400d40:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 6050c8 <munmap@GLIBC_2.2.5>
  400d46:	68 16 00 00 00       	pushq  $0x16
  400d4b:	e9 80 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d50 <bcopy@plt>:
  400d50:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 6050d0 <bcopy@GLIBC_2.2.5>
  400d56:	68 17 00 00 00       	pushq  $0x17
  400d5b:	e9 70 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d60 <fopen@plt>:
  400d60:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 6050d8 <fopen@GLIBC_2.2.5>
  400d66:	68 18 00 00 00       	pushq  $0x18
  400d6b:	e9 60 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d70 <getopt@plt>:
  400d70:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 6050e0 <getopt@GLIBC_2.2.5>
  400d76:	68 19 00 00 00       	pushq  $0x19
  400d7b:	e9 50 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d80 <strtoul@plt>:
  400d80:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 6050e8 <strtoul@GLIBC_2.2.5>
  400d86:	68 1a 00 00 00       	pushq  $0x1a
  400d8b:	e9 40 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d90 <gethostname@plt>:
  400d90:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 6050f0 <gethostname@GLIBC_2.2.5>
  400d96:	68 1b 00 00 00       	pushq  $0x1b
  400d9b:	e9 30 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400da0 <sprintf@plt>:
  400da0:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 6050f8 <sprintf@GLIBC_2.2.5>
  400da6:	68 1c 00 00 00       	pushq  $0x1c
  400dab:	e9 20 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400db0 <exit@plt>:
  400db0:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605100 <exit@GLIBC_2.2.5>
  400db6:	68 1d 00 00 00       	pushq  $0x1d
  400dbb:	e9 10 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dc0 <connect@plt>:
  400dc0:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605108 <connect@GLIBC_2.2.5>
  400dc6:	68 1e 00 00 00       	pushq  $0x1e
  400dcb:	e9 00 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dd0 <socket@plt>:
  400dd0:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605110 <socket@GLIBC_2.2.5>
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
  400def:	49 c7 c0 30 2d 40 00 	mov    $0x402d30,%r8
  400df6:	48 c7 c1 c0 2c 40 00 	mov    $0x402cc0,%rcx
  400dfd:	48 c7 c7 ba 10 40 00 	mov    $0x4010ba,%rdi
  400e04:	ff 15 e6 41 20 00    	callq  *0x2041e6(%rip)        # 604ff0 <__libc_start_main@GLIBC_2.2.5>
  400e0a:	f4                   	hlt    
  400e0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400e10 <deregister_tm_clones>:
  400e10:	b8 97 54 60 00       	mov    $0x605497,%eax
  400e15:	55                   	push   %rbp
  400e16:	48 2d 90 54 60 00    	sub    $0x605490,%rax
  400e1c:	48 83 f8 0e          	cmp    $0xe,%rax
  400e20:	48 89 e5             	mov    %rsp,%rbp
  400e23:	76 1b                	jbe    400e40 <deregister_tm_clones+0x30>
  400e25:	b8 00 00 00 00       	mov    $0x0,%eax
  400e2a:	48 85 c0             	test   %rax,%rax
  400e2d:	74 11                	je     400e40 <deregister_tm_clones+0x30>
  400e2f:	5d                   	pop    %rbp
  400e30:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e35:	ff e0                	jmpq   *%rax
  400e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e3e:	00 00 
  400e40:	5d                   	pop    %rbp
  400e41:	c3                   	retq   
  400e42:	0f 1f 40 00          	nopl   0x0(%rax)
  400e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e4d:	00 00 00 

0000000000400e50 <register_tm_clones>:
  400e50:	be 90 54 60 00       	mov    $0x605490,%esi
  400e55:	55                   	push   %rbp
  400e56:	48 81 ee 90 54 60 00 	sub    $0x605490,%rsi
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
  400e7e:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e83:	ff e0                	jmpq   *%rax
  400e85:	0f 1f 00             	nopl   (%rax)
  400e88:	5d                   	pop    %rbp
  400e89:	c3                   	retq   
  400e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e90 <__do_global_dtors_aux>:
  400e90:	80 3d 31 46 20 00 00 	cmpb   $0x0,0x204631(%rip)        # 6054c8 <completed.6972>
  400e97:	75 11                	jne    400eaa <__do_global_dtors_aux+0x1a>
  400e99:	55                   	push   %rbp
  400e9a:	48 89 e5             	mov    %rsp,%rbp
  400e9d:	e8 6e ff ff ff       	callq  400e10 <deregister_tm_clones>
  400ea2:	5d                   	pop    %rbp
  400ea3:	c6 05 1e 46 20 00 01 	movb   $0x1,0x20461e(%rip)        # 6054c8 <completed.6972>
  400eaa:	f3 c3                	repz retq 
  400eac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400eb0 <frame_dummy>:
  400eb0:	bf 18 4e 60 00       	mov    $0x604e18,%edi
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
  400edd:	83 3d 24 46 20 00 00 	cmpl   $0x0,0x204624(%rip)        # 605508 <is_checker>
  400ee4:	74 4b                	je     400f31 <usage+0x5b>
  400ee6:	48 8d 3d 5b 1e 00 00 	lea    0x1e5b(%rip),%rdi        # 402d48 <_IO_stdin_used+0x8>
  400eed:	b8 00 00 00 00       	mov    $0x0,%eax
  400ef2:	e8 69 fd ff ff       	callq  400c60 <printf@plt>
  400ef7:	48 8d 3d 82 1e 00 00 	lea    0x1e82(%rip),%rdi        # 402d80 <_IO_stdin_used+0x40>
  400efe:	e8 2d fd ff ff       	callq  400c30 <puts@plt>
  400f03:	48 8d 3d ee 1f 00 00 	lea    0x1fee(%rip),%rdi        # 402ef8 <_IO_stdin_used+0x1b8>
  400f0a:	e8 21 fd ff ff       	callq  400c30 <puts@plt>
  400f0f:	48 8d 3d 92 1e 00 00 	lea    0x1e92(%rip),%rdi        # 402da8 <_IO_stdin_used+0x68>
  400f16:	e8 15 fd ff ff       	callq  400c30 <puts@plt>
  400f1b:	48 8d 3d f0 1f 00 00 	lea    0x1ff0(%rip),%rdi        # 402f12 <_IO_stdin_used+0x1d2>
  400f22:	e8 09 fd ff ff       	callq  400c30 <puts@plt>
  400f27:	bf 00 00 00 00       	mov    $0x0,%edi
  400f2c:	e8 7f fe ff ff       	callq  400db0 <exit@plt>
  400f31:	48 8d 3d f6 1f 00 00 	lea    0x1ff6(%rip),%rdi        # 402f2e <_IO_stdin_used+0x1ee>
  400f38:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3d:	e8 1e fd ff ff       	callq  400c60 <printf@plt>
  400f42:	48 8d 3d 87 1e 00 00 	lea    0x1e87(%rip),%rdi        # 402dd0 <_IO_stdin_used+0x90>
  400f49:	e8 e2 fc ff ff       	callq  400c30 <puts@plt>
  400f4e:	48 8d 3d a3 1e 00 00 	lea    0x1ea3(%rip),%rdi        # 402df8 <_IO_stdin_used+0xb8>
  400f55:	e8 d6 fc ff ff       	callq  400c30 <puts@plt>
  400f5a:	48 8d 3d eb 1f 00 00 	lea    0x1feb(%rip),%rdi        # 402f4c <_IO_stdin_used+0x20c>
  400f61:	e8 ca fc ff ff       	callq  400c30 <puts@plt>
  400f66:	eb bf                	jmp    400f27 <usage+0x51>

0000000000400f68 <initialize_target>:
  400f68:	55                   	push   %rbp
  400f69:	53                   	push   %rbx
  400f6a:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400f71:	89 f5                	mov    %esi,%ebp
  400f73:	89 3d 7f 45 20 00    	mov    %edi,0x20457f(%rip)        # 6054f8 <check_level>
  400f79:	8b 3d b1 41 20 00    	mov    0x2041b1(%rip),%edi        # 605130 <target_id>
  400f7f:	e8 1b 1d 00 00       	callq  402c9f <gencookie>
  400f84:	89 05 7a 45 20 00    	mov    %eax,0x20457a(%rip)        # 605504 <cookie>
  400f8a:	89 c7                	mov    %eax,%edi
  400f8c:	e8 0e 1d 00 00       	callq  402c9f <gencookie>
  400f91:	89 05 69 45 20 00    	mov    %eax,0x204569(%rip)        # 605500 <authkey>
  400f97:	8b 05 93 41 20 00    	mov    0x204193(%rip),%eax        # 605130 <target_id>
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
  400fca:	48 89 05 af 44 20 00 	mov    %rax,0x2044af(%rip)        # 605480 <buf_offset>
  400fd1:	c6 05 50 51 20 00 72 	movb   $0x72,0x205150(%rip)        # 606128 <target_prefix>
  400fd8:	83 3d a9 44 20 00 00 	cmpl   $0x0,0x2044a9(%rip)        # 605488 <notify>
  400fdf:	74 09                	je     400fea <initialize_target+0x82>
  400fe1:	83 3d 20 45 20 00 00 	cmpl   $0x0,0x204520(%rip)        # 605508 <is_checker>
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
  401024:	48 8d 15 35 41 20 00 	lea    0x204135(%rip),%rdx        # 605160 <host_table>
  40102b:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40102f:	48 85 ff             	test   %rdi,%rdi
  401032:	74 2c                	je     401060 <initialize_target+0xf8>
  401034:	48 89 e6             	mov    %rsp,%rsi
  401037:	e8 a4 fb ff ff       	callq  400be0 <strcasecmp@plt>
  40103c:	85 c0                	test   %eax,%eax
  40103e:	74 1b                	je     40105b <initialize_target+0xf3>
  401040:	83 c3 01             	add    $0x1,%ebx
  401043:	eb dc                	jmp    401021 <initialize_target+0xb9>
  401045:	48 8d 3d dc 1d 00 00 	lea    0x1ddc(%rip),%rdi        # 402e28 <_IO_stdin_used+0xe8>
  40104c:	e8 df fb ff ff       	callq  400c30 <puts@plt>
  401051:	bf 08 00 00 00       	mov    $0x8,%edi
  401056:	e8 55 fd ff ff       	callq  400db0 <exit@plt>
  40105b:	bd 01 00 00 00       	mov    $0x1,%ebp
  401060:	85 ed                	test   %ebp,%ebp
  401062:	74 38                	je     40109c <initialize_target+0x134>
  401064:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40106b:	00 
  40106c:	e8 b3 19 00 00       	callq  402a24 <init_driver>
  401071:	85 c0                	test   %eax,%eax
  401073:	0f 89 71 ff ff ff    	jns    400fea <initialize_target+0x82>
  401079:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401080:	00 
  401081:	48 8d 3d 18 1e 00 00 	lea    0x1e18(%rip),%rdi        # 402ea0 <_IO_stdin_used+0x160>
  401088:	b8 00 00 00 00       	mov    $0x0,%eax
  40108d:	e8 ce fb ff ff       	callq  400c60 <printf@plt>
  401092:	bf 08 00 00 00       	mov    $0x8,%edi
  401097:	e8 14 fd ff ff       	callq  400db0 <exit@plt>
  40109c:	48 89 e6             	mov    %rsp,%rsi
  40109f:	48 8d 3d ba 1d 00 00 	lea    0x1dba(%rip),%rdi        # 402e60 <_IO_stdin_used+0x120>
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
  4010c8:	48 c7 c6 ca 1d 40 00 	mov    $0x401dca,%rsi
  4010cf:	bf 0b 00 00 00       	mov    $0xb,%edi
  4010d4:	e8 d7 fb ff ff       	callq  400cb0 <signal@plt>
  4010d9:	48 c7 c6 76 1d 40 00 	mov    $0x401d76,%rsi
  4010e0:	bf 07 00 00 00       	mov    $0x7,%edi
  4010e5:	e8 c6 fb ff ff       	callq  400cb0 <signal@plt>
  4010ea:	48 c7 c6 1e 1e 40 00 	mov    $0x401e1e,%rsi
  4010f1:	bf 04 00 00 00       	mov    $0x4,%edi
  4010f6:	e8 b5 fb ff ff       	callq  400cb0 <signal@plt>
  4010fb:	83 3d 06 44 20 00 00 	cmpl   $0x0,0x204406(%rip)        # 605508 <is_checker>
  401102:	75 58                	jne    40115c <main+0xa2>
  401104:	48 8d 2d 5a 1e 00 00 	lea    0x1e5a(%rip),%rbp        # 402f65 <_IO_stdin_used+0x225>
  40110b:	48 8b 05 8e 43 20 00 	mov    0x20438e(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  401112:	48 89 05 d7 43 20 00 	mov    %rax,0x2043d7(%rip)        # 6054f0 <infile>
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
  40114c:	48 8d 15 5d 1e 00 00 	lea    0x1e5d(%rip),%rdx        # 402fb0 <_IO_stdin_used+0x270>
  401153:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  401157:	48 01 d0             	add    %rdx,%rax
  40115a:	ff e0                	jmpq   *%rax
  40115c:	48 c7 c6 72 1e 40 00 	mov    $0x401e72,%rsi
  401163:	bf 0e 00 00 00       	mov    $0xe,%edi
  401168:	e8 43 fb ff ff       	callq  400cb0 <signal@plt>
  40116d:	bf 05 00 00 00       	mov    $0x5,%edi
  401172:	e8 09 fb ff ff       	callq  400c80 <alarm@plt>
  401177:	48 8d 2d ec 1d 00 00 	lea    0x1dec(%rip),%rbp        # 402f6a <_IO_stdin_used+0x22a>
  40117e:	eb 8b                	jmp    40110b <main+0x51>
  401180:	48 8b 3b             	mov    (%rbx),%rdi
  401183:	e8 4e fd ff ff       	callq  400ed6 <usage>
  401188:	48 8d 35 5e 20 00 00 	lea    0x205e(%rip),%rsi        # 4031ed <_IO_stdin_used+0x4ad>
  40118f:	48 8b 3d 12 43 20 00 	mov    0x204312(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  401196:	e8 c5 fb ff ff       	callq  400d60 <fopen@plt>
  40119b:	48 89 05 4e 43 20 00 	mov    %rax,0x20434e(%rip)        # 6054f0 <infile>
  4011a2:	48 85 c0             	test   %rax,%rax
  4011a5:	0f 85 7a ff ff ff    	jne    401125 <main+0x6b>
  4011ab:	48 8b 15 f6 42 20 00 	mov    0x2042f6(%rip),%rdx        # 6054a8 <optarg@@GLIBC_2.2.5>
  4011b2:	48 8d 35 b9 1d 00 00 	lea    0x1db9(%rip),%rsi        # 402f72 <_IO_stdin_used+0x232>
  4011b9:	48 8b 3d 00 43 20 00 	mov    0x204300(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  4011c0:	e8 0b fb ff ff       	callq  400cd0 <fprintf@plt>
  4011c5:	b8 01 00 00 00       	mov    $0x1,%eax
  4011ca:	e9 c9 00 00 00       	jmpq   401298 <main+0x1de>
  4011cf:	ba 10 00 00 00       	mov    $0x10,%edx
  4011d4:	be 00 00 00 00       	mov    $0x0,%esi
  4011d9:	48 8b 3d c8 42 20 00 	mov    0x2042c8(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4011e0:	e8 9b fb ff ff       	callq  400d80 <strtoul@plt>
  4011e5:	41 89 c6             	mov    %eax,%r14d
  4011e8:	e9 38 ff ff ff       	jmpq   401125 <main+0x6b>
  4011ed:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011f2:	be 00 00 00 00       	mov    $0x0,%esi
  4011f7:	48 8b 3d aa 42 20 00 	mov    0x2042aa(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4011fe:	e8 dd fa ff ff       	callq  400ce0 <strtol@plt>
  401203:	41 89 c5             	mov    %eax,%r13d
  401206:	e9 1a ff ff ff       	jmpq   401125 <main+0x6b>
  40120b:	c7 05 73 42 20 00 00 	movl   $0x0,0x204273(%rip)        # 605488 <notify>
  401212:	00 00 00 
  401215:	e9 0b ff ff ff       	jmpq   401125 <main+0x6b>
  40121a:	48 8d 3d 6e 1d 00 00 	lea    0x1d6e(%rip),%rdi        # 402f8f <_IO_stdin_used+0x24f>
  401221:	b8 00 00 00 00       	mov    $0x0,%eax
  401226:	e8 35 fa ff ff       	callq  400c60 <printf@plt>
  40122b:	48 8b 3b             	mov    (%rbx),%rdi
  40122e:	e8 a3 fc ff ff       	callq  400ed6 <usage>
  401233:	be 01 00 00 00       	mov    $0x1,%esi
  401238:	44 89 ef             	mov    %r13d,%edi
  40123b:	e8 28 fd ff ff       	callq  400f68 <initialize_target>
  401240:	83 3d c1 42 20 00 00 	cmpl   $0x0,0x2042c1(%rip)        # 605508 <is_checker>
  401247:	74 27                	je     401270 <main+0x1b6>
  401249:	44 3b 35 b0 42 20 00 	cmp    0x2042b0(%rip),%r14d        # 605500 <authkey>
  401250:	74 1e                	je     401270 <main+0x1b6>
  401252:	44 89 f6             	mov    %r14d,%esi
  401255:	48 8d 3d 6c 1c 00 00 	lea    0x1c6c(%rip),%rdi        # 402ec8 <_IO_stdin_used+0x188>
  40125c:	b8 00 00 00 00       	mov    $0x0,%eax
  401261:	e8 fa f9 ff ff       	callq  400c60 <printf@plt>
  401266:	b8 00 00 00 00       	mov    $0x0,%eax
  40126b:	e8 d6 07 00 00       	callq  401a46 <check_fail>
  401270:	8b 35 8e 42 20 00    	mov    0x20428e(%rip),%esi        # 605504 <cookie>
  401276:	48 8d 3d 25 1d 00 00 	lea    0x1d25(%rip),%rdi        # 402fa2 <_IO_stdin_used+0x262>
  40127d:	b8 00 00 00 00       	mov    $0x0,%eax
  401282:	e8 d9 f9 ff ff       	callq  400c60 <printf@plt>
  401287:	48 8b 3d f2 41 20 00 	mov    0x2041f2(%rip),%rdi        # 605480 <buf_offset>
  40128e:	e8 31 0c 00 00       	callq  401ec4 <launch>
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
  40170b:	e8 69 03 00 00       	callq  401a79 <Gets>
  401710:	b8 01 00 00 00       	mov    $0x1,%eax
  401715:	48 83 c4 28          	add    $0x28,%rsp
  401719:	c3                   	retq   

000000000040171a <touch1>:
  40171a:	48 83 ec 08          	sub    $0x8,%rsp
  40171e:	c7 05 d4 3d 20 00 01 	movl   $0x1,0x203dd4(%rip)        # 6054fc <vlevel>
  401725:	00 00 00 
  401728:	48 8d 3d 13 19 00 00 	lea    0x1913(%rip),%rdi        # 403042 <_IO_stdin_used+0x302>
  40172f:	e8 fc f4 ff ff       	callq  400c30 <puts@plt>
  401734:	bf 01 00 00 00       	mov    $0x1,%edi
  401739:	e8 52 05 00 00       	callq  401c90 <validate>
  40173e:	bf 00 00 00 00       	mov    $0x0,%edi
  401743:	e8 68 f6 ff ff       	callq  400db0 <exit@plt>

0000000000401748 <touch2>:
  401748:	48 83 ec 08          	sub    $0x8,%rsp
  40174c:	89 fe                	mov    %edi,%esi
  40174e:	c7 05 a4 3d 20 00 02 	movl   $0x2,0x203da4(%rip)        # 6054fc <vlevel>
  401755:	00 00 00 
  401758:	39 3d a6 3d 20 00    	cmp    %edi,0x203da6(%rip)        # 605504 <cookie>
  40175e:	74 25                	je     401785 <touch2+0x3d>
  401760:	48 8d 3d 29 19 00 00 	lea    0x1929(%rip),%rdi        # 403090 <_IO_stdin_used+0x350>
  401767:	b8 00 00 00 00       	mov    $0x0,%eax
  40176c:	e8 ef f4 ff ff       	callq  400c60 <printf@plt>
  401771:	bf 02 00 00 00       	mov    $0x2,%edi
  401776:	e8 d3 05 00 00       	callq  401d4e <fail>
  40177b:	bf 00 00 00 00       	mov    $0x0,%edi
  401780:	e8 2b f6 ff ff       	callq  400db0 <exit@plt>
  401785:	48 8d 3d dc 18 00 00 	lea    0x18dc(%rip),%rdi        # 403068 <_IO_stdin_used+0x328>
  40178c:	b8 00 00 00 00       	mov    $0x0,%eax
  401791:	e8 ca f4 ff ff       	callq  400c60 <printf@plt>
  401796:	bf 02 00 00 00       	mov    $0x2,%edi
  40179b:	e8 f0 04 00 00       	callq  401c90 <validate>
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
  4017ee:	48 8d 35 6a 18 00 00 	lea    0x186a(%rip),%rsi        # 40305f <_IO_stdin_used+0x31f>
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
  401827:	c7 05 cb 3c 20 00 03 	movl   $0x3,0x203ccb(%rip)        # 6054fc <vlevel>
  40182e:	00 00 00 
  401831:	48 89 fe             	mov    %rdi,%rsi
  401834:	8b 3d ca 3c 20 00    	mov    0x203cca(%rip),%edi        # 605504 <cookie>
  40183a:	e8 63 ff ff ff       	callq  4017a2 <hexmatch>
  40183f:	85 c0                	test   %eax,%eax
  401841:	74 28                	je     40186b <touch3+0x48>
  401843:	48 89 de             	mov    %rbx,%rsi
  401846:	48 8d 3d 6b 18 00 00 	lea    0x186b(%rip),%rdi        # 4030b8 <_IO_stdin_used+0x378>
  40184d:	b8 00 00 00 00       	mov    $0x0,%eax
  401852:	e8 09 f4 ff ff       	callq  400c60 <printf@plt>
  401857:	bf 03 00 00 00       	mov    $0x3,%edi
  40185c:	e8 2f 04 00 00       	callq  401c90 <validate>
  401861:	bf 00 00 00 00       	mov    $0x0,%edi
  401866:	e8 45 f5 ff ff       	callq  400db0 <exit@plt>
  40186b:	48 89 de             	mov    %rbx,%rsi
  40186e:	48 8d 3d 6b 18 00 00 	lea    0x186b(%rip),%rdi        # 4030e0 <_IO_stdin_used+0x3a0>
  401875:	b8 00 00 00 00       	mov    $0x0,%eax
  40187a:	e8 e1 f3 ff ff       	callq  400c60 <printf@plt>
  40187f:	bf 03 00 00 00       	mov    $0x3,%edi
  401884:	e8 c5 04 00 00       	callq  401d4e <fail>
  401889:	eb d6                	jmp    401861 <touch3+0x3e>

000000000040188b <test>:
  40188b:	48 83 ec 08          	sub    $0x8,%rsp
  40188f:	b8 00 00 00 00       	mov    $0x0,%eax
  401894:	e8 6b fe ff ff       	callq  401704 <getbuf>
  401899:	89 c6                	mov    %eax,%esi
  40189b:	48 8d 3d 66 18 00 00 	lea    0x1866(%rip),%rdi        # 403108 <_IO_stdin_used+0x3c8>
  4018a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a7:	e8 b4 f3 ff ff       	callq  400c60 <printf@plt>
  4018ac:	48 83 c4 08          	add    $0x8,%rsp
  4018b0:	c3                   	retq   

00000000004018b1 <start_farm>:
  4018b1:	b8 01 00 00 00       	mov    $0x1,%eax
  4018b6:	c3                   	retq   

00000000004018b7 <getval_309>:
  4018b7:	b8 af 58 c2 57       	mov    $0x57c258af,%eax
  4018bc:	c3                   	retq   

00000000004018bd <setval_329>:
  4018bd:	c7 07 ca 58 90 90    	movl   $0x909058ca,(%rdi)
  4018c3:	c3                   	retq   

00000000004018c4 <setval_482>:
  4018c4:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  4018ca:	c3                   	retq   

00000000004018cb <getval_162>:
  4018cb:	b8 58 90 90 90       	mov    $0x90909058,%eax
  4018d0:	c3                   	retq   

00000000004018d1 <addval_188>:
  4018d1:	8d 87 48 89 c7 91    	lea    -0x6e3876b8(%rdi),%eax
  4018d7:	c3                   	retq   

00000000004018d8 <addval_483>:
  4018d8:	8d 87 48 8d c7 90    	lea    -0x6f3872b8(%rdi),%eax
  4018de:	c3                   	retq   

00000000004018df <getval_380>:
  4018df:	b8 48 90 90 c3       	mov    $0xc3909048,%eax
  4018e4:	c3                   	retq   

00000000004018e5 <addval_227>:
  4018e5:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  4018eb:	c3                   	retq   

00000000004018ec <mid_farm>:
  4018ec:	b8 01 00 00 00       	mov    $0x1,%eax
  4018f1:	c3                   	retq   

00000000004018f2 <add_xy>:
  4018f2:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4018f6:	c3                   	retq   

00000000004018f7 <setval_113>:
  4018f7:	c7 07 48 89 e0 c2    	movl   $0xc2e08948,(%rdi)
  4018fd:	c3                   	retq   

00000000004018fe <setval_179>:
  4018fe:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401904:	c3                   	retq   

0000000000401905 <getval_292>:
  401905:	b8 89 ce 78 db       	mov    $0xdb78ce89,%eax
  40190a:	c3                   	retq   

000000000040190b <addval_302>:
  40190b:	8d 87 89 c2 38 db    	lea    -0x24c73d77(%rdi),%eax
  401911:	c3                   	retq   

0000000000401912 <setval_207>:
  401912:	c7 07 99 c2 38 d2    	movl   $0xd238c299,(%rdi)
  401918:	c3                   	retq   

0000000000401919 <setval_101>:
  401919:	c7 07 c9 d1 84 c0    	movl   $0xc084d1c9,(%rdi)
  40191f:	c3                   	retq   

0000000000401920 <addval_223>:
  401920:	8d 87 48 89 e0 92    	lea    -0x6d1f76b8(%rdi),%eax
  401926:	c3                   	retq   

0000000000401927 <setval_489>:
  401927:	c7 07 8e a9 ce 90    	movl   $0x90cea98e,(%rdi)
  40192d:	c3                   	retq   

000000000040192e <setval_119>:
  40192e:	c7 07 b5 89 ce 91    	movl   $0x91ce89b5,(%rdi)
  401934:	c3                   	retq   

0000000000401935 <setval_341>:
  401935:	c7 07 c9 d1 20 c0    	movl   $0xc020d1c9,(%rdi)
  40193b:	c3                   	retq   

000000000040193c <setval_439>:
  40193c:	c7 07 89 c2 90 90    	movl   $0x9090c289,(%rdi)
  401942:	c3                   	retq   

0000000000401943 <addval_165>:
  401943:	8d 87 48 89 e0 c7    	lea    -0x381f76b8(%rdi),%eax
  401949:	c3                   	retq   

000000000040194a <addval_252>:
  40194a:	8d 87 a9 d1 90 c3    	lea    -0x3c6f2e57(%rdi),%eax
  401950:	c3                   	retq   

0000000000401951 <setval_291>:
  401951:	c7 07 89 c2 94 c9    	movl   $0xc994c289,(%rdi)
  401957:	c3                   	retq   

0000000000401958 <addval_261>:
  401958:	8d 87 89 d1 38 db    	lea    -0x24c72e77(%rdi),%eax
  40195e:	c3                   	retq   

000000000040195f <setval_184>:
  40195f:	c7 07 89 ce 08 db    	movl   $0xdb08ce89,(%rdi)
  401965:	c3                   	retq   

0000000000401966 <getval_176>:
  401966:	b8 49 89 e0 c3       	mov    $0xc3e08949,%eax
  40196b:	c3                   	retq   

000000000040196c <setval_389>:
  40196c:	c7 07 48 89 e0 92    	movl   $0x92e08948,(%rdi)
  401972:	c3                   	retq   

0000000000401973 <getval_423>:
  401973:	b8 88 ce 90 c3       	mov    $0xc390ce88,%eax
  401978:	c3                   	retq   

0000000000401979 <getval_145>:
  401979:	b8 9f 88 c2 c3       	mov    $0xc3c2889f,%eax
  40197e:	c3                   	retq   

000000000040197f <addval_337>:
  40197f:	8d 87 89 d1 18 d2    	lea    -0x2de72e77(%rdi),%eax
  401985:	c3                   	retq   

0000000000401986 <setval_486>:
  401986:	c7 07 30 89 c2 94    	movl   $0x94c28930,(%rdi)
  40198c:	c3                   	retq   

000000000040198d <addval_412>:
  40198d:	8d 87 48 89 e0 92    	lea    -0x6d1f76b8(%rdi),%eax
  401993:	c3                   	retq   

0000000000401994 <addval_247>:
  401994:	8d 87 48 89 e0 c3    	lea    -0x3c1f76b8(%rdi),%eax
  40199a:	c3                   	retq   

000000000040199b <setval_270>:
  40199b:	c7 07 89 ce 91 c3    	movl   $0xc391ce89,(%rdi)
  4019a1:	c3                   	retq   

00000000004019a2 <addval_497>:
  4019a2:	8d 87 8d c2 90 90    	lea    -0x6f6f3d73(%rdi),%eax
  4019a8:	c3                   	retq   

00000000004019a9 <getval_420>:
  4019a9:	b8 89 ce c7 96       	mov    $0x96c7ce89,%eax
  4019ae:	c3                   	retq   

00000000004019af <setval_294>:
  4019af:	c7 07 89 ce 20 c9    	movl   $0xc920ce89,(%rdi)
  4019b5:	c3                   	retq   

00000000004019b6 <setval_427>:
  4019b6:	c7 07 89 d1 00 c9    	movl   $0xc900d189,(%rdi)
  4019bc:	c3                   	retq   

00000000004019bd <setval_195>:
  4019bd:	c7 07 89 d1 20 c0    	movl   $0xc020d189,(%rdi)
  4019c3:	c3                   	retq   

00000000004019c4 <getval_433>:
  4019c4:	b8 a9 c2 84 db       	mov    $0xdb84c2a9,%eax
  4019c9:	c3                   	retq   

00000000004019ca <getval_237>:
  4019ca:	b8 48 89 d1 94       	mov    $0x94d18948,%eax
  4019cf:	c3                   	retq   

00000000004019d0 <end_farm>:
  4019d0:	b8 01 00 00 00       	mov    $0x1,%eax
  4019d5:	c3                   	retq   

00000000004019d6 <save_char>:
  4019d6:	8b 05 48 47 20 00    	mov    0x204748(%rip),%eax        # 606124 <gets_cnt>
  4019dc:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  4019e1:	7f 4a                	jg     401a2d <save_char+0x57>
  4019e3:	8d 14 40             	lea    (%rax,%rax,2),%edx
  4019e6:	89 f9                	mov    %edi,%ecx
  4019e8:	c0 e9 04             	shr    $0x4,%cl
  4019eb:	4c 8d 05 3e 1a 00 00 	lea    0x1a3e(%rip),%r8        # 403430 <trans_char>
  4019f2:	83 e1 0f             	and    $0xf,%ecx
  4019f5:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  4019fa:	48 8d 0d 1f 3b 20 00 	lea    0x203b1f(%rip),%rcx        # 605520 <gets_buf>
  401a01:	48 63 f2             	movslq %edx,%rsi
  401a04:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  401a08:	8d 72 01             	lea    0x1(%rdx),%esi
  401a0b:	83 e7 0f             	and    $0xf,%edi
  401a0e:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  401a13:	48 63 f6             	movslq %esi,%rsi
  401a16:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  401a1a:	83 c2 02             	add    $0x2,%edx
  401a1d:	48 63 d2             	movslq %edx,%rdx
  401a20:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  401a24:	83 c0 01             	add    $0x1,%eax
  401a27:	89 05 f7 46 20 00    	mov    %eax,0x2046f7(%rip)        # 606124 <gets_cnt>
  401a2d:	f3 c3                	repz retq 

0000000000401a2f <save_term>:
  401a2f:	8b 05 ef 46 20 00    	mov    0x2046ef(%rip),%eax        # 606124 <gets_cnt>
  401a35:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401a38:	48 98                	cltq   
  401a3a:	48 8d 15 df 3a 20 00 	lea    0x203adf(%rip),%rdx        # 605520 <gets_buf>
  401a41:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  401a45:	c3                   	retq   

0000000000401a46 <check_fail>:
  401a46:	48 83 ec 08          	sub    $0x8,%rsp
  401a4a:	0f be 35 d7 46 20 00 	movsbl 0x2046d7(%rip),%esi        # 606128 <target_prefix>
  401a51:	48 8d 0d c8 3a 20 00 	lea    0x203ac8(%rip),%rcx        # 605520 <gets_buf>
  401a58:	8b 15 9a 3a 20 00    	mov    0x203a9a(%rip),%edx        # 6054f8 <check_level>
  401a5e:	48 8d 3d c6 16 00 00 	lea    0x16c6(%rip),%rdi        # 40312b <_IO_stdin_used+0x3eb>
  401a65:	b8 00 00 00 00       	mov    $0x0,%eax
  401a6a:	e8 f1 f1 ff ff       	callq  400c60 <printf@plt>
  401a6f:	bf 01 00 00 00       	mov    $0x1,%edi
  401a74:	e8 37 f3 ff ff       	callq  400db0 <exit@plt>

0000000000401a79 <Gets>:
  401a79:	41 54                	push   %r12
  401a7b:	55                   	push   %rbp
  401a7c:	53                   	push   %rbx
  401a7d:	49 89 fc             	mov    %rdi,%r12
  401a80:	c7 05 9a 46 20 00 00 	movl   $0x0,0x20469a(%rip)        # 606124 <gets_cnt>
  401a87:	00 00 00 
  401a8a:	48 89 fb             	mov    %rdi,%rbx
  401a8d:	eb 11                	jmp    401aa0 <Gets+0x27>
  401a8f:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a93:	88 03                	mov    %al,(%rbx)
  401a95:	0f b6 f8             	movzbl %al,%edi
  401a98:	e8 39 ff ff ff       	callq  4019d6 <save_char>
  401a9d:	48 89 eb             	mov    %rbp,%rbx
  401aa0:	48 8b 3d 49 3a 20 00 	mov    0x203a49(%rip),%rdi        # 6054f0 <infile>
  401aa7:	e8 74 f2 ff ff       	callq  400d20 <_IO_getc@plt>
  401aac:	83 f8 ff             	cmp    $0xffffffff,%eax
  401aaf:	74 05                	je     401ab6 <Gets+0x3d>
  401ab1:	83 f8 0a             	cmp    $0xa,%eax
  401ab4:	75 d9                	jne    401a8f <Gets+0x16>
  401ab6:	c6 03 00             	movb   $0x0,(%rbx)
  401ab9:	b8 00 00 00 00       	mov    $0x0,%eax
  401abe:	e8 6c ff ff ff       	callq  401a2f <save_term>
  401ac3:	4c 89 e0             	mov    %r12,%rax
  401ac6:	5b                   	pop    %rbx
  401ac7:	5d                   	pop    %rbp
  401ac8:	41 5c                	pop    %r12
  401aca:	c3                   	retq   

0000000000401acb <notify_server>:
  401acb:	83 3d 36 3a 20 00 00 	cmpl   $0x0,0x203a36(%rip)        # 605508 <is_checker>
  401ad2:	0f 85 de 00 00 00    	jne    401bb6 <notify_server+0xeb>
  401ad8:	55                   	push   %rbp
  401ad9:	53                   	push   %rbx
  401ada:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  401ae1:	89 fb                	mov    %edi,%ebx
  401ae3:	8b 05 3b 46 20 00    	mov    0x20463b(%rip),%eax        # 606124 <gets_cnt>
  401ae9:	83 c0 64             	add    $0x64,%eax
  401aec:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401af1:	0f 8f c1 00 00 00    	jg     401bb8 <notify_server+0xed>
  401af7:	44 0f be 0d 29 46 20 	movsbl 0x204629(%rip),%r9d        # 606128 <target_prefix>
  401afe:	00 
  401aff:	83 3d 82 39 20 00 00 	cmpl   $0x0,0x203982(%rip)        # 605488 <notify>
  401b06:	0f 84 c7 00 00 00    	je     401bd3 <notify_server+0x108>
  401b0c:	44 8b 05 ed 39 20 00 	mov    0x2039ed(%rip),%r8d        # 605500 <authkey>
  401b13:	85 db                	test   %ebx,%ebx
  401b15:	0f 84 c3 00 00 00    	je     401bde <notify_server+0x113>
  401b1b:	48 8d 2d 1f 16 00 00 	lea    0x161f(%rip),%rbp        # 403141 <_IO_stdin_used+0x401>
  401b22:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401b29:	00 
  401b2a:	48 8d 05 ef 39 20 00 	lea    0x2039ef(%rip),%rax        # 605520 <gets_buf>
  401b31:	50                   	push   %rax
  401b32:	56                   	push   %rsi
  401b33:	48 89 e9             	mov    %rbp,%rcx
  401b36:	8b 15 f4 35 20 00    	mov    0x2035f4(%rip),%edx        # 605130 <target_id>
  401b3c:	48 8d 35 08 16 00 00 	lea    0x1608(%rip),%rsi        # 40314b <_IO_stdin_used+0x40b>
  401b43:	b8 00 00 00 00       	mov    $0x0,%eax
  401b48:	e8 53 f2 ff ff       	callq  400da0 <sprintf@plt>
  401b4d:	48 83 c4 10          	add    $0x10,%rsp
  401b51:	83 3d 30 39 20 00 00 	cmpl   $0x0,0x203930(%rip)        # 605488 <notify>
  401b58:	0f 84 b8 00 00 00    	je     401c16 <notify_server+0x14b>
  401b5e:	85 db                	test   %ebx,%ebx
  401b60:	0f 84 a2 00 00 00    	je     401c08 <notify_server+0x13d>
  401b66:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  401b6d:	00 
  401b6e:	49 89 e1             	mov    %rsp,%r9
  401b71:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b77:	48 8b 15 ca 35 20 00 	mov    0x2035ca(%rip),%rdx        # 605148 <lab>
  401b7e:	48 8b 35 cb 35 20 00 	mov    0x2035cb(%rip),%rsi        # 605150 <course>
  401b85:	48 8b 3d b4 35 20 00 	mov    0x2035b4(%rip),%rdi        # 605140 <user_id>
  401b8c:	e8 6e 10 00 00       	callq  402bff <driver_post>
  401b91:	85 c0                	test   %eax,%eax
  401b93:	78 55                	js     401bea <notify_server+0x11f>
  401b95:	48 8d 3d f4 16 00 00 	lea    0x16f4(%rip),%rdi        # 403290 <_IO_stdin_used+0x550>
  401b9c:	e8 8f f0 ff ff       	callq  400c30 <puts@plt>
  401ba1:	48 8d 3d cb 15 00 00 	lea    0x15cb(%rip),%rdi        # 403173 <_IO_stdin_used+0x433>
  401ba8:	e8 83 f0 ff ff       	callq  400c30 <puts@plt>
  401bad:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401bb4:	5b                   	pop    %rbx
  401bb5:	5d                   	pop    %rbp
  401bb6:	f3 c3                	repz retq 
  401bb8:	48 8d 3d a1 16 00 00 	lea    0x16a1(%rip),%rdi        # 403260 <_IO_stdin_used+0x520>
  401bbf:	b8 00 00 00 00       	mov    $0x0,%eax
  401bc4:	e8 97 f0 ff ff       	callq  400c60 <printf@plt>
  401bc9:	bf 01 00 00 00       	mov    $0x1,%edi
  401bce:	e8 dd f1 ff ff       	callq  400db0 <exit@plt>
  401bd3:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401bd9:	e9 35 ff ff ff       	jmpq   401b13 <notify_server+0x48>
  401bde:	48 8d 2d 61 15 00 00 	lea    0x1561(%rip),%rbp        # 403146 <_IO_stdin_used+0x406>
  401be5:	e9 38 ff ff ff       	jmpq   401b22 <notify_server+0x57>
  401bea:	48 89 e6             	mov    %rsp,%rsi
  401bed:	48 8d 3d 73 15 00 00 	lea    0x1573(%rip),%rdi        # 403167 <_IO_stdin_used+0x427>
  401bf4:	b8 00 00 00 00       	mov    $0x0,%eax
  401bf9:	e8 62 f0 ff ff       	callq  400c60 <printf@plt>
  401bfe:	bf 01 00 00 00       	mov    $0x1,%edi
  401c03:	e8 a8 f1 ff ff       	callq  400db0 <exit@plt>
  401c08:	48 8d 3d 6e 15 00 00 	lea    0x156e(%rip),%rdi        # 40317d <_IO_stdin_used+0x43d>
  401c0f:	e8 1c f0 ff ff       	callq  400c30 <puts@plt>
  401c14:	eb 97                	jmp    401bad <notify_server+0xe2>
  401c16:	48 89 ee             	mov    %rbp,%rsi
  401c19:	48 8d 3d a8 16 00 00 	lea    0x16a8(%rip),%rdi        # 4032c8 <_IO_stdin_used+0x588>
  401c20:	b8 00 00 00 00       	mov    $0x0,%eax
  401c25:	e8 36 f0 ff ff       	callq  400c60 <printf@plt>
  401c2a:	48 8b 35 0f 35 20 00 	mov    0x20350f(%rip),%rsi        # 605140 <user_id>
  401c31:	48 8d 3d 4c 15 00 00 	lea    0x154c(%rip),%rdi        # 403184 <_IO_stdin_used+0x444>
  401c38:	b8 00 00 00 00       	mov    $0x0,%eax
  401c3d:	e8 1e f0 ff ff       	callq  400c60 <printf@plt>
  401c42:	48 8b 35 07 35 20 00 	mov    0x203507(%rip),%rsi        # 605150 <course>
  401c49:	48 8d 3d 41 15 00 00 	lea    0x1541(%rip),%rdi        # 403191 <_IO_stdin_used+0x451>
  401c50:	b8 00 00 00 00       	mov    $0x0,%eax
  401c55:	e8 06 f0 ff ff       	callq  400c60 <printf@plt>
  401c5a:	48 8b 35 e7 34 20 00 	mov    0x2034e7(%rip),%rsi        # 605148 <lab>
  401c61:	48 8d 3d 35 15 00 00 	lea    0x1535(%rip),%rdi        # 40319d <_IO_stdin_used+0x45d>
  401c68:	b8 00 00 00 00       	mov    $0x0,%eax
  401c6d:	e8 ee ef ff ff       	callq  400c60 <printf@plt>
  401c72:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401c79:	00 
  401c7a:	48 8d 3d 25 15 00 00 	lea    0x1525(%rip),%rdi        # 4031a6 <_IO_stdin_used+0x466>
  401c81:	b8 00 00 00 00       	mov    $0x0,%eax
  401c86:	e8 d5 ef ff ff       	callq  400c60 <printf@plt>
  401c8b:	e9 1d ff ff ff       	jmpq   401bad <notify_server+0xe2>

0000000000401c90 <validate>:
  401c90:	53                   	push   %rbx
  401c91:	89 fb                	mov    %edi,%ebx
  401c93:	83 3d 6e 38 20 00 00 	cmpl   $0x0,0x20386e(%rip)        # 605508 <is_checker>
  401c9a:	74 68                	je     401d04 <validate+0x74>
  401c9c:	39 3d 5a 38 20 00    	cmp    %edi,0x20385a(%rip)        # 6054fc <vlevel>
  401ca2:	75 2d                	jne    401cd1 <validate+0x41>
  401ca4:	8b 35 4e 38 20 00    	mov    0x20384e(%rip),%esi        # 6054f8 <check_level>
  401caa:	39 f7                	cmp    %esi,%edi
  401cac:	75 39                	jne    401ce7 <validate+0x57>
  401cae:	0f be 35 73 44 20 00 	movsbl 0x204473(%rip),%esi        # 606128 <target_prefix>
  401cb5:	48 8d 0d 64 38 20 00 	lea    0x203864(%rip),%rcx        # 605520 <gets_buf>
  401cbc:	89 fa                	mov    %edi,%edx
  401cbe:	48 8d 3d 0b 15 00 00 	lea    0x150b(%rip),%rdi        # 4031d0 <_IO_stdin_used+0x490>
  401cc5:	b8 00 00 00 00       	mov    $0x0,%eax
  401cca:	e8 91 ef ff ff       	callq  400c60 <printf@plt>
  401ccf:	5b                   	pop    %rbx
  401cd0:	c3                   	retq   
  401cd1:	48 8d 3d da 14 00 00 	lea    0x14da(%rip),%rdi        # 4031b2 <_IO_stdin_used+0x472>
  401cd8:	e8 53 ef ff ff       	callq  400c30 <puts@plt>
  401cdd:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce2:	e8 5f fd ff ff       	callq  401a46 <check_fail>
  401ce7:	89 fa                	mov    %edi,%edx
  401ce9:	48 8d 3d 00 16 00 00 	lea    0x1600(%rip),%rdi        # 4032f0 <_IO_stdin_used+0x5b0>
  401cf0:	b8 00 00 00 00       	mov    $0x0,%eax
  401cf5:	e8 66 ef ff ff       	callq  400c60 <printf@plt>
  401cfa:	b8 00 00 00 00       	mov    $0x0,%eax
  401cff:	e8 42 fd ff ff       	callq  401a46 <check_fail>
  401d04:	3b 3d f2 37 20 00    	cmp    0x2037f2(%rip),%edi        # 6054fc <vlevel>
  401d0a:	74 1a                	je     401d26 <validate+0x96>
  401d0c:	48 8d 3d 9f 14 00 00 	lea    0x149f(%rip),%rdi        # 4031b2 <_IO_stdin_used+0x472>
  401d13:	e8 18 ef ff ff       	callq  400c30 <puts@plt>
  401d18:	89 de                	mov    %ebx,%esi
  401d1a:	bf 00 00 00 00       	mov    $0x0,%edi
  401d1f:	e8 a7 fd ff ff       	callq  401acb <notify_server>
  401d24:	eb a9                	jmp    401ccf <validate+0x3f>
  401d26:	0f be 15 fb 43 20 00 	movsbl 0x2043fb(%rip),%edx        # 606128 <target_prefix>
  401d2d:	89 fe                	mov    %edi,%esi
  401d2f:	48 8d 3d e2 15 00 00 	lea    0x15e2(%rip),%rdi        # 403318 <_IO_stdin_used+0x5d8>
  401d36:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3b:	e8 20 ef ff ff       	callq  400c60 <printf@plt>
  401d40:	89 de                	mov    %ebx,%esi
  401d42:	bf 01 00 00 00       	mov    $0x1,%edi
  401d47:	e8 7f fd ff ff       	callq  401acb <notify_server>
  401d4c:	eb 81                	jmp    401ccf <validate+0x3f>

0000000000401d4e <fail>:
  401d4e:	48 83 ec 08          	sub    $0x8,%rsp
  401d52:	83 3d af 37 20 00 00 	cmpl   $0x0,0x2037af(%rip)        # 605508 <is_checker>
  401d59:	75 11                	jne    401d6c <fail+0x1e>
  401d5b:	89 fe                	mov    %edi,%esi
  401d5d:	bf 00 00 00 00       	mov    $0x0,%edi
  401d62:	e8 64 fd ff ff       	callq  401acb <notify_server>
  401d67:	48 83 c4 08          	add    $0x8,%rsp
  401d6b:	c3                   	retq   
  401d6c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d71:	e8 d0 fc ff ff       	callq  401a46 <check_fail>

0000000000401d76 <bushandler>:
  401d76:	48 83 ec 08          	sub    $0x8,%rsp
  401d7a:	83 3d 87 37 20 00 00 	cmpl   $0x0,0x203787(%rip)        # 605508 <is_checker>
  401d81:	74 16                	je     401d99 <bushandler+0x23>
  401d83:	48 8d 3d 5b 14 00 00 	lea    0x145b(%rip),%rdi        # 4031e5 <_IO_stdin_used+0x4a5>
  401d8a:	e8 a1 ee ff ff       	callq  400c30 <puts@plt>
  401d8f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d94:	e8 ad fc ff ff       	callq  401a46 <check_fail>
  401d99:	48 8d 3d b0 15 00 00 	lea    0x15b0(%rip),%rdi        # 403350 <_IO_stdin_used+0x610>
  401da0:	e8 8b ee ff ff       	callq  400c30 <puts@plt>
  401da5:	48 8d 3d 43 14 00 00 	lea    0x1443(%rip),%rdi        # 4031ef <_IO_stdin_used+0x4af>
  401dac:	e8 7f ee ff ff       	callq  400c30 <puts@plt>
  401db1:	be 00 00 00 00       	mov    $0x0,%esi
  401db6:	bf 00 00 00 00       	mov    $0x0,%edi
  401dbb:	e8 0b fd ff ff       	callq  401acb <notify_server>
  401dc0:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc5:	e8 e6 ef ff ff       	callq  400db0 <exit@plt>

0000000000401dca <seghandler>:
  401dca:	48 83 ec 08          	sub    $0x8,%rsp
  401dce:	83 3d 33 37 20 00 00 	cmpl   $0x0,0x203733(%rip)        # 605508 <is_checker>
  401dd5:	74 16                	je     401ded <seghandler+0x23>
  401dd7:	48 8d 3d 27 14 00 00 	lea    0x1427(%rip),%rdi        # 403205 <_IO_stdin_used+0x4c5>
  401dde:	e8 4d ee ff ff       	callq  400c30 <puts@plt>
  401de3:	b8 00 00 00 00       	mov    $0x0,%eax
  401de8:	e8 59 fc ff ff       	callq  401a46 <check_fail>
  401ded:	48 8d 3d 7c 15 00 00 	lea    0x157c(%rip),%rdi        # 403370 <_IO_stdin_used+0x630>
  401df4:	e8 37 ee ff ff       	callq  400c30 <puts@plt>
  401df9:	48 8d 3d ef 13 00 00 	lea    0x13ef(%rip),%rdi        # 4031ef <_IO_stdin_used+0x4af>
  401e00:	e8 2b ee ff ff       	callq  400c30 <puts@plt>
  401e05:	be 00 00 00 00       	mov    $0x0,%esi
  401e0a:	bf 00 00 00 00       	mov    $0x0,%edi
  401e0f:	e8 b7 fc ff ff       	callq  401acb <notify_server>
  401e14:	bf 01 00 00 00       	mov    $0x1,%edi
  401e19:	e8 92 ef ff ff       	callq  400db0 <exit@plt>

0000000000401e1e <illegalhandler>:
  401e1e:	48 83 ec 08          	sub    $0x8,%rsp
  401e22:	83 3d df 36 20 00 00 	cmpl   $0x0,0x2036df(%rip)        # 605508 <is_checker>
  401e29:	74 16                	je     401e41 <illegalhandler+0x23>
  401e2b:	48 8d 3d e6 13 00 00 	lea    0x13e6(%rip),%rdi        # 403218 <_IO_stdin_used+0x4d8>
  401e32:	e8 f9 ed ff ff       	callq  400c30 <puts@plt>
  401e37:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3c:	e8 05 fc ff ff       	callq  401a46 <check_fail>
  401e41:	48 8d 3d 50 15 00 00 	lea    0x1550(%rip),%rdi        # 403398 <_IO_stdin_used+0x658>
  401e48:	e8 e3 ed ff ff       	callq  400c30 <puts@plt>
  401e4d:	48 8d 3d 9b 13 00 00 	lea    0x139b(%rip),%rdi        # 4031ef <_IO_stdin_used+0x4af>
  401e54:	e8 d7 ed ff ff       	callq  400c30 <puts@plt>
  401e59:	be 00 00 00 00       	mov    $0x0,%esi
  401e5e:	bf 00 00 00 00       	mov    $0x0,%edi
  401e63:	e8 63 fc ff ff       	callq  401acb <notify_server>
  401e68:	bf 01 00 00 00       	mov    $0x1,%edi
  401e6d:	e8 3e ef ff ff       	callq  400db0 <exit@plt>

0000000000401e72 <sigalrmhandler>:
  401e72:	48 83 ec 08          	sub    $0x8,%rsp
  401e76:	83 3d 8b 36 20 00 00 	cmpl   $0x0,0x20368b(%rip)        # 605508 <is_checker>
  401e7d:	74 16                	je     401e95 <sigalrmhandler+0x23>
  401e7f:	48 8d 3d a6 13 00 00 	lea    0x13a6(%rip),%rdi        # 40322c <_IO_stdin_used+0x4ec>
  401e86:	e8 a5 ed ff ff       	callq  400c30 <puts@plt>
  401e8b:	b8 00 00 00 00       	mov    $0x0,%eax
  401e90:	e8 b1 fb ff ff       	callq  401a46 <check_fail>
  401e95:	be 05 00 00 00       	mov    $0x5,%esi
  401e9a:	48 8d 3d 27 15 00 00 	lea    0x1527(%rip),%rdi        # 4033c8 <_IO_stdin_used+0x688>
  401ea1:	b8 00 00 00 00       	mov    $0x0,%eax
  401ea6:	e8 b5 ed ff ff       	callq  400c60 <printf@plt>
  401eab:	be 00 00 00 00       	mov    $0x0,%esi
  401eb0:	bf 00 00 00 00       	mov    $0x0,%edi
  401eb5:	e8 11 fc ff ff       	callq  401acb <notify_server>
  401eba:	bf 01 00 00 00       	mov    $0x1,%edi
  401ebf:	e8 ec ee ff ff       	callq  400db0 <exit@plt>

0000000000401ec4 <launch>:
  401ec4:	55                   	push   %rbp
  401ec5:	48 89 e5             	mov    %rsp,%rbp
  401ec8:	48 89 fa             	mov    %rdi,%rdx
  401ecb:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401ecf:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401ed3:	48 29 c4             	sub    %rax,%rsp
  401ed6:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401edb:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401edf:	be f4 00 00 00       	mov    $0xf4,%esi
  401ee4:	e8 87 ed ff ff       	callq  400c70 <memset@plt>
  401ee9:	48 8b 05 b0 35 20 00 	mov    0x2035b0(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  401ef0:	48 39 05 f9 35 20 00 	cmp    %rax,0x2035f9(%rip)        # 6054f0 <infile>
  401ef7:	74 2b                	je     401f24 <launch+0x60>
  401ef9:	c7 05 f9 35 20 00 00 	movl   $0x0,0x2035f9(%rip)        # 6054fc <vlevel>
  401f00:	00 00 00 
  401f03:	b8 00 00 00 00       	mov    $0x0,%eax
  401f08:	e8 7e f9 ff ff       	callq  40188b <test>
  401f0d:	83 3d f4 35 20 00 00 	cmpl   $0x0,0x2035f4(%rip)        # 605508 <is_checker>
  401f14:	75 21                	jne    401f37 <launch+0x73>
  401f16:	48 8d 3d 2f 13 00 00 	lea    0x132f(%rip),%rdi        # 40324c <_IO_stdin_used+0x50c>
  401f1d:	e8 0e ed ff ff       	callq  400c30 <puts@plt>
  401f22:	c9                   	leaveq 
  401f23:	c3                   	retq   
  401f24:	48 8d 3d 09 13 00 00 	lea    0x1309(%rip),%rdi        # 403234 <_IO_stdin_used+0x4f4>
  401f2b:	b8 00 00 00 00       	mov    $0x0,%eax
  401f30:	e8 2b ed ff ff       	callq  400c60 <printf@plt>
  401f35:	eb c2                	jmp    401ef9 <launch+0x35>
  401f37:	48 8d 3d 03 13 00 00 	lea    0x1303(%rip),%rdi        # 403241 <_IO_stdin_used+0x501>
  401f3e:	e8 ed ec ff ff       	callq  400c30 <puts@plt>
  401f43:	b8 00 00 00 00       	mov    $0x0,%eax
  401f48:	e8 f9 fa ff ff       	callq  401a46 <check_fail>

0000000000401f4d <stable_launch>:
  401f4d:	53                   	push   %rbx
  401f4e:	48 89 3d 93 35 20 00 	mov    %rdi,0x203593(%rip)        # 6054e8 <global_offset>
  401f55:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f5b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f61:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f66:	ba 07 00 00 00       	mov    $0x7,%edx
  401f6b:	be 00 00 10 00       	mov    $0x100000,%esi
  401f70:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f75:	e8 d6 ec ff ff       	callq  400c50 <mmap@plt>
  401f7a:	48 89 c3             	mov    %rax,%rbx
  401f7d:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f83:	75 43                	jne    401fc8 <stable_launch+0x7b>
  401f85:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f8c:	48 89 15 9d 41 20 00 	mov    %rdx,0x20419d(%rip)        # 606130 <stack_top>
  401f93:	48 89 e0             	mov    %rsp,%rax
  401f96:	48 89 d4             	mov    %rdx,%rsp
  401f99:	48 89 c2             	mov    %rax,%rdx
  401f9c:	48 89 15 3d 35 20 00 	mov    %rdx,0x20353d(%rip)        # 6054e0 <global_save_stack>
  401fa3:	48 8b 3d 3e 35 20 00 	mov    0x20353e(%rip),%rdi        # 6054e8 <global_offset>
  401faa:	e8 15 ff ff ff       	callq  401ec4 <launch>
  401faf:	48 8b 05 2a 35 20 00 	mov    0x20352a(%rip),%rax        # 6054e0 <global_save_stack>
  401fb6:	48 89 c4             	mov    %rax,%rsp
  401fb9:	be 00 00 10 00       	mov    $0x100000,%esi
  401fbe:	48 89 df             	mov    %rbx,%rdi
  401fc1:	e8 7a ed ff ff       	callq  400d40 <munmap@plt>
  401fc6:	5b                   	pop    %rbx
  401fc7:	c3                   	retq   
  401fc8:	be 00 00 10 00       	mov    $0x100000,%esi
  401fcd:	48 89 c7             	mov    %rax,%rdi
  401fd0:	e8 6b ed ff ff       	callq  400d40 <munmap@plt>
  401fd5:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401fda:	48 8d 35 1f 14 00 00 	lea    0x141f(%rip),%rsi        # 403400 <_IO_stdin_used+0x6c0>
  401fe1:	48 8b 3d d8 34 20 00 	mov    0x2034d8(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401fe8:	b8 00 00 00 00       	mov    $0x0,%eax
  401fed:	e8 de ec ff ff       	callq  400cd0 <fprintf@plt>
  401ff2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ff7:	e8 b4 ed ff ff       	callq  400db0 <exit@plt>

0000000000401ffc <rio_readinitb>:
  401ffc:	89 37                	mov    %esi,(%rdi)
  401ffe:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402005:	48 8d 47 10          	lea    0x10(%rdi),%rax
  402009:	48 89 47 08          	mov    %rax,0x8(%rdi)
  40200d:	c3                   	retq   

000000000040200e <sigalrm_handler>:
  40200e:	48 83 ec 08          	sub    $0x8,%rsp
  402012:	ba 00 00 00 00       	mov    $0x0,%edx
  402017:	48 8d 35 22 14 00 00 	lea    0x1422(%rip),%rsi        # 403440 <trans_char+0x10>
  40201e:	48 8b 3d 9b 34 20 00 	mov    0x20349b(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  402025:	b8 00 00 00 00       	mov    $0x0,%eax
  40202a:	e8 a1 ec ff ff       	callq  400cd0 <fprintf@plt>
  40202f:	bf 01 00 00 00       	mov    $0x1,%edi
  402034:	e8 77 ed ff ff       	callq  400db0 <exit@plt>

0000000000402039 <urlencode>:
  402039:	41 54                	push   %r12
  40203b:	55                   	push   %rbp
  40203c:	53                   	push   %rbx
  40203d:	48 83 ec 10          	sub    $0x10,%rsp
  402041:	48 89 fb             	mov    %rdi,%rbx
  402044:	48 89 f5             	mov    %rsi,%rbp
  402047:	b8 00 00 00 00       	mov    $0x0,%eax
  40204c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402053:	f2 ae                	repnz scas %es:(%rdi),%al
  402055:	48 f7 d1             	not    %rcx
  402058:	8d 41 ff             	lea    -0x1(%rcx),%eax
  40205b:	eb 0e                	jmp    40206b <urlencode+0x32>
  40205d:	88 55 00             	mov    %dl,0x0(%rbp)
  402060:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402064:	48 83 c3 01          	add    $0x1,%rbx
  402068:	44 89 e0             	mov    %r12d,%eax
  40206b:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40206f:	85 c0                	test   %eax,%eax
  402071:	0f 84 95 00 00 00    	je     40210c <urlencode+0xd3>
  402077:	0f b6 13             	movzbl (%rbx),%edx
  40207a:	80 fa 2a             	cmp    $0x2a,%dl
  40207d:	0f 94 c1             	sete   %cl
  402080:	80 fa 2d             	cmp    $0x2d,%dl
  402083:	0f 94 c0             	sete   %al
  402086:	08 c1                	or     %al,%cl
  402088:	75 d3                	jne    40205d <urlencode+0x24>
  40208a:	80 fa 2e             	cmp    $0x2e,%dl
  40208d:	74 ce                	je     40205d <urlencode+0x24>
  40208f:	80 fa 5f             	cmp    $0x5f,%dl
  402092:	74 c9                	je     40205d <urlencode+0x24>
  402094:	8d 42 d0             	lea    -0x30(%rdx),%eax
  402097:	3c 09                	cmp    $0x9,%al
  402099:	76 c2                	jbe    40205d <urlencode+0x24>
  40209b:	8d 42 bf             	lea    -0x41(%rdx),%eax
  40209e:	3c 19                	cmp    $0x19,%al
  4020a0:	76 bb                	jbe    40205d <urlencode+0x24>
  4020a2:	8d 42 9f             	lea    -0x61(%rdx),%eax
  4020a5:	3c 19                	cmp    $0x19,%al
  4020a7:	76 b4                	jbe    40205d <urlencode+0x24>
  4020a9:	80 fa 20             	cmp    $0x20,%dl
  4020ac:	74 4c                	je     4020fa <urlencode+0xc1>
  4020ae:	8d 42 e0             	lea    -0x20(%rdx),%eax
  4020b1:	3c 5f                	cmp    $0x5f,%al
  4020b3:	0f 96 c1             	setbe  %cl
  4020b6:	80 fa 09             	cmp    $0x9,%dl
  4020b9:	0f 94 c0             	sete   %al
  4020bc:	08 c1                	or     %al,%cl
  4020be:	74 47                	je     402107 <urlencode+0xce>
  4020c0:	0f b6 d2             	movzbl %dl,%edx
  4020c3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4020c8:	48 8d 35 09 14 00 00 	lea    0x1409(%rip),%rsi        # 4034d8 <trans_char+0xa8>
  4020cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d4:	e8 c7 ec ff ff       	callq  400da0 <sprintf@plt>
  4020d9:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  4020de:	88 45 00             	mov    %al,0x0(%rbp)
  4020e1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  4020e6:	88 45 01             	mov    %al,0x1(%rbp)
  4020e9:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  4020ee:	88 45 02             	mov    %al,0x2(%rbp)
  4020f1:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4020f5:	e9 6a ff ff ff       	jmpq   402064 <urlencode+0x2b>
  4020fa:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4020fe:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402102:	e9 5d ff ff ff       	jmpq   402064 <urlencode+0x2b>
  402107:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40210c:	48 83 c4 10          	add    $0x10,%rsp
  402110:	5b                   	pop    %rbx
  402111:	5d                   	pop    %rbp
  402112:	41 5c                	pop    %r12
  402114:	c3                   	retq   

0000000000402115 <rio_writen>:
  402115:	41 55                	push   %r13
  402117:	41 54                	push   %r12
  402119:	55                   	push   %rbp
  40211a:	53                   	push   %rbx
  40211b:	48 83 ec 08          	sub    $0x8,%rsp
  40211f:	41 89 fc             	mov    %edi,%r12d
  402122:	49 89 d5             	mov    %rdx,%r13
  402125:	48 89 f5             	mov    %rsi,%rbp
  402128:	48 89 d3             	mov    %rdx,%rbx
  40212b:	eb 06                	jmp    402133 <rio_writen+0x1e>
  40212d:	48 29 c3             	sub    %rax,%rbx
  402130:	48 01 c5             	add    %rax,%rbp
  402133:	48 85 db             	test   %rbx,%rbx
  402136:	74 24                	je     40215c <rio_writen+0x47>
  402138:	48 89 da             	mov    %rbx,%rdx
  40213b:	48 89 ee             	mov    %rbp,%rsi
  40213e:	44 89 e7             	mov    %r12d,%edi
  402141:	e8 fa ea ff ff       	callq  400c40 <write@plt>
  402146:	48 85 c0             	test   %rax,%rax
  402149:	7f e2                	jg     40212d <rio_writen+0x18>
  40214b:	e8 a0 ea ff ff       	callq  400bf0 <__errno_location@plt>
  402150:	83 38 04             	cmpl   $0x4,(%rax)
  402153:	75 15                	jne    40216a <rio_writen+0x55>
  402155:	b8 00 00 00 00       	mov    $0x0,%eax
  40215a:	eb d1                	jmp    40212d <rio_writen+0x18>
  40215c:	4c 89 e8             	mov    %r13,%rax
  40215f:	48 83 c4 08          	add    $0x8,%rsp
  402163:	5b                   	pop    %rbx
  402164:	5d                   	pop    %rbp
  402165:	41 5c                	pop    %r12
  402167:	41 5d                	pop    %r13
  402169:	c3                   	retq   
  40216a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402171:	eb ec                	jmp    40215f <rio_writen+0x4a>

0000000000402173 <rio_read>:
  402173:	41 55                	push   %r13
  402175:	41 54                	push   %r12
  402177:	55                   	push   %rbp
  402178:	53                   	push   %rbx
  402179:	48 83 ec 08          	sub    $0x8,%rsp
  40217d:	48 89 fb             	mov    %rdi,%rbx
  402180:	49 89 f5             	mov    %rsi,%r13
  402183:	49 89 d4             	mov    %rdx,%r12
  402186:	eb 0a                	jmp    402192 <rio_read+0x1f>
  402188:	e8 63 ea ff ff       	callq  400bf0 <__errno_location@plt>
  40218d:	83 38 04             	cmpl   $0x4,(%rax)
  402190:	75 5c                	jne    4021ee <rio_read+0x7b>
  402192:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402195:	85 ed                	test   %ebp,%ebp
  402197:	7f 24                	jg     4021bd <rio_read+0x4a>
  402199:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40219d:	ba 00 20 00 00       	mov    $0x2000,%edx
  4021a2:	48 89 ee             	mov    %rbp,%rsi
  4021a5:	8b 3b                	mov    (%rbx),%edi
  4021a7:	e8 f4 ea ff ff       	callq  400ca0 <read@plt>
  4021ac:	89 43 04             	mov    %eax,0x4(%rbx)
  4021af:	85 c0                	test   %eax,%eax
  4021b1:	78 d5                	js     402188 <rio_read+0x15>
  4021b3:	85 c0                	test   %eax,%eax
  4021b5:	74 40                	je     4021f7 <rio_read+0x84>
  4021b7:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4021bb:	eb d5                	jmp    402192 <rio_read+0x1f>
  4021bd:	89 e8                	mov    %ebp,%eax
  4021bf:	49 39 c4             	cmp    %rax,%r12
  4021c2:	77 03                	ja     4021c7 <rio_read+0x54>
  4021c4:	44 89 e5             	mov    %r12d,%ebp
  4021c7:	4c 63 e5             	movslq %ebp,%r12
  4021ca:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4021ce:	4c 89 e2             	mov    %r12,%rdx
  4021d1:	4c 89 ef             	mov    %r13,%rdi
  4021d4:	e8 17 eb ff ff       	callq  400cf0 <memcpy@plt>
  4021d9:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4021dd:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4021e0:	4c 89 e0             	mov    %r12,%rax
  4021e3:	48 83 c4 08          	add    $0x8,%rsp
  4021e7:	5b                   	pop    %rbx
  4021e8:	5d                   	pop    %rbp
  4021e9:	41 5c                	pop    %r12
  4021eb:	41 5d                	pop    %r13
  4021ed:	c3                   	retq   
  4021ee:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021f5:	eb ec                	jmp    4021e3 <rio_read+0x70>
  4021f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4021fc:	eb e5                	jmp    4021e3 <rio_read+0x70>

00000000004021fe <rio_readlineb>:
  4021fe:	41 55                	push   %r13
  402200:	41 54                	push   %r12
  402202:	55                   	push   %rbp
  402203:	53                   	push   %rbx
  402204:	48 83 ec 18          	sub    $0x18,%rsp
  402208:	49 89 fd             	mov    %rdi,%r13
  40220b:	49 89 d4             	mov    %rdx,%r12
  40220e:	48 89 f5             	mov    %rsi,%rbp
  402211:	bb 01 00 00 00       	mov    $0x1,%ebx
  402216:	4c 39 e3             	cmp    %r12,%rbx
  402219:	73 47                	jae    402262 <rio_readlineb+0x64>
  40221b:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402220:	ba 01 00 00 00       	mov    $0x1,%edx
  402225:	4c 89 ef             	mov    %r13,%rdi
  402228:	e8 46 ff ff ff       	callq  402173 <rio_read>
  40222d:	83 f8 01             	cmp    $0x1,%eax
  402230:	75 1c                	jne    40224e <rio_readlineb+0x50>
  402232:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402236:	0f b6 54 24 0f       	movzbl 0xf(%rsp),%edx
  40223b:	88 55 00             	mov    %dl,0x0(%rbp)
  40223e:	80 7c 24 0f 0a       	cmpb   $0xa,0xf(%rsp)
  402243:	74 1a                	je     40225f <rio_readlineb+0x61>
  402245:	48 83 c3 01          	add    $0x1,%rbx
  402249:	48 89 c5             	mov    %rax,%rbp
  40224c:	eb c8                	jmp    402216 <rio_readlineb+0x18>
  40224e:	85 c0                	test   %eax,%eax
  402250:	75 22                	jne    402274 <rio_readlineb+0x76>
  402252:	48 83 fb 01          	cmp    $0x1,%rbx
  402256:	75 0a                	jne    402262 <rio_readlineb+0x64>
  402258:	b8 00 00 00 00       	mov    $0x0,%eax
  40225d:	eb 0a                	jmp    402269 <rio_readlineb+0x6b>
  40225f:	48 89 c5             	mov    %rax,%rbp
  402262:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402266:	48 89 d8             	mov    %rbx,%rax
  402269:	48 83 c4 18          	add    $0x18,%rsp
  40226d:	5b                   	pop    %rbx
  40226e:	5d                   	pop    %rbp
  40226f:	41 5c                	pop    %r12
  402271:	41 5d                	pop    %r13
  402273:	c3                   	retq   
  402274:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40227b:	eb ec                	jmp    402269 <rio_readlineb+0x6b>

000000000040227d <submitr>:
  40227d:	41 57                	push   %r15
  40227f:	41 56                	push   %r14
  402281:	41 55                	push   %r13
  402283:	41 54                	push   %r12
  402285:	55                   	push   %rbp
  402286:	53                   	push   %rbx
  402287:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  40228e:	49 89 fd             	mov    %rdi,%r13
  402291:	89 74 24 14          	mov    %esi,0x14(%rsp)
  402295:	49 89 d7             	mov    %rdx,%r15
  402298:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  40229d:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  4022a2:	4d 89 ce             	mov    %r9,%r14
  4022a5:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4022ac:	00 
  4022ad:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  4022b4:	00 00 00 00 
  4022b8:	ba 00 00 00 00       	mov    $0x0,%edx
  4022bd:	be 01 00 00 00       	mov    $0x1,%esi
  4022c2:	bf 02 00 00 00       	mov    $0x2,%edi
  4022c7:	e8 04 eb ff ff       	callq  400dd0 <socket@plt>
  4022cc:	85 c0                	test   %eax,%eax
  4022ce:	0f 88 ca 01 00 00    	js     40249e <submitr+0x221>
  4022d4:	89 c5                	mov    %eax,%ebp
  4022d6:	4c 89 ef             	mov    %r13,%rdi
  4022d9:	e8 e2 e9 ff ff       	callq  400cc0 <gethostbyname@plt>
  4022de:	48 85 c0             	test   %rax,%rax
  4022e1:	0f 84 05 02 00 00    	je     4024ec <submitr+0x26f>
  4022e7:	4c 8d a4 24 40 a0 00 	lea    0xa040(%rsp),%r12
  4022ee:	00 
  4022ef:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  4022f6:	00 00 00 00 00 
  4022fb:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  402302:	00 00 00 00 00 
  402307:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  40230e:	00 02 00 
  402311:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402315:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402319:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  402320:	00 
  402321:	48 8b 39             	mov    (%rcx),%rdi
  402324:	e8 27 ea ff ff       	callq  400d50 <bcopy@plt>
  402329:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  40232e:	66 c1 c8 08          	ror    $0x8,%ax
  402332:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  402339:	00 
  40233a:	ba 10 00 00 00       	mov    $0x10,%edx
  40233f:	4c 89 e6             	mov    %r12,%rsi
  402342:	89 ef                	mov    %ebp,%edi
  402344:	e8 77 ea ff ff       	callq  400dc0 <connect@plt>
  402349:	85 c0                	test   %eax,%eax
  40234b:	0f 88 02 02 00 00    	js     402553 <submitr+0x2d6>
  402351:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402358:	b8 00 00 00 00       	mov    $0x0,%eax
  40235d:	48 89 f1             	mov    %rsi,%rcx
  402360:	4c 89 f7             	mov    %r14,%rdi
  402363:	f2 ae                	repnz scas %es:(%rdi),%al
  402365:	48 f7 d1             	not    %rcx
  402368:	48 89 ca             	mov    %rcx,%rdx
  40236b:	48 89 f1             	mov    %rsi,%rcx
  40236e:	4c 89 ff             	mov    %r15,%rdi
  402371:	f2 ae                	repnz scas %es:(%rdi),%al
  402373:	48 f7 d1             	not    %rcx
  402376:	49 89 c8             	mov    %rcx,%r8
  402379:	48 89 f1             	mov    %rsi,%rcx
  40237c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402381:	f2 ae                	repnz scas %es:(%rdi),%al
  402383:	48 f7 d1             	not    %rcx
  402386:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  40238b:	48 89 f1             	mov    %rsi,%rcx
  40238e:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402393:	f2 ae                	repnz scas %es:(%rdi),%al
  402395:	48 89 c8             	mov    %rcx,%rax
  402398:	48 f7 d0             	not    %rax
  40239b:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4023a0:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4023a5:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4023ac:	00 
  4023ad:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4023b3:	0f 87 f3 01 00 00    	ja     4025ac <submitr+0x32f>
  4023b9:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  4023c0:	00 
  4023c1:	b9 00 04 00 00       	mov    $0x400,%ecx
  4023c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4023cb:	48 89 f7             	mov    %rsi,%rdi
  4023ce:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4023d1:	4c 89 f7             	mov    %r14,%rdi
  4023d4:	e8 60 fc ff ff       	callq  402039 <urlencode>
  4023d9:	85 c0                	test   %eax,%eax
  4023db:	0f 88 3d 02 00 00    	js     40261e <submitr+0x3a1>
  4023e1:	4c 8d a4 24 30 60 00 	lea    0x6030(%rsp),%r12
  4023e8:	00 
  4023e9:	4d 89 e9             	mov    %r13,%r9
  4023ec:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  4023f3:	00 
  4023f4:	4c 89 f9             	mov    %r15,%rcx
  4023f7:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  4023fc:	48 8d 35 65 10 00 00 	lea    0x1065(%rip),%rsi        # 403468 <trans_char+0x38>
  402403:	4c 89 e7             	mov    %r12,%rdi
  402406:	b8 00 00 00 00       	mov    $0x0,%eax
  40240b:	e8 90 e9 ff ff       	callq  400da0 <sprintf@plt>
  402410:	b8 00 00 00 00       	mov    $0x0,%eax
  402415:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40241c:	4c 89 e7             	mov    %r12,%rdi
  40241f:	f2 ae                	repnz scas %es:(%rdi),%al
  402421:	48 f7 d1             	not    %rcx
  402424:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402428:	4c 89 e6             	mov    %r12,%rsi
  40242b:	89 ef                	mov    %ebp,%edi
  40242d:	e8 e3 fc ff ff       	callq  402115 <rio_writen>
  402432:	48 85 c0             	test   %rax,%rax
  402435:	0f 88 6d 02 00 00    	js     4026a8 <submitr+0x42b>
  40243b:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  402442:	00 
  402443:	89 ee                	mov    %ebp,%esi
  402445:	4c 89 e7             	mov    %r12,%rdi
  402448:	e8 af fb ff ff       	callq  401ffc <rio_readinitb>
  40244d:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402454:	00 
  402455:	ba 00 20 00 00       	mov    $0x2000,%edx
  40245a:	4c 89 e7             	mov    %r12,%rdi
  40245d:	e8 9c fd ff ff       	callq  4021fe <rio_readlineb>
  402462:	48 85 c0             	test   %rax,%rax
  402465:	0f 8e ab 02 00 00    	jle    402716 <submitr+0x499>
  40246b:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402472:	00 
  402473:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  40247a:	00 
  40247b:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402482:	00 
  402483:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  402488:	48 8d 35 50 10 00 00 	lea    0x1050(%rip),%rsi        # 4034df <trans_char+0xaf>
  40248f:	b8 00 00 00 00       	mov    $0x0,%eax
  402494:	e8 97 e8 ff ff       	callq  400d30 <__isoc99_sscanf@plt>
  402499:	e9 9f 03 00 00       	jmpq   40283d <submitr+0x5c0>
  40249e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4024a5:	3a 20 43 
  4024a8:	48 89 03             	mov    %rax,(%rbx)
  4024ab:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4024b2:	20 75 6e 
  4024b5:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024b9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024c0:	74 6f 20 
  4024c3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024c7:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4024ce:	65 20 73 
  4024d1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024d5:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  4024dc:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  4024e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024e7:	e9 18 03 00 00       	jmpq   402804 <submitr+0x587>
  4024ec:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4024f3:	3a 20 44 
  4024f6:	48 89 03             	mov    %rax,(%rbx)
  4024f9:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402500:	20 75 6e 
  402503:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402507:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40250e:	74 6f 20 
  402511:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402515:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40251c:	76 65 20 
  40251f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402523:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  40252a:	72 20 61 
  40252d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402531:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  402538:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  40253e:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  402542:	89 ef                	mov    %ebp,%edi
  402544:	e8 47 e7 ff ff       	callq  400c90 <close@plt>
  402549:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40254e:	e9 b1 02 00 00       	jmpq   402804 <submitr+0x587>
  402553:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40255a:	3a 20 55 
  40255d:	48 89 03             	mov    %rax,(%rbx)
  402560:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402567:	20 74 6f 
  40256a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40256e:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402575:	65 63 74 
  402578:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40257c:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402583:	68 65 20 
  402586:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40258a:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  402591:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402597:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  40259b:	89 ef                	mov    %ebp,%edi
  40259d:	e8 ee e6 ff ff       	callq  400c90 <close@plt>
  4025a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025a7:	e9 58 02 00 00       	jmpq   402804 <submitr+0x587>
  4025ac:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4025b3:	3a 20 52 
  4025b6:	48 89 03             	mov    %rax,(%rbx)
  4025b9:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4025c0:	20 73 74 
  4025c3:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025c7:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4025ce:	74 6f 6f 
  4025d1:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025d5:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4025dc:	65 2e 20 
  4025df:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025e3:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  4025ea:	61 73 65 
  4025ed:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025f1:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  4025f8:	49 54 52 
  4025fb:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025ff:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402606:	55 46 00 
  402609:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40260d:	89 ef                	mov    %ebp,%edi
  40260f:	e8 7c e6 ff ff       	callq  400c90 <close@plt>
  402614:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402619:	e9 e6 01 00 00       	jmpq   402804 <submitr+0x587>
  40261e:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402625:	3a 20 52 
  402628:	48 89 03             	mov    %rax,(%rbx)
  40262b:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402632:	20 73 74 
  402635:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402639:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402640:	63 6f 6e 
  402643:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402647:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  40264e:	20 61 6e 
  402651:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402655:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40265c:	67 61 6c 
  40265f:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402663:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  40266a:	6e 70 72 
  40266d:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402671:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402678:	6c 65 20 
  40267b:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40267f:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402686:	63 74 65 
  402689:	48 89 43 38          	mov    %rax,0x38(%rbx)
  40268d:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402693:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402697:	89 ef                	mov    %ebp,%edi
  402699:	e8 f2 e5 ff ff       	callq  400c90 <close@plt>
  40269e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026a3:	e9 5c 01 00 00       	jmpq   402804 <submitr+0x587>
  4026a8:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026af:	3a 20 43 
  4026b2:	48 89 03             	mov    %rax,(%rbx)
  4026b5:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4026bc:	20 75 6e 
  4026bf:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026c3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4026ca:	74 6f 20 
  4026cd:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026d1:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4026d8:	20 74 6f 
  4026db:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026df:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4026e6:	72 65 73 
  4026e9:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026ed:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4026f4:	65 72 76 
  4026f7:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026fb:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402701:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  402705:	89 ef                	mov    %ebp,%edi
  402707:	e8 84 e5 ff ff       	callq  400c90 <close@plt>
  40270c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402711:	e9 ee 00 00 00       	jmpq   402804 <submitr+0x587>
  402716:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40271d:	3a 20 43 
  402720:	48 89 03             	mov    %rax,(%rbx)
  402723:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40272a:	20 75 6e 
  40272d:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402731:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402738:	74 6f 20 
  40273b:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40273f:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402746:	66 69 72 
  402749:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40274d:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402754:	61 64 65 
  402757:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40275b:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402762:	6d 20 72 
  402765:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402769:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402770:	20 73 65 
  402773:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402777:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40277e:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402782:	89 ef                	mov    %ebp,%edi
  402784:	e8 07 e5 ff ff       	callq  400c90 <close@plt>
  402789:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40278e:	eb 74                	jmp    402804 <submitr+0x587>
  402790:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402797:	3a 20 43 
  40279a:	48 89 03             	mov    %rax,(%rbx)
  40279d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027a4:	20 75 6e 
  4027a7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027ab:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027b2:	74 6f 20 
  4027b5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027b9:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4027c0:	68 65 61 
  4027c3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027c7:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4027ce:	66 72 6f 
  4027d1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027d5:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  4027dc:	20 72 65 
  4027df:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027e3:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4027ea:	73 65 72 
  4027ed:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027f1:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  4027f8:	89 ef                	mov    %ebp,%edi
  4027fa:	e8 91 e4 ff ff       	callq  400c90 <close@plt>
  4027ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402804:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  40280b:	5b                   	pop    %rbx
  40280c:	5d                   	pop    %rbp
  40280d:	41 5c                	pop    %r12
  40280f:	41 5d                	pop    %r13
  402811:	41 5e                	pop    %r14
  402813:	41 5f                	pop    %r15
  402815:	c3                   	retq   
  402816:	85 c0                	test   %eax,%eax
  402818:	74 51                	je     40286b <submitr+0x5ee>
  40281a:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402821:	00 
  402822:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402829:	00 
  40282a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40282f:	e8 ca f9 ff ff       	callq  4021fe <rio_readlineb>
  402834:	48 85 c0             	test   %rax,%rax
  402837:	0f 8e 53 ff ff ff    	jle    402790 <submitr+0x513>
  40283d:	0f b6 94 24 30 60 00 	movzbl 0x6030(%rsp),%edx
  402844:	00 
  402845:	b8 0d 00 00 00       	mov    $0xd,%eax
  40284a:	29 d0                	sub    %edx,%eax
  40284c:	75 c8                	jne    402816 <submitr+0x599>
  40284e:	0f b6 94 24 31 60 00 	movzbl 0x6031(%rsp),%edx
  402855:	00 
  402856:	b8 0a 00 00 00       	mov    $0xa,%eax
  40285b:	29 d0                	sub    %edx,%eax
  40285d:	75 b7                	jne    402816 <submitr+0x599>
  40285f:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  402866:	00 
  402867:	f7 d8                	neg    %eax
  402869:	eb ab                	jmp    402816 <submitr+0x599>
  40286b:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402872:	00 
  402873:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  40287a:	00 
  40287b:	ba 00 20 00 00       	mov    $0x2000,%edx
  402880:	e8 79 f9 ff ff       	callq  4021fe <rio_readlineb>
  402885:	48 85 c0             	test   %rax,%rax
  402888:	7e 67                	jle    4028f1 <submitr+0x674>
  40288a:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402891:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402897:	0f 85 d7 00 00 00    	jne    402974 <submitr+0x6f7>
  40289d:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4028a4:	00 
  4028a5:	48 89 df             	mov    %rbx,%rdi
  4028a8:	e8 73 e3 ff ff       	callq  400c20 <strcpy@plt>
  4028ad:	89 ef                	mov    %ebp,%edi
  4028af:	e8 dc e3 ff ff       	callq  400c90 <close@plt>
  4028b4:	0f b6 03             	movzbl (%rbx),%eax
  4028b7:	ba 4f 00 00 00       	mov    $0x4f,%edx
  4028bc:	29 c2                	sub    %eax,%edx
  4028be:	0f 85 da 00 00 00    	jne    40299e <submitr+0x721>
  4028c4:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  4028c8:	b8 4b 00 00 00       	mov    $0x4b,%eax
  4028cd:	29 c8                	sub    %ecx,%eax
  4028cf:	0f 85 cb 00 00 00    	jne    4029a0 <submitr+0x723>
  4028d5:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  4028d9:	b8 0a 00 00 00       	mov    $0xa,%eax
  4028de:	29 c8                	sub    %ecx,%eax
  4028e0:	0f 85 ba 00 00 00    	jne    4029a0 <submitr+0x723>
  4028e6:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  4028ea:	f7 d8                	neg    %eax
  4028ec:	e9 af 00 00 00       	jmpq   4029a0 <submitr+0x723>
  4028f1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028f8:	3a 20 43 
  4028fb:	48 89 03             	mov    %rax,(%rbx)
  4028fe:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402905:	20 75 6e 
  402908:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40290c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402913:	74 6f 20 
  402916:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40291a:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402921:	73 74 61 
  402924:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402928:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  40292f:	65 73 73 
  402932:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402936:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  40293d:	72 6f 6d 
  402940:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402944:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  40294b:	6c 74 20 
  40294e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402952:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402959:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  40295f:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402963:	89 ef                	mov    %ebp,%edi
  402965:	e8 26 e3 ff ff       	callq  400c90 <close@plt>
  40296a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40296f:	e9 90 fe ff ff       	jmpq   402804 <submitr+0x587>
  402974:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402979:	48 8d 35 28 0b 00 00 	lea    0xb28(%rip),%rsi        # 4034a8 <trans_char+0x78>
  402980:	48 89 df             	mov    %rbx,%rdi
  402983:	b8 00 00 00 00       	mov    $0x0,%eax
  402988:	e8 13 e4 ff ff       	callq  400da0 <sprintf@plt>
  40298d:	89 ef                	mov    %ebp,%edi
  40298f:	e8 fc e2 ff ff       	callq  400c90 <close@plt>
  402994:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402999:	e9 66 fe ff ff       	jmpq   402804 <submitr+0x587>
  40299e:	89 d0                	mov    %edx,%eax
  4029a0:	f7 d8                	neg    %eax
  4029a2:	0f 84 5c fe ff ff    	je     402804 <submitr+0x587>
  4029a8:	b9 05 00 00 00       	mov    $0x5,%ecx
  4029ad:	48 8d 3d 3c 0b 00 00 	lea    0xb3c(%rip),%rdi        # 4034f0 <trans_char+0xc0>
  4029b4:	48 89 de             	mov    %rbx,%rsi
  4029b7:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4029b9:	0f 97 c0             	seta   %al
  4029bc:	0f 92 c1             	setb   %cl
  4029bf:	29 c8                	sub    %ecx,%eax
  4029c1:	0f be c0             	movsbl %al,%eax
  4029c4:	85 c0                	test   %eax,%eax
  4029c6:	0f 84 38 fe ff ff    	je     402804 <submitr+0x587>
  4029cc:	85 d2                	test   %edx,%edx
  4029ce:	75 13                	jne    4029e3 <submitr+0x766>
  4029d0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  4029d4:	ba 4b 00 00 00       	mov    $0x4b,%edx
  4029d9:	29 c2                	sub    %eax,%edx
  4029db:	75 06                	jne    4029e3 <submitr+0x766>
  4029dd:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  4029e1:	f7 da                	neg    %edx
  4029e3:	89 d0                	mov    %edx,%eax
  4029e5:	f7 d8                	neg    %eax
  4029e7:	0f 84 17 fe ff ff    	je     402804 <submitr+0x587>
  4029ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029f2:	e9 0d fe ff ff       	jmpq   402804 <submitr+0x587>

00000000004029f7 <init_timeout>:
  4029f7:	85 ff                	test   %edi,%edi
  4029f9:	74 20                	je     402a1b <init_timeout+0x24>
  4029fb:	53                   	push   %rbx
  4029fc:	89 fb                	mov    %edi,%ebx
  4029fe:	85 ff                	test   %edi,%edi
  402a00:	78 1b                	js     402a1d <init_timeout+0x26>
  402a02:	48 8d 35 05 f6 ff ff 	lea    -0x9fb(%rip),%rsi        # 40200e <sigalrm_handler>
  402a09:	bf 0e 00 00 00       	mov    $0xe,%edi
  402a0e:	e8 9d e2 ff ff       	callq  400cb0 <signal@plt>
  402a13:	89 df                	mov    %ebx,%edi
  402a15:	e8 66 e2 ff ff       	callq  400c80 <alarm@plt>
  402a1a:	5b                   	pop    %rbx
  402a1b:	f3 c3                	repz retq 
  402a1d:	bb 00 00 00 00       	mov    $0x0,%ebx
  402a22:	eb de                	jmp    402a02 <init_timeout+0xb>

0000000000402a24 <init_driver>:
  402a24:	41 54                	push   %r12
  402a26:	55                   	push   %rbp
  402a27:	53                   	push   %rbx
  402a28:	48 83 ec 10          	sub    $0x10,%rsp
  402a2c:	48 89 fd             	mov    %rdi,%rbp
  402a2f:	be 01 00 00 00       	mov    $0x1,%esi
  402a34:	bf 0d 00 00 00       	mov    $0xd,%edi
  402a39:	e8 72 e2 ff ff       	callq  400cb0 <signal@plt>
  402a3e:	be 01 00 00 00       	mov    $0x1,%esi
  402a43:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a48:	e8 63 e2 ff ff       	callq  400cb0 <signal@plt>
  402a4d:	be 01 00 00 00       	mov    $0x1,%esi
  402a52:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a57:	e8 54 e2 ff ff       	callq  400cb0 <signal@plt>
  402a5c:	ba 00 00 00 00       	mov    $0x0,%edx
  402a61:	be 01 00 00 00       	mov    $0x1,%esi
  402a66:	bf 02 00 00 00       	mov    $0x2,%edi
  402a6b:	e8 60 e3 ff ff       	callq  400dd0 <socket@plt>
  402a70:	85 c0                	test   %eax,%eax
  402a72:	0f 88 80 00 00 00    	js     402af8 <init_driver+0xd4>
  402a78:	89 c3                	mov    %eax,%ebx
  402a7a:	48 8d 3d 74 0a 00 00 	lea    0xa74(%rip),%rdi        # 4034f5 <trans_char+0xc5>
  402a81:	e8 3a e2 ff ff       	callq  400cc0 <gethostbyname@plt>
  402a86:	48 85 c0             	test   %rax,%rax
  402a89:	0f 84 b5 00 00 00    	je     402b44 <init_driver+0x120>
  402a8f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402a96:	00 
  402a97:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402a9e:	00 00 
  402aa0:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402aa6:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402aaa:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402aae:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  402ab3:	48 8b 39             	mov    (%rcx),%rdi
  402ab6:	e8 95 e2 ff ff       	callq  400d50 <bcopy@plt>
  402abb:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402ac2:	ba 10 00 00 00       	mov    $0x10,%edx
  402ac7:	48 89 e6             	mov    %rsp,%rsi
  402aca:	89 df                	mov    %ebx,%edi
  402acc:	e8 ef e2 ff ff       	callq  400dc0 <connect@plt>
  402ad1:	85 c0                	test   %eax,%eax
  402ad3:	0f 88 d3 00 00 00    	js     402bac <init_driver+0x188>
  402ad9:	89 df                	mov    %ebx,%edi
  402adb:	e8 b0 e1 ff ff       	callq  400c90 <close@plt>
  402ae0:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402ae6:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402aea:	b8 00 00 00 00       	mov    $0x0,%eax
  402aef:	48 83 c4 10          	add    $0x10,%rsp
  402af3:	5b                   	pop    %rbx
  402af4:	5d                   	pop    %rbp
  402af5:	41 5c                	pop    %r12
  402af7:	c3                   	retq   
  402af8:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402aff:	3a 20 43 
  402b02:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b06:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402b0d:	20 75 6e 
  402b10:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b14:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b1b:	74 6f 20 
  402b1e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b22:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402b29:	65 20 73 
  402b2c:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b30:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402b37:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402b3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b42:	eb ab                	jmp    402aef <init_driver+0xcb>
  402b44:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402b4b:	3a 20 44 
  402b4e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b52:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402b59:	20 75 6e 
  402b5c:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b60:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b67:	74 6f 20 
  402b6a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b6e:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402b75:	76 65 20 
  402b78:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b7c:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402b83:	72 20 61 
  402b86:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402b8a:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b91:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b97:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b9b:	89 df                	mov    %ebx,%edi
  402b9d:	e8 ee e0 ff ff       	callq  400c90 <close@plt>
  402ba2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ba7:	e9 43 ff ff ff       	jmpq   402aef <init_driver+0xcb>
  402bac:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402bb3:	3a 20 55 
  402bb6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bba:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402bc1:	20 74 6f 
  402bc4:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bc8:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402bcf:	65 63 74 
  402bd2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402bd6:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402bdd:	65 72 76 
  402be0:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402be4:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402bea:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402bee:	89 df                	mov    %ebx,%edi
  402bf0:	e8 9b e0 ff ff       	callq  400c90 <close@plt>
  402bf5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bfa:	e9 f0 fe ff ff       	jmpq   402aef <init_driver+0xcb>

0000000000402bff <driver_post>:
  402bff:	53                   	push   %rbx
  402c00:	4c 89 cb             	mov    %r9,%rbx
  402c03:	45 85 c0             	test   %r8d,%r8d
  402c06:	75 18                	jne    402c20 <driver_post+0x21>
  402c08:	48 85 ff             	test   %rdi,%rdi
  402c0b:	74 05                	je     402c12 <driver_post+0x13>
  402c0d:	80 3f 00             	cmpb   $0x0,(%rdi)
  402c10:	75 32                	jne    402c44 <driver_post+0x45>
  402c12:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c17:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c1b:	44 89 c0             	mov    %r8d,%eax
  402c1e:	5b                   	pop    %rbx
  402c1f:	c3                   	retq   
  402c20:	48 89 ce             	mov    %rcx,%rsi
  402c23:	48 8d 3d e3 08 00 00 	lea    0x8e3(%rip),%rdi        # 40350d <trans_char+0xdd>
  402c2a:	b8 00 00 00 00       	mov    $0x0,%eax
  402c2f:	e8 2c e0 ff ff       	callq  400c60 <printf@plt>
  402c34:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c39:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c3d:	b8 00 00 00 00       	mov    $0x0,%eax
  402c42:	eb da                	jmp    402c1e <driver_post+0x1f>
  402c44:	48 83 ec 08          	sub    $0x8,%rsp
  402c48:	41 51                	push   %r9
  402c4a:	49 89 c9             	mov    %rcx,%r9
  402c4d:	49 89 d0             	mov    %rdx,%r8
  402c50:	48 89 f9             	mov    %rdi,%rcx
  402c53:	48 89 f2             	mov    %rsi,%rdx
  402c56:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402c5b:	48 8d 3d 93 08 00 00 	lea    0x893(%rip),%rdi        # 4034f5 <trans_char+0xc5>
  402c62:	e8 16 f6 ff ff       	callq  40227d <submitr>
  402c67:	48 83 c4 10          	add    $0x10,%rsp
  402c6b:	eb b1                	jmp    402c1e <driver_post+0x1f>

0000000000402c6d <check>:
  402c6d:	89 f8                	mov    %edi,%eax
  402c6f:	c1 e8 1c             	shr    $0x1c,%eax
  402c72:	85 c0                	test   %eax,%eax
  402c74:	74 1d                	je     402c93 <check+0x26>
  402c76:	b9 00 00 00 00       	mov    $0x0,%ecx
  402c7b:	83 f9 1f             	cmp    $0x1f,%ecx
  402c7e:	7f 0d                	jg     402c8d <check+0x20>
  402c80:	89 f8                	mov    %edi,%eax
  402c82:	d3 e8                	shr    %cl,%eax
  402c84:	3c 0a                	cmp    $0xa,%al
  402c86:	74 11                	je     402c99 <check+0x2c>
  402c88:	83 c1 08             	add    $0x8,%ecx
  402c8b:	eb ee                	jmp    402c7b <check+0xe>
  402c8d:	b8 01 00 00 00       	mov    $0x1,%eax
  402c92:	c3                   	retq   
  402c93:	b8 00 00 00 00       	mov    $0x0,%eax
  402c98:	c3                   	retq   
  402c99:	b8 00 00 00 00       	mov    $0x0,%eax
  402c9e:	c3                   	retq   

0000000000402c9f <gencookie>:
  402c9f:	53                   	push   %rbx
  402ca0:	83 c7 01             	add    $0x1,%edi
  402ca3:	e8 58 df ff ff       	callq  400c00 <srandom@plt>
  402ca8:	e8 63 e0 ff ff       	callq  400d10 <random@plt>
  402cad:	89 c3                	mov    %eax,%ebx
  402caf:	89 c7                	mov    %eax,%edi
  402cb1:	e8 b7 ff ff ff       	callq  402c6d <check>
  402cb6:	85 c0                	test   %eax,%eax
  402cb8:	74 ee                	je     402ca8 <gencookie+0x9>
  402cba:	89 d8                	mov    %ebx,%eax
  402cbc:	5b                   	pop    %rbx
  402cbd:	c3                   	retq   
  402cbe:	66 90                	xchg   %ax,%ax

0000000000402cc0 <__libc_csu_init>:
  402cc0:	41 57                	push   %r15
  402cc2:	41 56                	push   %r14
  402cc4:	41 89 ff             	mov    %edi,%r15d
  402cc7:	41 55                	push   %r13
  402cc9:	41 54                	push   %r12
  402ccb:	4c 8d 25 36 21 20 00 	lea    0x202136(%rip),%r12        # 604e08 <__frame_dummy_init_array_entry>
  402cd2:	55                   	push   %rbp
  402cd3:	48 8d 2d 36 21 20 00 	lea    0x202136(%rip),%rbp        # 604e10 <__init_array_end>
  402cda:	53                   	push   %rbx
  402cdb:	49 89 f6             	mov    %rsi,%r14
  402cde:	49 89 d5             	mov    %rdx,%r13
  402ce1:	4c 29 e5             	sub    %r12,%rbp
  402ce4:	48 83 ec 08          	sub    $0x8,%rsp
  402ce8:	48 c1 fd 03          	sar    $0x3,%rbp
  402cec:	e8 bf de ff ff       	callq  400bb0 <_init>
  402cf1:	48 85 ed             	test   %rbp,%rbp
  402cf4:	74 20                	je     402d16 <__libc_csu_init+0x56>
  402cf6:	31 db                	xor    %ebx,%ebx
  402cf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402cff:	00 
  402d00:	4c 89 ea             	mov    %r13,%rdx
  402d03:	4c 89 f6             	mov    %r14,%rsi
  402d06:	44 89 ff             	mov    %r15d,%edi
  402d09:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402d0d:	48 83 c3 01          	add    $0x1,%rbx
  402d11:	48 39 dd             	cmp    %rbx,%rbp
  402d14:	75 ea                	jne    402d00 <__libc_csu_init+0x40>
  402d16:	48 83 c4 08          	add    $0x8,%rsp
  402d1a:	5b                   	pop    %rbx
  402d1b:	5d                   	pop    %rbp
  402d1c:	41 5c                	pop    %r12
  402d1e:	41 5d                	pop    %r13
  402d20:	41 5e                	pop    %r14
  402d22:	41 5f                	pop    %r15
  402d24:	c3                   	retq   
  402d25:	90                   	nop
  402d26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d2d:	00 00 00 

0000000000402d30 <__libc_csu_fini>:
  402d30:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402d34 <_fini>:
  402d34:	48 83 ec 08          	sub    $0x8,%rsp
  402d38:	48 83 c4 08          	add    $0x8,%rsp
  402d3c:	c3                   	retq   
