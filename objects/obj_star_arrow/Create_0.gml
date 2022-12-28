/// @description Init

// Inherit the parent event
event_inherited();

rotate_effect = 0;
rotate_effect_previous = 0;
rotate_speed = 2;

hitbox = new comp_hitbox_circle(,,,,, 32);
with (hitbox)
	hitbox_bitmask_set(,,,, true);
