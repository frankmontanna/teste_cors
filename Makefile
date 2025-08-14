all: exploit.c fuse_spray.o monke
	gcc exploit.c fuse_spray.o -o exploit -static -D_FILE_OFFSET_BITS=64 \
	    -I/tmp/mylibs/include -L/tmp/mylibs/lib \
	    -lnftnl -lmnl -pthread -lfuse3 -ldl -no-pie

fuse_spray.o:
	gcc -c fuse_spray.c -o fuse_spray.o -static -D_FILE_OFFSET_BITS=64 \
	    -I/tmp/mylibs/include -pthread -lfuse3 -ldl -no-pie

monke:
	gcc monke.c -o monke -static -no-pie

clean:
	rm -f exploit monke *.o
