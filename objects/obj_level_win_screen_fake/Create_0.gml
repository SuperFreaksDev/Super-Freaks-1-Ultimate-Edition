/// @description 

var _i = 0;
trophy_count = 0;
perfect_flag = true;
clear_text = "clear";
victory_quote = choose("You did it!", "Look ma, I'm on TV!", "Guys I just saw a dog!", "Randomized victory quote!", "Gucci!", "You don't suck!", "Above average!", "Are you not entertained?", "We stan you king!", "Oh baby a triple!", "360 no scope!", "Number 1 victory royale!", "Positive reinforcement!", "Keep rollin rollin rollin rollin rollin", "Good! Great! Awesome! Outstanding! Amazing!", "It's yorbin' time!", "Dopefish lives!!!", "The sweep never ends!", "Congraturaisins!", "You're winner!", "That'll be four bucks baby you want fries with that?", "Rip and tear!", "Unga bunga!", "Can you do all that again? I wasn't looking", "Real", "Ture", "You cheated not only the game but yourself");
screen_shake(0, 0);
global.frame_machine_level.pause = true;
global.frame_machine_player.pause = true;

// Inherit the parent event
event_inherited();

animate = 0;
depth = -9998;
state_next_set(0);
game_timer_pause(true);
if (global.game_mode != game_modes.boss_rush)
	music_set(msc_victory);

lower_offset = 0;

global.levels[global.level_id][level_data.trophies] = (global.levels[global.level_id][level_data.trophies] | global.trophies);

for (_i = 0; _i < global.trophies_max; ++_i)
{
	if (!bit_get(global.trophies, _i))
		perfect_flag = false;
}
