// get inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

/*
 * Note: keyboard check will return 0 or 1. Also to move right you have to move +x, to move left you have to
 *       move -x, hence the order right = left
 */
var playerDirection = key_right - key_left;
var movement = horizontalSpeed * playerDirection;

// Check for horizontal collision
if (place_meeting(x + movement, y, oBlock))
{
	var one = sign(movement); // this could be +1, -1, 0
	while(!place_meeting(x + one, y, oBlock))
	{
		x += one;
	}
	
	// Since we have handled the movement internally, lets set movement = 0
	movement = 0;
}

// Set x position for the sprite
x += movement;