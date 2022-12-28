/// @description Step

var _i;

angle_previous = angle;
angle += rotate_speed;

for (_i = 0; _i < array_length(colliders); ++_i)
{
	collider_step(_i);
}

//show_debug_message(broad_phase_collider);