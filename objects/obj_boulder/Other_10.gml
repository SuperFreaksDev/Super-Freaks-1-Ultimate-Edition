/// @description Step

speed_y += 0.125;
y += speed_y;

if (collision_exists_down_simple())
{
	instance_create_layer(x, y, "layer_instances", obj_boss_explosion);
	instance_destroy();
}