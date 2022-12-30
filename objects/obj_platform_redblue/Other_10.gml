/// @description Step

// Inherit the parent event
event_inherited();

flash_effect = max(flash_effect - 0.125, 0);

switch (image_index == global.redblueplatformswap)
{
	case false:
		with (collider)
		{
			solid_x1 = collider_solidity.NA;
			solid_y1 = collider_solidity.NA;
			solid_x2 = collider_solidity.NA;
			solid_y2 = collider_solidity.NA;
		}
		alpha = 0.25;
		break;
	case true:
		with (collider)
		{
			solid_x1 = collider_solidity.solid;
			solid_y1 = collider_solidity.solid;
			solid_x2 = collider_solidity.solid;
			solid_y2 = collider_solidity.solid;
		}
		alpha = 1;
		
		if (global.redblueplatformtimer < 64 && (global.redblueplatformtimer mod 16 == 0))
			flash_effect = 0.75;
		break;
}