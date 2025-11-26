
if (keyboard_check_pressed(vk_space) && fade_dir == 0) {
    fade_dir = -1;
}

if (fade_dir != 0) {
    fade += fade_dir * 0.05;

    if (fade <= 0) {
        fade = 0;
        cutscene_step++;
        fade_dir = 1; 
    }

    if (fade >= 1) {
        fade = 1;
        fade_dir = 0;
    }
}
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);


draw_set_alpha(fade);

var scale = 4;

switch (cutscene_step)
{
    case 0:
        draw_set_color(c_white);
        draw_text(text_x, text_y,
            "Everyone knows the story of Hansel and Gretel..."
        );

        draw_sprite_ext(spr_player_silh, 0, art_x, art_y, scale, scale, 0, c_white, fade);
        draw_sprite_ext(spr_player2_silh, 0, art_x + 150, art_y, scale, scale, 0, c_white, fade);
    break;

    case 1:
        draw_set_color(c_white);
        draw_text(text_x, text_y,
            "But this story… is different."
        );

        draw_sprite_ext(spr_player_silh, 1, art_x, art_y, scale, scale, 0, c_white, fade);
        draw_sprite_ext(spr_player2_silh, 1, art_x + 150, art_y, scale, scale, 0, c_white, fade);
    break;

    case 2:
        draw_set_color(c_white);
        draw_text(text_x, text_y,
            "This one begins in the woods..."
        );
    break;

    case 3:
        room_goto(Room_1Tutorial);
    break;
}

draw_set_alpha(1);
