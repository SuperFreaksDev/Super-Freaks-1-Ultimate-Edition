/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,, -20, -24, 20, 24);
animate_speed = 0.125;
flashlight_radius = 64;

despawn_area[0] = -(flashlight_radius * 0.5);
despawn_area[1] = -(flashlight_radius * 0.5);
despawn_area[2] = (flashlight_radius * 0.5);
despawn_area[3] = (flashlight_radius * 0.5);