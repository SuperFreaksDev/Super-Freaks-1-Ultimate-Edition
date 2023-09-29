//Welcome to the code for the FreakLoader character loader!

//You probably won't need to use any of these functions at
//any point other than startup, but not like I can do anything
//to stop you now! Have fun!

// - defnotreal_

function freakloader_init()
{
	global.custom_character_indexes = {}

	if (directory_exists("chars"))
	{
		var loadDir = file_find_first("chars/*", fa_directory);
	
		while (loadDir != "")
		{
			show_debug_message($"Character folder \"{loadDir}\" found. Attempting to load...");
		
			if (!string_starts_with(loadDir, "!"))
			{
				if (!file_exists($"chars/{loadDir}/char.json"))
				{
					show_debug_message($"Character \"{loadDir}\" missing char.json file. Skipping.");
					loadDir = file_find_next();
				}
				else
				{
					global.custom_character_indexes[$ loadDir] = (array_length(struct_get_names(global.character_indexes)) + array_length(struct_get_names(global.custom_character_indexes)));
					show_debug_message($"Character \"{loadDir}\" successfully loaded!");
					loadDir = file_find_next();
				}
			}
			else
			{
				show_debug_message($"Character \"{loadDir}\" marked to skip. Skipping.");
				loadDir = file_find_next();
			}
		}
	
		file_find_close();
	}

	global.character_indexes.count = array_length(struct_get_names(global.character_indexes)) + array_length(struct_get_names(global.custom_character_indexes));
	
	for (var i = 0; i < array_length(struct_get_names(global.custom_character_indexes)); i++)
	{
		global.characters_unlocked[global.custom_character_indexes[$ struct_get_names(global.custom_character_indexes)[i]]] = true;
	}
}

function freakloader_add_chars()
{
	var customChars = struct_get_names(global.custom_character_indexes),
		character_;
	
	for (var i = 0; i < array_length(customChars); i++)
	{
		var filePath = $"chars/{customChars[i]}",
			buf		 = buffer_load($"{filePath}/char.json");
			charFile = json_parse(buffer_read(buf, buffer_string));
		buffer_delete(buf);
		
		_character = global.custom_character_indexes[$ customChars[i]];
		global.character_names[_character] = charFile.name;
		player_animation_create(_character, player_animations.hud_face, sprite_add($"{filePath}/{charFile.sprites.path}/hud.png", 2, false, false, 16, 16));
		player_animation_create(_character, player_animations.idle, sprite_add($"{filePath}/{charFile.sprites.path}/stand.png", 1, false, false, 24, 40));
		player_animation_create(_character, player_animations.walk, sprite_add($"{filePath}/{charFile.sprites.path}/walk.png", 4, false, false, 24, 40));
		player_animation_create(_character, player_animations.skid, spr_player_skid_scruffy);
		player_animation_create(_character, player_animations.hurt, spr_player_hurt_scruffy);
		player_animation_create(_character, player_animations.death, sprite_add($"{filePath}/{charFile.sprites.path}/death.png", 1, false, false, 24, 40));
		player_animation_create(_character, player_animations.air, spr_player_air_scruffy);
		player_animation_create(_character, player_animations.jump, sprite_add($"{filePath}/{charFile.sprites.path}/jump.png", charFile.sprites.jump.frames, false, false, charFile.sprites.jump.xorig, charFile.sprites.jump.yorig));
		player_animation_create(_character, player_animations.wall_slide, spr_player_wall_slide_scruffy);
		player_animation_create(_character, player_animations.hang, spr_player_hang_scruffy);
		player_animation_create(_character, player_animations.climb, spr_player_climb_scruffy);
		player_animation_create(_character, player_animations.pole_climb, spr_player_pole_scruffy);
		player_animation_create(_character, player_animations.pole_turn, spr_player_pole_turn_scruffy);
		player_animation_create(_character, player_animations.rail_grind, spr_player_rail_scruffy);
		
		player_mugshot_create(_character, sprite_add($"{filePath}/{charFile.sprites.path}/mugshot.png", 1, false, false, 32, 40));
		
		var sndPath  = $"{filePath}/snd/death.ogg",
			sndToAdd = sfx_yell_wilhelm;
		
		if (file_exists(sndPath)) sndToAdd = audio_create_stream(sndPath);
		player_deathsound_create(_character, sndToAdd);
	}
}