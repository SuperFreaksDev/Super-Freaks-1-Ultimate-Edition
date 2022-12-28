/// @description Spawn

// Inherit the parent event
event_inherited();

if (on)
	state_next_set(0);
else
	state_next_set(1);