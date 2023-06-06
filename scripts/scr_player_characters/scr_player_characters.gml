enum character_indexes
{
	scruffy = 0,
	quincy,
	gambi,
	tikiman,
	superior,
	negative_quincy,
	geyzer,
	trash_can_man,
	slaypool,
	cyquops,
	gloverine,
	professor_t,
	scruffy_2006,
	quincy_2006,
	gambi_2006,
	tikiman_2006,
	dino,
	uncle_swordsman,
	brick,
	
	count,
}

enum player_animations
{
	hud_face = 0,
	idle,
	walk,
	skid,
	hurt,
	death,
	air,
	jump,
	wall_slide,
	hang,
	climb,
	pole_climb,
	pole_turn,
	rail_grind,
	
	count,
}

/// @function characters_init
function characters_init()
{
	var _i;
	var _character;
	
	global.character_names = [];
	global.player_animation = [];
	global.characters_unlocked = [];
	
	for (_i = 0; _i < character_indexes.count; ++_i)
	{
		global.character_names[_i] = "";
		global.characters_unlocked[_i] = false;
	}
	
	for (_i = 0; _i < player_animations.count; ++_i)
	{
		array_push(global.player_animation, array_create(character_indexes.count));
	}
	
	global.characters_unlocked[character_indexes.scruffy] = true;
	global.characters_unlocked[character_indexes.quincy] = true;
	global.characters_unlocked[character_indexes.gambi] = true;
	global.characters_unlocked[character_indexes.tikiman] = true;
	
	#region Scruffy
		_character = character_indexes.scruffy;
		global.character_names[_character] = "Scruffy";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_scruffy);
		player_animation_create(_character, player_animations.idle, spr_player_stand_scruffy);
		player_animation_create(_character, player_animations.walk, spr_player_walk_scruffy);
		player_animation_create(_character, player_animations.skid, spr_player_skid_scruffy);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_scruffy);
		player_animation_create(_character, player_animations.death, spr_player_death_scruffy);
		player_animation_create(_character, player_animations.air, spr_player_air_scruffy);
		player_animation_create(_character, player_animations.jump, spr_player_jump_scruffy);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_scruffy);
		player_animation_create(_character, player_animations.hang, spr_player_hang_scruffy);
		player_animation_create(_character, player_animations.climb, spr_player_climb_scruffy);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_scruffy);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_scruffy);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_scruffy);
	#endregion
	
	#region King Quincy
		_character = character_indexes.quincy;
		global.character_names[_character] = "King Quincy";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_quincy);
		player_animation_create(_character, player_animations.idle, spr_player_stand_quincy);
		player_animation_create(_character, player_animations.walk, spr_player_walk_quincy);
		player_animation_create(_character, player_animations.skid, spr_player_skid_quincy);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_quincy);
		player_animation_create(_character, player_animations.death, spr_player_death_quincy);
		player_animation_create(_character, player_animations.air, spr_player_air_quincy);
		player_animation_create(_character, player_animations.jump, spr_player_jump_quincy);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_quincy);
		player_animation_create(_character, player_animations.hang, spr_player_hang_quincy);
		player_animation_create(_character, player_animations.climb, spr_player_climb_quincy);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_quincy);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_quincy);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_quincy);
	#endregion
	
	#region Gambi
		_character = character_indexes.gambi;
		global.character_names[_character] = "Gambi";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_gambi);
		player_animation_create(_character, player_animations.idle, spr_player_stand_gambi);
		player_animation_create(_character, player_animations.walk, spr_player_walk_gambi);
		player_animation_create(_character, player_animations.skid, spr_player_skid_gambi);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_gambi);
		player_animation_create(_character, player_animations.death, spr_player_death_gambi);
		player_animation_create(_character, player_animations.air, spr_player_air_gambi);
		player_animation_create(_character, player_animations.jump, spr_player_jump_gambi);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_gambi);
		player_animation_create(_character, player_animations.hang, spr_player_hang_gambi);
		player_animation_create(_character, player_animations.climb, spr_player_climb_gambi);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_gambi);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_gambi);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_gambi);
	#endregion
	
	#region Tikiman
		_character = character_indexes.tikiman;
		global.character_names[_character] = "Tikiman";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_tikiman);
		player_animation_create(_character, player_animations.idle, spr_player_stand_tikiman);
		player_animation_create(_character, player_animations.walk, spr_player_walk_tikiman);
		player_animation_create(_character, player_animations.skid, spr_player_skid_tikiman);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_tikiman);
		player_animation_create(_character, player_animations.death, spr_player_death_tikiman);
		player_animation_create(_character, player_animations.air, spr_player_air_tikiman);
		player_animation_create(_character, player_animations.jump, spr_player_jump_tikiman);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_tikiman);
		player_animation_create(_character, player_animations.hang, spr_player_hang_tikiman);
		player_animation_create(_character, player_animations.climb, spr_player_climb_tikiman);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_tikiman);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_tikiman);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_tikiman);
	#endregion
	
	#region Superior
		_character = character_indexes.superior;
		global.character_names[_character] = "Superior";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_superior);
		player_animation_create(_character, player_animations.idle, spr_player_stand_superior);
		player_animation_create(_character, player_animations.walk, spr_player_walk_superior);
		player_animation_create(_character, player_animations.skid, spr_player_skid_superior);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_superior);
		player_animation_create(_character, player_animations.death, spr_player_death_superior);
		player_animation_create(_character, player_animations.air, spr_player_air_superior);
		player_animation_create(_character, player_animations.jump, spr_player_jump_superior);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_superior);
		player_animation_create(_character, player_animations.hang, spr_player_hang_superior);
		player_animation_create(_character, player_animations.climb, spr_player_climb_superior);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_superior);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_superior);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_superior);
	#endregion
	
	#region Negative Quincy
		_character = character_indexes.negative_quincy;
		global.character_names[_character] = "Negative Quincy";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_negative_quincy);
		player_animation_create(_character, player_animations.idle, spr_player_stand_negative_quincy);
		player_animation_create(_character, player_animations.walk, spr_player_walk_negative_quincy);
		player_animation_create(_character, player_animations.skid, spr_player_skid_negative_quincy);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_negative_quincy);
		player_animation_create(_character, player_animations.death, spr_player_death_negative_quincy);
		player_animation_create(_character, player_animations.air, spr_player_air_negative_quincy);
		player_animation_create(_character, player_animations.jump, spr_player_jump_negative_quincy);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_negative_quincy);
		player_animation_create(_character, player_animations.hang, spr_player_hang_negative_quincy);
		player_animation_create(_character, player_animations.climb, spr_player_climb_negative_quincy);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_negative_quincy);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_negative_quincy);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_negative_quincy);
	#endregion
	
	#region Geyzer
		_character = character_indexes.geyzer;
		global.character_names[_character] = "Geyzer";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_geyzer);
		player_animation_create(_character, player_animations.idle, spr_player_stand_geyzer);
		player_animation_create(_character, player_animations.walk, spr_player_walk_geyzer);
		player_animation_create(_character, player_animations.skid, spr_player_skid_geyzer);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_geyzer);
		player_animation_create(_character, player_animations.death, spr_player_death_geyzer);
		player_animation_create(_character, player_animations.air, spr_player_air_geyzer);
		player_animation_create(_character, player_animations.jump, spr_player_jump_geyzer);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_geyzer);
		player_animation_create(_character, player_animations.hang, spr_player_hang_geyzer);
		player_animation_create(_character, player_animations.climb, spr_player_climb_geyzer);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_geyzer);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_geyzer);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_geyzer);
	#endregion
	
	#region Trash Can Man
		_character = character_indexes.trash_can_man;
		global.character_names[_character] = "Trash Can Man";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_trash_can_man);
		player_animation_create(_character, player_animations.idle, spr_player_stand_trash_can_man);
		player_animation_create(_character, player_animations.walk, spr_player_walk_trash_can_man);
		player_animation_create(_character, player_animations.skid, spr_player_skid_trash_can_man);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_trash_can_man);
		player_animation_create(_character, player_animations.death, spr_player_death_trash_can_man);
		player_animation_create(_character, player_animations.air, spr_player_air_trash_can_man);
		player_animation_create(_character, player_animations.jump, spr_player_jump_trash_can_man);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_trash_can_man);
		player_animation_create(_character, player_animations.hang, spr_player_hang_trash_can_man);
		player_animation_create(_character, player_animations.climb, spr_player_climb_trash_can_man);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_trash_can_man);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_trash_can_man);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_trash_can_man);
	#endregion
	
	#region Scruffy (2006)
		_character = character_indexes.scruffy_2006;
		global.character_names[_character] = "Scruffy (2006)";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_scruffy_2006);
		player_animation_create(_character, player_animations.idle, spr_player_stand_scruffy_2006);
		player_animation_create(_character, player_animations.walk, spr_player_walk_scruffy_2006);
		player_animation_create(_character, player_animations.skid, spr_player_skid_scruffy_2006);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_scruffy_2006);
		player_animation_create(_character, player_animations.death, spr_player_death_scruffy_2006);
		player_animation_create(_character, player_animations.air, spr_player_air_scruffy_2006);
		player_animation_create(_character, player_animations.jump, spr_player_jump_scruffy_2006);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_scruffy_2006);
		player_animation_create(_character, player_animations.hang, spr_player_hang_scruffy_2006);
		player_animation_create(_character, player_animations.climb, spr_player_climb_scruffy_2006);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_scruffy_2006);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_scruffy_2006);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_scruffy_2006);
	#endregion
	
	#region Quincy (2006)
		_character = character_indexes.quincy_2006;
		global.character_names[_character] = "King Quincy (2006)";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_quincy_2006);
		player_animation_create(_character, player_animations.idle, spr_player_stand_quincy_2006);
		player_animation_create(_character, player_animations.walk, spr_player_walk_quincy_2006);
		player_animation_create(_character, player_animations.skid, spr_player_skid_quincy_2006);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_quincy_2006);
		player_animation_create(_character, player_animations.death, spr_player_death_quincy_2006);
		player_animation_create(_character, player_animations.air, spr_player_air_quincy_2006);
		player_animation_create(_character, player_animations.jump, spr_player_jump_quincy_2006);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_quincy_2006);
		player_animation_create(_character, player_animations.hang, spr_player_hang_quincy_2006);
		player_animation_create(_character, player_animations.climb, spr_player_climb_quincy_2006);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_quincy_2006);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_quincy_2006);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_quincy_2006);
	#endregion
	
	#region Gambi (2006)
		_character = character_indexes.gambi_2006;
		global.character_names[_character] = "Gambi (2006)";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_gambi_2006);
		player_animation_create(_character, player_animations.idle, spr_player_stand_gambi_2006);
		player_animation_create(_character, player_animations.walk, spr_player_walk_gambi_2006);
		player_animation_create(_character, player_animations.skid, spr_player_skid_gambi_2006);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_gambi_2006);
		player_animation_create(_character, player_animations.death, spr_player_death_gambi_2006);
		player_animation_create(_character, player_animations.air, spr_player_air_gambi_2006);
		player_animation_create(_character, player_animations.jump, spr_player_jump_gambi_2006);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_gambi_2006);
		player_animation_create(_character, player_animations.hang, spr_player_hang_gambi_2006);
		player_animation_create(_character, player_animations.climb, spr_player_climb_gambi_2006);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_gambi_2006);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_gambi_2006);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_gambi_2006);
	#endregion
	
	#region Tikiman (2006)
		_character = character_indexes.tikiman_2006;
		global.character_names[_character] = "Tikiman (2006)";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_tikiman_2006);
		player_animation_create(_character, player_animations.idle, spr_player_stand_tikiman_2006);
		player_animation_create(_character, player_animations.walk, spr_player_walk_tikiman_2006);
		player_animation_create(_character, player_animations.skid, spr_player_skid_tikiman_2006);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_tikiman_2006);
		player_animation_create(_character, player_animations.death, spr_player_death_tikiman_2006);
		player_animation_create(_character, player_animations.air, spr_player_air_tikiman_2006);
		player_animation_create(_character, player_animations.jump, spr_player_jump_tikiman_2006);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_tikiman_2006);
		player_animation_create(_character, player_animations.hang, spr_player_hang_tikiman_2006);
		player_animation_create(_character, player_animations.climb, spr_player_climb_tikiman_2006);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_tikiman_2006);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_tikiman_2006);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_tikiman_2006);
	#endregion
	
	#region Dino
		_character = character_indexes.dino;
		global.character_names[_character] = "Dino";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_dino);
		player_animation_create(_character, player_animations.idle, spr_player_stand_dino);
		player_animation_create(_character, player_animations.walk, spr_player_walk_dino);
		player_animation_create(_character, player_animations.skid, spr_player_skid_dino);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_dino);
		player_animation_create(_character, player_animations.death, spr_player_death_dino);
		player_animation_create(_character, player_animations.air, spr_player_air_dino);
		player_animation_create(_character, player_animations.jump, spr_player_jump_dino);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_dino);
		player_animation_create(_character, player_animations.hang, spr_player_hang_dino);
		player_animation_create(_character, player_animations.climb, spr_player_climb_dino);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_dino);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_dino);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_dino);
	#endregion
}

/// @function player_character_set
/// @param _player_number
/// @param _character_index
function player_character_set(_player_number, _character_index)
{
	global.player_list[_player_number][player_data.character_index] = _character_index;
	
	gml_pragma("forceinline");
}

/// @function player_character_get
/// @param _player_number
function player_character_get(_player_number)
{
	return global.player_list[_player_number][player_data.character_index];
	
	gml_pragma("forceinline");
}

/// @function player_animation_create
/// @param _character_index
/// @param _animation_index
/// @param _sprite
function player_animation_create(_character_index, _animation_index, _sprite)
{
	global.player_animation[_animation_index][_character_index] = _sprite;
	
	gml_pragma("forceinline");
}

/// @function player_animation_get
/// @param _character_index
/// @param _animation_index
function player_animation_get(_character_index, _animation_index)
{
	return global.player_animation[_animation_index][_character_index];
	
	gml_pragma("forceinline");
}