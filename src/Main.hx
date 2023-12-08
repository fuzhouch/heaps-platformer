class Main extends hxd.App {
    var bmp: h2d.Bitmap;
    var tile: h2d.Tile;

    var velocity: Float = 0;
    var gravity: Float = 9.8;
    var unitSize: Float = 64;

    override function init() {
        var window = hxd.Window.getInstance();
        window.title = "Claw Machine Adventure";
        // NOTE
        // Though we can set window size via definition
        // "-D windowSize=1280x720" in compile.hxml, I prefer we do it
        // either hardcoding, or read from configuration file.
        window.resize(1280, 720); 


        tile = h2d.Tile.fromColor(0xFF0000, 64, 64).center();
        bmp = new h2d.Bitmap(tile, s2d);
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;
    }

    override function update(dt: Float) {
        bmp.y += velocity * unitSize * dt;
        velocity += gravity * dt;

        if (bmp.y + bmp.tile.height / 2 > s2d.height) {
            velocity = -velocity;
        }
    }

    static function main() {
        new Main();
    }
}
