/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.normal, 1, -12, -24, 12, 0);

speed_h = 0;
speed_v = 0;
speed_move = 10;
speed_acc = 0.5;
speed_dec = 0.5;
target = undefined;
timer = 0;
blink = false;

state_next_set(0);

collider_detector_up_set(-8, 0, 8, 0, -24);
collider_detector_down_set(-12, 0, 12, 0, 0);
collider_detector_sides_set(-12, -12, -12, -12, 12);