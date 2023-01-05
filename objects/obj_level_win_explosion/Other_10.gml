/// @description Step

if (floor(image_index) == image_number)
	animate_speed = 0;

if (timer > 0)
	timer = max(timer - 1, 0);
if (timer == 0)
{
	timer = -1;
	level_beat();
}