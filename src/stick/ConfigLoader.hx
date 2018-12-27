package stick;

import haxe.Template;
#if (haxe_ver >= "4.0")
import haxe.xml.Access;
#else
import haxe.xml.Fast as Access;
#end

/*
    Reads config.xml
*/
class ConfigLoader extends XMLLoader {
    public var config(default, null):Config;

    public function new() {
        super();

        config = new Config();
    }

    override function processElement(element:Xml) {
        var element_ = new Access(element);
        var innerData = element_.innerData;

        switch element_.name {
            case "cLibraryName":
                config.cLibraryName = innerData;
            case "cLibraryInclude":
                config.cLibraryInclude = innerData;
            case "cNativePrefix":
                config.cNativePrefix = innerData;
            case "cNativeOutput":
                config.cNativeOutput = innerData;
            case "haxePackage":
                config.haxePackage = innerData;
            case "haxeExternClass":
                config.haxeExternClass = innerData;
            case "haxeExternOutput":
                config.haxeExternOutput = innerData;
            case "cppInject":
                config.cppInject = innerData;
        }
    }
}
