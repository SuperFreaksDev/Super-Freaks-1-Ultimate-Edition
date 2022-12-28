/// @description 

game_pause_set(false);
with (obj_menu_pause)
	state_next_set(pause_menu_states.inactive);

zones_clear();
hashmap_collision_clean();

with (obj_master)
{
	if (!persistent)
		instance_destroy();
}

gc_collect();
gc_timer = 0;

global.frame_machine_player.frame_amount = 0;
global.frame_machine_level.frame_amount = 0;