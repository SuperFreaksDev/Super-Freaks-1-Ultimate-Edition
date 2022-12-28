/// @description Init

// Inherit the parent event
event_inherited();

speed_acc = move_speed;
speed_dec = move_speed;
speed_grv = 0.25;
state_next_set(0);

speed_h = move_speed;
speed_v = 0;

hitbox.shape_x1 = -16;
hitbox.shape_y1 = -8;
hitbox.shape_x2 = 15;
hitbox.shape_y2 = 15;
hitbox.behavior = enemy_hitbox_behaviors.hazard;

collider_detector_up_set(-8,,8,,-8);
collider_detector_sides_set(,,,,16);
collider_detector_down_set(,,,,15);

animate_speed = 0.125;