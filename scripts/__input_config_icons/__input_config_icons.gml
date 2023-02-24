/// This struct contains mappings from binding labels - a combination of keyboard key names, mouse button
/// names, and abstract gamepad names - to more friendly terms that you can show a player. Typically you'd
/// set up this function to return sprites such that you can draw gamepad icons as visual icons.
/// 
/// Default values in this struct reflect the particular, and sometimes unexpected, buttons that each gamepad
/// binding maps to on the actual physical hardware. There are a handful of special cases at the top of the
/// struct that are used to handle errors or misconfigurations.



//Special case: When a non-binding value is being evaluated
//              This should only happen if input_binding_get_icon() is given an invalid input argument
input_icons("not a binding")
.add(all, "not a binding")

//Special case: When an empty binding is being evaluated
input_icons("empty")
.add(all, "empty")



//Optional remapping for keyboard and mouse
//This is useful for turning keyboard keys into sprite icons to match other assets, or for returning formatted strings (e.g. for use with Scribble)
//Any keyboard key label not in this struct will simply fall through and return the key name
#region Keyboard and Mouse
	input_icons("keyboard and mouse")
		//Mouse Buttons
		.add("mouse button left", spr_control_icon_mouse_left)
		.add("mouse button middle", spr_control_icon_mouse_middle)
		.add("mouse button right", spr_control_icon_mouse_right)
		.add("mouse button forward", spr_control_icon_mouse_forward)
		.add("mouse button back", spr_control_icon_mouse_back)
		.add("mouse button unknown", spr_control_icon_mouse_unknown)
		.add("mouse wheel up", spr_control_icon_mouse_wheel_up)
		.add("mouse wheel down", spr_control_icon_mouse_wheel_down)
		.add("touchscreen press", spr_control_icon_mouse_touchscreen)
		//Arrow Keys
		.add("arrow left", spr_control_icon_keyboard_arrow_left)
		.add("arrow up", spr_control_icon_keyboard_arrow_up)
		.add("arrow right", spr_control_icon_keyboard_arrow_right)
		.add("arrow down", spr_control_icon_keyboard_arrow_down)
		//Commands
		.add("alt", spr_control_icon_keyboard_alt)
		.add("backspace", spr_control_icon_keyboard_backspace)
		.add("ctrl", spr_control_icon_keyboard_ctrl)
		.add("delete", spr_control_icon_keyboard_del)
		.add("enter", spr_control_icon_keyboard_enter)
		.add("escape", spr_control_icon_keyboard_esc)
		.add("tab", spr_control_icon_keyboard_tab)
		.add("shift", spr_control_icon_keyboard_shift)
		//Symbols
		.add("\"", spr_control_icon_keyboard_back_slash)
		.add("[", spr_control_icon_keyboard_bracket_square_left)
		.add("]", spr_control_icon_keyboard_bracket_square_right)
		.add("/", spr_control_icon_keyboard_forward_slash)
		.add("|", spr_control_icon_keyboard_vertical_bar)
		//Numbers
		.add("0", spr_control_icon_keyboard_0)
		.add("1", spr_control_icon_keyboard_1)
		.add("2", spr_control_icon_keyboard_2)
		.add("3", spr_control_icon_keyboard_3)
		.add("4", spr_control_icon_keyboard_4)
		.add("5", spr_control_icon_keyboard_5)
		.add("6", spr_control_icon_keyboard_6)
		.add("7", spr_control_icon_keyboard_7)
		.add("8", spr_control_icon_keyboard_8)
		.add("9", spr_control_icon_keyboard_9)
		//Numpad
		
		//Function Keys
		
		//Letters
		.add("A", spr_control_icon_keyboard_a)
		.add("B", spr_control_icon_keyboard_b)
		.add("C", spr_control_icon_keyboard_c)
		.add("D", spr_control_icon_keyboard_d)
		.add("E", spr_control_icon_keyboard_e)
		.add("F", spr_control_icon_keyboard_f)
		.add("G", spr_control_icon_keyboard_g)
		.add("H", spr_control_icon_keyboard_h)
		.add("I", spr_control_icon_keyboard_i)
		.add("J", spr_control_icon_keyboard_j)
		.add("K", spr_control_icon_keyboard_k)
		.add("L", spr_control_icon_keyboard_l)
		.add("M", spr_control_icon_keyboard_m)
		.add("N", spr_control_icon_keyboard_n)
		.add("O", spr_control_icon_keyboard_o)
		.add("P", spr_control_icon_keyboard_p)
		.add("Q", spr_control_icon_keyboard_q)
		.add("R", spr_control_icon_keyboard_r)
		.add("S", spr_control_icon_keyboard_s)
		.add("T", spr_control_icon_keyboard_t)
		.add("U", spr_control_icon_keyboard_u)
		.add("V", spr_control_icon_keyboard_v)
		.add("W", spr_control_icon_keyboard_w)
		.add("X", spr_control_icon_keyboard_x)
		.add("Y", spr_control_icon_keyboard_y)
		.add("Z", spr_control_icon_keyboard_z)
