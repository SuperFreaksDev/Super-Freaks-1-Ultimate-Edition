/// @description 

var _i = 0;
var _level_save = global.level_save_data_list[global.story_mode][global.level_id];
trophy_count = 0;
perfect_flag = true;
clear_text = "clear";

victory_quote_array = [
"You did it!", 
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
"Wubba, wubba. I'm in the freak today, boy!",
"What the freak did you just freaking say about me, you little freak? I'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Castle Kranion, and I have over 300 confirmed victory royales. I am trained in gorilla warfare and I'm the top sniper in the entire USC armed forces. You are nothing to me but just another target. I will wipe you the freak out with precision the likes of which has never been seen before on this Earth, mark my freaking words. You think you can get away with saying that stuff to me over the Internet? Think again, freaker. As we speak I am contacting my secret network of spies across the USC and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You're freaking dead, kid. I can be anywhere, anytime, and I can down you in over seven hundred ways, and that's just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Of Craziness Marine Corps and I will use it to its full extent to wipe your miserable behind off the face of the continent, you little freak. If only you could have known what unholy retribution your little 'clever' comment was about to bring down upon you, maybe you would have held your freaking tongue. But you couldn't, you didn't, and now you're paying the price, you freaking idiot. I will blast fury all over you and you will drown in it. You're freaking dead, kiddo.",
"Grab a slice of bread and staple it to a tree!",
"Is this sightreadable?",
"Also try Mr. Shootem Breaks Out!",
"How 'bout that freak's face when he saw the gyatt"
];

victory_quote_array_windows = [
"Activate Windows\nGo to Settings to activate Windows"
];
victory_quote_array_mac = [
"An apple a day!",
"Hey Siri, where's the 5th number star in Cool n Chill Secret?"
];
victory_quote_array_linux = [
"I use Arch btw",
"They should make a Super Freaks distro where the only apps are Super Freaks games"
];
victory_quote_array_android = [
"Para Android"
];

switch (os_type)
{
    case os_windows:
        array_push(victory_quote_array, victory_quote_array_windows);
        break;
    case os_macosx:
        array_push(victory_quote_array, victory_quote_array_mac);
        break;
    case os_linux:
        array_push(victory_quote_array, victory_quote_array_linux);
        if (current_weekday == 2) //check if Tuesday
            array_push(victory_quote_array, "Is your printer working?");
        break;
    case os_android:
        array_push(victory_quote_array, victory_quote_array_android);
        break;
    case os_unknown:
        victory_quote_array = ["Ok literally how did you even get this game running on here?"];
        break;
}

victory_quote = array_shuffle(victory_quote_array)[0];

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
