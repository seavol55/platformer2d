/// @description Calculations cleanup

// Reset vertical speed if it is already colliding with the ground (to avoid buffer overflows)
if (IsInGround(x, y, oBlock))
{
	gVerticalSpeed = 0;
}