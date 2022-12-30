/// @description Init

// Inherit the parent event
event_inherited();

animate_speed = 0.125;
speed_h = speed_move;
collider_detector_sides_set(,,,, 16);
timer = new comp_timer(timer_delay, function()
{
	var _face = sign(image_xscale);
	var _drop_speed = drop_speed;
	var _object;
	var _zone = zone_index;
	
	switch (drop_type)
	{
		case "Barrel":
			_object = instance_create_layer(x, y + 32, "layer_instances", obj_crackerbarrel);
			with (_object)
			{
				face = _face;
				speed_initial = _drop_speed;
				can_despawn = false;
			}
			break;
		case "Barrel_Bounce":
			_object = instance_create_layer(x, y + 32, "layer_instances", obj_crackerbarrel,
			{
				bouncy: true,
			});
			with (_object)
			{				
				face = _face;
				speed_initial = _drop_speed;
				can_despawn = false;
			}
			break;
		case "Bomb":
			_object = instance_create_layer(x, y + 32, "layer_instances", obj_kranibomb);
			with (_object)
			{
				direction = 270;
				speed = _drop_speed;
				can_despawn = false;
			}
			break;
		case "Ball":
			_object = instance_create_layer(x, y + 32, "layer_instances", obj_crackerball);
			with (_object)
			{
				face = _face;
				speed_initial = _drop_speed;
				can_despawn = false;
			}
			break;
		default:
			break;
	}
	timer.frames = timer_frequency;
});