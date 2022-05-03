/// @function						calculate_physics(animate_gravity);
/// @desc							runs all the physics based calculations, call in step
/// @arg {bool} [animate_gravity]	whether to automatically handle the gravity changing animation
function calculate_physics(animate_gravity = false) {
	#region handle changes in gravity
	
		if (animate_gravity) {
			if (self.image_angle != snap_direction(wrap(self.physics.grav.dir+90, 0, 360))) {
				self.status.state = objectState.switchingGravity;
				self.physics.isCollidable = false;
				if (round(self.image_angle) == self.image_angle && place_meeting(self.x+lengthdir_x(12,self.physics.grav.dir), self.y+lengthdir_y(12,self.physics.grav.dir), PAR_Wall)) {
					self.x += lengthdir_x(12,self.physics.grav.dir+180);
					self.y += lengthdir_y(12,self.physics.grav.dir+180);
				} else {
					self.hspeed = 0;
					self.vspeed = 0;
				}
	
				self.image_angle = lerp(self.image_angle, snap_direction(wrap(self.physics.grav.dir+90, 0, 360)), 0.2);
	
				if (round(self.image_angle) == snap_direction(wrap(self.physics.grav.dir+90, 0, 360))) {
					self.image_angle = round(self.image_angle);
					if (!place_meeting(self.x+lengthdir_x(4,self.physics.grav.dir), self.y+lengthdir_y(4,self.physics.grav.dir), PAR_Wall)) {
						self.x += lengthdir_x(4,self.physics.grav.dir);
						self.y += lengthdir_y(4,self.physics.grav.dir);
					}
					self.physics.isCollidable = true;
					self.status.state = self.status.defaultState;
				}
			}
		}

	#endregion
	
	#region get gms variables into our own

		self.coords =
		{
			xPos : self.x,
			yPos : self.y,
			xPrev : self.xprevious,
			yPrev : self.yprevious
		};

		self.spd.hPrev = self.spd.h;
		self.spd.vPrev = self.spd.v;
		self.spd.h = self.hspeed;
		self.spd.v = self.vspeed;
	
	#endregion
	
	#region determine how gravity is calculated
	
		var _gravDir = self.physics.grav.dir;
		var _gravStr = self.physics.grav.str;
		
		if (global.physics.grav.useGlobal) {
			if (global.physics.grav.type == gravType.directional) {
				_gravDir = global.physics.grav.dir;
				self.physics.grav.dir = _gravDir;
				_gravStr = global.physics.grav.str;
				self.physics.grav.str = _gravStr;
			} else if (global.physics.grav.type == gravType.object) {
				if (instance_exists(PAR_GravityEmitter)) {
					var nearest = instance_nearest(self.x, self.y, PAR_GravityEmitter);
					_gravDir = point_direction(x, y, nearest.x, nearest.y);
					self.physics.grav.dir = _gravDir;
					_gravStr = global.physics.grav.str;
				} else {
					_gravDir = global.physics.grav.dir;
					self.physics.grav.dir = _gravDir;
					_gravStr = global.physics.grav.str;
					self.physics.grav.str = _gravStr;
				}
			}
		} else {
			if (self.physics.grav.type == gravType.directional) {
				_gravDir = self.physics.grav.dir;
				_gravStr = self.physics.grav.str;
			} else if (self.physics.grav.type == gravType.object) {
				if (instance_exists(PAR_GravityEmitter)) {
					var nearest = instance_nearest(self.x, self.y, PAR_GravityEmitter);
					_gravDir = point_direction(x, y, nearest.x, nearest.y);
					self.physics.grav.dir = _gravDir;
					_gravStr = self.physics.grav.str;
				} else {
					_gravDir = self.physics.grav.dir;
					_gravStr = self.physics.grav.str;
				}
			}
		}
		
	#endregion

	#region determine object status
	
		// set justLanded to false by default
		self.status.justLanded = false;
		
		var colliders = ds_list_create();
		var insiders = ds_list_create();
		var wall = pointer_null;
		var _x = lengthdir_x((os_browser != browser_not_a_browser ? 1 : _gravStr), snap_direction(_gravDir));
		var _y = lengthdir_y((os_browser != browser_not_a_browser ? 1 : _gravStr), snap_direction(_gravDir));
		
		var collidersSz = instance_place_list(self.coords.xPos + _x, self.coords.yPos + _y, PAR_Wall, colliders, false);
		instance_place_list(self.coords.xPos, self.coords.yPos, PAR_Wall, insiders, false);
		
		if (collidersSz == 0) {
				self.status.justLanded = false;
				self.status.isGrounded = false;
				self.status.groundingBlock = pointer_null;
		} else {
			for (var i=0; i<collidersSz; i++) {
				wall = ds_list_find_value(colliders, i);
		
				if (wall != noone && !is_in_list(wall, insiders)) { 
					if (self.spd.h >= 0 && self.bbox_right <= wall.bbox_left && wall.status.left) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						i = collidersSz;
					} else if (self.spd.h <= 0 && self.bbox_left >= wall.bbox_right && wall.status.right) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						i = collidersSz;
					} else if (self.spd.v <= 0 && self.bbox_top >= wall.bbox_bottom && wall.status.bottom) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						i = collidersSz;
					} else if (self.spd.v >= 0 && self.bbox_bottom <= wall.bbox_top && wall.status.top) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						i = collidersSz;
					}
				} else {
					self.status.justLanded = false;
					self.status.isGrounded = false;
					self.status.groundingBlock = pointer_null;
				}
			}
		}
		
		ds_list_destroy(colliders);
		ds_list_destroy(insiders);

	#endregion

	#region add gravity's effect to the vsp and hsp
		
		self.spd.h += lengthdir_x(_gravStr, _gravDir);
		self.spd.v += lengthdir_y(_gravStr, _gravDir);

	#endregion

	#region calculate new xpos after collision checks and effects

		// set previous x pos
		self.coords.xPrev = self.coords.xPos;
	
		// limit speed
		if (abs(self.spd.h) > self.spd.mx) self.spd.h = sign(self.spd.h) * self.spd.mx;
	
		// apply friction
		if (self.physics.frict.h > 0) {
			if (abs(self.spd.h) > self.physics.frict.h) self.spd.h = self.spd.h * self.physics.frict.h;
			else self.spd.h = 0;
		}
	
		// apply sticky block effects
		var stickyH = 0.35; 
		if (self.status.isGrounded && self.status.groundingBlock != pointer_null && (self.status.groundingBlock).status.sticky) {
			if (abs(self.spd.h) > stickyH) self.spd.h = self.spd.h * stickyH;
			else self.spd.h = 0;
		}
	
		// apply icy block effects
		var icyH = 0.98;
		if (self.status.isGrounded && self.status.groundingBlock != pointer_null && (self.status.groundingBlock).status.icy) {
			if (abs(self.spd.hPrev) > abs(self.spd.h)) self.spd.h = self.spd.hPrev * icyH;
			if (abs(self.spd.h) < 1) self.spd.h = 0;
		}

		//check every pixel between current position and next position for collisions, react accordingly
		if (self.physics.isCollidable) {
			var hPrecision = _gravStr*0.5; //precision in pixels
			var hInside = ds_list_create();
			var hColliders = ds_list_create();
			var hCollidersSz = 0;
				
			for (var i=0; i<=max(abs(self.spd.h), hPrecision); i+=hPrecision) {
				instance_place_list(self.coords.xPos, self.coords.yPos, PAR_Wall, hInside, false);
				hCollidersSz = instance_place_list(self.coords.xPos + (sign(self.spd.h)*i), self.coords.yPos, PAR_Wall, hColliders, false);
				
				for (var j=0; j<hCollidersSz; j++) {
					var hInst = ds_list_find_value(hColliders,j);
				
					if (hInst != noone && !is_in_list(hInst,hInside)) {
						if (sign(self.spd.h) <= 0 && hInst.status.right) {
							self.coords.xPos = self.coords.xPos + (sign(self.spd.h)*(i-hPrecision));
							i = max(abs(self.spd.h), hPrecision);
							if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
							else self.spd.h = 0;
						}
	
						if (sign(self.spd.h) >= 0 && hInst.status.left) {
							self.coords.xPos = self.coords.xPos + (sign(self.spd.h)*(i-hPrecision));
							i = max(abs(self.spd.h), hPrecision);
							if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
							else self.spd.h = 0;
						}
					} else if (hInst != noone && hInst.object_index == PAR_Wall) {
						self.coords.xPos -= sign(self.spd.h);
						i = max(abs(self.spd.h), hPrecision);
						if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
						else self.spd.h = 0;
					}
				}
				
				ds_list_clear(hInside);
				ds_list_clear(hColliders);
			}
			
			ds_list_destroy(hColliders);
			ds_list_destroy(hInside);
		}

		// actually move
		self.x = round(self.coords.xPos); 
		self.xprevious = round(self.coords.xPrev); 
		self.hspeed = self.spd.h;
	
	#endregion

	#region calculate new ypos after collision checks and effects

		// set prev y pos
		self.coords.yPrev = self.coords.yPos;
	
		// limit speed
		if (abs(self.spd.v) > self.spd.mx) self.spd.v = sign(self.spd.v) * self.spd.mx;
	
		// apply friction
		if (self.physics.frict.v > 0) {
			if (abs(self.spd.v) > self.physics.frict.v) self.spd.v = self.spd.v * self.physics.frict.v;
			else self.spd.v = 0;
		}
	
		// apply sticky block effects
		var stickyV = 0.35;
		if (self.status.isGrounded && self.status.groundingBlock != pointer_null && (self.status.groundingBlock).status.sticky) {
			if (abs(self.spd.v) > stickyV) self.spd.v = self.spd.v * stickyV;
			else self.spd.v = 0;
		}
	
		// apply icy block effects
		var icyV = 0.98; 
		if (self.status.isGrounded && self.status.groundingBlock != pointer_null && (self.status.groundingBlock).status.icy) {
			if (abs(self.spd.vPrev) > abs(self.spd.v)) self.spd.v = self.spd.vPrev * icyV;
			if (abs(self.spd.v) < 1) self.spd.v = 0;
		}

		//check every pixel between current position and next position for collisions, react accordingly
		if (self.physics.isCollidable) {
			var vPrecision = _gravStr*0.5;
			var vInside = ds_list_create();
			var vColliders = ds_list_create();
			var vCollidersSz = 0;
				
			for (var i=0; i<max(abs(self.spd.v), vPrecision); i+=vPrecision) {
				instance_place_list(self.coords.xPos, self.coords.yPos, PAR_Wall, vInside, false);
				vCollidersSz = instance_place_list(self.coords.xPos, self.coords.yPos + (sign(self.spd.v)*i), PAR_Wall, vColliders, false);
				
				for (var j=0; j<vCollidersSz; j++) {
					var vInst = ds_list_find_value(vColliders,j);
		
					if (vInst != noone && !is_in_list(vInst,vInside)) {
						if (sign(self.spd.v) <= 0 && vInst.status.bottom) {
							self.coords.yPos = self.coords.yPos + (sign(self.spd.v)*(i-vPrecision));
							i = max(abs(self.spd.v), vPrecision);
							if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
							else self.spd.v = 0;
						}
	
						if (sign(self.spd.v) >= 0 && vInst.status.top) {
							self.coords.yPos = self.coords.yPos + (sign(self.spd.v)*(i-vPrecision));
							i = max(abs(self.spd.v), vPrecision);
							if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
							else self.spd.v = 0;
						}
					} else if (vInst != noone && vInst.object_index == PAR_Wall) {
						self.coords.yPos -= sign(self.spd.v);
						i = max(abs(self.spd.v), vPrecision);
						if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
						else self.spd.v = 0;
					}
				}
				
				ds_list_clear(vInside);
				ds_list_clear(vColliders);
			}
			
			ds_list_destroy(vInside);
			ds_list_destroy(vColliders);
		}

		// actually move
		self.y = round(self.coords.yPos); 
		self.yprevious = round(self.coords.yPrev);
		self.vspeed = self.spd.v;
	
	#endregion
}