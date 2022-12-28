/// @description Step

if (mouse_check_button(mb_left))
{
	collider.x_offset = mouse_x;
	collider.y_offset = mouse_y;
}
else if (mouse_check_button(mb_right))
{
	collider.shape_x2 = mouse_x;
	collider.shape_y2 = mouse_y;
}