# Used for HashLink

all: pumpkin.hdll main

# Dynamic library
pumpkin.hdll:
	mkdir -p ./out/hl/
	gcc -g -D LIBHL_EXPORTS -fPIC -shared -std=c11 -o ./out/hl/pumpkin.hdll libpumpkin/pumpkin.c gen/pumpkin_stick_wrapper.c -I libpumpkin/ -I../../src/stick/ -lhl

# The HL/C executable
main:
	gcc -g -o out/hl/main -std=c11 -I out/hl/ out/hl/main.c out/hl/pumpkin.hdll -lhl -lm

.PHONY: pumpkin.hdll main
