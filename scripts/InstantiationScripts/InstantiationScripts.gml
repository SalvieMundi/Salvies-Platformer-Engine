/// @function						instantiate_physics_structs();
/// @desc							used to properly delete all physics related structs from an object
function instantiate_physics_structs() {
	if (!variable_instance_exists(self.id, "spd")) {
		spd = 
		{
			h : self.hspeed,
			v : self.vspeed,
			hPrev : self.hspeed,
			vPrev : self.vspeed,
			mx : 12
		};
	} else {
		self.spd.h = self.hspeed;
		self.spd.v = self.vspeed;
		self.spd.hPrev = self.hspeed;
		self.spd.vPrev = self.vspeed;
		self.spd.mx = 12;
	}
	
	if (!variable_instance_exists(self.id, "status")) {
		status = 
		{
			isGrounded : false,
			justLanded : false,
			groundingBlock : pointer_null,
			state : objectState.free,
			defaultState : objectState.free
		};
	} else {
		self.status.isGrounded = false;
		self.status.justLanded = false;
		self.status.groundingBlock = pointer_null;
		self.status.state = objectState.free;
		self.status.defaultState = objectState.free;
	}
	
	if (!variable_instance_exists(self.id, "coords")) {
		coords = 
		{
			xPrev : xprevious,
			yPrev : yprevious,
			xPos : xstart,
			yPos : ystart
		};
	} else {
		self.coords.xPrev = xprevious;
		self.coords.yPrev = yprevious;
		self.coords.xPos = xstart;
		self.coords.yPos = ystart;
	}
	
	if (!variable_instance_exists(self.id, "physics")) { 
		physics = 
		{
			grav : 
			{
				type : gravType.directional,
				dir : 270,
				str : 0.25
			},
			frict : 
			{
				h : 0,
				v : 0
			},
			isBouncy : false,
			isCollidable : true
		};
	} else {
		self.physics.grav = 
		{
			type : gravType.directional,
			dir : 270,
			str : 0.25
		};
		
		self.physics.frict = 
		{
			h : 0,
			v : 0
		};
		
		self.physics.isBouncy = false;
		self.physics.isCollidable = true;
	}
}

/// @function						instantiate_player_structs();
/// @desc							used to properly create all player related structs in an object
function instantiate_player_structs() {
	if (!variable_instance_exists(self.id, "player")) {
		player = 
		{
			isPlayer1 : true,
			isPlayer2 : false,
			isPlayer3 : false,
			isPlayer4 : false
		};
	} else {
		self.player.isPlayer1 = true;
		self.player.isPlayer2 = false;
		self.player.isPlayer3 = false;
		self.player.isPlayer4 = false;
	}
	
	if (!variable_instance_exists(self.id, "status")) {
		status = 
		{
			state : playerState.free,
			defaultState : playerState.free
		};
	} else {
		self.status.state = playerState.free;
		self.status.defaultState = playerState.free;
	}
}

/// @function						instantiate_light_emitter_structs();
/// @desc							used to properly create all light emitter related structs in an object
function instantiate_light_emitter_structs() {
	if (!variable_instance_exists(self.id, "lighting")) {
		self.lighting = {
			isEmitter : true,
			distance : 1,
			strength : 1,
			clr : c_white,
			flicker : FLICKER_STANDARD,
			surface : noone
		};
	} else {
		self.lighting.isEmitter = true;
		self.lighting.distance = 1;
		self.lighting.strength = 1;
		self.lighting.clr = c_white;
		self.lighting.flicker = FLICKER_STANDARD;
		self.lighting.surface = noone;
	}
}

/// @function						instantiate_shadow_caster_structs();
/// @desc							used to properly create all shadow casting related structs in an object
function instantiate_shadow_caster_structs() {
	if (!variable_instance_exists(self.id, "lighting")) {
		self.lighting = {
			isCaster : true,
			distance : 2048,
			strength : 1,
			clr : c_black
		};
	} else {
		self.lighting.isCaster = true;
		self.lighting.distance = 2048;
		self.lighting.strength = 1;
		self.lighting.clr = c_black;
	}
}
