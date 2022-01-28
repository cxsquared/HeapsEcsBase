package ecs.utils;

import hxd.Math;
import h2d.col.Point;
import ecs.component.Camera;
import ecs.component.Transform;

class CameraUtils {
	public static function worldToScreen(t:Transform, c:Camera, ct:Transform):Point {
		var position = new Point(t.x, t.y);

		var offsetX = Math.clamp(ct.x - (c.offsetX / c.zoom), c.bounds.x, c.bounds.width - (c.offsetX * 2) / c.zoom);
		var offsetY = Math.clamp(ct.y - (c.offsetY / c.zoom), c.bounds.y, c.bounds.height - (c.offsetY * 2) / c.zoom);

		return position.sub(new Point(offsetX, offsetY));
	}
}
