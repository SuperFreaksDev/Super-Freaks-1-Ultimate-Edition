/// @description Step

if (fade)
{
	fade_effect = max(fade_effect - 0.025, 0);
	if (fade_effect == 0)
		fade = false;
}
else
{
	fade_effect = min(fade_effect + 0.025, 1);
	if (fade_effect == 1)
		fade = true;
}