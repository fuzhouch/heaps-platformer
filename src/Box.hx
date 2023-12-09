class Box {
    var scene: h2d.Scene;
    var bmp: h2d.Bitmap;
    var tile: h2d.Tile;

    var velocity: Float = 0;
    var gravity: Float = 9.8;
    var unitSize: Float = 64;

    public function new(s: h2d.Scene) {
        scene = s;
    }

    public function init() {
        tile = h2d.Tile.fromColor(0xFF0000, 64, 64).center();
        bmp = new h2d.Bitmap(tile, scene);
        bmp.x = scene.width * 0.5;
        bmp.y = scene.height * 0.5;
    }

    public function update(dt: Float) {
        bmp.y += velocity * unitSize * dt;
        velocity += gravity * dt;

        if (bmp.y + bmp.tile.height / 2 > scene.height) {
            velocity = -velocity;
        }
    }
}
