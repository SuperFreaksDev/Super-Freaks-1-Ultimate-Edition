/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 24);

size_previous = 0;
size = 0;
animate_speed = 0.25;

collider_detector_up_set(-8, 0, 8, 0, -24);
collider_detector_down_set(-8, 0, 8, 0, 24);
collider_detector_sides_set(-8, 0, 8, 0, 24);