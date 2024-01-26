#######################
# Makefile
#######################
# source object target
SOURCE := plt.c
OBJS   := plt.o
TARGET := plt

# compile and lib parameter
CC      := gcc
LIBS    :=
LDFLAGS := -L.
DEFINES :=
INCLUDE := -I.
CFLAGS  := 
CXXFLAGS:= 

# link
$(TARGET):$(OBJS)
	$(CC) -m32 -no-pie -g -o $@ $^
	hexdump -C $(TARGET) > hexdump-C
	objdump -s $(TARGET) > objdump-s
	objdump -S $(TARGET) > objdump-S
	objdump -d $(TARGET) > objdump-d
	readelf -r $(TARGET) > readelf-r
	readelf -S $(TARGET) > readelf-S
	readelf -x .got $(TARGET) > got

# compile
$(OBJS):$(SOURCE)
	$(CC) -c plt.c -m32 -no-pie -g -o plt.o

# clean
clean:
	rm -fr *.o
	rm -fr $(TARGET) hexdump-C objdump-s objdump-S objdump-d readelf-r readelf-S got
