/// @description Init

// Inherit the parent event
event_inherited();

animate_speed = 0;
image_index = choose(0, 1);
image_alpha = 1;
depth = choose(-1, 1);
image_xscale = choose(1, 0.5, 0.25);
image_yscale = image_xscale;
image_angle = random(359);