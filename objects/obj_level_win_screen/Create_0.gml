/// @description 

var _i = 0;
var _level_save = global.level_save_data_list[global.story_mode][global.level_id];
trophy_count = 0;
perfect_flag = true;
clear_text = "clear";

victory_quote = choose("You did it!", 
"Look ma, I'm on TV!", 
"Guys I just saw a dog!", 
"Randomized victory quote!", 
"Gucci!", 
"You don't suck!", 
"Above average!", 
"Are you not entertained?", 
"We stan you king!", 
"Oh baby a triple!", "360 no scope!", 
"Number 1 victory royale!", 
"Positive reinforcement!", 
"Keep rollin rollin rollin rollin rollin", 
"Good! Great! Awesome! Outstanding! Amazing!", 
"It's yorbin' time!", 
"Dopefish lives!!!", 
"The sweep never ends!", 
"Congraturaisins!", 
"You're winner!", 
"That'll be four bucks baby you want fries with that?", 
"Rip and tear!", 
"Unga bunga!", 
"Can you do all that again? I wasn't looking", 
"Real", 
"Ture", 
"You cheated not only the game but yourself", 
"This is weirder than the 4th of July at Rick James' house!", 
"Ssssssssmokin!", 
"Now do it blindfolded!", 
"Let's McFreakin lose it!", 
"H", 
"E", 
"I'm freaks!", 
"I heard you can lose a lot of weight on it!", 
"That blew my skeleton out of my body! Wanna trade?", 
"Wowie zowie!", 
"Bones", 
"It's been 16 hours since you replied to me. Is this referencing arthritis?", 
"Am I the only one who likes Super Freaks 1 Ultimate Edition?", 
"SuperFreaksDev just shot himself in the foot. I'm an expert on Japanese culture",
"Wanna watch me brush my teeth?",
"Licking doorknobs is illegal on other planets!",
"What's up gamers it's Mayor Cheddar",
"What was with those homies dissing my freaks? Why did they gotta front?",
"FREAK I HATE IT!!!!",
"Kino joeshima freakmentum",
"Mr. Freaksdev I am going to remove your collar bones",
"Super Freaks 4 Episode 1 as you turely imagined it",
"5th Super Freak coming soon",
"I have no choice, none whatsoever, but to give this freaky sausage a 5 out of 5!",
"Uh super freaks? Yeah, I sure hope it does",
"Four different meat Scruffys!",
"Freak you, you freaking freak, always naysaying! Everything I create! You create something like Super Freaks 1 Ultimate Edition!",
"Scruffy King Quincy",
"Gambi Tikiman",
"It looks like you're trying to play Super Freaks 1 Ultimate Edition. Do you need some help?",
"Erwal",
"Wubba, wubba. I'm in the freak today, boy!");

screen_shake(0, 0);
global.frame_machine_level.pause = true;
global.frame_machine_player.pause = true;

// Inherit the parent event
event_inherited();

animate = 0;
depth = -9998;
state_next_set(0);
game_timer_pause(true);
music_set(msc_victory);

_level_save.trophies = (_level_save.trophies | global.trophies);

for (_i = 0; _i < global.trophies_max; ++_i)
{
	if (!bit_get(global.trophies, _i))
		perfect_flag = false;
}
