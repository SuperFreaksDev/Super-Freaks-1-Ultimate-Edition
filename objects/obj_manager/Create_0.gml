/// @description Init Game

var _binding_string;

global.demo = false;
input_multiplayer_params_set(1, 4, false);
if (file_exists("input.settings"))
{
	_binding_string = string_load("input.settings");
	if input_system_verify(_binding_string)
		input_system_import(_binding_string);
}
input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
global.input_source_mode_previous = INPUT_SOURCE_MODE.FIXED;
randomize();

#region Init Components
	comp_list_camera_init();
#endregion

audio_init();
debug_init(true);
framerate_game_init();
gameplay_init();
room_transition_init();
visuals_init();

instance_create(obj_menu_pause, 0, 0);
instance_create(obj_metronome, 0, 0);

global.font_16 = font_add_sprite(spr_font_16, ord("!"), true, 2);
global.font_12 = font_add_sprite(spr_font_12, ord("!"), true, 2);
global.font_title = font_add_sprite_ext(spr_font_title_card, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?,:\'\"", true, 2);

global.animate = 0;
global.game_frame_new = true;
global.instance_despawn_timer = 8;

global.hearts = 0;
global.heart_meter = 0;

global.water_active = true;
global.water_height = 256;

global.frame = 0;

global.music = -1;
global.music_id = 0;

global.story_mode = story_modes.kranion;

gc_timer = 0;
gc_enable(false);
depth = -10005;

//show_debug_overlay(true);