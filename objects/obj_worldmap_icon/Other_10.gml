/// @description Step


if (hover_over == true)
	pic_alpha = min(pic_alpha + 0.1, 1);
else
	pic_alpha = max(pic_alpha - 0.1, 0);
	
hover_over = false;