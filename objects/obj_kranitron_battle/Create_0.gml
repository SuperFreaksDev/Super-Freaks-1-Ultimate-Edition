/// @description Init

// Inherit the parent event
event_inherited();

depth = 12;
image_xscale = -4;
image_yscale = 4;
hitbox = new comp_hitbox_AABB(,, hitbox_active.active,,, -200, -100, 256, 320);
hitbox_head = new comp_hitbox_AABB(, -152, hitbox_active.active,,, -120, -120, 120, 120);
hitbox_laser = new comp_hitbox_capsule(0, 0, hitbox_active.inactive, enemy_hitbox_behaviors.hazard, 1, 0, 64, -8000, 64, 48);
timer = 0;
timer_missile = 0;
multiplier = 0;
laser_alpha = 0;
can_despawn = false;
animate_speed = 0;
hp_init(6);
boss_name = "Kranitron K 'Greg'";
yorb_amount = 0;

state_next_set(0);