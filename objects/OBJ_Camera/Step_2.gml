/// @description Handle camera movement

#region handle camera zoom

	if (global.camera.wd < (global.resolution.internal.wd * global.camera.zoom)) {
		global.camera.wd -= (global.resolution.internal.wd - (global.resolution.internal.wd * global.camera.zoom)) * (global.camera.type == cameraType.smooth ? global.camera.lerp*0.25 : 1);
	} else if (global.camera.wd > (global.resolution.internal.wd * global.camera.zoom))  {
		global.camera.wd -= (global.resolution.internal.wd + (global.resolution.internal.wd * global.camera.zoom)) * (global.camera.type == cameraType.smooth ? global.camera.lerp*0.25 : 1);
	}
	
	if (global.camera.ht < (global.resolution.internal.ht * global.camera.zoom)) {
		global.camera.ht -= (global.resolution.internal.ht - (global.resolution.internal.ht * global.camera.zoom)) * (global.camera.type == cameraType.smooth ? global.camera.lerp*0.25 : 1);
	} else if (global.camera.ht > (global.resolution.internal.ht * global.camera.zoom)) {
		global.camera.ht -= (global.resolution.internal.ht + (global.resolution.internal.ht * global.camera.zoom)) * (global.camera.type == cameraType.smooth ? global.camera.lerp*0.25 : 1);
	}
	
	camera_set_view_size(global.camera.viewCamera, global.camera.wd, global.camera.ht); 

#endregion

#region determine where to put camera

	if (!null(global.camera.target) && instance_exists(global.camera.target)) {
		if ((global.camera.target).x > (global.camera.xPos + global.camera.padding + (global.camera.wd/2))) {
			global.camera.xPos += ((global.camera.target).x - (global.camera.xPos + global.camera.padding + (global.camera.wd/2))) * (global.camera.type == cameraType.smooth ? global.camera.lerp : 1);
		} else if ((global.camera.target).x < (global.camera.xPos - global.camera.padding + (global.camera.wd/2))) {
			global.camera.xPos += ((global.camera.target).x - (global.camera.xPos - global.camera.padding + (global.camera.wd/2))) * (global.camera.type == cameraType.smooth ? global.camera.lerp : 1);
		}

		if ((global.camera.target).y > (global.camera.yPos + global.camera.padding + (global.camera.ht/2))) {
			global.camera.yPos += ((global.camera.target).y - (global.camera.yPos + global.camera.padding + (global.camera.ht/2))) * (global.camera.type == cameraType.smooth ? global.camera.lerp : 1);
		} else if ((global.camera.target).y < (global.camera.yPos - global.camera.padding + (global.camera.ht/2))) {
			global.camera.yPos += ((global.camera.target).y - (global.camera.yPos - global.camera.padding + (global.camera.ht/2))) * (global.camera.type == cameraType.smooth ? global.camera.lerp : 1);
		}
	}

#endregion

#region re-adjust to stay inside room

	if (global.camera.xPos < 0) global.camera.xPos = 0;
	else if (global.camera.xPos > room_width - global.camera.wd) global.camera.xPos = room_width - global.camera.wd;

	if (global.camera.yPos < 0) global.camera.yPos = 0;
	else if (global.camera.yPos > room_height - global.camera.ht) global.camera.yPos = room_height - global.camera.ht;

#endregion

#region deactivate any instances far outside the camera view

	if (global.camera.deactivate) {
		instance_deactivate_region(global.camera.xPos - global.camera.padding, global.camera.yPos - global.camera.padding, global.camera.xPos + global.camera.wd + global.camera.padding, global.camera.yPos + global.camera.ht + global.camera.padding, false, true);
		instance_activate_region(global.camera.xPos - global.camera.padding, global.camera.yPos - global.camera.padding, global.camera.xPos + global.camera.wd + global.camera.padding, global.camera.yPos + global.camera.ht + global.camera.padding, true);
		if (!null(global.camera.target)) instance_activate_object(global.camera.target);
		if (!null(global.camera.exemptions) && is_array(global.camera.exemptions)) {
			var arrayLength = array_length(global.camera.exemptions);
			for (var i=0; i<arrayLength; i++) {
				instance_activate_object(global.camera.exemptions[i]);
			}
		}
	}

#endregion

#region handle shake

	if (global.camera.isShaking) {
		camera_set_view_pos(global.camera.viewCamera, global.camera.xPos + irandom_range(-1*global.camera.shakeAmount, global.camera.shakeAmount), global.camera.yPos + irandom_range(-1*global.camera.shakeAmount, global.camera.shakeAmount));
		if (global.camera.shakeFrames > 0) {
			global.camera.shakeFrames--;
		} else if (global.camera.shakeFrames == 0) {
			global.camera.isShaking = false;
			global.camera.shakeFrames = 5;
		}
	} else {
		camera_set_view_pos(global.camera.viewCamera, global.camera.xPos, global.camera.yPos);
	}

#endregion