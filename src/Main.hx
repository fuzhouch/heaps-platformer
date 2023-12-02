class Main extends hxd.App {
    override function init() {
        var window = hxd.Window.getInstance();
        window.title = "Claw Machine Adventure";
        // NOTE
        // Though we can set window size via definition
        // "-D windowSize=1280x720" in compile.hxml, I prefer we do it
        // either hardcoding, or read from configuration file.
        window.resize(1280, 720); 

        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "Hello, Hashlink !";
    }

    static function main() {
        new Main();
    }
}
