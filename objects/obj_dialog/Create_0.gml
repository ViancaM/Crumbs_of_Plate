messages = [];
current_message = 0;
current_char = 0;
draw_message = "";

char_speed = 0.5;
input_key = vk_enter;

// Make sure dialog draws above everything
depth = -10000; // Even higher depth

// Pause the game when dialog is active
global.dialog_active = true;

dialog_width = 400;
dialog_height = 300;