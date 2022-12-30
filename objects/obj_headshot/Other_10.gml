/// @description Step

var _target = player_nearest_alive();
var _fireball;
var _zone = zone_index;

// Inherit the parent event
event_inherited();

collision_flags = 0;

switch (state)
{
	case 0: //Chase
		if (state_begin)
		{
			sprite_index = spr_headshot;
			timer = 0;
		}
		
		timer = min(timer + 1, 32);
			
		if (!is_undefined(_target))
		{
			switch (face)
			{
				case 0: #region //Facing Right
					if (_target.y > y + 24)
						speed_move = min(speed_move + speed_acc, speed_chase);
					else if (_target.y < y - 24)
						speed_move = max(speed_move - speed_acc, -speed_chase);
					else
					{
						if (timer == 32)
							state_next_set(1);
					}
						
					y += speed_move;
					
					switch (sign(y - y_previous))
					{
						case -1:
							collision_up();
							
							if !collision_exists_left(,,,, 8)
							{
								y = y_previous;
								speed_move = 0;
							}
							break;
						case 0:
							break;
						case 1:
							collision_down();
							
							if !collision_exists_left(,,,, 8)
							{
								y = y_previous;
								speed_move = 0;
							}
							break;
					}
					
					if (collision_flag_get_up() || collision_flag_get_down())
						speed_move = 0;
					break;
				#endregion
				case 1: #region //Facing Up
					if (_target.x > x + 24)
						speed_move = min(speed_move + speed_acc, speed_chase);
					else if (_target.x < x - 24)
						speed_move = max(speed_move - speed_acc, -speed_chase);
					else
					{
						if (timer == 32)
							state_next_set(1);
					}
						
					x += speed_move;
					
					switch (sign(x - x_previous))
					{
						case -1:
							collision_left();
							
							if !collision_exists_down(,,,, 8)
							{
								x = x_previous;
								speed_move = 0;
							}
							break;
						case 0:
							break;
						case 1:
							collision_right();
							
							if !collision_exists_down(,,,, 8)
							{
								x = x_previous;
								speed_move = 0;
							}
							break;
					}
					
					if (collision_flag_get_left() || collision_flag_get_right())
						speed_move = 0;
					break;
				#endregion
				case 2: #region //Facing Left
					if (_target.y > y + 24)
						speed_move = min(speed_move + speed_acc, speed_chase);
					else if (_target.y < y - 24)
						speed_move = max(speed_move - speed_acc, -speed_chase);
					else
					{
						if (timer == 32)
							state_next_set(1);
					}
						
					y += speed_move;
					
					switch (sign(y - y_previous))
					{
						case -1:
							collision_up();
							
							if !collision_exists_right(,,,, 8)
							{
								y = y_previous;
								speed_move = 0;
							}
							break;
						case 0:
							break;
						case 1:
							collision_down();
							
							if !collision_exists_right(,,,, 8)
							{
								y = y_previous;
								speed_move = 0;
							}
							break;
					}
					
					if (collision_flag_get_up() || collision_flag_get_down())
						speed_move = 0;
					break;
				#endregion
				case 3: #region //Facing Down
					if (_target.x > x + 24)
						speed_move = min(speed_move + speed_acc, speed_chase);
					else if (_target.x < x - 24)
						speed_move = max(speed_move - speed_acc, -speed_chase);
					else
					{
						if (timer == 32)
							state_next_set(1);
					}
						
					x += speed_move;
					
					switch (sign(x - x_previous))
					{
						case -1:
							collision_left();
							
							if !collision_exists_up(,,,, 8)
							{
								x = x_previous;
								speed_move = 0;
							}
							break;
						case 0:
							break;
						case 1:
							collision_right();
							
							if !collision_exists_up(,,,, 8)
							{
								x = x_previous;
								speed_move = 0;
							}
							break;
					}
					
					if (collision_flag_get_left() || collision_flag_get_right())
						speed_move = 0;
					break;
				#endregion
			}
			
			animate_speed = speed_move * 0.125;
		}
		else
		{
			speed_move = 0;
			animate_speed = 0;
		}
		break;
	case 1: //Shoot
		if (state_begin)
		{
			sprite_index = spr_headshot_prepare;
			timer = 0;
		}
		
		timer = min(timer + 1, 8);
		
		if (timer == 8)
		{
			state_next_set(0);
			_fireball = instance_create_layer(x, y, "layer_instances", obj_enemy_fireball, 
			{
				speed: 4,
				direction: face * 90,
				zone_index: _zone
			});
		}
		break;
}