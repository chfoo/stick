package stick;

import haxe.ds.Option;

/*
    Info structures for definitions.xml
*/
class Definition {
    public var functions:Array<FunctionDef>;

    public function new() {
        functions = new Array();
    }
}

class FunctionDef {
    public var name:String;
    public var doc:String = "";
    public var parameters:Array<ParameterDef>;
    public var returnDef:Option<ReturnDef> = None;

    public function new(name:String) {
        this.name = name;
        parameters = new Array();
    }
}

class ParameterDef {
    public var name:String;
    public var nativeType:String;
    public var haxeType:String;
    public var bindType:BindType;

    public function new(name:String, nativeType:String, haxeType:String, bindType:BindType) {
        this.name = name;
        this.nativeType = nativeType;
        this.haxeType = haxeType;
        this.bindType = bindType;
    }
}

class ReturnDef {
    public var nativeType:String;
    public var haxeType:String;
    public var bindType:BindType;

    public function new(nativeType:String, haxeType:String, bindType:BindType) {
        this.nativeType = nativeType;
        this.haxeType = haxeType;
        this.bindType = bindType;
    }
}

@:enum
abstract BindType(String) from String {
    var Int32 = "int32";
    var Int32Pointer = "int32-pointer";
    var UInt32 = "uint32";
    var UInt32Pointer = "uint32-pointer";
    var Int64 = "int64";
    var Int64Pointer = "int64-pointer";
    var UInt64 = "uint64";
    var UInt64Pointer = "uint64-pointer";
    var ByteArray = "byte-array";
    var CharArray = "char-array";
}
