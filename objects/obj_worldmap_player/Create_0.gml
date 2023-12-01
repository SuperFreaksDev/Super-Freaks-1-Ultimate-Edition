/// @description Init

var _player_num;


// Inherit the parent event
event_inherited();
level_id = -1;

state_next_set(0);
hitbox = new comp_hitbox_AABB(,,hitbox_active.active,,, -16, -16, 16, 16);
depth = -10;

unlockedChars = [];

for (var i = 0; i < array_length(struct_get_names(global.character_indexes)); i++)
{
	show_debug_message(global.characters_unlocked);
	if (global.characters_unlocked[i][global.story_mode])
		array_push(unlockedChars, i);
}

for (_player_num = 0; _player_num <= player_numbers.count; _player_num++)
{
	if (!array_contains(unlockedChars, global.player_list[_player_num][player_data.character_index]))
	{
		global.player_list[_player_num][player_data.character_index] = unlockedChars[0];
	}
}