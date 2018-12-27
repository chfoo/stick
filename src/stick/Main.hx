package stick;

import sys.io.File;

class Main {
    public static function main() {
        var args = Sys.args();
        var configLoader = new ConfigLoader();
        var definitionLoader = new DefinitionLoader();

        if (args.length < 2 || args.indexOf("-h") >= 0 || args.indexOf("--help") >= 0) {
            printHelp();
            Sys.exit(2);
        }

        configLoader.read(Sys.args()[0]);
        definitionLoader.read(Sys.args()[1]);

        var externGenerator = new ExternGenerator(configLoader.config, definitionLoader.definition);
        var nativeGenerator = new NativeGenerator(configLoader.config, definitionLoader.definition);

        File.saveBytes(configLoader.config.haxeExternOutput, externGenerator.generate());
        File.saveBytes(configLoader.config.cNativeOutput, nativeGenerator.generate());
    }

    static function printHelp() {
        trace(
            "Stick - Haxe extern binding tool\n" +
            "Usage: program CONFIG-FILE DEFINITION-FILE\n" +
            "For details, see example project. Also available online at <URL>"
        );
    }
}
