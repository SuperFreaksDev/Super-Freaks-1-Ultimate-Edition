/// @description Init

// Inherit the parent event
event_inherited();

animate_speed = 0.125;
flashlight_radius = radius;
despawn_area[0] = -(flashlight_radius * 0.5);
despawn_area[1] = -(flashlight_radius * 0.5);
despawn_area[2] = (flashlight_radius * 0.5);
despawn_area[3] = (flashlight_radius * 0.5);