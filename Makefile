EXCLUDES = blown-up-demo components parameters
OBJECTS := $(filter-out $(EXCLUDES),$(patsubst src/%.scad,%,$(wildcard src/*.scad)))
dir_guard=@mkdir -p ./build

all:	$(OBJECTS)
	$(dir_guard)
	mkdir -p ./build/docs
	cp ./docs/README-objects.md ./build/README.md
	cp ./docs/assembly-and-tips.md ./build/docs/assembly-and-tips.md
	cp ./docs/printing-and-materials.md ./build/docs/printing-and-materials.md
	cp ./LICENSE ./build/LICENSE
	pushd ./build; zip ./buildable-stick-system-`git describe --dirty`-stls.zip . -r; popd

$(OBJECTS):
	$(dir_guard)
	openscad -o build/$@.stl src/$@.scad

clean:
	rm -rf ./build
