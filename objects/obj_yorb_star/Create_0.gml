/// @description Init

event_inherited();

despawn_area[0] = -32;
despawn_area[1] = -32;
despawn_area[2] = 32;
despawn_area[3] = 32;

animate = 0;
rotate_speed = 8;

hitbox = new comp_hitbox_AABB(,,,,, -32, -32, 32, 32);
animate_speed = 0.125;
depth = 4;

if (global.checkpoint_death_count < CHECKPOINT_DEATH_MAX || checkpoint_id != checkpoint_id_get())
	instance_destroy();