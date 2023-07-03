/// @description Init

var _radius = 64 * image_xscale;
var _collider_size = 28 * image_xscale;

// Inherit the parent event
event_inherited();

hp_init(6);

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, _radius);
spike = false;
speed_grv = 0.25;
speed_frc_air = 0.99;
angle = 0;
angle_previous = 0;
blink = false;

timer = 0;
state_next_set(0);

collider_detector_sides_set(-_collider_size,, _collider_size,, _radius);
collider_detector_up_set(-_collider_size,, _collider_size,, -_radius);
collider_detector_down_set(-_collider_size,, _collider_size,, _radius);