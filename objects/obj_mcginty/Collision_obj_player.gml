/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];
var _hitbox_self_x = _hitbox_self.x_offset + x;
var _hitbox_self_y = _hitbox_self.y_offset + y;
var _hitbox_player = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox_other];
var _enemy_hurt = false;
var _player_hurt = false;
var _enemy_hurt_timer = hurt_timer;
var _enemy = id;

player_hit = other;
player_hit_speed_x = other.x - other.x_start_frame;
player_hit_speed_y = other.y - other.y_start_frame;

with (other)
{
	if (ball)
	{
		//speed_h = 4 * sign(x - _hitbox_self_x);
		if (underwater)
		{
			speed_h = 3 * sign(-speed_h);
			speed_v = 3 * sign(-speed_v);
		}
		else
		{
			//speed_h = 4 * sign(-speed_h);
			speed_h = 4 * sign(((x + x_start_frame) / 2) - _hitbox_self_x);
			speed_v = 3 * sign(((y + y_start_frame) / 2) - _hitbox_self_y);
			//speed_v = min(speed_v, -5);
		}
		while (hitbox_collision_check(_hitbox_self, _hitbox_player))
		{
			x += speed_h * 2;
			if (!ground_on)
				y += speed_v * 2;
		}
		lock_controls_horizontal = 20;
		_enemy_hurt = true;
	}
	else
	{
		_player_hurt = true;
		while (hitbox_collision_check(_hitbox_self, _hitbox_player))
		{
			x += 2 * sign(x - _enemy.x);
			if (!ground_on)
				y += 2 * sign(y - _enemy.y);
		}
	}
}

if (_enemy_hurt)
{
	with (other)
	{
		if (physics == player_physics_modifiers.ice)
			player_physics_set_normal();
	}
	enemy_hurt();
}

if (_player_hurt)
{
	if (_enemy_hurt_timer == 0)
	{
		with (other)
			player_hurt();
	}
}
