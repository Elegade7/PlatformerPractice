/* Collision with enemy
 *  - 
 */

// other applies to the specific instance of the enemy you hit
// (the 'other' side of the collision)
with (other){
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

// destroy the specific instance of the bullet
instance_destroy();