/// @description Step

var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;

collision_flags = 0;

if (ground_on)
{
	speed_x = lengthdir_x(speed_h, angle_ground);
	speed_y = lengthdir_y(speed_h, angle_ground);
}
else
{
	speed_v = min(speed_v + speed_grv, 6);
	speed_x = speed_h;
	speed_y = speed_v;
}
		
x += speed_x;
y += speed_y;
		
switch sign(x - x_previous)
{
	case -1:
		collision_right_simple(,,,,,,, false);
		collision_left_simple();
		break;
	case 0:
		collision_left_simple();
		collision_right_simple();
		break;
	case 1:
		collision_left_simple(,,,,,,, false);
		collision_right_simple();
		break;
}
		
if (ground_on)
{
	collision_up_simple();
	collision_down_simple(,,,, 16,, true);
	angle_ground = global.collider_collision[collider_collision.angle];
}
else
{
	switch sign(y - y_previous)
	{
		case -1:
			collision_down_simple(,,,,,,, false);
			collision_up_simple();
			break;
		case 0:
		case 1:
			collision_up_simple(,,,,,,, false);
			collision_down_simple()
			angle_ground = global.collider_collision[collider_collision.angle];
			break;
	}
}


_collision_left = collision_flag_get_left();
_collision_up = collision_flag_get_up();
_collision_right = collision_flag_get_right();
_collision_down = collision_flag_get_down();

if (_collision_down)
{
	if (_collision_up)
		instance_destroy();
		
	if (speed_v > 0)
	{
		speed_v = 0;
		ground_on = true;
		if (in_view())
			screen_shake(0, 8);
	}
}
else
{
	ground_on = false;
	collider_attach_clear();
}

show_debug_message(collider.attach_list);