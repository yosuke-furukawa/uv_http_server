uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
CFLAGS += -g
CPPFLAGS += -Isrc
LDFLAGS=-lm

CPPFLAGS += -D_LARGEFILE_SOURCE
CPPFLAGS += -D_FILE_OFFSET_BITS=64

ifeq (Linux,$(uname_S))
LDFLAGS+=-ldl -lrt
endif

webserver: webserver.c libuv/libuv.a http-parser/http_parser.o
	gcc $(CPPFLAGS) -o webserver webserver.c libuv/libuv.a http-parser/http_parser.o $(LDFLAGS);

libuv/libuv.a:
	make -C libuv

http_parser/http_parser.o:
	make -C http-parser http_parser.o

clean:
	make -C http-parser clean
	make -C libuv distclean
	rm webserver
