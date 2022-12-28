/// @description Step

// Inherit the parent event
event_inherited();

flash_effect = max(flash_effect - 0.125, 0);

switch (image_index == global.redblueplatformswap)
{
	case false:
		with (collider)
			collision_flags_set_all(false, false, false, false);
		alpha = 0.25;
		break;
	case true:
		with (collider)
			collision_flags_set_all(true, true, true, true);
		alpha = 1;
		
		if (global.redblueplatformtimer < 64 && (global.redblueplatformtimer mod 16 == 0))
			flash_effect = 0.75;
		break;
}