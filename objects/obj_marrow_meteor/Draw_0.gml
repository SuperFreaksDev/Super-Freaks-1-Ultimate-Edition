/// @description 

draw_set_color(c_yellow);
draw_set_alpha(rectangle_fade);
draw_rectangle(x - 96, y, x + 96, room_height, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_interpolated(sprite_index);