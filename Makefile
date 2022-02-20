default: libunrandom.so

%.so: %.c
	$(CC) -shared -fPIC -ldl -o $@ $<

test: test.o
