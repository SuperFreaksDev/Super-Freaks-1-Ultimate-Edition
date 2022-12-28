/// @description Step

var _bubble;
var _direction = image_angle;
var _speed = bubble_speed;

timer++;

if (timer >= bubble_timer)
{
	timer = 0;
	
	_bubble = instance_create_layer(x, y, "layer_instances", obj_air_bubble);
	
	with (_bubble)
	{
		speed_h = lengthdir_x(_speed, _direction);
		speed_v = lengthdir_y(_speed, _direction);
		zone_index = -3;
	}
}