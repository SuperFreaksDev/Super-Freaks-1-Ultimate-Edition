/// @description 

instance_destroy();
sfx_play_global(sfx_time_slow);

if (instance_exists(obj_slowmo_effect))
	obj_slowmo_effect.slowmo_timer.frames = 256;
else
	instance_create_layer(0, 0, "layer_instances", obj_slowmo_effect);