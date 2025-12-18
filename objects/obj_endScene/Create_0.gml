book_x = (room_width - sprite_get_width(spr_storybook)) / 2;
book_y = (room_height - sprite_get_height(spr_storybook)) / 2;
book_w = sprite_get_width(spr_storybook);
book_h = sprite_get_height(spr_storybook);

text_x = book_x + book_w * 0.10;
text_y = book_y + book_h * 0.30;

art_center_x = book_x + book_w * 0.73;
art_center_y = book_y + book_h * 0.47;

page_text = [
    "At last, Hansel and Gretel outwitted the witch\nand fled from her crooked house.\n\nWithout daring to look behind them,\nthey ran toward freedom and light.",
    "Through winding paths and whispering trees,\nthey followed the trail side by side,\nnever once letting go.",
    "Before the sun could set, they found\ntheir way home.\n\nSafe. Together."
];

page_art = [ spr_leaving_house, spr_trail, spr_back_home ];

page = 0;
pages_count = array_length(page_text);

fade = 0;
fade_dir = 1;
fade_speed = 0.04;

page_timer = 0;
page_min_time = 30;

h_sprite = spr_player_walk_right;
g_sprite = spr_player2_walk_right;

h_frame = 0;
g_frame = 0;

music_id = audio_play_sound(snd_end, 1, false);

function setup_page() {
    art_w = sprite_get_width(page_art[page]);
    art_h = sprite_get_height(page_art[page]);

    art_x = art_center_x - art_w * 0.5;
    art_y = art_center_y - art_h * 0.5;

    var ground_y = art_y + art_h * 0.55;

    if (page == 0) {
        h_x = art_x + art_w * 0.45;
        g_x = art_x + art_w * 0.40;
    } else {
        h_x = art_x + 24;
        g_x = art_x + 4;
    }

    h_y = ground_y;
    g_y = ground_y;

    walk_speed = (page == 1) ? 0.35 : 0.5;
}

setup_page();
