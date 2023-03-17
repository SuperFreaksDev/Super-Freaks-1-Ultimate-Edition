/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(0, 0, hitbox_active.passive, enemy_hitbox_behaviors.heavy_invulnerable,,16);

active = false;
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

angle_start = image_angle;
angle = angle_start;
angle_previous = angle;