// load room-specific objects (keys, enemies, etc.)
if (global.loading_game)
{
    // destroy default room players
    if (instance_exists(obj_player)) instance_destroy(obj_player);
    if (instance_exists(obj_player2)) instance_destroy(obj_player2);

    // spawn saved players
    instance_create_depth(global.statData.save_x, global.statData.save_y, layer, obj_player);
    instance_create_depth(global.statData.save2_x, global.statData.save2_y, layer, obj_player2);

    // load saved room keys
    load_room();
	obj_saveload.skipRoomSave = true;
    global.loading_game = false;
}
else
{
    // normal room load
    load_room();
}
