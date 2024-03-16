// get inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

/*
 * Note: keyboard check will return 0 or 1. Also to move right you have to move +x, to move left you have to
 *       move -x, hence the order right = left
 */
var playerDirection = key_right - key_left;

// Set x position for the sprite
x += horizontalSpeed * playerDirection;