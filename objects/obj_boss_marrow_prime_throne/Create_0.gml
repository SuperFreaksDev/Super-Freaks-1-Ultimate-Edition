/// @description Init

// Inherit the parent event
event_inherited();

collider_detector_sides_set(0, 0, 0, 0, 88);

x = 800;
can_despawn = false;
platform = new comp_collider_AABB(0, 44, -64, 0, 64, 32);
animate_speed = 0.125;


if (global.boss_phase > 0)
{
	y = 752;
	speed_h = choose(-1, 1);
}
else
	y = 512;

if (global.boss_phase < 2)
	instance_create(obj_boss_marrow_prime_1, x, y);

depth = 2;
