package stick;

import sys.io.File;
import haxe.PosInfos;

class XMLLoader {
    public function new() {
    }

    public function read(filename:String) {
        parseString(File.getContent(filename));
    }

    function traceWarning(message:String, ?posInfo:PosInfos) {
        trace(message, posInfo);
    }

    function parseString(content:String) {
        var xml = Xml.parse(content);
        var root = xml.firstElement();

        for (element in root.elements()) {
            processElement(element);
        }
    }

    function processElement(element:Xml) {
        throw "Not implemented";
    }
}
