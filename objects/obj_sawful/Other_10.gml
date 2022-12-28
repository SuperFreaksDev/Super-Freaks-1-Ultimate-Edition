/// @description Step

event_inherited();

buzzsaw_angle_previous = buzzsaw_angle;
buzzsaw_angle = (buzzsaw_angle + 30) mod 360;

path_move(my_path, path_end_actions.reverse);