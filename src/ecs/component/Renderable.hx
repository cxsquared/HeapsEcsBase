package ecs.component;

import h2d.Drawable;
import h2d.Console;

class Renderable implements IComponent {
	public var drawable(default, null):Drawable;

	public function new(drawable:Drawable) {
		this.drawable = drawable;
	}

	public function log(console:Console, ?color:Null<Int>):Void {
		console.log(' tile: ${drawable.name}', color);
	}

	public function remove() {
		this.drawable.remove();
	}
}
