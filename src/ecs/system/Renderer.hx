package ecs.system;

import ecs.utils.CameraUtils;
import ecs.component.Transform;
import ecs.component.Renderable;
import ecs.component.Camera;

class Renderer implements IPerEntitySystem {
	public var forComponents:Array<Class<Dynamic>> = [Renderable, Transform];

	public var cameraTransform:Transform;
	public var camera:Camera;

	public function new(camera:Entity) {
		this.camera = camera.get(Camera);
		this.cameraTransform = camera.get(Transform);
	}

	public function update(entity:Entity, dt:Float) {
		var renderable = entity.get(Renderable);
		var transform = entity.get(Transform);

		var position = CameraUtils.worldToScreen(transform, camera, cameraTransform);

		renderable.drawable.setPosition(position.x, position.y);
		renderable.drawable.rotation = transform.rotation;
	}
}
