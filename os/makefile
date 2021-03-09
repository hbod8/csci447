#
# Type 'make' with this 'makefile' file to build the BLITZ OS kernel
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: os DISK

#
# Stuff related to user-level programs in general...
#

UserRuntime.o: UserRuntime.s
	asm UserRuntime.s

UserSystem.s: UserSystem.h UserSystem.k Syscall.h
	kpl UserSystem -unsafe

UserSystem.o: UserSystem.s
	asm UserSystem.s

#
# Stuff related to user-level program 'MyProgram'...
#

MyProgram.s: UserSystem.h MyProgram.h MyProgram.k Syscall.h
	kpl MyProgram -unsafe

MyProgram.o: MyProgram.s
	asm MyProgram.s

MyProgram: UserRuntime.o UserSystem.o MyProgram.o Syscall.o
	lddd UserRuntime.o UserSystem.o MyProgram.o Syscall.o -o MyProgram

#
# Stuff related to user-level program 'TestProgram1'...
#

TestProgram1.s: UserSystem.h TestProgram1.h TestProgram1.k Syscall.h
	kpl TestProgram1 -unsafe

TestProgram1.o: TestProgram1.s
	asm TestProgram1.s

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

#
# Stuff related to the DISK...
#

#DISK: MyProgram TestProgram1 TestProgram2
#	diskUtil -i
#	diskUtil -a MyProgram MyProgram
#	diskUtil -a TestProgram1 TestProgram1
#	diskUtil -a TestProgram2 TestProgram2

DISK: MyProgram TestProgram1 TestProgram2 TestProgram3 TestProgram3a \
	   TestProgram4 Program1 Program2 TestProgram4a\
	   file1 file2 file3 file1234abcd \
	   FileWithVeryLongName012345678901234567890123456789
	rm -f DISK
	toyfs -i -n10 -s250
	toyfs -a -x MyProgram TestProgram1 TestProgram2 /
	toyfs -a -x TestProgram3 TestProgram3a /
	toyfs -a -x TestProgram4 Program1 Program2 /
	toyfs -a TestProgram4a /
	toyfs -a file1 file2 file3 file1234abcd /
	toyfs -a FileWithVeryLongName012345678901234567890123456789 /
	toyfs -a MyProgram xProg 

clean:
	rm -f *.o Main.s Kernel.s BitMap.s List.s System.s Syscall.s UserSystem.s
	rm -f *Prog*.[os]
	rm -f *~

realclean: clean
	rm -f os DISK
	rm -f MyProgram TestProgram[1234] TestProgram3a Program[12] TestProgram4a