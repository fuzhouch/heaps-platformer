class Main extends hxd.App {
    var box: Box;

    override function init() {
        // Though we can set window size via definition
        // "-D windowSize=1280x720" in compile.hxml, I prefer we do it
        // either hardcoding, or read from configuration file.
        var window = hxd.Window.getInstance();
        window.title = "Claw Machine Adventure";
        window.resize(1280, 720); 

        box = new Box(s2d);
        box.init();
    }

    override function update(dt: Float) {
        // We should just call .update() method for every object in
        // current scene here.
        box.update(dt);
    }

    static function main() {
        new Main();
    }
}
