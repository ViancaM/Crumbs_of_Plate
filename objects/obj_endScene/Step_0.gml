page_timer++;

if (fade_dir != 0) {
    fade += fade_dir * fade_speed;

    if (fade >= 1) {
        fade = 1;
        fade_dir = 0;
    }

    if (fade <= 0) {
        page++;
        if (page >= pages_count) {
            audio_stop_sound(music_id);
            room_goto(Room_0Start);
            exit;
        }
        setup_page();
        page_timer = 0;
        fade_dir = 1;
    }
}

if (keyboard_check_pressed(vk_space) && page_timer > page_min_time && fade_dir == 0) {
    fade_dir = -1;
}

if (fade_dir == 0) {
    var right_edge = art_x + art_w - 24;
    var center_x = art_x + art_w * 0.5;

    if (page < 2) {
        h_x += walk_speed;
        g_x += walk_speed;
        if (h_x >= right_edge) fade_dir = -1;
    } else {
        if (h_x < center_x) {
            h_x += walk_speed;
            g_x += walk_speed;
        }
    }

    h_frame = (h_frame + 0.08) mod sprite_get_number(h_sprite);
    g_frame = (g_frame + 0.08) mod sprite_get_number(g_sprite);
}
