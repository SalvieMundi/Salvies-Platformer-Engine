/// @description Set up view & camera
if (!view_enabled) {
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = global.resolution.internal.wd;
	view_hport[0] = global.resolution.internal.ht;
	view_camera[0] = camera_create_view(0, 0, global.camera.wd, global.camera.ht, 0, -1, -1, -1, 0, 0);
	global.camera.viewCamera = view_camera[0];
	view_visible[0] = true;
	view_enabled = true;
}

global.camera.xPos = (!null(global.camera.target) && instance_exists(global.camera.target) ? (global.camera.target).x-(global.camera.wd/2) : 0);
global.camera.yPos = (!null(global.camera.target) && instance_exists(global.camera.target) ? (global.camera.target).y-(global.camera.ht/2) : 0);
