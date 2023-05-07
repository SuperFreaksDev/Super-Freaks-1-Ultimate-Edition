/// @description Hit

if (state == enemy_gunnery_states.reload)
	image_index = 0;
else
	state_next_set(enemy_gunnery_states.reload);