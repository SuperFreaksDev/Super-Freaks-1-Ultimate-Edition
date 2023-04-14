/// @description Step

var _fireball, _shoot_direction;
var _zone = zone_index;

// Inherit the parent event
event_inherited();

angle_previous = angle;
angle = (angle + rotate_speed) mod 360;

if (angle < 0)
{
	angle += 360;
	angle_previous += 360;
}

timer++;

if (timer >= shoot_frequency)
{
	_shoot_direction = angle;
	
	repeat(4)
	{
		_fireball = instance_create_layer(x + lengthdir_x(48, _shoot_direction), y + lengthdir_y(48, _shoot_direction), "layer_instances", obj_enemy_fireball, 
		{
			speed: 4,
			direction: _shoot_direction,
			zone_index: _zone
		});
		_shoot_direction += 90;
	}
	
	if (in_view())
		sfx_play_global(sfx_explode_short);
	
	timer = 0;
}