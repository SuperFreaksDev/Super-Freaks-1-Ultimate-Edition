/// @description Spawn

// Inherit the parent event
event_inherited();

switch (trigger_id)
{
	case -1:
		active = true;
		break;
	default:
		active = trigger_get(trigger_id);
		break;
}

timer = -shoot_frequency_delay;
ammo = ammo_amount;
angle = angle_start;
angle_previous = angle;