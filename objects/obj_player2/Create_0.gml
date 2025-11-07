move_speed = 1.5;

tilemap = layer_tilemap_get_id("Tiles_Col");

carried_item = noone;  // Reference to currently carried item

// obj_player Create Event
has_key = false;

// Create Event
if (!variable_global_exists("has_key")) {
    global.has_key = 0;
}
