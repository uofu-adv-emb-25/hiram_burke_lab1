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

.PHONY: clean

clean:
	rm -f hello.txt *.s *.o *.i