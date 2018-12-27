package stick;

// int64 data type emulated by passing a 64-bit floating point number to be converted on the C wrapper
private typedef UInt64Type =
#if (cpp || hl)
Float
#else
haxe.Int64
#end
;

abstract UInt64(UInt64Type)
#if (cpp || hl)
from Int
#else
from haxe.Int64
to haxe.Int64
#end
{
    #if (cpp || hl)
    @:from
    inline static function fromInt64(value:haxe.Int64):stick.UInt64 {
        return cast (value.high * 4294967296 + value.low);
    }

    @:to
    inline function toInt64():haxe.Int64 {
        return haxe.Int64.fromFloat(this);
    }
    #end
}
