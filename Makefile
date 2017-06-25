CXX = g++ -v
CXXFLAGS = -std=c++11 -Wall -pthread


INC=-I/usr/local/include/ -I/usr/local/include/pocketsphinx/ -I/usr/local/include/sphinxbase/
LIB=-L/usr/local/lib/

SRC=./VCS/

LIB+=-lportaudio -lpocketsphinx -lsphinxbase

COMPILE=${CXX} ${CXXFLAGS} ${INC} ${LIB}

all: voice_interface audio_stream
	${COMPILE} -o ./build/vcs ${SRC}main.cpp ./build/*.o
voice_interface: builddir
	${COMPILE} -c ${SRC}voice_interface.cpp -o ./build/voice_interface.o

audio_stream: builddir
	${COMPILE} -c ${SRC}audio_stream.cpp -o ./build/audio_stream.o
builddir:
	mkdir -p build
clean:
	rm -rdf ./build