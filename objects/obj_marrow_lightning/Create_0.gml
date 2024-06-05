/// @description Init

// Inherit the parent event
event_inherited();

can_despawn = false;
y = 928;

timer = 0;
timer_max = 36;
hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive,,, -8, -1000, 8, 0);

rectangle_radius = 0;

animate_speed = 0.25;
state_next_set(0);

spawn_left = true;
spawn_right = true;
fast_forward = false;