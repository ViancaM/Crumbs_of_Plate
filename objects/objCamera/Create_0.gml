//Split Screen
playerList[0] = obj_player;
playerList[1] = obj_player2

view_enabled = true;

var width = 960, height = 540, scale = 1.5;

global.Cameras = undefined;

for(var i = 0; i < array_length_1d(playerList); ++i) {
	view_visible[i] = true;
	
	//create camera
	var CameraWidth = width / array_length_1d(playerList);
	global.Cameras[i] = camera_create_view(0, 0, CameraWidth, height, 0, playerList[i], -1, -1, CameraWidth, height);
	view_set_camera(i, global.Cameras[i]);
	
	//viewport
	view_xport[i] = CameraWidth * i;
	view_wport[i] = CameraWidth;
	
}

window_set_size(width * scale, height * scale);
surface_resize(application_surface, width * scale, height * scale);