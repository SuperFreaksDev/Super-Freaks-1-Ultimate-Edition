/// @description Draw Background

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();

draw_sprite_tiled(spr_star_background_stars, image_index, (_view_x1 / 1.25) - _view_x1, (_view_y1 / 1.25) - _view_y1);
draw_sprite_tiled(spr_star_background_bricks, 0, (_view_x1 / 2) - _view_x1, (_view_y1 / 2) - _view_y1);