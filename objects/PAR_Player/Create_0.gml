/// @description Instantiate variables

instantiate_physics_structs();
instantiate_player_structs();

self.physics.grav.type = self.gravityType;
self.physics.grav.dir = self.gravityDirection;
self.physics.grav.str = self.gravityStrength;

event_inherited();
