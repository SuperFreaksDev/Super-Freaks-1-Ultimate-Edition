/// @description Spawn

// Inherit the parent event
event_inherited();

if (trigger_get(trigger_id))
	searchlight.active = hitbox_active.inactive;
	
angle = angle_start;
angle_previous = angle;