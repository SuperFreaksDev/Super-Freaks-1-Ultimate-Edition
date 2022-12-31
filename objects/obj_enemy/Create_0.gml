/// @description 

// Inherit the parent event
event_inherited();

hp_init();
hit_counter = 0;
player_hit = undefined;
player_hit_speed_x = 0;
player_hit_speed_y = 0;
hitbox = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.normal,, -16, -16, 16, 16);
hurt_timer_set(0);
despawn_area[0] = sprite_get_bbox_left(sprite_index);
despawn_area[1] = sprite_get_bbox_top(sprite_index);
despawn_area[2] = sprite_get_bbox_right(sprite_index);
despawn_area[3] = sprite_get_bbox_bottom(sprite_index);
target = undefined;
depth = 3;
