/// @description 

// Inherit the parent event
event_inherited();

collider_detector_up_set(0, 0, 0, 0, -10);
collider_detector_down_set(0, 0, 0, 0, 18);
collider_detector_sides_set(-8, 0, 8, 0, 12);

speed_walk = walk_speed;
animate_speed = speed_walk * 0.25;
