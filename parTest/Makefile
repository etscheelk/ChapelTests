all: parTest printer

parTest: parTest.chpl
	chpl -o parTest parTest.chpl

printer: printer.c
	gcc -o printer printer.c -Og -Wall -g

clean:
	rm -f parTest printer