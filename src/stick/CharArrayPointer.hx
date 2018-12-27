package stick;

private typedef NativeCharArrayPointer =
    #if cpp
    cpp.ConstCharStar
    #elseif hl
    hl.Bytes
    #else
    Int
    #end
;

/*
    C string (`char *`)
*/
abstract CharArrayPointer(NativeCharArrayPointer) {
    inline function new(nativePointer:NativeCharArrayPointer) {
        this = nativePointer;
    }

    public static function fromString(text:String):CharArrayPointer {
        #if cpp
        return new CharArrayPointer(cpp.ConstCharStar.fromString(text));
        #elseif hl
        var bytes = Bytes.ofString(text);
        return new CharArrayPointer(bytes.getData().bytes);
        #else
        return null;
        #end
    }

    public function toString():String {
        #if cpp
        return cpp.NativeString.fromPointer(cpp.ConstPointer.fromRaw(this.toPointer()));
        #elseif hl
        return @:privateAccess String.fromUTF8(this);
        #else
        return null;
        #end
    }
}
