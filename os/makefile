#
# Type 'make' with this 'makefile' file to build the BLITZ OS kernel
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: os DISK

#
# Suffix Rules to make this much easier!
#
.SUFFIXES: .k .s .o

.k.s:; kpl -unsafe $$(basename $< .k)
.s.o:; asm $<

#
# Stuff related to user-level programs in general...
#

UserRuntime.o: UserRuntime.s
UserSystem.s: UserSystem.h UserSystem.k Syscall.h
UserSystem.o: UserSystem.s

#
# Stuff related to user-level program 'MyProgram'...
#

MyProgram.s: UserSystem.h MyProgram.h MyProgram.k Syscall.h
MyProgram.o: MyProgram.s
MyProgram: UserRuntime.o UserSystem.o MyProgram.o Syscall.o
	lddd UserRuntime.o UserSystem.o MyProgram.o Syscall.o -o MyProgram

#
# Stuff related to user-level program 'TestProgram1'...
#

TestProgram1.s: UserSystem.h TestProgram1.h TestProgram1.k Syscall.h
TestProgram1.o: TestProgram1.s
TestProgram1: UserRuntime.o UserSystem.o TestProgram1.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram1.o Syscall.o -o TestProgram1

#
# Stuff related to user-level program 'TestProgram2'...
#

TestProgram2.s: UserSystem.h TestProgram2.h TestProgram2.k Syscall.h
	kpl TestProgram2 -unsafe

TestProgram2.o: TestProgram2.s
	asm TestProgram2.s

TestProgram2: UserRuntime.o UserSystem.o TestProgram2.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram2.o Syscall.o -o TestProgram2

#
# Stuff related to user-level program 'TestProgram3a'...
#

TestProgram3a.s: UserSystem.h TestProgram3a.h TestProgram3a.k Syscall.h
	kpl TestProgram3a -unsafe

TestProgram3a.o: TestProgram3a.s
	asm TestProgram3a.s

TestProgram3a: UserRuntime.o UserSystem.o TestProgram3a.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram3a.o Syscall.o -o TestProgram3a

#
# Stuff related to user-level program 'TestProgram3'...
#

TestProgram3.s: UserSystem.h TestProgram3.h TestProgram3.k Syscall.h
	kpl TestProgram3 -unsafe

TestProgram3.o: TestProgram3.s
	asm TestProgram3.s

TestProgram3: UserRuntime.o UserSystem.o TestProgram3.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram3.o Syscall.o -o TestProgram3

#
# Stuff related to user-level program 'TestProgram3'...
#

TestProgram4.s: UserSystem.h TestProgram4.h TestProgram4.k Syscall.h
	kpl TestProgram4 -unsafe

TestProgram4.o: TestProgram4.s
	asm TestProgram4.s

TestProgram4: UserRuntime.o UserSystem.o TestProgram4.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram4.o Syscall.o -o TestProgram4

TestProgram4a.s: UserSystem.h TestProgram4a.h Syscall.o
	kpl TestProgram4a

TestProgram4a.o: TestProgram4a.s
	asm TestProgram4a.s

TestProgram4a: TestProgram4a.o UserSystem.o  Syscall.o UserRuntime.o
	lddd UserRuntime.o UserSystem.o TestProgram4a.o Syscall.o -o TestProgram4a

TestProgram5.o: UserSystem.h TestProgram5.s Syscall.h UserLib.h
TestProgram5:	TestProgram5.o UserSystem.o Syscall.o UserRuntime.o UserLib.o
	lddd UserRuntime.o UserSystem.o TestProgram5.o UserLib.o Syscall.o -o TestProgram5

#
# Stuff related to user-level program 'Program1'...
#

Program1.s: UserSystem.h Program1.h Program1.k Syscall.h
	kpl Program1

Program1.o: Program1.s
	asm Program1.s

Program1: UserRuntime.o UserSystem.o Program1.o Syscall.o
	lddd UserRuntime.o UserSystem.o Program1.o Syscall.o -o Program1


