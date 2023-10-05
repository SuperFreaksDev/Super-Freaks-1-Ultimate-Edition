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
laser = new comp_hitbox_AABB(,, hitbox_active.inactive, enemy_hitbox_behaviors.hazard,, -4, -4, 4, 4);
attack_x = x;
attack_y = y;
can_despawn = false;

character_index = global.character_indexes.trash_can_man;