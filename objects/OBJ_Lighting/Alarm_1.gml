/// @description Get casters & depth sort

if (global.lighting.ambient < 1) { 
	// erase current lists of casters
	var _casters = [];

	//get all casters
	with (all) {
		if (variable_instance_exists(self.id, "lighting") && variable_struct_exists(self.lighting, "isCaster") && self.lighting.isCaster && self.depth < LIGHTING_DEPTH_MAX && self.depth > LIGHTING_DEPTH_MIN) {
			array_push(_casters, self);
		}
	}

	casters = _casters;
	array_sort(casters, compare_depth);
}

alarm[1] = GAME_FPS / 2; // only do depth sorting every half a second