/* Collision with enemy
 *  - 
 */

// other applies to the specific instance of the enemy you hit
// (the 'other' side of the collision)
if (place_meeting(x, y, pShootable)){
	with (instance_place(x, y, pShootable)){
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	// destroy the specific instance of the bullet
	instance_destroy();
}


// upon collision with a wall, destroy the bullet.
// allows the bullet to be drawn even if it collides right away (happens after being drawn, hence post-draw)

if (place_meeting(x, y, oWall))
	instance_destroy();