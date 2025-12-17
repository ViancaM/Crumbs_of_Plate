if (global.dialog_active) {
    exit;
}


if (hp <= 0 && !captured && !in_jar)
{
    jar_instance = instance_create_layer(x, y, "Instances", obj_jar);
    jar_instance.captured_player = id;

    captured = true;
    in_jar = true;
    visible = false;

}

if (in_jar)
{
    if (!instance_exists(jar_instance)) {
 
        jar_instance = instance_create_layer(x, y, "Instances", obj_jar);
        jar_instance.captured_player = id;
    }
    
    var _hor = (keyboard_check(vk_right) - keyboard_check(vk_left));
    var _ver = (keyboard_check(vk_down) - keyboard_check(vk_up));
    
    if (_hor != 0 || _ver != 0) {
        var move_x = _hor * 0.8;
        var move_y = _ver * 0.8;
        
        var old_x = x; 
        var old_y = y;
        
        if (place_free(x + move_x, y)) {
            x += move_x;
        }
        if (place_free(x, y + move_y)) {
            y += move_y;
        }
    }

    if (instance_exists(jar_instance)) {
        jar_instance.x = x;
        jar_instance.y = y;
    }
    
    exit; 
}

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var d = instance_find(obj_door, 0);
if (d != noone && !d.door_open)
    move_and_collide(_hor * move_speed, _ver * move_speed, [obj_boulder, obj_bordercabin, obj_bordercobblestone, obj_borderdarkness, obj_bordertree, obj_borderwoodfloor, obj_sign, obj_door, obj_door_1, obj_door_2, obj_door_3, obj_door_4, obj_door_5, obj_door_6]);
else
    move_and_collide(_hor * move_speed, _ver * move_speed, [obj_boulder, obj_sign, obj_bordercabin, obj_bordercobblestone, obj_borderdarkness, obj_bordertree, obj_borderwoodfloor]);

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

if (instance_exists(obj_player) && instance_exists(obj_player2))
{
    var p1 = obj_player.in_jar;
    var p2 = obj_player2.in_jar;

    if (p1 && p2)
    {
        room_goto(Room_4DemoEnd);
    }
}