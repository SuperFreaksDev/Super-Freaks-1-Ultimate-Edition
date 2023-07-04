/// @description Init

// Inherit the parent event
event_inherited();

hp_init(2);
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 48);
yorb_amount = 10;

angle_start = image_angle;
angle = angle_start;
angle_previous = angle_start;
timer = -shoot_delay;

blink = false;