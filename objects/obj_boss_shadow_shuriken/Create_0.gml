/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 16);
collider_detector_up_set(0, 0, 0, 0, -16);
collider_detector_down_set(0, 0, 0, 0, 16);
collider_detector_sides_set(0, 0, 0, 0, 16);
animate_speed = 0.25;
flashlight_radius = 36;

timer = 32;
state = 0;
state_next_set(0);
image_angle_previous = image_angle;