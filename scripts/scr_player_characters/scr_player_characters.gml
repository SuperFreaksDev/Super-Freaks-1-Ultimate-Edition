global.character_indexes =
{
	scruffy: 0,
	quincy: 1,
	gambi: 2,
	tikiman: 3,
	superior: 4,
	negative_quincy: 5,
	geyzer: 6,
	trash_can_man: 7,
	slaypool: 8,
	cyquops: 9,
	gloverine: 10,
	professor_t: 11,
	scruffy_2006: 12,
	quincy_2006: 13,
	gambi_2006: 14,
	tikiman_2006: 15,
	dino: 16,
	uncle_swordsman: 17,
	boney_m: 18,
	brick: 19,
	kranion: 20,
	cranion: 21,
	sticky: 22,
	spike: 23,
	wartnose: 24,
	pseudo_scruffy: 25
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

global.character_count = array_length(struct_get_names(global.character_indexes));

/// @function characters_init
function characters_init()
{
	var _i;
	var _character;
	
	global.character_names	   = [];
	global.player_animation	   = [];
	global.player_mugshot      = [];
	global.player_jumpsound	   = [];
	global.player_deathsound   = [];
	global.player_fallsound	   = [];
	global.player_hitbox_size  = [];
	global.characters_unlocked = [];
	
	for (_i = 0; _i < global.character_count; ++_i)
	{
		global.character_names[_i] = "";
		global.characters_unlocked[_i] = false;
	}
	
	for (_i = 0; _i < player_animations.count; ++_i)
	{
		array_push(global.player_animation, array_create(global.character_count));
	}
	
	global.characters_unlocked[global.character_indexes.scruffy] = true;
	global.characters_unlocked[global.character_indexes.quincy] = true;
	global.characters_unlocked[global.character_indexes.gambi] = true;
	global.characters_unlocked[global.character_indexes.tikiman] = true;
	global.characters_unlocked[global.character_indexes.kranion] = true;
	
	#region Scruffy
		_character = global.character_indexes.scruffy;
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
		
		player_mugshot_create(_character, spr_character_select_scruffy);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region King Quincy
		_character = global.character_indexes.quincy;
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
		
		player_mugshot_create(_character, spr_character_select_quincy);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Gambi
		_character = global.character_indexes.gambi;
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
		
		player_mugshot_create(_character, spr_character_select_gambi);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Tikiman
		_character = global.character_indexes.tikiman;
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
		
		player_mugshot_create(_character, spr_character_select_tikiman);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Superior
		_character = global.character_indexes.superior;
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
		
		player_mugshot_create(_character, spr_character_select_superior);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Negative Quincy
		_character = global.character_indexes.negative_quincy;
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
		
		player_mugshot_create(_character, spr_character_select_negative_quincy);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Geyzer
		_character = global.character_indexes.geyzer;
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
		
		player_mugshot_create(_character, spr_character_select_geyzer);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Trash Can Man
		_character = global.character_indexes.trash_can_man;
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
		
		player_mugshot_create(_character, spr_character_select_trash_can_man);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Les Slaypool
		_character = global.character_indexes.slaypool;
		global.character_names[_character] = "Les Slaypool";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_slaypool);
		player_animation_create(_character, player_animations.idle, spr_player_stand_slaypool);
		player_animation_create(_character, player_animations.walk, spr_player_walk_slaypool);
		player_animation_create(_character, player_animations.skid, spr_player_skid_slaypool);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_slaypool);
		player_animation_create(_character, player_animations.death, spr_player_death_slaypool);
		player_animation_create(_character, player_animations.air, spr_player_air_slaypool);
		player_animation_create(_character, player_animations.jump, spr_player_jump_slaypool);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_slaypool);
		player_animation_create(_character, player_animations.hang, spr_player_hang_slaypool);
		player_animation_create(_character, player_animations.climb, spr_player_climb_slaypool);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_slaypool);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_slaypool);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_slaypool);
		
		player_mugshot_create(_character, spr_character_select_slaypool);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Cyquops
		_character = global.character_indexes.cyquops;
		global.character_names[_character] = "Cyquops";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_cyquops);
		player_animation_create(_character, player_animations.idle, spr_player_stand_cyquops);
		player_animation_create(_character, player_animations.walk, spr_player_walk_cyquops);
		player_animation_create(_character, player_animations.skid, spr_player_skid_cyquops);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_cyquops);
		player_animation_create(_character, player_animations.death, spr_player_death_cyquops);
		player_animation_create(_character, player_animations.air, spr_player_air_cyquops);
		player_animation_create(_character, player_animations.jump, spr_player_jump_cyquops);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_cyquops);
		player_animation_create(_character, player_animations.hang, spr_player_hang_cyquops);
		player_animation_create(_character, player_animations.climb, spr_player_climb_cyquops);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_cyquops);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_cyquops);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_cyquops);
		
		player_mugshot_create(_character, spr_character_select_cyquops);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Gloverine
		_character = global.character_indexes.gloverine;
		global.character_names[_character] = "Gloverine";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_gloverine);
		player_animation_create(_character, player_animations.idle, spr_player_stand_gloverine);
		player_animation_create(_character, player_animations.walk, spr_player_walk_gloverine);
		player_animation_create(_character, player_animations.skid, spr_player_skid_gloverine);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_gloverine);
		player_animation_create(_character, player_animations.death, spr_player_death_gloverine);
		player_animation_create(_character, player_animations.air, spr_player_air_gloverine);
		player_animation_create(_character, player_animations.jump, spr_player_jump_gloverine);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_gloverine);
		player_animation_create(_character, player_animations.hang, spr_player_hang_gloverine);
		player_animation_create(_character, player_animations.climb, spr_player_climb_gloverine);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_gloverine);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_gloverine);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_gloverine);
		
		player_mugshot_create(_character, spr_character_select_gloverine);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Professor T
		_character = global.character_indexes.professor_t;
		global.character_names[_character] = "Professor T";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_professor_t);
		player_animation_create(_character, player_animations.idle, spr_player_stand_professor_t);
		player_animation_create(_character, player_animations.walk, spr_player_walk_professor_t);
		player_animation_create(_character, player_animations.skid, spr_player_skid_professor_t);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_professor_t);
		player_animation_create(_character, player_animations.death, spr_player_death_professor_t);
		player_animation_create(_character, player_animations.air, spr_player_air_professor_t);
		player_animation_create(_character, player_animations.jump, spr_player_jump_professor_t);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_professor_t);
		player_animation_create(_character, player_animations.hang, spr_player_hang_professor_t);
		player_animation_create(_character, player_animations.climb, spr_player_climb_professor_t);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_professor_t);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_professor_t);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_professor_t);
		
		player_mugshot_create(_character, spr_character_select_professor_t);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Scruffy (2006)
		_character = global.character_indexes.scruffy_2006;
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
		
		player_mugshot_create(_character, spr_character_select_scruffy_2006);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Quincy (2006)
		_character = global.character_indexes.quincy_2006;
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
		
		player_mugshot_create(_character, spr_character_select_quincy_2006);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Gambi (2006)
		_character = global.character_indexes.gambi_2006;
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
		
		player_mugshot_create(_character, spr_character_select_gambi_2006);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Tikiman (2006)
		_character = global.character_indexes.tikiman_2006;
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
		
		player_mugshot_create(_character, spr_character_select_tikiman_2006);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Dino
		_character = global.character_indexes.dino;
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
		
		player_mugshot_create(_character, spr_character_select_dino);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Uncle Swordsman
		_character = global.character_indexes.uncle_swordsman;
		global.character_names[_character] = "Uncle Swordsman";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_swordsman);
		player_animation_create(_character, player_animations.idle, spr_player_stand_swordsman);
		player_animation_create(_character, player_animations.walk, spr_player_walk_swordsman);
		player_animation_create(_character, player_animations.skid, spr_player_skid_swordsman);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_swordsman);
		player_animation_create(_character, player_animations.death, spr_player_death_swordsman);
		player_animation_create(_character, player_animations.air, spr_player_air_swordsman);
		player_animation_create(_character, player_animations.jump, spr_player_jump_swordsman);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_swordsman);
		player_animation_create(_character, player_animations.hang, spr_player_hang_swordsman);
		player_animation_create(_character, player_animations.climb, spr_player_climb_swordsman);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_swordsman);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_swordsman);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_swordsman);
		
		player_mugshot_create(_character, spr_character_select_swordsman);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Boney M
		_character = global.character_indexes.boney_m;
		global.character_names[_character] = "Boney M";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_boneym);
		player_animation_create(_character, player_animations.idle, spr_player_stand_boneym);
		player_animation_create(_character, player_animations.walk, spr_player_walk_boneym);
		player_animation_create(_character, player_animations.skid, spr_player_skid_boneym);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_boneym);
		player_animation_create(_character, player_animations.death, spr_player_death_boneym);
		player_animation_create(_character, player_animations.air, spr_player_air_boneym);
		player_animation_create(_character, player_animations.jump, spr_player_jump_boneym);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_boneym);
		player_animation_create(_character, player_animations.hang, spr_player_hang_boneym);
		player_animation_create(_character, player_animations.climb, spr_player_climb_boneym);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_boneym);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_boneym);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_boneym);
		
		player_mugshot_create(_character, spr_character_select_boneym);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Brick
		_character = global.character_indexes.brick;
		global.character_names[_character] = "Brick";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_brick);
		player_animation_create(_character, player_animations.idle, spr_player_stand_brick);
		player_animation_create(_character, player_animations.walk, spr_player_walk_brick);
		player_animation_create(_character, player_animations.skid, spr_player_skid_brick);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_brick);
		player_animation_create(_character, player_animations.death, spr_player_death_brick);
		player_animation_create(_character, player_animations.air, spr_player_air_brick);
		player_animation_create(_character, player_animations.jump, spr_player_jump_brick);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_brick);
		player_animation_create(_character, player_animations.hang, spr_player_hang_brick);
		player_animation_create(_character, player_animations.climb, spr_player_climb_brick);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_brick);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_brick);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_brick);
		
		player_mugshot_create(_character, spr_character_select_brick);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character);
	#endregion
	
	#region Kranion
		_character = global.character_indexes.kranion;
		global.character_names[_character] = "Kranion";
		player_animation_create(_character, player_animations.hud_face, spr_player_HUD_brick);
		player_animation_create(_character, player_animations.idle, spr_player_stand_kranion);
		player_animation_create(_character, player_animations.walk, spr_player_walk_kranion);
		player_animation_create(_character, player_animations.skid, spr_player_skid_kranion);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_kranion);
		player_animation_create(_character, player_animations.death, spr_player_death_kranion);
		player_animation_create(_character, player_animations.air, spr_player_air_kranion);
		player_animation_create(_character, player_animations.jump, spr_player_jump_kranion);
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_kranion);
		player_animation_create(_character, player_animations.hang, spr_player_stand_kranion);
		player_animation_create(_character, player_animations.climb, spr_player_climb_kranion);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_kranion);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_kranion);
		player_animation_create(_character, player_animations.rail_grind, spr_player_stand_kranion);
		
		player_mugshot_create(_character, spr_character_select_kranion);
		
		player_jumpsound_create(_character, sfx_jump);
		player_deathsound_create(_character, sfx_yell_wilhelm);
		player_fallsound_create(_character, sfx_yell_goofy);
		
		player_hitbox_resize(_character, -16, -24, 16, 20);
	#endregion
	
	freakloader_init();
	freakloader_add_chars();
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
	
	if (_character_index >= 20 && _animation_index != player_animations.hud_face) sprite_set_offset(_sprite, max(0, sprite_get_width(_sprite) / 2), max(0, sprite_get_height(_sprite) - 24));
	
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

