/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 00CF7EED
/// @DnDComment : The section below handles pixel-perfect collision checking.$(13_10)It does collision checking twice, first on the X axis, and$(13_10)then on the Y axis.$(13_10)On each axis, it moves the character pixel-by-pixel$(13_10)until its velocity for that axis is covered, or a$(13_10)collision is found.$(13_10)$(13_10)'move_count' is how many total pixels the character$(13_10)needs to move this frame. It is the absolute value$(13_10)of the velocity on an axis.$(13_10)$(13_10)'move_once' is the amount of pixels it needs to move$(13_10)once, before checking for a collision. It is 1, 0, or -1.
/// @DnDInput : 2
/// @DnDArgument : "var" "move_count"
/// @DnDArgument : "value" "abs(vel_x)"
/// @DnDArgument : "var_1" "move_once"
/// @DnDArgument : "value_1" "sign(vel_x)"
var move_count = abs(vel_x);
var move_once = sign(vel_x);

/// @DnDAction : YoYo Games.Loops.Repeat
/// @DnDVersion : 1
/// @DnDHash : 15406DBC
/// @DnDComment : This runs a loop, which runs 'move_count' times. All actions$(13_10)attached to this are repeated that many amount of times.
/// @DnDArgument : "times" "move_count"
repeat(move_count)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 00D6D252
	/// @DnDComment : This calls the check_collision function to check$(13_10)for collisions on the X axis, if moved by the$(13_10)move_once value on that dimension. The Y argument$(13_10)is set to 0, so for this collision there is no$(13_10)Y movement.$(13_10)$(13_10)The result of the function, either true or false,$(13_10)is stored in the 'collision_found' variable, which$(13_10)is temporary.
	/// @DnDInput : 2
	/// @DnDParent : 15406DBC
	/// @DnDArgument : "var" "collision_found"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "check_collision"
	/// @DnDArgument : "arg" "move_once"
	/// @DnDArgument : "arg_1" "0"
	var collision_found = check_collision(move_once, 0);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 26E2AE5A
	/// @DnDComment : This checks if collision_found is equal to false,$(13_10)meaning a collision was not found, and the player$(13_10)is free to move once on the X axis.
	/// @DnDParent : 15406DBC
	/// @DnDArgument : "var" "collision_found"
	/// @DnDArgument : "value" "false"
	if(collision_found == false)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 034B95B0
		/// @DnDComment : In that case, move_once is added to the X coordinate$(13_10)of the character.
		/// @DnDParent : 26E2AE5A
		/// @DnDArgument : "value" "move_once"
		/// @DnDArgument : "value_relative" "1"
		x += move_once;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 589D7A08
	/// @DnDComment : This 'Else' block runs if a collision was found.
	/// @DnDParent : 15406DBC
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 764D0A6F
		/// @DnDComment : In that case, we reset the X velocity to 0,$(13_10)so the character stops its movement on that$(13_10)axis.
		/// @DnDParent : 589D7A08
		/// @DnDArgument : "var" "vel_x"
		vel_x = 0;
	
		/// @DnDAction : YoYo Games.Loops.Break
		/// @DnDVersion : 1
		/// @DnDHash : 7B2949E8
		/// @DnDParent : 589D7A08
		break;
	}
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 52FB5303
/// @DnDComment : We now repeat all of the previous steps to check for collisions$(13_10)on the Y axis.$(13_10)$(13_10)Everything is the same, but vel_x is replaced by vel_y, and the$(13_10)check_collision function takes a Y value (its second argument).
/// @DnDInput : 2
/// @DnDArgument : "var" "move_count"
/// @DnDArgument : "value" "abs(vel_y)"
/// @DnDArgument : "var_1" "move_once"
/// @DnDArgument : "value_1" "sign(vel_y)"
var move_count = abs(vel_y);
var move_once = sign(vel_y);

/// @DnDAction : YoYo Games.Loops.Repeat
/// @DnDVersion : 1
/// @DnDHash : 1841C812
/// @DnDComment : This runs a loop, which runs 'move_count' times. All actions$(13_10)attached to this are repeated that many amount of times.
/// @DnDArgument : "times" "move_count"
repeat(move_count)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5733C848
	/// @DnDComment : This calls the check_collision function to check$(13_10)for collisions on the Y axis, if moved by the$(13_10)move_once value.$(13_10)$(13_10)The result of the function, either true or false,$(13_10)is stored in the 'collision_found' variable, which$(13_10)is temporary.
	/// @DnDInput : 2
	/// @DnDParent : 1841C812
	/// @DnDArgument : "var" "collision_found"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "check_collision"
	/// @DnDArgument : "arg" "0"
	/// @DnDArgument : "arg_1" "move_once"
	var collision_found = check_collision(0, move_once);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7FB0349D
	/// @DnDComment : This checks if collision_found is equal to false,$(13_10)meaning a collision was not found, and the player$(13_10)is free to move once on the Y axis.
	/// @DnDParent : 1841C812
	/// @DnDArgument : "var" "collision_found"
	/// @DnDArgument : "value" "false"
	if(collision_found == false)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 3C1F61C9
		/// @DnDComment : In that case, move_once is added to the Y coordinate$(13_10)of the character.
		/// @DnDParent : 7FB0349D
		/// @DnDArgument : "value" "move_once"
		/// @DnDArgument : "value_relative" "1"
		/// @DnDArgument : "instvar" "1"
		y += move_once;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6A7C9C2B
	/// @DnDComment : This 'Else' block runs if a collision was found.
	/// @DnDParent : 1841C812
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7EADAF3D
		/// @DnDComment : In that case, we reset the Y velocity to 0,$(13_10)so the character stops its movement on that$(13_10)axis.
		/// @DnDParent : 6A7C9C2B
		/// @DnDArgument : "var" "vel_y"
		vel_y = 0;
	
		/// @DnDAction : YoYo Games.Loops.Break
		/// @DnDVersion : 1
		/// @DnDHash : 0B9DDC56
		/// @DnDComment : Then we break out of the Repeat loop, as no more$(13_10)collision checks are required.
		/// @DnDParent : 6A7C9C2B
		break;
	}
}