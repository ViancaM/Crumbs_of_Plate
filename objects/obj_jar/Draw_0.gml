if (instance_exists(captured_player))
{
    var p = captured_player;

    draw_sprite_ext(
        p.sprite_index,
        p.image_index,
        x,                   
        y - 8,               
        0.7,                 
        0.7,
        0,
        c_white,
        1
    );
}

draw_self();