package example;

import pumpkin.Pumpkin;

class Main {
    public static function main() {
        var success = true;
        trace("Starting");

        trace("3 + 5 = ");
        var addResult = Pumpkin.add(3, 5);
        trace('  $addResult');
        success = success && addResult == 5;

        var filename = "example/Main.hx";
        trace('Read $filename');
        var readResult = Pumpkin.read(filename);
        trace('  "${readResult.toString().substr(0, 16)}"');
        success = success && readResult.toString().substr(0, 16) == "package example;";

        trace("'Hello' + ' world!' =");
        var concatResult = Pumpkin.concat("Hello", " world!");
        trace('  "$concatResult"');
        success = success && concatResult == "Hello world!";

        trace("Done");

        if (!success) {
            Sys.exit(1);
        }
    }
}
