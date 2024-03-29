/// @description Player Movement Calculation

#region Player movement logic

// get inputs
gKeyLeft = keyboard_check(vk_left);
gKeyRight = keyboard_check(vk_right);
gKeyJump = keyboard_check(vk_space);

// Player's direction
/*
 * Note: keyboard check will return 0 or 1. Also to move right you have to move +x, to move left you have to
 *       move -x, hence the order right - left
 */
var playerDirection = gKeyRight - gKeyLeft;
var movementHorizontal = gHorizontalSpeed * playerDirection;
var movementVertical = 0;

// Check if player is trying to jump
if (IsInGround(x, y, oBlock) && gKeyJump)
{
	gVerticalSpeed = gVerticalJumpSpeed;
}
else
{
	gVerticalSpeed += gVerticalAcceleration;
}
movementVertical = gVerticalSpeed;


// Calculate player's final movement based on collision detection
// Set x,y position for the sprite
x += CalculateHorizontalCollision(x, y, movementHorizontal, oBlock);
y += CalculateVerticalCollision(x, y, movementVertical, oBlock);

#endregion

#region Player animation logic

var spriteSpeed = 1;
var xscale = sign(playerDirection);

if (!IsInGround(x, y, oBlock)) // Air animation
{
	sprite_index = sPlayerAir;
	image_speed = 0;
	image_index = 1;
}
else if (movementHorizontal != 0) // Run animation
{
	sprite_index = sPlayerRun;
	image_speed = spriteSpeed;
	image_xscale = xscale;
}
else // Idle animation
{
	sprite_index = sPlayer;
	image_speed = spriteSpeed;
}

#endregion