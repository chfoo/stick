Stick
=====

Experimental, proof-of-concept Haxe foreign function binding tool.

Workflow overview
-----------------

Stick is a command line tool that processes definition files and generates Haxe and C source code. It is intended for mapping simple C types to Haxe types as one-to-one function parameters.

There is an example program in `example/pumpkin` which the following describes.

The example has two XML files which the program accepts as arguments:

1. `config.xml`: Includes information about input and output filenames.
2. `definition.xml`: Includes the C function signatures and how to bind them to Haxe.

Running the program will generate two files:

1. `pumpkin_stick_wrapper.c`: C code that wraps the native C function calls and contains symbol definitions for HashLink.
2. `PumpkinExtern.hx`: Low level Haxe code that contains an extern class matching the C wrapper.

The `pumpkin_stick_wrapper.c` file wraps the libpumpkin library C functions. It is anticipated for practical scenarios, an intermediate facade library will need to be manually written such that it provides an API with one-to-one mapping of supported Haxe and C types.

`Pumpkin.hx` contains manually written code that unwraps the underlying C data types and passes them `PumpkinExtern.hx`. Stick includes some abstract types that represent actual types in C such as `stick.CharArrayPointer.` Further work could be done to automate this step, such as automatic `Bytes` unwrapping either in Haxe or C code.

To learn more, please take at the example and the Stick source code.

Getting started on Linux
------------------------

Stick has been tested with:

* Ubuntu 18.10 on x86
* Neko 2.2
* Haxe 4.0.0-preview.5
* HL 1.8.0 (JIT and C)
* hxcpp 3.4.188
* GCC 8.2.0

To build the Stick tool:

    haxe hxml/app.neko.hxml

To generate the wrapper code for the pumpkin example:

    cd example/pumpkin/
    neko ../../out/neko/app.n config.xml definitions.xml

To build the example application:

    haxelib install main.cpp.hxml main.hl.hxml
    haxe main.cpp.hxml
    haxe main.hl.hxml
    haxe main.hl_c.hxml

Run the example application:

    ./run.cpp.sh
    ./run.hl.sh
    ./run.hl_c.sh

Further work
------------

The following types are currently supported:

* 8-bit unsigned integer array (for use with Bytes)
* char signed array (for use with Strings, currently assumed to be UTF-8)
* 32-bit signed and unsigned integers and pointers
* 64-bit signed and unsigned integers and pointers emulated by conversion to 64-bit floating point numbers. There will be loss of precision at large values (like JavaScript).

Possible next steps:

* 32-bit and 64-bit floating point number support
* Specifying string encoding
* Garbage collection for objects that library has malloc-ed and require us to free it
* Native 64-bit support (HashLink does not have support yet)
* Better integer pointer support (`uint64_t*` is not the same size as `size_t*` in HashLink currently)
* Object pointer support (`void*`)

Possibly in the future:

* Generation of `definitions.xml` using IDL generated from C headers and processing of Haxe interfaces using macros

Contributing
------------

I can accept issue reports and pull requests for bugs or must-have features. But any in-depth discussion or feature request shouldn't belong here but on relevant Haxe forums. This is very experimental and I'm not an expert at foreign functions in Haxe or language design. The goal of this project to inspire a more formal, community-developed project (not necessarily directly from Stick).
