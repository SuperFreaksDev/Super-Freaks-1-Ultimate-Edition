/// @description Step

if (global.lightbulb_timer == 0)
	draw_alpha = min(draw_alpha + 0.025, 1);
else
	draw_alpha = max(draw_alpha - 0.25, 0);