#
# Stuff related to user-level program 'Program2'...
#

Program2.s: UserSystem.h Program2.h Program2.k Syscall.h
	kpl Program2 -unsafe

Program2.o: Program2.s
	asm Program2.s

Program2: UserRuntime.o UserSystem.o Program2.o Syscall.o
	lddd UserRuntime.o UserSystem.o Program2.o Syscall.o -o Program2

#
# User land programs
#

USER_OBJS= UserLib.o UserSystem.o UserRuntime.o Syscall.o
USER_SRC= sh.k cat.k hello.k ls.k grep.k wc.k echoargs.k ln.k mkdir.k \
          rm.k rmdir.k cp.k du.k tee.k pwd.k more.k expr.k setexit.k \
          chmode.k shutdown.k script.k test.k exn.k stat.k df.k
USER_CMDS= ${USER_SRC:.k=}
USER_S= ${USER_SRC:.k=.s}
DEPS= UserLib.h UserSystem.h Syscall.h

${USER_OBJS}: ${DEPS}

sh.s: Environ.o
sh.o: ${DEPS} Environ.h 
sh: sh.o ${USER_OBJS} Environ.o
	lddd -o sh sh.o ${USER_OBJS} Environ.o

cat.o: ${DEPS}
cat: cat.o ${USER_OBJS}
	lddd -o cat cat.o ${USER_OBJS}

hello.o: ${DEPS}
hello: hello.o ${USER_OBJS}
	lddd -o hello hello.o ${USER_OBJS}

ls.o: ${DEPS}
ls: ls.o ${USER_OBJS} 
	lddd -o ls ls.o ${USER_OBJS}

grep.o:  ${DEPS}
grep: grep.o ${USER_OBJS} 
	lddd -o grep grep.o ${USER_OBJS}

wc.o: ${DEPS}
wc: wc.o ${USER_OBJS} 
	lddd -o wc wc.o ${USER_OBJS}

echoargs.o: ${DEPS}
echoargs: echoargs.o ${USER_OBJS} 
	lddd -o echoargs echoargs.o ${USER_OBJS}

ln.o: ${DEPS}
ln: ln.o ${USER_OBJS} 
	lddd -o ln ln.o ${USER_OBJS}

mkdir.o: ${DEPS}
mkdir: mkdir.o ${USER_OBJS} 
	lddd -o mkdir mkdir.o ${USER_OBJS}

rm.o: ${DEPS}
rm: rm.o ${USER_OBJS} 
	lddd -o rm rm.o ${USER_OBJS}

rmdir.o: ${DEPS}
rmdir: rmdir.o ${USER_OBJS} 
	lddd -o rmdir rmdir.o ${USER_OBJS}

cp.o: ${DEPS}
cp: cp.o ${USER_OBJS} 
	lddd -o cp cp.o ${USER_OBJS}

du.o: ${DEPS}
du: du.o ${USER_OBJS}
	lddd -o du du.o ${USER_OBJS}

df.o: ${DEPS}
df: df.o ${USER_OBJS}
	lddd -o df df.o ${USER_OBJS}

tee.o: ${DEPS}
tee: tee.o ${USER_OBJS}
	lddd -o tee tee.o ${USER_OBJS}

pwd.o: ${DEPS}
pwd: pwd.o ${USER_OBJS}
	lddd -o pwd pwd.o ${USER_OBJS}


more.o: ${DEPS}
more: more.o ${USER_OBJS}
	lddd -o more more.o ${USER_OBJS}

expr.o: ${DEPS}
expr: expr.o ${USER_OBJS}
	lddd -o expr expr.o ${USER_OBJS}

setexit.o: ${DEPS}
setexit: setexit.o ${USER_OBJS}
	lddd -o setexit setexit.o ${USER_OBJS}

chmode.o: ${DEFS}
chmode:	chmode.o ${USER_OBJS}
	lddd -o chmode chmode.o ${USER_OBJS}

