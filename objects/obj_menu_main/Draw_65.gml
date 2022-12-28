/// @description 

option_fullscreen = window_get_fullscreen();
options[main_menu_pages.options_visual][2][menu_option_data.text] = "Fullscreen: " + string(boolean_string_onoff(option_fullscreen));