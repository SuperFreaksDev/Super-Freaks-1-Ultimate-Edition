/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,, hitbox_active.active,,, -20, 0, 20, 32);
speed_h = 0;
speed_v = 0;
active = false;
animate_speed = 0.25;
fast_forward = false;

despawn_area[0] = -32;
despawn_area[1] = -96;
despawn_area[2] = 32;
despawn_area[3] = 0;
can_despawn = true;
timer = 0;