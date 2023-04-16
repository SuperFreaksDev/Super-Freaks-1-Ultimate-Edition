/// @description Init

// Inherit the parent event
event_inherited();

can_despawn = false;
x = room_width;

timer = 0;
hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive,,, -room_width, -48, 0, 48);
multiplier = 0;

state_next_set(0);