/// @description Init

// Inherit the parent event
event_inherited();

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