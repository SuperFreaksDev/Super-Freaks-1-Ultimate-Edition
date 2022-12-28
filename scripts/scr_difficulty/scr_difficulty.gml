enum difficulty_levels
{
	very_easy = 0,
	easy,
	normal,
	hard,
	stupid,
}

/// @function difficulty_init
function difficulty_init()
{
	global.difficulty = difficulty_levels.normal;
}