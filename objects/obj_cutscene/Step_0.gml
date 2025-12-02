page_timer += 1;

if (fade_dir != 0) {
    fade += fade_dir * fade_speed;
    if (fade >= 1) {
        fade = 1;
        fade_dir = 0;
    }
    if (fade <= 0) {
        page += 1;
        if (page >= pages_count) {
            room_goto(Room_1Tutorial);
            exit;
        }
        page_timer = 0;
        show_players = (page == 0);

        fade_dir = 1;
    }
}

if (keyboard_check_pressed(vk_space) && page_timer > page_min_time && fade_dir == 0) {
    fade_dir = -1;
}

if (page == 0 && show_players) {

    h_x += walk_speed;
    g_x += walk_speed;

    h_frame += 0.08;
    g_frame += 0.08;
    
    var h_frames = sprite_get_number(h_sprite);
    var g_frames = sprite_get_number(g_sprite);
    if (h_frame >= h_frames) h_frame -= h_frames;
    if (g_frame >= g_frames) g_frame -= g_frames;

   var right_edge = cottage_draw_x + cottage_draw_y - 40; 
   
   if (h_x > right_edge && page_timer > page_min_time) {
       fade_dir = -1;
   }
}
