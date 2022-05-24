/// @function						cleanup_physics_structs();
/// @desc							used to properly delete all physics related structs from an object
function cleanup_physics_structs() {
	if (variable_instance_exists(self.id, "spd")) delete spd;
	if (variable_instance_exists(self.id, "status")) delete status;
	if (variable_instance_exists(self.id, "coords")) delete coords;
	if (variable_instance_exists(self.id, "physics")) { 
		delete physics.grav;
		delete physics.frict;
		delete physics;
	}
}

/// @function						cleanup_player_structs();
/// @desc							used to properly delete all player related structs from an object
function cleanup_player_structs() {
	if (variable_instance_exists(self.id, "player")) delete player;
}

/// @function						cleanup_lighting_structs();
/// @desc							used to properly delete all lighting related structs from an object
function cleanup_lighting_structs() {
	if (variable_instance_exists(self.id, "lighting")) delete lighting;
}
