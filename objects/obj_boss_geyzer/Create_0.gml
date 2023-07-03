/// @description Init

// Inherit the parent event
event_inherited();

hp_init(8);

collider_detector_up_set(-6, 0, 6, 0, -16);
collider_detector_sides_set(-8, 0, 16, 0, 14);
collider_detector_down_set(-8, 0, 8, 0, 24);
face = -1;
timer = 0;
wait = 0;
attack_lerp = 0;
start_x = 0;
start_y = 0;
attack_x = 0;
attack_y = 0;
can_despawn = false;
blink = false;

character_index = character_indexes.geyzer;