/// @description 

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,,-48, -48, 48, 48);
with (hitbox)
	hitbox_bitmask_set(,,,,true);
	
despawn_area[0] = -48;
despawn_area[1] = -48;
despawn_area[1] = 48;
despawn_area[2] = 48;
	
depth = 5;

if (checkpoint_id <= global.checkpoint[spawn_point_data.checkpoint_id])
{
	active = true;
	animate_speed = 0.125;
}
else
{
	active = false;
	animate_speed = 0;
}