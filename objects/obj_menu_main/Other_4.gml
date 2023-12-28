/// @description 

var _i;

switch (global.game_mode)
{
	case game_modes.normal:
		page = main_menu_pages.story;
		option = 0;
		break;
	case game_modes.free_play:
		page = main_menu_pages.challenge_freeplay;
		index = global.level_demo;
		option = 0;
		break;
	case game_modes.randomizer:
		page = main_menu_pages.challenge;
		option = 1;
		break;
	case game_modes.speedrun:
		page = main_menu_pages.challenge;
		option = 2;
		break;
	case game_modes.boss_rush:
		page = main_menu_pages.challenge;
		option = 3;
		break;
	case game_modes.museum:
		page = main_menu_pages.museum_theater;
		option = 0;
		cutscene_index = global.game_mode_subtype;
		break;
	default:
		page = main_menu_pages.main;
		option = 0;
		break;
}

level_complete_list_reset();
museum_unlocks();
//museum_save();
for (_i = 0; _i < array_length(global.museum_stuff[museum_data.characters]); ++_i)
{
	if (global.museum_stuff[museum_data.characters][_i][museum_character_data.unlocked])
		array_push(museum_items[museum_data.characters], _i);
}
for (_i = 0; _i < array_length(global.museum_stuff[museum_data.cutscenes]); ++_i)
{
	if (global.museum_stuff[museum_data.cutscenes][_i][museum_cutscene_data.unlocked])
		array_push(museum_items[museum_data.cutscenes], _i);
}
for (_i = 0; _i < array_length(global.museum_stuff[museum_data.songs]); ++_i)
{
	array_push(museum_items[museum_data.songs], _i);
}

show_debug_message("Museum Items: " + string(museum_items));