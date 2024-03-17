#region Player movement logic

// get inputs
gKeyLeft = keyboard_check(vk_left);
gKeyRight = keyboard_check(vk_right);

// Player's direction
/*
 * Note: keyboard check will return 0 or 1. Also to move right you have to move +x, to move left you have to
 *       move -x, hence the order right = left
 */
var playerDirection = gKeyRight - gKeyLeft;
var movementHorizontal = gHorizontalSpeed * playerDirection;

gVerticalSpeed += gVerticalAcceleration;
var movementVertical = gVerticalSpeed;


// Calculate player's final movement based on collision detection
// Set x,y position for the sprite
x += CalculateHorizontalCollision(x, y, movementHorizontal, oBlock);
y += CalculateVerticalCollision(x, y, movementVertical, oBlock);

// Reset vertical speed if it is already colliding with the ground (to avoid buffer overflows)
gVerticalSpeed = CalculateVerticalSpeed(x, y, gVerticalSpeed, oBlock);

#endregion