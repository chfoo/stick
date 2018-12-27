package stick;

import haxe.io.Output;

/*
    A convenience class that writes out code with state management such as indents.
*/
class CodeWriter {
    var output:Output;
    var indentLevel:Int = 0;
    var newline:String = "\n";
    var tab:String = "    ";
    var lineDirty:Bool = false;

    public function new(output:Output) {
        this.output = output;
    }

    function writeTabs() {
        for (level in 0...indentLevel) {
            output.writeString(tab);
        }
    }

    function writeLeadingTabs() {
        if (!lineDirty) {
            writeTabs();
            lineDirty = true;
        }
    }

    public function write(text:String) {
        writeLeadingTabs();
        output.writeString(text);
    }

    public function writeLine(text:String = "") {
        writeLeadingTabs();
        output.writeString(text);
        output.writeString(newline);
        lineDirty = false;
    }

    public function indent(amount:Int = 1) {
        indentLevel += amount;
    }

    public function unindent(amount:Int = 1) {
        indentLevel -= amount;
    }
}
