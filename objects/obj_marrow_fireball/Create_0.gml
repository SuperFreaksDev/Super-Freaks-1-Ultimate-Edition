/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 20);
collider_detector_up_set(0, 0, 0, 0, -20);
collider_detector_down_set(0, 0, 0, 0, 20);
collider_detector_sides_set(0, 0, 0, 0, 20);
animate_speed = 0.125;
flashlight_radius = 72;