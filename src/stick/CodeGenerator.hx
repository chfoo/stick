package stick;

import haxe.io.BytesOutput;

/*
    Base class for generating code.
*/
class CodeGenerator {
    var config:Config;
    var definition:Definition;
    var output:BytesOutput;
    var writer:CodeWriter;

    public function new(config:Config, definition:Definition) {
        this.config = config;
        this.definition = definition;
        output = new BytesOutput();
        writer = new CodeWriter(output);
    }
}
