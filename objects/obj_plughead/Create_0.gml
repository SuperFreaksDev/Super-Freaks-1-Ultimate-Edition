/// @description Init

// Inherit the parent event
event_inherited();

speed_grv = 0.25;
speed_fall = 6;
animate_speed = 0.125;
timer = timer_delay;

collider_detector_up_set(0, 0, 0, 0, -10);
collider_detector_down_set(0, 0, 0, 0, 20);
collider_detector_sides_set(-8, 0, 8, 0, 12);

despawn_area[0] = -24;
despawn_area[1] = -24;
despawn_area[2] = 24;
despawn_area[3] = 24;