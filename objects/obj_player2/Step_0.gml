var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_boulder, obj_door]);

if (_hor != 0 or _ver != 0){
    if(_ver > 0) sprite_index = spr_player2_walk_down;
        
    else if (_ver < 0) sprite_index = spr_player2_walk_up;
        
    else if (_hor > 0) sprite_index = spr_player2_walk_right
        
    else if (_hor < 0) sprite_index = spr_player2_walk_left;
}

else{
    if (sprite_index == spr_player2_walk_right) sprite_index = spr_player2_idle_right;
        
    else if (sprite_index == spr_player2_walk_left) sprite_index = spr_player2_idle_left;
        
    else if (sprite_index == spr_player2_walk_up) sprite_index = spr_player2_idle_up;
        
    else if (sprite_index == spr_player2_walk_down) sprite_index = spr_player2_idle_down;
}


if (keyboard_check_pressed(vk_shift)) {
    if (carried_item != noone)
    {
        // Drop key
        carried_item.picked_up = false;
        carried_item.owner = noone;
        carried_item = noone;
        has_key = false;
        global.has_key = 0;
    }
    else
    {
        // Pick up key if under player
        var item = instance_place(x, y, obj_key);
        if (item != noone)
        {
            if (item.owner != noone && item.owner != id)
            {
                item.owner.has_key = false;
                item.owner.carried_item = noone;
            }

            carried_item = item;
            has_key = true;
            item.owner = id;
            item.picked_up = true;

            global.has_key = 1;
        }
    }
}