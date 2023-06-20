/// @description 

var _frame_delta = frame_delta_level_get();
var _x = lerp(x_start_frame, x, _frame_delta);
var _y = lerp(y_start_frame, y, _frame_delta);
var _aura_angle = lerp_360(aura_angle_previous, aura_angle, _frame_delta);
var _spike_angle = lerp_360(spike_angle_previous, spike_angle, _frame_delta);
var _face_angle = lerp_360(face_angle_previous, face_angle, _frame_delta);

if (state == boss_kranion_final_states.death_2)
{
	draw_sprite(spr_boss_kranion_death, 0, _x, _y);
}
else
{
	draw_sprite_ext(spr_boss_kranion_ultimate_aura, 0, _x, _y, aura_size, aura_size, _aura_angle, c_white, 1);
	draw_sprite_ext(spr_boss_kranion_ultimate_spikes, 0, _x, _y, spike_size, spike_size, _spike_angle, c_white, 1);
	draw_sprite(spr_boss_kranion_ultimate_body, 0, _x, _y);
	draw_sprite_ext(spr_boss_kranion_ultimate_face, image_index, _x, _y, 1, 1, _face_angle, c_white, 1);
}