//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    
    keyboard_and_mouse:
    {
        up:    [input_binding_key(vk_up),    input_binding_key("W")],
        down:  [input_binding_key(vk_down),  input_binding_key("S")],
        left:  [input_binding_key(vk_left),  input_binding_key("A")],
        right: [input_binding_key(vk_right), input_binding_key("D")],
        
		jump: [input_binding_key("Z"), input_binding_key(vk_space), input_binding_mouse_button(mb_left)],
		
		bubble: [input_binding_key("X"), input_binding_mouse_button(mb_right)],
		rubberband: [input_binding_key("C"), input_binding_key("Q")],
		rubberband_color: [input_binding_key("V"), input_binding_key("E")],
		drop_out: input_binding_key(vk_shift),
        
        start: [input_binding_key(vk_escape), input_binding_key(vk_enter)],
        confirm:  [input_binding_key("Z"), input_binding_mouse_button(mb_left)],
        deny:  [input_binding_key("X"), input_binding_mouse_button(mb_right)],
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
        
        jump:  input_binding_gamepad_button(gp_face1),
		
        bubble:  input_binding_gamepad_button(gp_face2),
        rubberband: input_binding_gamepad_button(gp_shoulderlb),
		rubberband_color: input_binding_gamepad_button(gp_shoulderrb),
		drop_out: input_binding_gamepad_button(gp_select),
        
        start: input_binding_gamepad_button(gp_start),
        confirm:  input_binding_gamepad_button(gp_face1),
        deny:  input_binding_gamepad_button(gp_face2),
    },
    
};

//Sets the preferred behaviour for input_binding_get() when a player has no profile set
//This typically happens when hotswapping and the player hasn't pressed any buttons/keys/etc. yet
//
//Three options are available:
//  0 = Always return an empty binding if the player has no profile set
//  1 = Prefer INPUT_AUTO_PROFILE_FOR_KEYBOARD for bindings if on desktop OSs, and use gamepad bindings otherwise
//  2 = Prefer INPUT_AUTO_PROFILE_FOR_GAMEPAD for bindings
#macro INPUT_FALLBACK_PROFILE_BEHAVIOUR  1

//Names of the default profiles to use when automatically assigning profiles based on the source that a
//player is currently using. Default profiles for sources that you don't intend to use in your game do
//not need to be defined
#macro INPUT_AUTO_PROFILE_FOR_KEYBOARD     "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_MOUSE        "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_GAMEPAD      "gamepad"
#macro INPUT_AUTO_PROFILE_FOR_MIXED        "mixed"
#macro INPUT_AUTO_PROFILE_FOR_MULTIDEVICE  "multidevice"

//Toggles whether INPUT_KEYBOARD and INPUT_MOUSE should be considered a single source at all times
//For most PC games you'll want to tie the keyboard and mouse together but occasionally having them
//separated out is useful
#macro INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER  true

//Whether to allow default profiles (see below) to contain different verbs. Normally every profile
//should contain a reference to every verb, but for complex games this is inconvenient
#macro INPUT_ALLOW_ASSYMMETRIC_DEFAULT_PROFILES  true