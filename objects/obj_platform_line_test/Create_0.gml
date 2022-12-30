/// @description Init

// Inherit the parent event
event_inherited();

x = 0;
y = 0;
collider = new comp_collider_line();
with (collider)
	solid_y1 = collider_solidity.semi_solid;