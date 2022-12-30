/// @description Step

var _target = player_nearest_alive();
var _fireball;
var _zone = zone_index;

if (!is_undefined(_target))
{
	if (_target.x > x)
		face = 1;
	else
		face = -1;
}

timer = max(timer - 1, 0);

if (timer == 0)
{
	sprite_index = spr_propello;
	if (!is_undefined(_target) && point_distance(x, y, _target.x, _target.y) > 72)
	{
		_fireball = instance_create_layer(x, y, "layer_instances", obj_enemy_fireball, 
		{
			speed: 2,
			direction: point_direction(x, y, _target.x, _target.y),
			zone_index: _zone
		});
	}
	
	timer = 160;
}
else if (timer < 32)
	sprite_index = spr_propello_prepare;
	
y = ystart + lengthdir_y(16, float_anim);
float_anim = float_anim + 4 mod 360;

// Inherit the parent event
event_inherited();