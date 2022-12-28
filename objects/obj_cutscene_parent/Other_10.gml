/// @description Step
var _text_length;
var _button, _button_start;
var _my_message = string(text_next);
var _sprite, _music;

controls_step(0);

_button = controls_action_state_get(controls_actions.jump, 0);
_button_start = controls_action_state_get(controls_actions.start, 0);

if (!room_transition_active_get())
{
	if (_button_start == controls_action_states.press)
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
		                if (_button == controls_action_states.hold)
		                    text_draw += 3;
		                else
		                    text_draw += 1;
		                //sound_play(snd_text);
		            }
		            else
		            {
		                text_draw = _text_length;
						if (segment_current == -1 || (_button == controls_action_states.press))
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