function player_mugshot_create(_character_index, _sprite)
{
	global.player_mugshot[_character_index] = _sprite;
	
	gml_pragma("forceinline");
}

function player_mugshot_get(_character_index)
{
	return global.player_mugshot[_character_index];
	
	gml_pragma("forceinline");
}

function player_jumpsound_create(_character_index, _sound)
{
	global.player_jumpsound[_character_index] = _sound;
	
	gml_pragma("forceinline");
}

function player_jumpsound_get(_character_index)
{
	return global.player_jumpsound[_character_index];
	
	gml_pragma("forceinline");
}

function player_deathsound_create(_character_index, _sound)
{
	global.player_deathsound[_character_index] = _sound;
	
	gml_pragma("forceinline");
}

function player_deathsound_get(_character_index)
{
	return global.player_deathsound[_character_index];
	
	gml_pragma("forceinline");
}

function player_fallsound_create(_character_index, _sound)
{
	global.player_fallsound[_character_index] = _sound;
	
	gml_pragma("forceinline");
}

function player_fallsound_get(_character_index)
{
	return global.player_fallsound[_character_index];
	
	gml_pragma("forceinline");
}

function player_hitbox_resize(_character_index, _x1 = -8, _y1 = -12, _x2 = 8, _y2 = 20)
{
	global.player_hitbox_size[_character_index] =
	{
		x1: _x1,
		y1: _y1,
		x2: _x2,
		y2: _y2
	};
	
	gml_pragma("forceinline");
}

function player_hitbox_get(_character_index)
{
	return global.player_hitbox_size[_character_index];
	
	gml_pragma("forceinline");
}