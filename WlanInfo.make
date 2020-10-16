C=clang
CXX=clang++
EXE=WlanInfo
LIB=libwlaninfo

all: build run

prepare:
	mkdir -p bin

FRAMEWORKS = -framework Foundation -framework CoreWLAN
build: prepare
	$(CXX) -stdlib=libc++ -std=c++11 -shared $(FRAMEWORKS) -fpic src/WlanInfo.mm -o bin/$(LIB).dylib
	$(CXX) -stdlib=libc++ -std=c++11 src/Main.cpp bin/$(LIB).dylib -o bin/$(EXE)


run:
	bin/./$(EXE)

clean:
	rm bin/*