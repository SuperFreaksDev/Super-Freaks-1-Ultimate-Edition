/// @description Step

if (variable_global_exists("music_id"))
	audio_pos = audio_sound_get_track_position(global.music_id);

function metronome(_interval_beats, _offset_beats, _bpm)
{
	var _interval_seconds = (60 / _bpm) * _interval_beats;
	var _offset_seconds = (60 / _bpm) * _offset_beats;
	var _comp_a = ((audio_pos + _offset_seconds) mod _interval_seconds);
	var _comp_b = ((prev_audio_pos + _offset_seconds) mod _interval_seconds);
	if (variable_global_exists("music_is_playing"))
		if (global.music_is_playing)
			return (_comp_a < _comp_b);
		return false;
	return false;
}

warn = metronome(interval, warn_offset, bpm);
strike = metronome(interval, strike_offset, bpm);

if (variable_global_exists("music_id"))
	prev_audio_pos = audio_sound_get_track_position(global.music_id);