/// @description Common variables


// Global object variables
gHorizontalSpeed = 7;

gVerticalAcceleration = 0.5;
gVerticalSpeed = 0;

gKeyLeft = 0;
gKeyRight = 0;



#region Player Collision Functions

/// @function                           CalculateHorizontalCollision(
/// @param {real}  xPos                 x position of sprite
/// @param {real}  yPos                 y position of the sprite
/// @param {real}  movement             amount of horizontal movement to do
/// @param {Asset.GMObject}  collider   GameObject that represents the collider to check
/// @description                        Calculate the amount of movement without generating a collision
function CalculateHorizontalCollision(xPos, yPos, movement, collider)
{
	var movementAmount = movement;
	
	// Check if we collide in our next movement
	if (place_meeting(xPos + movement, yPos, collider))
	{
		var one = sign(movement); // this could be +1, -1, 0
		movementAmount = 0;
		
		while(!place_meeting(xPos + movementAmount + one, yPos, collider))
		{
			movementAmount += one;
		}
	}
	
	return movementAmount;
}


/// @function                           CalculateHorizontalCollision(
/// @param {real}  xPos                 x position of sprite
/// @param {real}  yPos                 y position of the sprite
/// @param {real}  movement             amount of horizontal movement to do
/// @param {Asset.GMObject}  collider   GameObject that represents the collider to check
/// @description                        Calculate the amount of movement without generating a collision
function CalculateVerticalCollision(xPos, yPos, movement, collider)
{
	var movementAmount = movement;
	
	// Check if we collide in our next movement
	if (place_meeting(xPos, yPos + movement, collider))
	{
		var one = sign(movement); // this could be +1, -1, 0
		movementAmount = 0;
		
		while(!place_meeting(xPos, yPos + movementAmount + one, collider))
		{
			movementAmount += one;
		}
	}
	
	return movementAmount;
}

#endregion

#region Player Gravity related functions

/// @function                           CalculateHorizontalCollision(
/// @param {real}  xPos                 x position of sprite
/// @param {real}  yPos                 y position of the sprite
/// @param {real}  vSpeed               Current vertical speed before calculation
/// @param {Asset.GMObject}  collider   collider to check if we're colliding or not
/// @description                        Calculate Object speed depending if it is colliding with another object or not
function CalculateVerticalSpeed(xPos, yPos, vSpeed, collider)
{
	if (place_meeting(xPos, yPos + 1, collider))
	{
		return 0;
	}
	
	return vSpeed;
}

#endregion