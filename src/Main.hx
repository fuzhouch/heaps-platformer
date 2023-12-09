class Main extends hxd.App {
    var box: Box;
    var map: LevelMap;

    override function init() {
        super.init();
        // Though we can set window size via definition
        // "-D windowSize=1280x720" in compile.hxml, I prefer we do it
        // either hardcoding, or read from configuration file.
        var window = hxd.Window.getInstance();
        window.title = "Claw Machine Adventure";
        window.resize(1280, 720); 

        box = new Box(s2d);
        map = new LevelMap(s2d);
        box.init();
        map.init();
    }

    override function update(dt: Float) {
        // We should just call .update() method for every object in
        // current scene here.
        box.update(dt);
    }

    static function main() {
        //
        // DOC: https://heaps.io/documentation/resource-management.html
        //
        // Although many examples use hxd.Res.initEmbed() to embed all
        // resources in bytecode, this is not a good idea for
        // production, esp. when game is big enough.
        hxd.Res.initPak();
        new Main();
    }
}
