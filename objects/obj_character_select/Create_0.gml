/// @description Init

enum menu_character_select_pages
{
	difficulty_select = 0,
	character_select,
	main,
	modifiers,
}

// Inherit the parent event
event_inherited();

y_offset = 1;

page = menu_character_select_pages.main;
option = 0;

depth = -9994;