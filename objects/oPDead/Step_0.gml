if (done == 0){
	vsp += grv; // vertical speed which changes depending on gravity

	// Collision detection
	// horizontal collision
	if (place_meeting(x+hsp, y, oWall)){
		while(!place_meeting(x+sign(hsp), y, oWall)){
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp; // change objects horizontal position in the room 

	// vertical collision
	if (place_meeting(x, y+vsp, oWall)){
		if (vsp > 0){
			done = 1;
			image_index = 1;
			alarm[0] = 60;
		}
		while(!place_meeting(x, y+sign(vsp), oWall)){
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp; // change objects vertical position in the room
}