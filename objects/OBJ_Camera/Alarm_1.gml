/// @description Deactivate objects

#region deactivate any instances far outside the camera view

	if (global.camera.deactivate) {
		var viewL, viewR, viewT, viewB, target, exemptions, arrayLength;
		viewL = global.camera.xPos - global.camera.padding;
		viewT = global.camera.yPos - global.camera.padding;
		viewR = global.camera.camR + global.camera.padding;
		viewB = global.camera.camB + global.camera.padding;
		target = global.camera.target;
		exemptions = global.camera.exemptions;
		arrayLength = array_length(exemptions);
		
		instance_activate_all();
		
		with (all) {
			if (collision_rectangle(viewL, viewT, viewR, viewB, self.id, false, false) != noone && !variable_instance_exists(self.id, "lighting") && !is_in_list(self.object_index, exemptions) && self.object_index != target) {
				instance_deactivate_object(self.id);
			}
		}
	} else {
		instance_activate_all();
	}

#endregion

alarm[1] = GAME_FPS / 15; // do deactivation every 15th of a second