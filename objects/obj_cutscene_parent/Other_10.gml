/// @description Step
var _text_length;
var _my_message = string(text_next);
var _sprite, _music;

if (!room_transition_active_get())
{
	if (!is_undefined(global.player_lead) && (input_check_pressed("start", global.player_lead)))
		event_user(5);
	else
	{
		if (sprite_index != sprite_next)
		{
		    if (sprite_alpha > 0)
		        sprite_alpha -= 0.1;
		    else
		    {
		        sprite_alpha = 0;
		        sprite_index = sprite_next;
		    }
		}
		else
		{
		    if (sprite_alpha < 1)
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
