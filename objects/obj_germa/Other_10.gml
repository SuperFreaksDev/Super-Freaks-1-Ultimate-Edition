/// @description Step

var _target = player_nearest_alive();
var _fireball;
var _collision_left, _collision_up, _collision_right, _collision_down;

collision_flags = 0;

timer = max(timer - 1, 0);

if (timer == 0)
{
	if (!is_undefined(_target) && point_distance(x, y, _target.x, _target.y) > 72)
	{
		_fireball = instance_create_layer(x, y, "layer_instances", obj_enemy_fireball, 
		{
			speed: 2,
			direction: point_direction(x, y, _target.x, _target.y),
			zone_index: -3
		});
	}
	
	timer = 160;
	blink = false;
}
else if (timer <= 24)
{
	if (timer mod 2 == 0)
		blink = !blink;
}
	
float_anim = float_anim + 4 mod 360;

speed_h *= 0.9;
speed_v *= 0.9;

x += speed_h;
y += speed_v;

switch (sign(x - x_previous))
{
	case -1:
		collision_left();
		break;
	case 0:
		collision_left();
		collision_right();
		break;
	case 1:
		collision_right();
		break;
}

switch (sign(y - y_previous))
{
	case -1:
		collision_up();
		break;
	case 0:
		collision_up();
		collision_down();
		break;
	case 1:
		collision_down();
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
	if (_collision_up)
	{
		player_hit_speed_x = 0;
		hp = 0;
		event_user(5);
	}
	if (speed_v > 0)
		speed_v = -speed_v;
}

// Inherit the parent event
event_inherited();