#endregion


#region Gamepads

//Xbox One and Series S|X controllers
input_icons("xbox one")
.add("gamepad face south",         spr_control_icon_xboxone_button_down)
.add("gamepad face east",          spr_control_icon_xboxone_button_right)
.add("gamepad face west",          spr_control_icon_xboxone_button_left)
.add("gamepad face north",         spr_control_icon_xboxone_button_up)
.add("gamepad shoulder l",         spr_control_icon_xboxone_button_shoulder_l)
.add("gamepad shoulder r",         spr_control_icon_xboxone_button_shoulder_r)
.add("gamepad trigger l",          spr_control_icon_xboxone_button_trigger_l)
.add("gamepad trigger r",          spr_control_icon_xboxone_button_trigger_r)
.add("gamepad select",             spr_control_icon_xboxone_button_select)
.add("gamepad start",              spr_control_icon_xboxone_button_select)
.add("gamepad dpad left",          spr_control_icon_xboxone_dpad_left)
.add("gamepad dpad right",         spr_control_icon_xboxone_dpad_right)
.add("gamepad dpad up",            spr_control_icon_xboxone_dpad_up)
.add("gamepad dpad down",          spr_control_icon_xboxone_dpad_down)

.add("gamepad thumbstick l left",  spr_control_icon_xboxone_stick_l_left)
.add("gamepad thumbstick l right", spr_control_icon_xboxone_stick_l_right)
.add("gamepad thumbstick l up",    spr_control_icon_xboxone_stick_l_up)
.add("gamepad thumbstick l down",  spr_control_icon_xboxone_stick_l_down)
.add("gamepad thumbstick l click", spr_control_icon_xboxone_stick_l_click)

.add("gamepad thumbstick r left",  spr_control_icon_xboxone_stick_r_left)
.add("gamepad thumbstick r right", spr_control_icon_xboxone_stick_r_right)
.add("gamepad thumbstick r up",    spr_control_icon_xboxone_stick_r_up)
.add("gamepad thumbstick r down",  spr_control_icon_xboxone_stick_r_down)
.add("gamepad thumbstick r click", spr_control_icon_xboxone_stick_r_click)

//Series S|X only
.add("gamepad misc 1", "share")

//These are used for Elite controllers only
.add("gamepad paddle 1",           "P1")
.add("gamepad paddle 2",           "P3")  //Thanks SDL
.add("gamepad paddle 3",           "P2")  //Many thanks
.add("gamepad paddle 4",           "P4")

//PlayStation 5
input_icons("ps5")
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "create")
.add("gamepad start",              "options")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

.add("gamepad touchpad click", "touchpad click")

//Not available on the PlayStation 5 console itself but available on other platforms
.add("gamepad misc 1",         "mic")

//Switch handheld/dual JoyCon/Pro Controller
input_icons("switch")
.add("gamepad face south",         "B")
.add("gamepad face east",          "A")
.add("gamepad face west",          "Y")
.add("gamepad face north",         "X")
.add("gamepad shoulder l",         "L")
.add("gamepad shoulder r",         "R")
.add("gamepad trigger l",          "ZL")
.add("gamepad trigger r",          "ZR")
.add("gamepad select",             "minus")
.add("gamepad start",              "plus")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "thumbstick l click")
 
.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "thumbstick r click")
  
//Not available on the Switch console itself but available on other platforms
.add("gamepad guide",              "home")
.add("gamepad misc 1",             "capture")

//Left-hand Switch JoyCon
//This setup assums horizontal hold type
input_icons("switch joycon left")
.add("gamepad face south",         "face south")
.add("gamepad face east",          "face east")
.add("gamepad face west",          "face west") 
.add("gamepad face north",         "face north")
.add("gamepad shoulder l",         "SL")
.add("gamepad shoulder r",         "SR")
.add("gamepad start",              "minus")

.add("gamepad thumbstick l left",  "thumbstick left")
.add("gamepad thumbstick l right", "thumbstick right")
.add("gamepad thumbstick l up",    "thumbstick up")
.add("gamepad thumbstick l down",  "thumbstick down")
.add("gamepad thumbstick l click", "thumbstick click")

