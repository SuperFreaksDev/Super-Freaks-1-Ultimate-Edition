/// @description Step

var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;
var _attack, _attack_speed = drop_speed * sign(image_xscale);

hurt_timer_step();

if (!ground_on)
{
	if (speed_v < speed_fall)
		speed_v += min(speed_grv, speed_fall - speed_v);
			
	angle = 0;
}

timer = max(timer - 1, 0);
if (timer == 0)
{
	sprite_index = spr_plughead_attack;
	animate_speed = 0.5;
	timer = timer_frequency;
	_attack = instance_create_layer(x, y + 24, "layer_instances", obj_enemy_electric_ball);
	_attack.speed_move = _attack_speed;
}
else if (timer < timer_frequency - 8)
{
	sprite_index = spr_plughead_stand;
	animate_speed = 0.125;
}

collision_flags = 0;

if (ground_on)
{
	collision_up();
	collision_down(,,,, 16, true);
	angle_ground = global.collider_collision[collider_collision.angle];
}
else
{
	switch sign(y - y_previous)
	{
		case -1:
			collision_up();
			break;
		case 0:
		case 1:
			collision_up();
			collision_down(,,,,, true);
			angle_ground = global.collider_collision[collider_collision.angle];
			break;
	}
}

_collision_left = collision_flag_get_left();
_collision_up = collision_flag_get_up();
_collision_right = collision_flag_get_right();
_collision_down = collision_flag_get_down();
		
if (_collision_left)
{
	if (speed_h < 0)
	{
		speed_h = -speed_h;
		face = 1;
	}
}
if (_collision_right)
{
	if (speed_h > 0)
	{
		speed_h = -speed_h;
		face = -1;
	}
}
if (_collision_up)
{
	if (speed_v < 0)
	{
		speed_v = 0;
		sfx_play_global(sfx_honk);
	}
}
if (_collision_down)
{
	if (speed_v > 0)
	{
		speed_v = 0;
		ground_on = true;
	}
}
else
{
	ground_on = false;
	collider_attach_clear();
}
