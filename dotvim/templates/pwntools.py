from pwn import *

PROGNAME   = "./NAME"
REMOTEIP   = "8.8.8.8"
REMOTEPORT = 9999

if args.REMOTE:
    p = remote(REMOTEIP, REMOTEPORT)
    elf = ELF(PROGNAME)
else:
    p = process(PROGNAME)
    elf = p.elf


p.interactive()
