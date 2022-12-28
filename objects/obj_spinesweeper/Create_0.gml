/// @description 

var _range_half = range / 2;

// Inherit the parent event
event_inherited();

animate_speed = 0.125;
size_previous = 1;
size = 1;
timer = 0;

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.hazard, 0, 24);

despawn_area[0] = -_range_half;
despawn_area[1] = -_range_half;
despawn_area[2] = _range_half;
despawn_area[3] = _range_half;

state_next_set(0);