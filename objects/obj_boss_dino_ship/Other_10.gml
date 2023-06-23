/// @description Init

var _i, _angle, _x1, _y1, _x2, _y2, _saber;

// Inherit the parent event
event_inherited();

saber_angle_previous = saber_angle;

for (_i = 0; _i < array_length(hitbox_saber); ++_i)
{
	_angle = saber_angle + (_i * 90);
	_x1 = lengthdir_x(56, _angle);
	_y1 = lengthdir_y(56, _angle);
	_x2 = lengthdir_x(64, _angle);
	_y2 = lengthdir_y(64, _angle);
	
	_saber = hitbox_saber[_i];
	
	with (_saber)
	{
		x_offset = _x1;
		y_offset = _y1;
		shape_x1 = 0;
		shape_y1 = 0;
		shape_x2 = _x2;
		shape_y2 = _y2;
	}
}

switch (state)
{
	case boss_dino_ship_states.intro:
		if (state_begin)
		{
			x = 800;
			y = 368;
			speed_x = 2;
		}
		
		y = min(y + 4, 720);
		if (y == 720)
			state_next_set(boss_dino_ship_states.normal);
		break;
	case boss_dino_ship_states.normal:
		if (state_begin)
		{
			movement = 0;
		}
		
		movement = (movement + 2) mod 360;
		y = 720 + lengthdir_y(96, movement);
		
		x += speed_x;
		saber_angle += 1;
		
		switch (face)
		{
			case -1:
				speed_x = max(speed_x - 0.25, -1);
				if (x <= 544)
					face = 1;
				break;
			case 0:
				break;
			case 1:
				speed_x = min(speed_x + 0.25, 1);
				if (x >= 1056)
					face = -1;
				break;
		}
		break;
}

if (saber_angle >= 360)
{
	saber_angle -= 360;
	saber_angle_previous -= 360;
}