/// @description Init

// Inherit the parent event
event_inherited();

can_despawn = false;
y = 0;

timer = 0;
hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive,,, -24, 0, 24, room_height + 256);

animate_speed = 0.25;
state_next_set(0);