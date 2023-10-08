/// @desc

draw_line_color(0, floor(room_height / 2.5), room_width, floor(room_height / 2.5), c_red, c_red);
draw_sprite(dummy.sprite, animFrame, (window_get_width() / 4) - 64, floor(room_height / 2.5));
draw_sprite(custom.sprite, animFrame, custom.x, custom.y);