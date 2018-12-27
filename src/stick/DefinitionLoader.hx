package stick;

#if (haxe_ver >= "4.0")
import haxe.xml.Access;
#else
import haxe.xml.Fast as Access
#end
import sys.io.File;
import stick.Definition;
import haxe.ds.Option;

/*
    Reads definitions.xml
*/
class DefinitionLoader extends XMLLoader {
    public var definition(default, null):Definition;

    public function new() {
        super();

        definition = new Definition();
    }

    override function processElement(element:Xml) {
        switch element.nodeName {
            case "function":
                processFunctionElement(element);
            default:
                traceWarning('Unknown element ${element.nodeName}');
        }
    }

    function processFunctionElement(element:Xml) {
        var elementAccess = new Access(element);
        var name = null;
        var doc = null;
        var parameters = [];
        var returnDef = None;

        for (subElement in elementAccess.elements) {
            switch subElement.name {
                case "name":
                    name = subElement.innerData;
                case "doc":
                    doc = subElement.innerData;
                case "parameter":
                    parameters.push(processParameterElement(subElement));
                case "return":
                    returnDef = Some(processReturnElement(subElement));
            }
        }

        if (name == null) {
            throw "Missing name";
        }

        var functionDef = new FunctionDef(name);

        if (doc != null) {
            functionDef.doc = doc;
        }

        functionDef.parameters = parameters;
        functionDef.returnDef = returnDef;

        definition.functions.push(functionDef);
    }

    function processParameterElement(element:Access):ParameterDef {
        return new ParameterDef(
            element.att.name,
            element.att.nativeType,
            element.att.haxeType,
            element.att.bindType
        );
    }

    function processReturnElement(element:Access):ReturnDef {
        return new ReturnDef(
            element.att.nativeType,
            element.att.haxeType,
            element.att.bindType
        );
    }
}
