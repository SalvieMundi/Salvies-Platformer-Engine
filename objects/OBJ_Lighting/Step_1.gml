/// @description Handle frameskipping

// don't waste computations if not needed
if (global.lighting.ambient < 1) { 

	// set the light update counter correctly
	if (lightUpdateCounter > 0) {
		// if game fps drops too low, reduce lighting fps to save resources
		var fpsThreshhold = (os_browser == browser_not_a_browser ? GAME_FPS*2 : GAME_FPS);
		lightUpdateCounter -= (fps_real < fpsThreshhold ? 0.5 : 1);
	}

	// get camera positions to make frameskip work
	if (lightUpdateCounter <= 0) {
		global.camera.xFrameskip = global.camera.xPos;
		global.camera.yFrameskip = global.camera.yPos;
	}
}
