/// @description Step
var _text_length;
var _my_message = string(text_next);
var _sprite, _music;
var _transition_type;

if (segment_current >= 0)
	_transition_type = segment[segment_current][cutscene_segment.transition];
else
	_transition_type = cutscene_transitions.fade_black;

if (!room_transition_active_get())
{
	if (!is_undefined(global.player_lead) && (input_check_pressed("start", global.player_lead)))
		event_user(5);
	else
	{
		if (sprite_index != sprite_next)
		{
			switch (_transition_type)
			{
				case cutscene_transitions.shake:
					screen_shake(0, 12);
				case cutscene_transitions.NA:
				    sprite_alpha = 1;
				    sprite_index = sprite_next;
					break;
				case cutscene_transitions.fade_black:
				case cutscene_transitions.fade_white:
				case cutscene_transitions.fade:
				    if (sprite_alpha > 0)
				        sprite_alpha -= 0.1;
				    else
				    {
				        sprite_alpha = 0;
				        sprite_index = sprite_next;
				    }
					break;
			}
		}
		else
		{
		    if ((_transition_type == cutscene_transitions.fade_black || _transition_type == cutscene_transitions.fade_white) && sprite_alpha < 1)
		        sprite_alpha += 0.1;
		    else
		    {
		        sprite_alpha = 1;
		        if (text != _my_message)
		        {
		            text = string(text_next);
		            text_draw = 0;
		        }
		        else
		        {
		            _text_length = string_length(text);
		            if (text_draw < _text_length)
		            {
		                if (!is_undefined(global.player_lead) && (input_check("confirm", global.player_lead)))
		                    text_draw += 3;
		                else
		                    text_draw += 1;
		                //sound_play(snd_text);
		            }
		            else
		            {
		                text_draw = _text_length;
						if (segment_current == -1 || (!is_undefined(global.player_lead) && (input_check_pressed("confirm", global.player_lead))))
						{
							if (segment_current + 1 >= array_length(segment))
								event_user(5);
							else
							{
								segment_current++;
								_sprite = segment[segment_current][cutscene_segment.sprite_index];
								text_next = segment[segment_current][cutscene_segment.text];
								_music = segment[segment_current][cutscene_segment.music];
							
								if (_sprite != -1)
									sprite_next = segment[segment_current][cutscene_segment.sprite_index];
								if (_music != -1)
									music_set(_music);
							}
						}
		            }
		        }
		    }
		}
	}
}
