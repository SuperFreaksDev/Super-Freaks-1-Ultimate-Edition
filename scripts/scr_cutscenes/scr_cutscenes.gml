enum cutscene_segment
{
	text = 0,
	sprite_index,
	image_index,
	animate_speed,
	music,
	sfx,
	transition,
}

enum cutscene_transitions
{
	NA = 0,
	fade,
	fade_black,
	fade_white,
	shake,
}

/// @function cutscene_segment_set
/// @param _segment_num
/// @param _text = ""
/// @param _sprite_index = spr_cutscene_placeholder
/// @param _image_index = 0
/// @param _animate_speed = 0
/// @param _music = -1
/// @param _sfx = -1
/// @param _transition = cutscene_transitions.NA
function cutscene_segment_set(_segment_num, _text = "", _sprite_index = -1, _image_index = 0, _animate_speed = 0, _music = -1, _sfx = -1, _transition = cutscene_transitions.NA)
{
	segment[_segment_num][cutscene_segment.text] = _text;
	segment[_segment_num][cutscene_segment.sprite_index] = _sprite_index;
	segment[_segment_num][cutscene_segment.image_index] = _image_index;
	segment[_segment_num][cutscene_segment.animate_speed] = _animate_speed;
	segment[_segment_num][cutscene_segment.music] = _music;
	segment[_segment_num][cutscene_segment.sfx] = _sfx;
	segment[_segment_num][cutscene_segment.transition] = _transition;
}