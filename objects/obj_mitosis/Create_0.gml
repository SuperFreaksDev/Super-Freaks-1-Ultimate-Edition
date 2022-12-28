/// @description Init

// Inherit the parent event
event_inherited();

float_anim = 0;
animate_speed = 0.125;

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 24);

timer = 96;
blink = false;