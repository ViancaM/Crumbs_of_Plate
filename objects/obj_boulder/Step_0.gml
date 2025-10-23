// obj_boulder Step Event

// Reset direction
dir_x = 0;
dir_y = 0;

// Check collision with player
if (place_meeting(x, y, obj_player)) {
    // Determine player input (assumes arrow keys)
    if (keyboard_check(ord("A"))) dir_x = -push_speed;
    if (keyboard_check(ord("D"))) dir_x = push_speed;
    if (keyboard_check(ord("W"))) dir_y = -push_speed;
    if (keyboard_check(ord("s"))) dir_y = push_speed;
    
    // Move boulder only if space is free
    //if (!place_meeting(x + dir_x, y + dir_y, obj_solid)) {
        //x += dir_x;
       // y += dir_y;
       // pushing = true;
    //} else {
     //   pushing = false;
    //}
//} else {
//    pushing = false;
}

if (place_meeting(x, y, obj_player2)) {
    // Determine player input (assumes arrow keys)
    if (keyboard_check(vk_left)) dir_x = -push_speed;
    if (keyboard_check(vk_right)) dir_x = push_speed;
    if (keyboard_check(vk_up)) dir_y = -push_speed;
    if (keyboard_check(vk_down)) dir_y = push_speed;
    
    // Move boulder only if space is free
    if (!place_meeting(x + dir_x, y + dir_y, obj_solid)) {
        x += dir_x;
        y += dir_y;
        pushing = true;
    } else {
        pushing = false;
    }
} else {
    pushing = false;
}