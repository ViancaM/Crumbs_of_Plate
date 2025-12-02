book_x = (room_width - sprite_get_width(spr_storybook)) / 2;
book_y = (room_height - sprite_get_height(spr_storybook)) / 2;
book_w = sprite_get_width(spr_storybook);
book_h = sprite_get_height(spr_storybook);

text_x = book_x + book_w * 0.10;
text_y = book_y + book_h * 0.30;
art_center_x = book_x + book_w * 0.73; 
art_center_y = book_y + book_h * 0.47;

page_text = [
    "Hansel and Gretel lived in a tiny cottage\nat the edge of the woods.\n\nOne morning, they set out together\non a long journey...",
    "They walked until they reached the forest\nentrance. The deeper they went,\nthe darker it became...",
    "Deep in the woods, they found a strange\nhouse..."
];
page_art = [ spr_cottage, spr_forest_enter, spr_witches_house ];

var cw = sprite_get_width(spr_cottage);
var ch = sprite_get_height(spr_cottage);

cottage_draw_x = art_center_x - cw * 0.5;
cottage_draw_y = art_center_y - ch * 0.5;

h_x = cottage_draw_x + 95;
h_y = cottage_draw_y + 185;

g_x = cottage_draw_x + 55;
g_y = cottage_draw_y + 185;


page = 0;                 
pages_count = array_length(page_text);


fade = 0;            
fade_dir = 1;                
fade_speed = 0.04;

page_timer = 0;
page_min_time = 30;        


show_players = true;
walk_speed = 0.5;           

h_sprite = spr_player_walk_right;   
g_sprite = spr_player2_walk_right;

h_frame = 0;
g_frame = 0;
