/// @description Camera

switch (state)
{
	case player_states.normal:
		player_camera_extend_x();
	
		if (jetpack)
			player_camera_extend_y();
		else
		{
			if (ground_on)
			{
				if (camera.y > y)
					camera.y = max(camera.y - 6, y);
				else
					camera.y = min(camera.y + 6, y);
			}
			else
			{
				if (y < (camera.y - 48))
					camera.y += (y - (camera.y - 48));
				if (y > (camera.y + 32))
					camera.y += (y - (camera.y + 32));
			}
		}
		break;
	case player_states.hurt:
		camera.x += (x - x_start_frame);
		
		if (y < (camera.y - 48))
			camera.y += (y - (camera.y - 48));
		if (y > (camera.y + 32))
			camera.y += (y - (camera.y + 32));
		break;
	case player_states.death:
	case player_states.death_fall:
		break;
	case player_states.climb:
		player_camera_extend_x();
		player_camera_extend_y(1.5);
		break;
	default:
		camera.x += (x - x_start_frame);
		camera.y += (y - y_start_frame);
		break;
}