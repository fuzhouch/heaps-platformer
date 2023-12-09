typedef TiledMapData = {
    layers: Array<{ data: Array<Int>}>,
    tilewidth: Int,
    tileheight: Int,
    width: Int,
    height: Int
};

class LevelMap {
    var scene: h2d.Scene;
    var mapData: TiledMapData;
    var group: h2d.TileGroup;

    // The main logic is copied from official documentation. However the
    // documentation seems out-dated. The latest git version of
    // format package does not need extension appear as part of field
    // name.
    //
    // DOC: https://heaps.io/documentation/drawing-tiles.html
    public function new(s: h2d.Scene) {
        scene = s;
        mapData = haxe.Json.parse(hxd.Res.main.entry.getText());
        var tileImage = hxd.Res.tileset_claw_machines_0001.toTile();
        var group = new h2d.TileGroup(tileImage, scene);

        var tw = mapData.tilewidth;
        var th = mapData.tileheight;
        var mw = mapData.width;
        var mh = mapData.height;

        var tiles = [
            for (y in 0 ... Std.int(tileImage.height / th))
                for (x in 0 ... Std.int(tileImage.width / tw))
                    tileImage.sub(x * tw, y * th, tw, th)
        ];

        for (layer in mapData.layers) {
            for (y in 0 ... mh) for (x in 0 ... mw) {
                var tid = layer.data[x + y * mw];
                if (tid != 0) { // Skip transparent tiles
                    group.add(x * tw, y * tw, tiles[tid - 1]);
                }
            }
        }
    }

    public function init() {
    }
}
