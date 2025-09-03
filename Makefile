hello.txt:
	echo "hello world!" > hello.txt

CPP=arm-none-eabi-cpp

main.i: main.c
	$(CPP) main.c > main.i

.PHONY: clean

clean:
	rm -f hello.txt main.s *.o *.i

CC=arm-none-eabi-gcc
AS=arm-none-eabi-as

main.s: main.i
	$(CC) -S main.i

%.o: %.s
	$(AS) $< -o $@