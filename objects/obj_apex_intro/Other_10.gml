/// @description Update

// Inherit the parent event
event_inherited();

y = min(y + 1.5, 480);

if (y == 480)
{
	if (phase == 0)
	{
		phase = 1;
		instance_create_layer(x, y, "layer_instances", obj_boss_apex);
	}
}