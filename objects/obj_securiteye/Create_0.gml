/// @description Init

// Inherit the parent event
event_inherited();

searchlight = new comp_hitbox_triangle(,, hitbox_active.passive,,, 0, 0, -64, 128, 64, 128);
animate_speed = 0.125;

if (trigger_get(trigger_id))
	searchlight.active = hitbox_active.inactive;
	
angle_start = image_angle;
angle = angle_start;
angle_previous = angle;