//Not available on the Switch console itself but available on other platforms
.add("gamepad select",             "capture")

//Right-hand Switch JoyCon
//This setup assums horizontal hold type
input_icons("switch joycon right")
.add("gamepad face south",         "face south")
.add("gamepad face east",          "face east")
.add("gamepad face west",          "face west") 
.add("gamepad face north",         "face north")
.add("gamepad shoulder l",         "SL")
.add("gamepad shoulder r",         "SR")
.add("gamepad start",              "plus")

.add("gamepad thumbstick l left",  "thumbstick left")
.add("gamepad thumbstick l right", "thumbstick right")
.add("gamepad thumbstick l up",    "thumbstick up")
.add("gamepad thumbstick l down",  "thumbstick down")
.add("gamepad thumbstick l click", "thumbstick click")

//Not available on the Switch console itself but available on other platforms
.add("gamepad select",             "home")

//Xbox 360
input_icons("xbox 360")
.add("gamepad face south",         "A")
.add("gamepad face east",          "B")
.add("gamepad face west",          "X")
.add("gamepad face north",         "Y")
.add("gamepad shoulder l",         "LB")
.add("gamepad shoulder r",         "RB")
.add("gamepad trigger l",          "LT")
.add("gamepad trigger r",          "RT")
.add("gamepad select",             "back")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "thumbstick l click")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "thumbstick r click")

//PlayStation 4
input_icons("ps4")
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "share")
.add("gamepad start",              "options")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

.add("gamepad touchpad click", "touchpad click")

//PlayStation 1-3
input_icons("psx")
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "select")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

//Nintendo Gamecube
input_icons("gamecube")
.add("gamepad face south",         "A")
.add("gamepad face east",          "X")
.add("gamepad face west",          "B")
.add("gamepad face north",         "Y")
.add("gamepad shoulder r",         "Z")
.add("gamepad trigger l",          "L")
.add("gamepad trigger r",          "R")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")

//The following icons are for Switch GameCube controllers and adapters only
.add("gamepad thumbstick l click", "thumbstick l click")
.add("gamepad thumbstick r click", "thumbstick r click")
.add("gamepad guide",              "home")
.add("gamepad misc 1",             "capture")

//Nintendo 64
input_icons("n64")
.add("gamepad face south",         "A")
.add("gamepad face east",          "B")
.add("gamepad shoulder l",         "L")
.add("gamepad shoulder r",         "R")
.add("gamepad trigger l",          "Z")
.add("gamepad start",              "start")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")

.add("gamepad thumbstick l left",  "thumbstick left")
.add("gamepad thumbstick l right", "thumbstick right")
.add("gamepad thumbstick l up",    "thumbstick up")
.add("gamepad thumbstick l down",  "thumbstick down")

.add("gamepad thumbstick r left",  "C left")
.add("gamepad thumbstick r right", "C right")
.add("gamepad thumbstick r up",    "C up")
.add("gamepad thumbstick r down",  "C down")

//Sega Saturn
input_icons("saturn")
.add("gamepad face south", spr_control_icon_saturn_button_down)
.add("gamepad face east",  spr_control_icon_saturn_button_right)
.add("gamepad face west",  spr_control_icon_saturn_button_left)
.add("gamepad face north", spr_control_icon_saturn_button_up)
.add("gamepad shoulder l", spr_control_icon_saturn_button_shoulder_l)
.add("gamepad shoulder r", spr_control_icon_saturn_button_shoulder_r)
.add("gamepad trigger l",  spr_control_icon_saturn_button_trigger_l)
.add("gamepad trigger r",  spr_control_icon_saturn_button_trigger_r)
.add("gamepad select",     spr_control_icon_saturn_button_select)
.add("gamepad start",      spr_control_icon_saturn_button_start)
.add("gamepad dpad up",    spr_control_icon_saturn_dpad_up)
.add("gamepad dpad down",  spr_control_icon_saturn_dpad_down)
.add("gamepad dpad left",  spr_control_icon_saturn_dpad_left)
.add("gamepad dpad right", spr_control_icon_saturn_dpad_right)

//Super Nintendo
input_icons("snes")
.add("gamepad face south", "B")
.add("gamepad face east",  "A")
.add("gamepad face west",  "Y")
.add("gamepad face north", "X")
.add("gamepad shoulder l", "L")
.add("gamepad shoulder r", "R")
.add("gamepad select",     "select")
.add("gamepad start",      "start")
.add("gamepad dpad up",    "dpad up")
.add("gamepad dpad down",  "dpad down")
.add("gamepad dpad left",  "dpad left")
.add("gamepad dpad right", "dpad right")

#endregion
