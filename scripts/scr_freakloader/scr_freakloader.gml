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

	global.character_count = array_length(struct_get_names(global.character_indexes)) + array_length(struct_get_names(global.custom_character_indexes));
	
	if (array_length(struct_get_names(global.custom_character_indexes)) > 0)
	{
		for (var i = 0; i < array_length(struct_get_names(global.custom_character_indexes)); i++)
		{
			global.characters_unlocked[global.custom_character_indexes[$ struct_get_names(global.custom_character_indexes)[i]]] = true;
		}
	}
}

function freakloader_add_chars()
{
	if (array_length(struct_get_names(global.custom_character_indexes)) == 0) exit;
	
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
		player_animation_create(_character, player_animations.idle, sprite_add($"{filePath}/{charFile.sprites.path}/stand.png", charFile.sprites.stand.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.walk, sprite_add($"{filePath}/{charFile.sprites.path}/walk.png", charFile.sprites.walk.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.skid, sprite_add($"{filePath}/{charFile.sprites.path}/skid.png", charFile.sprites.skid.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.hurt, sprite_add($"{filePath}/{charFile.sprites.path}/hurt.png", charFile.sprites.hurt.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.death, sprite_add($"{filePath}/{charFile.sprites.path}/death.png", charFile.sprites.death.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.air, sprite_add($"{filePath}/{charFile.sprites.path}/air.png", charFile.sprites.air.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.jump, sprite_add($"{filePath}/{charFile.sprites.path}/jump.png", charFile.sprites.jump.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.wall_slide, sprite_add($"{filePath}/{charFile.sprites.path}/wall_slide.png", charFile.sprites.wall_slide.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.hang, sprite_add($"{filePath}/{charFile.sprites.path}/hang.png", charFile.sprites.hang.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.climb, sprite_add($"{filePath}/{charFile.sprites.path}/climb.png", charFile.sprites.climb.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.pole_climb, sprite_add($"{filePath}/{charFile.sprites.path}/pole.png", charFile.sprites.pole.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.pole_turn, sprite_add($"{filePath}/{charFile.sprites.path}/pole_turn.png", charFile.sprites.pole_turn.frames, false, false, 0, 0));
		player_animation_create(_character, player_animations.rail_grind, sprite_add($"{filePath}/{charFile.sprites.path}/rail.png", charFile.sprites.rail.frames, false, false, 0, 0));
		
		player_mugshot_create(_character, sprite_add($"{filePath}/{charFile.sprites.path}/mugshot.png", 1, false, false, 32, 40));
		
		var sndPath  = $"{filePath}/snd/death.ogg",
			sndToAdd = sfx_yell_wilhelm;
		
		if (file_exists(sndPath)) sndToAdd = audio_create_stream(sndPath);
		player_deathsound_create(_character, sndToAdd);
	}
}