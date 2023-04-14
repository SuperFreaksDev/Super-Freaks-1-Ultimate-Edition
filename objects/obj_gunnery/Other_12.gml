/// @description Spawn

// Inherit the parent event
event_inherited();

timer = 0;
shoot_counter = 0;
shoot_spread = 0;
ground_on = false;
speed_v = 0;
state_next_set(enemy_gunnery_states.walk);