draw_set_color(c_red);
draw_set_alpha(0.5);
draw_rectangle(x - rectangle_radius, y - 1000, x + rectangle_radius, y, false);

draw_set_color(c_white);
draw_set_alpha(1);
if (state != 0)
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1000, 0, c_white, image_alpha);