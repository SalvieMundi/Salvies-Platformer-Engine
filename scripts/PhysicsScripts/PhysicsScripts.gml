/// @function						calculate_physics(animate_gravity, precision);
/// @desc							runs all the physics based calculations, call in step
/// @arg {bool} [animate_gravity]	whether to automatically handle the gravity changing animation
/// @arg {int} [precision]			pixel precision of collision checks; a performance vs accuracy option
function calculate_physics(animate_gravity = false, precision = MIN_BLOCK_WD) {
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
		
				if (wall != noone) { 
					if (self.spd.h >= 0 && self.bbox_right <= wall.bbox_left && wall.status.left) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						if (wall.vspeed != 0) self.spd.v += wall.vspeed;
						i = collidersSz;
					} else if (self.spd.h <= 0 && self.bbox_left >= wall.bbox_right && wall.status.right) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						if (wall.vspeed != 0) self.spd.v += wall.vspeed;
						i = collidersSz;
					} else if (self.spd.v <= 0 && self.bbox_top >= wall.bbox_bottom && wall.status.bottom) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						if (wall.hspeed != 0) self.spd.h += wall.hspeed;
						i = collidersSz;
					} else if (self.spd.v >= 0 && self.bbox_bottom <= wall.bbox_top && wall.status.top) {
						if (!self.status.isGrounded) self.status.justLanded = true;
						self.status.isGrounded = true;
						self.status.groundingBlock = wall;
						if (wall.hspeed != 0) self.spd.h += wall.hspeed;
						i = collidersSz;
					}
				} else {
					self.status.justLanded = false;
					self.status.isGrounded = false;
					self.status.groundingBlock = pointer_null;
				}
			}
		}
		
		// if no grounding block is set, show not grounded
		if (self.status.groundingBlock == pointer_null) self.status.isGrounded = false;
		
		// if grounding block is not currently being collided with, show not grounded
		if (self.status.isGrounded && !is_in_list(self.status.groundingBlock, colliders) && !is_in_list(self.status.groundingBlock, insiders)) {
			self.status.justLanded = false;
			self.status.isGrounded = false;
			self.status.groundingBlock = pointer_null;
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
			var hPrecision = (precision != 0 ? precision : (_gravStr == 0 ? 1 : _gravStr*0.5)); //precision in pixels
			
			var hInside = ds_list_create();
			instance_place_list(round(self.coords.xPos), self.coords.yPos, PAR_Wall, hInside, false);
			
			var hColliders = ds_list_create();
			var hCollidersSz = 0;
			var hMax = max(abs(self.spd.h), hPrecision);
				
			for (var i=0; i<=hMax; i+=hPrecision) {
				hCollidersSz = instance_place_list(self.coords.xPos + (sign(self.spd.h)*i), self.coords.yPos, PAR_Wall, hColliders, false);
				
				for (var j=0; j<hCollidersSz; j++) {
					var hInst = ds_list_find_value(hColliders,j);
				
					if (precision != 0 && hInst != noone && (!is_in_list(hInst,hInside) || hInst.object_index == PAR_Wall) && hPrecision == precision) {
						i -= hPrecision;
						hPrecision = (_gravStr == 0 ? 1 : _gravStr*0.5);
						hMax = max(abs(self.spd.h), hPrecision);
						j=hCollidersSz;
					} else {
						if (hInst != noone && !is_in_list(hInst,hInside)) {
							if (sign(self.spd.h) <= 0 && hInst.status.right) {
								self.coords.xPos = self.coords.xPos + (sign(self.spd.h)*(i-hPrecision));
								i = hMax;
								if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
								else self.spd.h = 0;
							}
	
							if (sign(self.spd.h) >= 0 && hInst.status.left) {
								self.coords.xPos = self.coords.xPos + (sign(self.spd.h)*(i-hPrecision));
								i = hMax;
								if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
								else self.spd.h = 0;
							}
						} else if (hInst != noone && hInst.object_index == PAR_Wall) {
							self.coords.xPos -= sign(self.spd.h);
							i = hMax;
							if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
							else self.spd.h = 0;
						} else if (hInst != noone && !instance_place(self.coords.xPos + (sign(self.spd.h)*(i-hPrecision)), self.coords.yPos, hInst)) {
							if (sign(self.spd.h) <= 0 && hInst.status.right) {
								self.coords.xPos = hInst.bbox_right + sprite_xoffset;
								i = hMax;
								if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
								else self.spd.h = 0;
							}
	
							if (sign(self.spd.h) >= 0 && hInst.status.left) {
								self.coords.xPos = hInst.bbox_left - (sprite_width - sprite_xoffset);
								i = hMax;
								if (self.physics.isBouncy) self.spd.h = -0.5 * self.spd.h;
								else self.spd.h = 0;
							}
						}
					}
				}
				
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
			var vPrecision = (precision != 0 ? precision : (_gravStr == 0 ? 1 : _gravStr*0.5));
			
			var vInside = ds_list_create();
			instance_place_list(self.coords.xPos, round(self.coords.yPos), PAR_Wall, vInside, false);
				
			var vColliders = ds_list_create();
			var vCollidersSz = 0;
			var vMax = max(abs(self.spd.v), vPrecision);
				
			for (var i=0; i<=vMax; i+=vPrecision) {
				vCollidersSz = instance_place_list(self.coords.xPos, self.coords.yPos + (sign(self.spd.v)*i), PAR_Wall, vColliders, false);
				
				for (var j=0; j<vCollidersSz; j++) {
					var vInst = ds_list_find_value(vColliders,j);
			
					if (precision != 0 && vInst != noone && (!is_in_list(vInst,vInside) || vInst.object_index == PAR_Wall) && vPrecision == precision) {
						i -= vPrecision;
						vPrecision = (_gravStr == 0 ? 1 : _gravStr*0.5);
						vMax = max(abs(self.spd.v), vPrecision);
						j=vCollidersSz;
					} else {
						if (vInst != noone && !is_in_list(vInst,vInside)) {
							if (sign(self.spd.v) <= 0 && vInst.status.bottom) {
								self.coords.yPos = self.coords.yPos + (sign(self.spd.v)*(i-vPrecision));
								i = vMax;
								if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
								else self.spd.v = 0;
							}
	
							if (sign(self.spd.v) >= 0 && vInst.status.top) {
								self.coords.yPos = self.coords.yPos + (sign(self.spd.v)*(i-vPrecision));
								i = vMax;
								if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
								else self.spd.v = 0;
							}
						} else if (vInst != noone && vInst.object_index == PAR_Wall) {
							self.coords.yPos -= sign(self.spd.v);
							i = vMax;
							if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
							else self.spd.v = 0;
						} else if (vInst != noone && !instance_place(self.coords.xPos, self.coords.yPos + (sign(self.spd.v)*(i-vPrecision)), vInst)) {
							if (sign(self.spd.v) <= 0 && vInst.status.bottom) {
								self.coords.yPos = vInst.bbox_bottom + sprite_yoffset;
								i = vMax;
								if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
								else self.spd.v = 0;
							}
	
							if (sign(self.spd.v) >= 0 && vInst.status.top) {
								self.coords.yPos = vInst.bbox_top - (sprite_height - sprite_yoffset);
								i = vMax;
								if (self.physics.isBouncy) self.spd.v = -0.5 * self.spd.v;
								else self.spd.v = 0;
							}
						}
					}
				}
				
				ds_list_clear(vColliders);
			}
			
			ds_list_destroy(vColliders);
			ds_list_destroy(vInside);
		}

		// actually move
		self.y = round(self.coords.yPos); 
		self.yprevious = round(self.coords.yPrev);
		self.vspeed = self.spd.v;
	
	#endregion
}

/// @function						push_objects();
/// @desc							allows moving blocks to push things out of their way
function push_objects() {
	var _other = collision_rectangle(bbox_left, bbox_top-abs(vspeed)-1, bbox_right, bbox_bottom+abs(vspeed)+1, all, false, true);
	if (_other != noone) {
		if (variable_instance_exists(_other.id, "physics")) {
			_other.y += self.vspeed;
			if (place_meeting(x,y,_other)) _other.x += self.hspeed;
		}
	}
}