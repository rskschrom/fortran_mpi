# compile options
FC = mpif90
FCFLAGS = -O3
FLIBS = -fopenmp
LPATH = -L/usr/global/openmpi-1.6.5-intel/lib
IPATH = -I/usr/global/openmpi-1.6.5-intel/include
OBJS = test_funcs.o
MAIN = ftest.f90

# build main program
ftest : $(MAIN) $(OBJS)
	$(FC) $(FCFLAGS) -o $@ $^ $(LPATH) $(IPATH) $(FLIBS)

# compile objects
%.o : %.f90
	$(FC) $(FCFLAGS) -c $< $(LPATH) $(IPATH) $(FLIBS)

clean :
	rm ftest *.o
