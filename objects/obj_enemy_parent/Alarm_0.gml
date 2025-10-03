if (instance_exists(obj_player) && distance_to_object(obj_player) < distance_to_player){
    target_x = obj_player.x;
    target_y = obj_player.y;
}
else{
    target_x = random_range(xstart - 100, xstart + 100);
    target_y = random_range(ystart - 100, ystart + 100);
}

alarm[0] = 60;

if (instance_exists(obj_player2) && distance_to_object(obj_player2) < distance_to_player){
    target_x = obj_player2.x;
    target_y = obj_player2.y;
}
else{
    target_x = random_range(xstart - 100, xstart + 100);
    target_y = random_range(ystart - 100, ystart + 100);
}

alarm[0] = 60;