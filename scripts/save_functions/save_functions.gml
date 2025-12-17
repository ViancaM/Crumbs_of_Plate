//room saving
function save_room()
{

	var _keyState1 = instance_number(obj_key);

	var _roomStruct = 
	{
		keyState1 : _keyState1,
		keyData : array_create(_keyState1),

	}
	
	//Get data from savable objects
	
	//key
	for (var i = 0; i < _keyState1; i++) {
		
		var _inst = instance_find(obj_key, i)
		
		_roomStruct.keyData[i] = {
			
			x : _inst.x,
			y : _inst.y,
			
			}
	
	}
	//Store room specific struct in global level
	if room == Room_1Tutorial {global.levelData.level_1 = _roomStruct;};
	if room == Room_2Foyer {global.levelData.level_2 = _roomStruct;};
	if room == Room_3Livingroom {global.levelData.level_3 = _roomStruct;};

}

function load_room() 
{

	var _roomStruct = 0;
	
	//get struct for room you are in
	if room == Room_1Tutorial{_roomStruct = global.levelData.level_1;};
	if room == Room_2Foyer {_roomStruct = global.levelData.level_2;};
	if room == Room_3Livingroom {_roomStruct = global.levelData.level_3;};
	
	//Safety check
	if !is_struct(_roomStruct) {exit;};
	
	//delete old key
	//create new key
	if instance_exists(obj_key) { instance_destroy(obj_key) };
	for (var i = 0; i < _roomStruct.keyState1; i++){
		
		instance_create_depth(_roomStruct.keyData[i].x, _roomStruct.keyData[i].y, layer, obj_key);
		
	}
	

}

//Overall saving
function save_game()
{
	
	var _saveArray = array_create(0);
	
	//save room youre in
	save_room();
	
	//set and save stats
	global.statData.save_x = obj_player.x;
	global.statData.save_y = obj_player.y;
	global.statData.save2_x = obj_player2.x;
	global.statData.save2_y = obj_player2.y;
	global.statData.save_rm = room_get_name(room);
	
	// DEBUG - Show what you're saving
show_debug_message("SAVING:");
show_debug_message("Player 1: " + string(obj_player.x) + ", " + string(obj_player.y));
show_debug_message("Player 2: " + string(obj_player2.x) + ", " + string(obj_player2.y));
show_debug_message("Room: " + room_get_name(room));
	
	array_push(_saveArray, global.statData);
	
	//save all the room data
	array_push(_saveArray, global.levelData);
	
	//file saving logic
	var _filename = "savedata.sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1 );
	buffer_write( _buffer, buffer_string, _json );
	
	buffer_save( _buffer, _filename );
	
	buffer_delete(_buffer);
	
}

function load_game()
{
	
	//loading saved data
	var _filename = "savedata.sav";
	if !file_exists(_filename) exit;
	
	// loading the buffer, get JSON, delete the buffer to free memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//undo stringify and extract data
	var _loadArray = json_parse(_json);
	
	//set data in game to match loading data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);

	
	//use data to get to where you need to be
		//go to correct room
		var _loadRoom = asset_get_index(global.statData.save_rm);
		
		// tell the room we are loading a game
		global.loading_game = true;

		room_goto(_loadRoom);
		

		
		
		//create the player obj
		//if instance_exists(obj_player) {instance_destroy(obj_player);};
		//instance_create_depth(global.statData.save_x, global.statData.save_y, layer, obj_player);
		
		//if instance_exists(obj_player2) {instance_destroy(obj_player2);};
		//instance_create_depth(global.statData.save2_x, global.statData.save2_y, layer, obj_player2);
		
		//manually load the room
		//load_room();
}

//room_goto(Room_1Tutorial);

