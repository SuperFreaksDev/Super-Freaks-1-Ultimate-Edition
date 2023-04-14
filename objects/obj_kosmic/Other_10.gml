/// @description Step

var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;

x += speed_h;
y += speed_v;

collision_flags = 0;

switch sign(x - x_previous)
{
	case -1:
		collision_left_simple();
		break;
	case 0:
	case 1:
		collision_right_simple();
		break;
}

switch sign(y - y_previous)
{
	case -1:
		collision_up_simple();
		break;
	case 0:
	case 1:
		collision_down_simple();
		break;
}

_collision_left = collision_flag_get_left();
_collision_up = collision_flag_get_up();
_collision_right = collision_flag_get_right();
_collision_down = collision_flag_get_down();
		
if (_collision_left)
{
	if (speed_h < 0)
		speed_h = -speed_h;
}
if (_collision_right)
{
	if (speed_h > 0)
		speed_h = -speed_h;
}
if (_collision_up)
{
	if (speed_v < 0)
		speed_v = -speed_v;
}
if (_collision_down)
{
	if (speed_v > 0)
		speed_v = -speed_v;
}

switch (face)
{
	case 0: //Right
		attack_y = y;
		if (collision_right_simple(x + 24, y, y, y, infinity,,, true, false))
			attack_x = global.collider_collision[collider_attach_data.collision_x];
		else
			attack_x = room_width;
		laser.shape_x2 = attack_x - x;
		break;
	case 1: //Up
		attack_x = x;
		//if (collision_up_simple(x, x, x, y - 24, infinity,,, true, false))
		if collision_up(x, x, x, y - 24, -infinity, 0, false, true, false)
			attack_y = global.collider_collision[collider_attach_data.collision_y];
		else
			attack_y = 0;
		laser.shape_y1 = attack_y - y;
		break;
	case 2: //Left
		attack_y = y;
		if (collision_left_simple(x - 24, y, y, y, infinity,,, true, false))
			attack_x = global.collider_collision[collider_attach_data.collision_x];
		else
			attack_x = 0;
		laser.shape_x1 = attack_x - x;
		break;
	case 3: //Down
		attack_x = x;
		if (collision_down_simple(x, x, x, y + 24, infinity,,, true, false))
			attack_y = global.collider_collision[collider_attach_data.collision_y];
		else
			attack_y = room_height;
		laser.shape_y2 = attack_y - y;
		break;
}