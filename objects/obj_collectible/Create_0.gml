/// @description 

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,, -16, -16, 16, 16);
hitbox.flags = bit_set(hitbox.flags, hitbox_flags.collectible);
animate_speed = 0.125;

depth = 2;
