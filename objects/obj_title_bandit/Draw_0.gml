/// @description 

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_title_aura, image_index, x, y, 1, 1, 0, c_white, 0.5);
gpu_set_blendmode(bm_normal);
draw_sprite(spr_title_bandit, 0, x, y);