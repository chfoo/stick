package stick;

import haxe.io.Bytes;

private typedef NativeByteArrayPointer =
    #if cpp
    cpp.RawPointer<cpp.UInt8>
    #elseif hl
    hl.Bytes
    #else
    Int
    #end
;

/*
    An array of bytes (`uint8_t*`)
*/
abstract ByteArrayPointer(NativeByteArrayPointer) {
    inline function new(nativePointer:NativeByteArrayPointer) {
        this = nativePointer;
    }

    public static function fromBytes(bytes:Bytes):ByteArrayPointer {
        #if cpp
        var array = bytes.getData();
        return new ByteArrayPointer(cpp.NativeArray.address(array, 0).raw);
        #elseif hl
        return new ByteArrayPointer(bytes.getData().bytes);
        #else
        return new ByteArrayPointer(0);
        #end
    }

    public function toBytes(length:Int):Bytes {
        #if cpp
        return Bytes.ofData(cpp.Pointer.fromRaw(this).toUnmanagedArray(length));
        #elseif hl
        return Bytes.ofData(new haxe.io.BytesData(this, length));
        #else
        return null;
        #end
    }
}
