/// @description 

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_aura_2, image_index, x, y, 2, 2, 0, c_white, 0.5);
gpu_set_blendmode(bm_normal);
draw_sprite(spr_title_swordsman, 0, x, y);