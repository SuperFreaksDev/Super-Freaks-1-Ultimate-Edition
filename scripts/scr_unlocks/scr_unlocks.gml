enum unlock_data
{
	unlocked = 0,
	description,
	text,
	func_condition,
	func_unlock,
}

enum unlocks
{
	free_play,
	randomizer,
	speedrun_story,
	speedrun_secret,
	speedrun_100,
	boss_rush,
	supersecret,
	speedrun_normal,
	speedrun_crazy,
	speedrun_ludicrous,
	speedrun_insane,
	speedrun_freaky,
	speedrun_kranion,
	speedrun_stadium,
	museum,
	character_superior,
	character_negative_quincy,
	character_geyzer,
	character_trash_can_man,
	character_2006,
	character_dino,
	character_x_freaks,
	character_swordsman,
	character_boneym,
	character_brick,
	character_cranion,
	freaks_in_badguys,
	badguys_in_freaks,
}

/// @function unlocks_init
function unlocks_init()
{
	global.unlocks = [];
	
	unlock_create(unlocks.free_play, "Unlock Free Play", "Free Play Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_stadium);
	});
	unlock_create(unlocks.randomizer, "Unlock Randomizer", "Randomizer Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_crazy_boss);
	});
	unlock_create(unlocks.supersecret, "Unlock Exciting Encore", "You can now access the Super Secret Level! Good luck! No, seriously--you're gonna need it.", function()
	{
		return false;
	});
	unlock_create(unlocks.speedrun_normal, "Unlock Normal Run", "Normal Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_normal_fruit_secret) && level_complete_get(level_ids.level_normal_boss);
	});
	unlock_create(unlocks.speedrun_crazy, "Unlock Crazy Run", "Crazy Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_crazy_toy_secret) && level_complete_get(level_ids.level_crazy_boss);
	});
	unlock_create(unlocks.speedrun_ludicrous, "Unlock Ludicrous Run", "Ludicrous Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_ludicrous_barrel_secret) && level_complete_get(level_ids.level_ludicrous_boss);
	});
	unlock_create(unlocks.speedrun_insane, "Unlock Insane Run", "Insane Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_insane_hippie_secret) && level_complete_get(level_ids.level_insane_boss);
	});
	unlock_create(unlocks.speedrun_freaky, "Unlock Freaky Run", "Freaky Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_freaky_ice_secret) && level_complete_get(level_ids.level_freaky_boss);
	});	
	unlock_create(unlocks.speedrun_kranion, "Unlock Kranion Run", "Kranion Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_boss_secret) && level_complete_get(level_ids.level_kranion_final_boss);
	});
	unlock_create(unlocks.speedrun_stadium, "Unlock Stadium Run", "Stadium Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.speedrun_story, "Unlock Adventure Run", "Adventure Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_final_boss);
	});
	unlock_create(unlocks.speedrun_secret, "Unlock Secret Run", "Secret Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_boss_secret);
	});
	unlock_create(unlocks.speedrun_100, "Unlock Ultimate Run", "Ultimate Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.boss_rush, "Unlock Boss Rush", "Boss Rush Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.museum, "Unlock Museum", "Museum Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_stadium);
	});
	unlock_create(unlocks.character_superior, "Unlock Superior", "You can now play as Scruffy's Anti Freaks counterpart, Superior! He's alright I guess.", function()
	{
		return level_perfect_get(level_ids.level_normal_fruit_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.superior][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.superior][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_negative_quincy, "Unlock Negative Quincy", "You can now play as King Quincy's Anti Freaks counterpart, Negative Quincy! Be very glad you're not playing against him.", function()
	{
		return level_perfect_get(level_ids.level_crazy_toy_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.negative_quincy][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.negative_quincy][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_geyzer, "Unlock Geyzer", "You can now play as Gambi's Anti Freaks counterpart, Geyzer! But don't touch him, what with all that edge he's got.", function()
	{
		return level_perfect_get(level_ids.level_insane_hippie_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.geyzer][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.geyzer][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_trash_can_man, "Unlock Trash Can Man", "You can now play as Tikiman's Anti Freaks counterpart, Trash Can Man! If he had it his way, you'd have to buy him.", function()
	{
		return level_perfect_get(level_ids.level_freaky_ice_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.trash_can_man][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.trash_can_man][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_2006, "Unlock 2006 Super Freaks", "You can now play as the 2006 Super Freaks! They're almost old enough to get their drivers licenses!", function()
	{
		return level_perfect_get(level_ids.level_kranion_boss_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.scruffy_2006][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.scruffy_2006][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.quincy_2006][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.quincy_2006][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.gambi_2006][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.gambi_2006][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.tikiman_2006][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.tikiman_2006][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_dino, "Unlock Dino", "You can now play as Kranion's right hand man, Dino! Give him the victory he's never had!", function()
	{
		return level_perfect_get(level_ids.level_kranion_boss);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.dino][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.dino][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_x_freaks, "Unlock X-Freaks", "You can now play as the X-Freaks! These guys are First Class! ...yeah I know, that joke kinda sucked. Great movie though!", function()
	{
		return level_perfect_get(level_ids.level_ludicrous_barrel_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.slaypool][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.slaypool][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.cyquops][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.cyquops][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.gloverine][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.gloverine][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.professor_t][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.professor_t][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_swordsman, "Unlock Uncle Swordsman", "You can now play as Uncle Swordsman! He's a cut above the rest!", function()
	{
		return level_perfect_get(level_ids.level_kranion_final_boss);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.uncle_swordsman][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.uncle_swordsman][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_cranion, "Unlock Cranion", "You can now play as Cranion! He's just a blue guy living in a blue world!", function()
	{
		return level_perfect_get(level_ids.level_kranion_final_boss, story_modes.kranion);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.cranion][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.cranion][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_boneym, "Unlock Boney M", "You can now play as Boney M! You know, the little robot guy that walks back and forth, and you bonk him on the head and he falls off the screen and makes a funny slide whistle sound. Gives me a good chuckle every time.", function()
	{
		return level_perfect_get(level_ids.level_kranion_conveyor_secret);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.boney_m][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.boney_m][story_modes.kranion] = true;
	});
	unlock_create(unlocks.character_brick, "Unlock Brick", "You can now play as a brick! An actual brick. Like the kind you make walls out of. Don't tell me you weren't expecting a really stupid 100% reward!", function()
	{
		return level_perfect_get(level_ids.level_supersecret_boss);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.brick][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.brick][story_modes.kranion] = true;
	});
	unlock_create(unlocks.badguys_in_freaks, "Unlock Kranion and Sticky in Super Freaks Story", "You can now play as Kranion and Sticky in the Super Freaks Story! The skeletons appeared!", function()
	{
		return level_perfect_get(level_ids.level_supersecret_boss, story_modes.super_freaks);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.kranion][story_modes.super_freaks] = true;
		global.characters_unlocked[global.character_indexes.sticky][story_modes.super_freaks] = true;
	});
	unlock_create(unlocks.freaks_in_badguys, "Unlock Super Freaks in Bad Guys Story", "You can now play as the Super Freaks in the Bad Guys Story! I'm freaks!", function()
	{
		return level_perfect_get(level_ids.level_supersecret_boss, story_modes.super_freaks);
	}, function()
	{
		global.characters_unlocked[global.character_indexes.scruffy][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.quincy][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.gambi][story_modes.kranion] = true;
		global.characters_unlocked[global.character_indexes.tikiman][story_modes.kranion] = true;
	});
	
	unlocks_load();
}

/// @function unlocks_save
function unlocks_save()
{
	var _i, _json;
	var _array = [];
	
	for (_i = 0; _i < array_length(global.unlocks); ++_i)
	{
		_array[_i] = global.unlocks[_i][unlock_data.unlocked];
	}
	
	_json = json_stringify(_array);
	string_save(_json, "Save1/unlockables.save");
}

/// @function unlocks_load
function unlocks_load()
{
	var _json;
	var _array;
	var _i;
	var _func;
	
	if (file_exists("Save1/unlockables.save"))
	{
		_json = string_load("Save1/unlockables.save");
		_array = json_parse(_json);
		
		for (_i = 0; _i < array_length(_array); ++_i)
		{
			global.unlocks[_i][unlock_data.unlocked] = _array[_i];
			if (_array[_i] == true)
			{
				_func = global.unlocks[_i][unlock_data.func_unlock];
				_func();
			}
		}
	}
}

/// @function unlock_create
/// @param {int} _id
/// @param {string} _description = ""
/// @param {string} _text = ""
/// @param {function} _func_condition = function(){}
/// @param {function} _func_unlock = function(){}
function unlock_create(_id, _description = "", _text = "", _func_condition = function(){return false;}, _func_unlock = function(){})
{
	global.unlocks[_id][unlock_data.unlocked] = false;
	global.unlocks[_id][unlock_data.description] = _description;
	global.unlocks[_id][unlock_data.text] = _text;
	global.unlocks[_id][unlock_data.func_condition] = _func_condition;
	global.unlocks[_id][unlock_data.func_unlock] = _func_unlock;
}

/// @function unlocks_unlock
function unlocks_unlock()
{
	var _i;
	var _func;
	
	for (_i = 0; _i < array_length(global.unlocks); ++_i)
	{
		if (global.unlocks[_i][unlock_data.unlocked] == true)
			continue;
			
		_func = global.unlocks[_i][unlock_data.func_condition];
		
		if (_func() == true)
		{
			global.unlocks[_i][unlock_data.unlocked] = true;
			_func = global.unlocks[_i][unlock_data.func_unlock];
			_func();
		}
	}
}