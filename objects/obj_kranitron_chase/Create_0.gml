/// @description Init

var _active = active;

// Inherit the parent event
event_inherited();

depth = 12;
image_xscale = 4;
image_yscale = 4;
hitbox = new comp_hitbox_AABB(,, hitbox_active.passive,,, -256, -320, 256, 320);
camera_blocker = instance_create_layer(x + 960, y, "layer_instances", obj_view_blocker);
can_despawn = false;
animate_speed = 0;
fade = 2;
fast_forward = false;

with (camera_blocker)
{
	image_xscale = 6;
	image_yscale = 1000;
	solid_left = !_active;
	solid_right = false;
	solid_down = false;
	solid_up = false;
}

if (_active)
	state_next_set(1);
else
	state_next_set(0);