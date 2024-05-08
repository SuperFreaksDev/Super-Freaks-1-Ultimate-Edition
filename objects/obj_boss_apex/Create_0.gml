/// @description Init

// Inherit the parent event
event_inherited();

enum BOSS_APEX_STATES
{
	INTRO = 0,
	IDLE,
	SUMMON,
}

timer = 0;
teleport_timer = 0;

hp = 20;

hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive, enemy_hitbox_behaviors.heavy,, -48, -64, 48, 64);

state_next_set(BOSS_APEX_STATES.INTRO, 0);
collider_detector_up_set(0, 0, 0, 0, -88);
collider_detector_down_set(0, 0, 0, 0, 88);
collider_detector_sides_set(0, 0, 0, 0, 64);