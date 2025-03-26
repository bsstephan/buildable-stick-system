all:
	python build.py
	mkdir -p ./build/docs
	cp ./README.md ./build/README.md
	cp ./docs/README-objects.md ./build/README-objects.md
	cp ./docs/* ./build/docs/
	cp ./LICENSE ./build/LICENSE
	cp ./CHANGELOG.md ./build/CHANGELOG.md
	pushd ./build; zip ./buildable-stick-system-`git describe --dirty`-stls-and-docs.zip . -r; popd
	pushd ./build; zip ./buildable-stick-system-`git describe --dirty`-stls.zip extras frames misc panels -r; popd

clean:
	rm -rf ./build
