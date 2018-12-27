package examplebind;

@:keep
#if cpp
@:include("example.h")
@:buildXml("<include name='${this_dir}/../../libexample/build.xml'/>")
// `this_dir` in this context is the cpp output directory.
// `haxelib:LibraryNameHere` should be used when installed by haxelib
#elseif hl
#end
extern class Native {
    #if cpp
    @:native("example_add_two")
    #elseif hl
    @:hlNative("example", "example_add_two")
    #end
    static function addTwo(a:Int):Int;
}
