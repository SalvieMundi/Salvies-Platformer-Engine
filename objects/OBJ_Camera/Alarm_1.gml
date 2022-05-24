/// @description Deactivate objects

#region deactivate any instances far outside the camera view

	if (global.camera.deactivate) {
		instance_deactivate_region(global.camera.xPos - global.camera.padding, global.camera.yPos - global.camera.padding, global.camera.camR + global.camera.padding, global.camera.camB + global.camera.padding, false, true);
		instance_activate_region(global.camera.xPos - global.camera.padding, global.camera.yPos - global.camera.padding, global.camera.camR + global.camera.padding, global.camera.camB + global.camera.padding, true);
		if (!null(global.camera.target)) instance_activate_object(global.camera.target);
		if (!null(global.camera.exemptions) && is_array(global.camera.exemptions)) {
			var arrayLength = array_length(global.camera.exemptions);
			for (var i=0; i<arrayLength; i++) {
				instance_activate_object(global.camera.exemptions[i]);
			}
		}
	} else {
		instance_activate_all();
	}

#endregion

alarm[1] = 2; //do deactivation every 2 frames
