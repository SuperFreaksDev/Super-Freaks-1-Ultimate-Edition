/// @description Step

timer -= 0.1;

if (timer < 0)
{
	image_alpha -= 0.25;
	if (image_alpha < 0)
		instance_destroy();
}