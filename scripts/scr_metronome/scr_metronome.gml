// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function metronome_interval_set
function metronome_interval_set(value)
{
	obj_metronome.interval = value;
}

/// @function metronome_warn_offset_set
function metronome_warn_offset_set(value)
{
	obj_metronome.warn_offset = value;
}

/// @function metronome_strike_offset_set
function metronome_strike_offset_set(value)
{
	obj_metronome.strike_offset = value;
}

/// @function metronome_bpm_set
function metronome_bpm_set(value)
{
	obj_metronome.bpm = value;
}

/// @function metronome_warn
function metronome_warn()
{
	return obj_metronome.warn;
}

/// @function metronome_strike
function metronome_strike()
{
	return obj_metronome.strike;
}