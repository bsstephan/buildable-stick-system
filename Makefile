SRC_FILES := $(wildcard ./src/*.scad)
SRC_FILES := $(filter-out ./src/blown-up-demo.scad, $(SRC_FILES))
SRC_FILES := $(filter-out ./src/components.scad, $(SRC_FILES))
SRC_FILES := $(filter-out ./src/roundedcube.scad, $(SRC_FILES))
all: $(SRC_FILES)
	mkdir -p ./build
	for file in $^ ; do \
		openscad -o $${file}.stl $${file} ; \
		mv $${file}.stl ./build/ ; \
	done
	zip ./build/buildable-stick-system-`git describe --dirty`-stls.zip ./build/*

clean:
	rm -rf ./build
