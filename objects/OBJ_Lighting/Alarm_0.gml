/// @description Get active lights

if (global.lighting.ambient < 1) { 
	// erase current lists of lights
	var _lights = [];
	var camL = global.camera.xPos;
	var camR = global.camera.camR;
	var camT = global.camera.yPos;
	var camB = global.camera.camB;

	// get all lights
	with (all) {
		if (variable_instance_exists(self.id, "lighting") && variable_struct_exists(self.lighting, "isEmitter") && self.lighting.isEmitter) {
			var _d = self.lighting.distance*0.5;
			var _w = _d*LIGHT_WD;
			var _h = _d*LIGHT_HT;
			if (rectangle_in_rectangle(camL, camT, camR, camB, self.x - _w, self.y - _h, self.x + _w, self.y + _h) > 0) {
				array_push(_lights, self);
			}
		}
	}

	lights = _lights;
}

alarm[0] = GAME_FPS / 10; // only do light activation every 10th of a second