/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 0DC7DCB7
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 35119B6E
/// @DnDComment : // Checks for a jump input
/// @DnDArgument : "expr" "jump_input"
if(jump_input)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6DE35500
	/// @DnDComment : // Preforms a player jump
	/// @DnDParent : 35119B6E
	/// @DnDArgument : "function" "player_jump"
	player_jump();
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 41DEF7CC
/// @DnDComment : // Checks for a left input
/// @DnDArgument : "expr" "left_input"
if(left_input)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 399FDE89
	/// @DnDComment : // Preforms a player left movement
	/// @DnDParent : 41DEF7CC
	/// @DnDArgument : "function" "player_left"
	player_left();
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 3A1532FB
/// @DnDComment : // Checks for a right input
/// @DnDArgument : "expr" "right_input"
if(right_input)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 06C02BC7
	/// @DnDComment : // Preforms a player right movement
	/// @DnDParent : 3A1532FB
	/// @DnDArgument : "function" "player_right"
	player_right();
}