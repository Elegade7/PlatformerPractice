/* Draw Event
 *  - creating white flash over enemy
 */

draw_self();

if (flash > 0){
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}