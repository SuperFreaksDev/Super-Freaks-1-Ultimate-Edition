/// @description Step 2

if (y < -128)
	y = -128;

switch (state)
{
	case player_states.normal:
		player_camera_extend_x();
	
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
		
		if (state_next != player_states.climb)
			instance_attach = undefined;
		else if (hang_on == false || is_undefined(instance_attach) || !instance_exists(instance_attach))
		{
			instance_attach = undefined;
			state_next_set(player_states.normal);
		}
		break;
	default:
		camera.x += (x - x_start_frame);
		camera.y += (y - y_start_frame);
		break;
}

if (invincible)
	instance_create_layer(x - 12 + random(24), y - 12 + random(24), "layer_instances", obj_invincibility_stars);