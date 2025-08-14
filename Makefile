# Makefile adaptado para /tmp/mylibs + FUSE do sistema

CFLAGS = -static -D_FILE_OFFSET_BITS=64 -I/tmp/mylibs/include -I/usr/include/fuse3 -pthread -no-pie
LDFLAGS = -L/tmp/mylibs/lib -lmnl -lnftnl -lfuse3 -ldl -pthread -no-pie

all: exploit fuse_spray.o monke
	gcc exploit.c fuse_spray.o -o exploit $(LDFLAGS) $(CFLAGS)

fuse_spray.o:
	gcc -c fuse_spray.c -o fuse_spray.o $(CFLAGS) $(LDFLAGS)

monke:
	gcc monke.c -o monke -static -no-pie

clean:
	rm -f exploit monke *.o
