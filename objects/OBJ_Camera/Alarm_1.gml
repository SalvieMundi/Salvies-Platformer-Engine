/// @description Deactivate objects

#region deactivate any instances far outside the camera view, and fill lights and casters for OBJ_Lighting
		
	// erase current lists of lights
	var _lights = [];
	var _casters = [];
	var camL = global.camera.xPos;
	var camR = global.camera.camR;
	var camT = global.camera.yPos;
	var camB = global.camera.camB;

	if (global.camera.deactivate) {
		// get local variables for general deactivation
		var _id, viewL, viewR, viewT, viewB, target, exemptions, arrayLength;
		viewL = global.camera.xPos - global.camera.padding;
		viewT = global.camera.yPos - global.camera.padding;
		viewR = global.camera.camR + global.camera.padding;
		viewB = global.camera.camB + global.camera.padding;
		target = global.camera.target;
		exemptions = global.camera.exemptions;
		arrayLength = array_length(exemptions);
		
		// temporarily activate all instances
		instance_activate_all();
		
		with (all) {
			
			// if instance is not in view, is not a lighting element, is not in exemption list, and is not the camera target, deactivate
			_id = self.id;
			if (collision_rectangle(viewL, viewT, viewR, viewB, _id, false, false) != noone && !variable_instance_exists(_id, "lighting") && !is_in_list(self.object_index, exemptions) && self.object_index != target) {
				instance_deactivate_object(_id);
			}
			
			// if this is a light emitter or caster
			if (variable_instance_exists(_id, "lighting")) {
				// if it's a light, put into light array if in view, or deactivate if not
				if (variable_struct_exists(self.lighting, "isEmitter") && self.lighting.isEmitter) {
					var _d = self.lighting.distance*0.5;
					var _w = _d*LIGHT_WD;
					var _h = _d*LIGHT_HT;
					if (rectangle_in_rectangle(camL, camT, camR, camB, self.x - _w, self.y - _h, self.x + _w, self.y + _h) > 0) {
						array_push(_lights, self);
					} else if(!is_in_list(self.object_index, exemptions) && self.object_index != target) {
						instance_deactivate_object(_id);
					}
				}
				
				// if it's a caster, put into the casters array
				if (variable_struct_exists(self.lighting, "isCaster") && self.lighting.isCaster && self.depth < LIGHTING_DEPTH_MAX && self.depth > LIGHTING_DEPTH_MIN) {
					array_push(_casters, self);
				}
			}
		}
	} else {
		instance_activate_all();
		
		with (all) {
			_id = self.id;
			
			// if lighting engine is on and this is a light emitter or caster
			if (variable_instance_exists(_id, "lighting")) {
				// if it's a light, put into light array if in view, or deactivate if not
				if (variable_struct_exists(self.lighting, "isEmitter") && self.lighting.isEmitter) {
					var _d = self.lighting.distance*0.5;
					var _w = _d*LIGHT_WD;
					var _h = _d*LIGHT_HT;
					if (rectangle_in_rectangle(camL, camT, camR, camB, self.x - _w, self.y - _h, self.x + _w, self.y + _h) > 0) {
						array_push(_lights, self);
					}
				}
				
				// if it's a caster, put into the casters array
				if (variable_struct_exists(self.lighting, "isCaster") && self.lighting.isCaster && self.depth < LIGHTING_DEPTH_MAX && self.depth > LIGHTING_DEPTH_MIN) {
					array_push(_casters, self);
				}
			}
		}
	}
	
	array_sort(_casters, compare_depth);
	OBJ_Lighting.lights = _lights;
	OBJ_Lighting.casters = _casters;

#endregion

alarm[1] = GAME_FPS / 2; // do deactivation every half a second