 /*
 * Step event:
 * - checking for events and acting accordingly
 */

vsp += grv; // vertical speed which changes depending on gravity

//Don't walk off edges
if (grounded && afraidOfHeights && !place_meeting(x+hsp, y+1, oWall)){
	hsp = -hsp;
}

// Collision detection
// horizontal collision
if (place_meeting(x+hsp, y, oWall)){
	while(!place_meeting(x+sign(hsp), y, oWall)){
		x += sign(hsp);
	}
	hsp = -hsp;
}
x += hsp; // change objects horizontal position in the room 

// vertical collision
if (place_meeting(x, y+vsp, oWall)){
	while(!place_meeting(x, y+sign(vsp), oWall)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp; // change objects vertical position in the room


/* 
 * Animation
 */
// falling/jumping
if (!place_meeting(x, y+1, oWall)){
	grounded = false;
	sprite_index = sEnemyA; // set sprite to falling/jumping frames
	image_speed = 0; // don't animate the sprite
	// choose appropriate frame
	if (sign(vsp) > 0)
		image_index = 1;
	else
		image_index = 0;
}
// all other animation
else{
	grounded = true;
	image_speed = 1;
	if (hsp == 0){
		sprite_index = sEnemy;
	}
	else{
		sprite_index = sEnemyR;
	}
}

if (hsp != 0){
	image_xscale = sign(hsp) * size;
	image_yscale = size;
}