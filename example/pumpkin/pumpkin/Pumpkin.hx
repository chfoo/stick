package pumpkin;

import haxe.io.Bytes;

/*
    User friendly API to the pumpkin library
*/
class Pumpkin {
    public static function add(a:Int, b:Int):Int {
        return PumpkinExtern.pumpkin_add(3, 5);
    }

    public static function read(filename:String):Bytes {
        // Lots of manual work here
        var buffer = Bytes.alloc(4096);
        var bytesRead:stick.UInt64 = haxe.Int64.ofInt(0);
        var bytesReadPointer = stick.Pointer.make(bytesRead);
        var filenamePointer = stick.CharArrayPointer.fromString(filename);
        var bufferPointer = stick.ByteArrayPointer.fromBytes(buffer);
        var result = PumpkinExtern.pumpkin_read(filenamePointer, bufferPointer, buffer.length, bytesReadPointer);

        if (result != 0) {
            throw 'Read error $result';
        }
        return buffer.sub(0, (bytesRead:haxe.Int64).low);
    }

    public static function concat(text1:String, text2:String):String {
        var textPointer1 = stick.CharArrayPointer.fromString(text1);
        var textPointer2 = stick.CharArrayPointer.fromString(text2);
        var resultPointer = PumpkinExtern.pumpkin_concat(textPointer1, textPointer2);

        if (resultPointer == null) {
            throw "Concat error";
        }

        // Memory leak: We are responsible for freeing C string
        return resultPointer.toString();
    }
}
