all:
	python build.py
	mkdir -p ./build/docs
	cp ./README.md ./build/README.md
	cp ./docs/README-objects.md ./build/README-objects.md
	cp ./docs/assembly-and-tips.md ./build/docs/assembly-and-tips.md
	cp ./docs/printing-and-materials.md ./build/docs/printing-and-materials.md
	cp ./LICENSE ./build/LICENSE
	cp ./CHANGELOG.md ./build/CHANGELOG.md
	pushd ./build; zip ./buildable-stick-system-`git describe --dirty`-stls.zip . -r; popd

clean:
	rm -rf ./build
