// Sign step event
if (instance_exists(obj_dialog)) exit; // Don't create new dialog if one exists

// Check if player2 is close and presses Enter
var p2 = instance_nearest(x, y, obj_player2);
if (p2 != noone && distance_to_point(p2.x, p2.y) < interact_range) {
    if (keyboard_check_pressed(vk_enter)) {
        create_dialog([
            {
                name: "Controls:",
                msg: "Press SHIFT to pick up items!"
            }
        ]);
        dialog_created = true;
    }
}

// Check if player1 is close and presses Tab
var p1 = instance_nearest(x, y, obj_player);
if (p1 != noone && distance_to_point(p1.x, p1.y) < interact_range) {
    if (keyboard_check_pressed(vk_tab)) { // Tab key
        create_dialog([
            {
                name: "Controls:",
                msg: "Press the SPACE BAR to pick up items!"
            }
        ]);
        dialog_created = true;
    }
}