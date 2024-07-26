/// @description Step

if (sprite_index == spr_boss_shadow_bomb_appear && animation_about_to_end())
{
	sprite_index = spr_boss_shadow_bomb;
	image_index = 0;
}

timer--;

if (timer < 1)
{
	instance_destroy();
	instance_create_layer(x, y - 32, "layer_instances", obj_explosion_bomb);
}