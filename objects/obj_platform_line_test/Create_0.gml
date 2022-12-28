/// @description Init

// Inherit the parent event
event_inherited();

x = 0;
y = 0;
collider = new comp_collider_line();
with (collider)
	collision_flag_set_up();