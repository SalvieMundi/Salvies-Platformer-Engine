/// @description Set depth

self.depth = LIGHTING_DEPTH_MIN;
self.casters = [];
self.lights = [];
self.lightFrameskip = (1 / LIGHT_FRAMESKIP);
self.lightUpdateCounter = lightFrameskip;
alarm[0] = 1; 
alarm[1] = 1; 
