/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];
var _hitbox_player = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox_other];
var _hitbox_self_x = _hitbox_self.x_offset + x;
var _hitbox_self_y = _hitbox_self.y_offset + y;
var _player_num = 0;
var _hint_screen, _hit = false;

with (other)
{
	if (ball)
	{
		//ball = false;
		speed_h = 3 * sign(((x + x_start_frame) / 2) - _hitbox_self_x);
		speed_v = 3 * sign(((y + y_start_frame) / 2) - _hitbox_self_y);
		while (hitbox_collision_check(_hitbox_self, _hitbox_player))
		{
			x += speed_h * 2;
			y += speed_v * 2;
		}
		lock_controls_horizontal = 20;
		_hit = true;
		_player_num = player_number;
	}
}

if (_hit && !room_transition_active_get())
{
	_hint_screen = instance_create_layer(0, 0, "layer_instances", obj_hint_screen);
	switch (global.story_mode)
	{
		case story_modes.kranion:
			if (hint_kranion != "")
				_hint_screen.hint = hint_kranion;
			else
				_hint_screen.hint = hint;
			break;
		case story_modes.swordsman:
			if (hint_swordsman != "")
				_hint_screen.hint = hint_swordsman;
			else
				_hint_screen.hint = hint;
			break;
		case story_modes.anti_freaks:
			if (hint_antifreaks != "")
				_hint_screen.hint = hint_kranion;
			else
				_hint_screen.hint = hint;
			break;
		default:
			_hint_screen.hint = hint;
			break;
	}
	_hint_screen.player_number = _player_num;
	game_pause_set(true);
}