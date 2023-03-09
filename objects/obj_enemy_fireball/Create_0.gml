/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 8);
collider_detector_up_set(0, 0, 0, 0, -16);
collider_detector_down_set(0, 0, 0, 0, 16);
collider_detector_sides_set(0, 0, 0, 0, 16);
animate_speed = 0.25;
flashlight_radius = 36;