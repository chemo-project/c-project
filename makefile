IDIR =../include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=src/obj
LDIR =lib

LIBS=

_DEPS = hellomake.h
_OBJ = hellomake.o hellofunc.o 

DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
