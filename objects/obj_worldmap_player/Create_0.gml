/// @description Init

// Inherit the parent event
event_inherited();
level_id = -1;

state_next_set(0);
hitbox = new comp_hitbox_AABB(,,hitbox_active.active,,, -16, -16, 16, 16);
depth = -10;