// Don't create new dialog if one exists
if (instance_exists(obj_dialog)) exit;

// Cooldown timer
if (interact_cooldown > 0) {
    interact_cooldown--;
    exit;
}

// Check if any player is close
var p1 = instance_nearest(x, y, obj_player);
var p2 = instance_nearest(x, y, obj_player2);
player_near = false;

if (p1 != noone && distance_to_point(p1.x, p1.y) < interact_range) {
    player_near = true;
}

if (p2 != noone && distance_to_point(p2.x, p2.y) < interact_range) {
    player_near = true;
}

// Create dialog when Enter is pressed and player is near
if (player_near && keyboard_check_pressed(vk_enter)) {
    // Create the dialog instance
    var dialog = instance_create_layer(x, y, "Instances", obj_dialog);
    
    // SET THE MESSAGES ARRAY
    dialog.messages = [
        {
            name: "Controls:",
            msg: "Hansel: Press SPACE to pick up items!\nGretel: Press SHIFT to pick up items!"
        }
    ];
    
    // Make sure it starts at the first message
    dialog.current_message = 0;
    dialog_created = true;
    interact_cooldown = 30; // 30 frame cooldown (about 0.5 seconds)
}