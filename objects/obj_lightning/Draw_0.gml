/// @description 

var _view_y1 = view_y1_get();

draw_set_alpha(image_alpha);
switch (state)
{
	case 0:
		break;
	case 1: //Appear
		draw_sprite(spr_lightning_appear, image_index, x, _view_y1);
		break;
	default:
		draw_sprite_stretched(spr_lightning, image_index, x - 32, _view_y1, 64, room_height);
		break;
}
draw_set_alpha(1);