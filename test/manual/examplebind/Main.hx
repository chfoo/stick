package examplebind;

class Main {
    public static function main() {
        trace("Starting...");

        var result = Native.addTwo(3);
        var success = result == 5;

        trace('3 + 2 = $result');

        trace("Done.");

        if (!success) {
            Sys.exit(1);
        }
    }
}
