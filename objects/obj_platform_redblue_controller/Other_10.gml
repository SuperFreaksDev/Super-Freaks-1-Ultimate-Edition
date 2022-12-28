/// @description Step

global.redblueplatformtimer--;

if (global.redblueplatformtimer <= 0)
{
	global.redblueplatformtimer = timer;
	global.redblueplatformswap = !global.redblueplatformswap;
}