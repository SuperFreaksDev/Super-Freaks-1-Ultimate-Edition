/// @description Init Game

global.demo = false;
randomize();

#region Init Components
	comp_list_camera_init();
#endregion

audio_init();
controls_init();
debug_init(false);
framerate_init();
gameplay_init();
room_transition_init();
visuals_init();

instance_create(obj_menu_pause, 0, 0);

global.font_16 = font_add_sprite(spr_font_16, ord("!"), true, 2);
global.font_title = font_add_sprite_ext(spr_font_title_card, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?,:", true, 2);

global.animate = 0;
global.game_frame_new = true;
global.instance_despawn_timer = 8;

global.hearts = 0;
global.heart_meter = 0;

global.water_active = true;
global.water_height = 256;

global.frame = 0;

gc_timer = 0;
gc_enable(false);
depth = -10000;

//show_debug_overlay(true);
