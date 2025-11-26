if (keyboard_check_pressed(vk_space)) {
    fade_dir = -1;
}

if (fade_dir != 0) {
    fade += fade_dir * 0.05;

    if (fade <= 0) {
        fade = 0;
        fade_dir = 0;
        cutscene_step++;
        fade_dir = 1;
    }

    if (fade >= 1) {
        fade = 1;
        fade_dir = 0;
    }
}
