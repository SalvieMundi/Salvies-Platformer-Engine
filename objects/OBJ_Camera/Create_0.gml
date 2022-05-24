/// @description Instantiate variables

window_set_size(global.resolution.external.wd, global.resolution.external.ht);
display_set_gui_size(global.resolution.internal.wd, global.resolution.internal.ht);

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = global.resolution.internal.wd;
view_hport[0] = global.resolution.internal.ht;
view_camera[0] = camera_create_view(0, 0, global.camera.wd, global.camera.ht, 0, -1, -1, -1, 0, 0);
global.camera.viewCamera = view_camera[0];
view_visible[0] = true;
view_enabled = true;
depth = -1000;

alarm[0] = 30; //resize window every half a second
alarm[1] = 2; //do deactivation every 2 frames
