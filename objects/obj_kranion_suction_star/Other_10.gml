/// @description Step

lerp_is_a_funny_word = min(lerp_is_a_funny_word + 0.05, 1);

if (!instance_exists(obj_boss_kranion_final))
{
	instance_destroy();
	exit;
}

x = lerp(xstart, obj_boss_kranion_final.x, lerp_is_a_funny_word);
y = lerp(ystart, obj_boss_kranion_final.y, lerp_is_a_funny_word);

if (lerp_is_a_funny_word == 1)
	instance_destroy();