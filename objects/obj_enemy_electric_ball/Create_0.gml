/// @description Init

// Wall Directions
// 0 - Ground
// 1 - Wall to Right
// 2 - Ceiling
// 3 - Wall to Left

// Inherit the parent event
event_inherited();

wall_direction = 0;
speed_h = 0;
speed_v = 0;
animate_speed = 0.25;
hitbox = new comp_hitbox_circle(,,,,, 24);