shutdown.o: ${DEFS}
shutdown: shutdown.o ${USER_OBJS}
	lddd -o shutdown shutdown.o ${USER_OBJS}

exn.o: ${DEPS}
exn: exn.o ${USER_OBJS} 
	lddd -o exn exn.o ${USER_OBJS}

script.o: ${DEPS}
script: script.o ${USER_OBJS} 
	lddd -o script script.o ${USER_OBJS}

test.o: ${DEPS}
test: test.o ${USER_OBJS} 
	lddd -o test test.o ${USER_OBJS}

stat.o: ${DEPS}
stat: stat.o ${USER_OBJS} 
	lddd -o stat stat.o ${USER_OBJS}

#
# Stuff related to the os kernel...
#

Runtime.o: Runtime.s
	asm Runtime.s

Switch.o: Switch.s
	asm Switch.s

System.s: System.h System.k
	kpl System -unsafe

System.o: System.s
	asm System.s

List.s: System.h List.h List.k
	kpl List -unsafe

List.o: List.s
	asm List.s

BitMap.s: System.h BitMap.h BitMap.k
	kpl BitMap -unsafe

BitMap.o: BitMap.s
	asm BitMap.s

Kernel.s: System.h List.h BitMap.h Kernel.h Kernel.k Syscall.h
	kpl Kernel -unsafe

Kernel.o: Kernel.s
	asm Kernel.s

Main.s: System.h List.h BitMap.h Kernel.h Main.h Main.k Syscall.h
	kpl Main -unsafe

Main.o: Main.s
	asm Main.s

Syscall.s: Syscall.k Syscall.h
	kpl Syscall

Syscall.o: Syscall.s
	asm Syscall.s

os: Runtime.o Switch.o System.o List.o BitMap.o Kernel.o Main.o Syscall.o
	lddd Runtime.o Switch.o System.o List.o BitMap.o Kernel.o Main.o Syscall.o -o os

# empty files for output ...
#

test-output grep-output file-out:
	touch $@

#
# Stuff related to the DISK with ToyFs
#

DISK:	   MyProgram TestProgram1 TestProgram2 TestProgram3 TestProgram3a \
	   TestProgram4 TestProgram5 Program1 Program2 TestProgram4a\
	   makefile \
	   file1 file2 file3 file1234abcd \
	   FileWithVeryLongName012345678901234567890123456789 \
	   ${USER_CMDS} \
	   fileA fileB fileC fileD help script.sh test-script test-447 \
           test-output grep-output file-out
	rm -f DISK
	toyfs -i -n10 -s700
	toyfs -m /bin
	toyfs -a -x MyProgram TestProgram1 TestProgram2 /
	toyfs -a -x TestProgram3 TestProgram3a /
	toyfs -a -x TestProgram4 Program1 Program2 TestProgram5 /
	toyfs -a TestProgram4a /
	toyfs -a file1 file2 file3 file1234abcd /
	toyfs -a FileWithVeryLongName012345678901234567890123456789 /
	toyfs -a MyProgram xProg 
	toyfs -a fileA fileB fileC fileD help script.sh /
	toyfs -a TestProgram5.k /
	toyfs -a -x ${USER_CMDS} /bin
	for f in ${USER_CMDS}; do toyfs -c 5 /bin/$$f ; done
	toyfs -m /testdir
	toyfs -m /testdir/subdir
	toyfs -a primes.txt test-script test-447 test-output grep-output file-out /testdir

clean:
	rm -f *.o Main.s Kernel.s BitMap.s List.s System.s Syscall.s
	rm -f *Prog*.[os] sh.[os] hello.[os] cat.[os]  UserLib.[os] UserSystem.[os]
	rm -f ${USER_S}  Environ.[os]
	rm -f *~

realclean: clean
	rm -f os DISK
	rm -f MyProgram TestProgram[1234] TestProgram3a Program[12] TestProgram4a
	rm -f TestProgram5 ${USER_CMDS} grep-output test-output
