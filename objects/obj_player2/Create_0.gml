move_speed = 1.4;
tilemap = layer_tilemap_get_id("Tiles_Col");
carried_item = noone;
has_key = false;

if (!variable_global_exists("has_key")) {
    global.has_key = 0;
}


max_hp = 100;
hp = max_hp; 

in_jar = false;
jar_instance = noone;
captured = false;