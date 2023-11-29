/// @description Init

enum menu_character_select_pages
{
	difficulty_select = 0,
	character_select,
	main,
	modifiers,
}

unlockedChars = [];

for (var i = 0; i < array_length(struct_get_names(global.character_indexes)); i++)
{
	show_debug_message(global.characters_unlocked);
	if (global.characters_unlocked[i][global.story_mode])
		if (array_length(unlockedChars) == 0)
		{
			for (_player_num = 0; _player_num <= player_numbers.count; _player_num++)
			{
				//global.player_list[_player_num][player_data.character_index] = i;
			}
		}
		array_push(unlockedChars, i);
}

for (var _player_num = 0; _player_num < player_numbers.count; _player_num++)
{
	if (!array_contains(unlockedChars, global.player_list[_player_num][player_data.character_index]))
	{
		global.player_list[_player_num][player_data.character_index] = unlockedChars[0];
	}
}

// Inherit the parent event
event_inherited();

y_offset = 1;

page = menu_character_select_pages.main;
option = 0;

depth = -9994;