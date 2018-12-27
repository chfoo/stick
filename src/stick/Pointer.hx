package stick;

private typedef NativePointer<T> =
    #if cpp
    cpp.RawPointer<T>
    #elseif hl
    hl.Ref<T>
    #else
    Int
    #end
;

/*
    A C pointer to `T`.

    `T` must be a supported primitive type. Passing Haxe objects to the C wrapper is not a defined concept in Stick.
*/
abstract Pointer<T>(NativePointer<T>) {
    inline function new(nativePointer:NativePointer<T>) {
        this = nativePointer;
    }

    inline public static function make<T>(object:T):Pointer<T> {
        #if cpp
        return new Pointer(cpp.RawPointer.addressOf(object));
        #elseif hl
        return new Pointer(new hl.Ref(object));
        #else
        return new Pointer(0);
        #end
    }

    inline public function get():T {
        #if cpp
        return cpp.Pointer.fromRaw(this).ref;
        #elseif hl
        return this.get();
        #else
        return null;
        #end
    }
}
