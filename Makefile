EXCLUDES = blown-up-demo components parameters
OBJECTS := $(filter-out $(EXCLUDES),$(patsubst src/%.scad,%,$(wildcard src/*.scad)))
dir_guard=@mkdir -p ./build

all:	$(OBJECTS)
	zip ./build/buildable-stick-system-`git describe --dirty`-stls.zip ./build/*

$(OBJECTS):
	$(dir_guard)
	openscad -o build/$@.stl src/$@.scad

clean:
	rm -rf ./build
