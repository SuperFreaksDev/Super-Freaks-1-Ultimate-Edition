enum audio_data
{
	volume_music = 0,
	volume_sfx,
}

/// @function audio_init
function audio_init()
{
	global.audio_settings = [];
	global.audio_emitter_music = VinylEmitterPoint(0, 0);//audio_emitter_create();
	global.audio_emitter_sfx = audio_emitter_create();
		
	audio_default();
	audio_load();

	//audio_emitter_gain(global.audio_emitter_music, volume_music_get());
	audio_emitter_gain(global.audio_emitter_sfx, volume_sfx_get());
		
	global.music = MUSIC_NA;
}

/// @function audio_save
function audio_save()
{
	var _json = json_stringify(global.audio_settings);
	string_save(_json, "audio.settings");
}

/// @function audio_load
function audio_load()
{
	var _json;
	var _array;
	
	if file_exists("audio.settings")
	{
		_json = string_load("audio.settings");
		_array = json_parse(_json);
		
		global.audio_settings = _array;
	}
}

/// @function audio_default
function audio_default()
{
	global.audio_settings[audio_data.volume_music] = 0.75;
	//global.audio_settings[audio_data.volume_music] = 0;
	global.audio_settings[audio_data.volume_sfx] = 0.8;
}
