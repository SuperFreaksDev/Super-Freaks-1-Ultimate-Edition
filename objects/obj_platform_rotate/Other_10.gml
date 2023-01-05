/// @description Step

var _i;

angle_previous = angle;
angle += rotate_speed;

for (_i = 0; _i < array_length(colliders); _i += 2)
{
	collider_side_step(_i);
}

for (_i = 1; _i < array_length(colliders); _i += 2)
{
	collider_corner_step(_i);
}