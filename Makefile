SRCDIR = ./src
all: $(SRCDIR)/*
	mkdir -p build
	for file in $^ ; do \
		openscad -o $${file}.stl $${file} ; \
		mv $${file}.stl build ; \
	done

clean:
	rm build/*.stl
	rmdir build
