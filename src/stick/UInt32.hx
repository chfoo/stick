package stick;

private typedef UInt32Type =
#if cpp
cpp.UInt32
#else
Int
#end
;

abstract UInt32(UInt32Type) {
    @:to
    inline function toInt64():haxe.Int64 {
        return haxe.Int64.make(0, this);
    }

    @:to
    inline function toInt():Int {
        return this & 0xffffffff;
    }

    @:from
    inline static function fromInt64(value:haxe.Int64) {
        return value.low;
    }

    @:from
    inline static function fromInt(value:Int) {
        return value & 0xffffffff;
    }
}
