OBJECTS = $(patsubst %.c,%.o,$(wildcard *.c))

run: $(OBJECTS)
	gcc -g -o run $(OBJECTS)
 
test.o: test.c
	gcc -g -c test.c
.PHONY: clean
clean:
	rm -rf *.o run
