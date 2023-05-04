/// @description Step

// Inherit the parent event
event_inherited();

switch (move_direction)
{
	case "Left":
		if (bbox_left > (view_x_get() + 512))
			speed_extra = min(speed_extra + 0.1, 3);
		else
			speed_extra = max(speed_extra - 0.1, 0);
		x -= speed_move - speed_extra;
		break;
	case "Up":
		if (bbox_top > (view_y_get() + 512))
			speed_extra = min(speed_extra + 0.1, 3);
		else
			speed_extra = max(speed_extra - 0.1, 0);
		y -= speed_move - speed_extra;
		break;
	case "Right":
		if (bbox_right < (view_x_get() - 512))
			speed_extra = min(speed_extra + 0.1, 3);
		else
			speed_extra = max(speed_extra - 0.1, 0);
		x += speed_move + speed_extra;
		break;
	case "Down":
		if (bbox_bottom < (view_y_get() - 512))
			speed_extra = min(speed_extra + 0.1, 3);
		else
			speed_extra = max(speed_extra - 0.1, 0);
		y += speed_move + speed_extra;
		break;
}