/// @description 

// Inherit the parent event
event_inherited();

hp_init(9999);
visual_face = 0;
visual_angle = 0;
visual_angle_previous = 0;

speed_h = 0;
speed_v = 0;
speed_grv = 0.25;
speed_frc = 0.125;
speed_fall = 6;

angle = 0;
angle_ground = 0;

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 64);
collider_detector_up_set(-16, 0, 16, 0, -64);
collider_detector_down_set(-16, 0, 16, 0, 64);
collider_detector_sides_set(-24, 0, 24, 0, 64);

despawn_area[0] = -32;
despawn_area[1] = -32;
despawn_area[2] = 32;
despawn_area[3] = 32;

depth = 4;