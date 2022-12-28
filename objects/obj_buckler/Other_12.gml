/// @description Spawn

// Inherit the parent event
event_inherited();

timer = 0;
shoot_counter = 0;
speed_v = 0;
ground_on = false;
state_next_set(enemy_buckler_states.ready);