/// @description Init

var _target;

// Inherit the parent event
event_inherited();

if (global.checkpoint[spawn_point_data.go_to_checkpoint] == true)
	_target = global.checkpoint[spawn_point_data.y];
else	
	_target = global.spawn_point[spawn_point_data.y];

if (!is_undefined(_target))
	y = _target + 32;

collider = new comp_collider_AABB(,, -1000, 0, 1000, 32);
with (collider)
	solid_y1 = collider_solidity.solid;

camera_blocker = instance_create_layer(x, y + 192, "layer_instances", obj_view_blocker);
with (camera_blocker)
{
	image_xscale = 5;
	image_yscale = 5;
	solid_left = false;
	solid_right = false;
	solid_down = false;
}

fast_forward = false;
can_despawn = false;
depth = 10;