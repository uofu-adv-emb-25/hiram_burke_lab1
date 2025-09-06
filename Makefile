all: firmware.elf

hello.txt:
	echo "hello world!" > hello.txt

CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as

%.i: %.c
	$(CPP) $< -o $@

%.s: %.i
	$(CC) -S $< -o $@

%.o: %.s
	$(AS) $< -o $@


LD=arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

firmware.elf: $(OBJS)
	$(LD) -o $@ $^


.PHONY: clean all

clean:
	rm -f hello.txt *.s *.o *.i *.elf