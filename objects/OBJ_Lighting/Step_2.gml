/// @description Get active lights & casters

// don't waste computations if not needed
if (global.lighting.ambient < 1) { 

	// set the light update counter correctly
	if (lightUpdateCounter > 0) {
		// if game fps drops too low, reduce lighting fps to save resources
		var fpsThreshhold = (os_browser == browser_not_a_browser ? GAME_FPS*2 : GAME_FPS);
		lightUpdateCounter -= (fps_real < fpsThreshhold ? 0.5 : 1);
	}

	if (lightUpdateCounter <= 0) {

		// erase current lists of lights and casters
		var _lights = [];
		var _casters = [];
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

		//get all casters
		with (all) {
			if (variable_instance_exists(self.id, "lighting") && variable_struct_exists(self.lighting, "isCaster") && self.lighting.isCaster && self.depth < LIGHTING_DEPTH_MAX && self.depth > LIGHTING_DEPTH_MIN) {
				array_push(_casters, self);
			}
		}

		casters = _casters;
		array_sort(casters, compare_depth);
		
		// get camera positions to make frameskip work
		global.camera.xFrameskip = global.camera.xPos;
		global.camera.yFrameskip = global.camera.yPos;
	}
}
