package stick;

private typedef Int32Type =
#if cpp
cpp.Int32
#else
haxe.Int32
#end
;

abstract Int32(Int32Type) from Int to Int {
}
