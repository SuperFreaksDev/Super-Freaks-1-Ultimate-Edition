/// @description Init

// Inherit the parent event
event_inherited();

hp_init(3);
pos = 0;
angle_previous = 0;
angle = 0;
start_x = x;
start_y = y;
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 48);
yorb_amount = 10;