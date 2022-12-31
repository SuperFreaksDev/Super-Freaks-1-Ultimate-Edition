/// @description Death

var _clone;
var _direction = point_direction(0, 0, player_hit_speed_x, player_hit_speed_y);

if (image_xscale >= 1)
{
	_clone = instance_create_layer(x, y, "layer_instances", obj_germa);
	with (_clone)
	{
		speed_h = lengthdir_x(8, _direction);
		speed_v = lengthdir_y(8, _direction);
		timer = 64;
		image_xscale = 0.5;
		image_yscale = 0.5;
		hitbox.behavior = enemy_hitbox_behaviors.normal;
	}
	_clone = instance_create_layer(x, y, "layer_instances", obj_germa);
	with (_clone)
	{
		speed_h = lengthdir_x(7, _direction + 45);
		speed_v = lengthdir_y(7, _direction + 45);
		timer = 128;
		image_xscale = 0.5;
		image_yscale = 0.5;
		hitbox.behavior = enemy_hitbox_behaviors.normal;
	}
	_clone = instance_create_layer(x, y, "layer_instances", obj_germa);
	with (_clone)
	{
		speed_h = lengthdir_x(7, _direction - 45);
		speed_v = lengthdir_y(7, _direction - 45);
		timer = 96;
		image_xscale = 0.5;
		image_yscale = 0.5;
		hitbox.behavior = enemy_hitbox_behaviors.normal;
	}
	instance_destroy();
}
else
	event_inherited();