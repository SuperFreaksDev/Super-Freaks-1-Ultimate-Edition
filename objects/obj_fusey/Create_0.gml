/// @description 

// Inherit the parent event
event_inherited();

collider_detector_up_set(0, 0, 0, 0, -10);
collider_detector_down_set(0, 0, 0, 0, 18);
collider_detector_sides_set(-8, 0, 8, 0, 12);

animate_speed = 0.25;
hp_init(9999);
countdown = false;
countdown_timer = 96;
speed_walk = 1;
sound_run = -1;
timer_seek = -1;