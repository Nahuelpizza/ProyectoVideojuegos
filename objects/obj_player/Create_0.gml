/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 1A562DB6
/// @DnDComment : This runs the Create event of the parent,$(13_10)ensuring the player gets all variables$(13_10)from the character parent.
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5AF156C1
/// @DnDComment : This variable stores the number of coins$(13_10)the player has collected.
/// @DnDArgument : "var" "coins"
coins = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 76A6322D
/// @DnDComment : This variable tells whether the player is currently$(13_10)in knockback (from being hit by an enemy). It will$(13_10)be true if it is, and false if not.
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "in_knockback"
in_knockback = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3C5C4CB3
/// @DnDComment : This is the object that replaces the player$(13_10)once it is defeated.
/// @DnDArgument : "expr" "obj_player_defeated"
/// @DnDArgument : "var" "defeated_object"
defeated_object = obj_player_defeated;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1EEEE3F8
/// @DnDComment : // Flag for if a jump is detected
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "jump_input"
jump_input = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 21365E2E
/// @DnDComment : // Function to be called when a player jumps
/// @DnDArgument : "funcName" "player_jump"
function player_jump() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 5749E389
	/// @DnDComment : This checks if the 'grounded' variable is true,$(13_10)meaning the player is standing on the ground, and$(13_10)can jump.$(13_10)
	/// @DnDParent : 21365E2E
	/// @DnDArgument : "expr" "grounded"
	if(grounded)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 590C89B1
		/// @DnDComment : This sets the Y velocity to negative jump_speed,$(13_10)making the player immediately jump upwards. It$(13_10)will automatically be brought down by the gravity$(13_10)code in the parent's Begin Step event.
		/// @DnDParent : 5749E389
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "vel_y"
		vel_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 6969417C
		/// @DnDComment : This changes the player's sprite to the jump sprite,$(13_10)and resets the frame to 0.
		/// @DnDParent : 5749E389
		/// @DnDArgument : "spriteind" "spr_player_jump"
		/// @DnDSaveInfo : "spriteind" "spr_player_jump"
		sprite_index = spr_player_jump;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 368C9063
		/// @DnDComment : This sets 'grounded' to false, so that any events$(13_10)after this know that the player is not supposed$(13_10)to be on the ground anymore.
		/// @DnDParent : 5749E389
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "grounded"
		grounded = false;
	
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 41CAEE96
		/// @DnDComment : This creates an instance of obj_effect_jump $(13_10)at the bottom of the player's mask. This is the$(13_10)jump VFX animation.$(13_10)
		/// @DnDParent : 5749E389
		/// @DnDArgument : "xpos" "x"
		/// @DnDArgument : "ypos" "bbox_bottom"
		/// @DnDArgument : "objectid" "obj_effect_jump"
		/// @DnDSaveInfo : "objectid" "obj_effect_jump"
		instance_create_layer(x, bbox_bottom, "Instances", obj_effect_jump);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 1B4D09EC
		/// @DnDComment : Play the jump sound, and store the played sound's ID$(13_10)in a temporary variable
		/// @DnDParent : 5749E389
		/// @DnDArgument : "target" "sound"
		/// @DnDArgument : "target_temp" "1"
		/// @DnDArgument : "soundid" "snd_jump"
		/// @DnDSaveInfo : "soundid" "snd_jump"
		var sound = audio_play_sound(snd_jump, 0, 0, 1.0, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Random.Get_Random_Number
		/// @DnDVersion : 1
		/// @DnDHash : 0D90A032
		/// @DnDComment : Get a random value to use for the jump sound's pitch
		/// @DnDParent : 5749E389
		/// @DnDArgument : "var" "pitch"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "min" "0.8"
		var pitch = (random_range(0.8, 1));
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Pitch
		/// @DnDVersion : 1
		/// @DnDHash : 22B5D423
		/// @DnDComment : Change the jump sound's pitch through its ID variable
		/// @DnDParent : 5749E389
		/// @DnDArgument : "sound" "sound"
		/// @DnDArgument : "pitch" "pitch"
		audio_sound_pitch(sound, pitch);
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7B1C1BCB
	/// @DnDComment : // Sets jump flag back to false
	/// @DnDParent : 21365E2E
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "jump_input"
	jump_input = false;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7BF5591E
/// @DnDComment : // Flag for if a left input is detected
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "left_input"
left_input = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1C37710D
/// @DnDArgument : "funcName" "player_left"
function player_left() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 6BDD8528
	/// @DnDComment : This checks if the player is currently in knockback,$(13_10)after being hit by an enemy.
	/// @DnDParent : 1C37710D
	/// @DnDArgument : "expr" "in_knockback"
	if(in_knockback)
	{
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 0E69B8A8
		/// @DnDComment : // In that case we return
		/// @DnDParent : 6BDD8528
		return;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4F9916AB
	/// @DnDComment : Set the X velocity to negative move_speed.$(13_10)This makes the character move left.
	/// @DnDParent : 1C37710D
	/// @DnDArgument : "expr" "-move_speed"
	/// @DnDArgument : "var" "vel_x"
	vel_x = -move_speed;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 123E20E8
	/// @DnDComment : This checks if the current sprite is the fall sprite,$(13_10)meaning the player hasn't landed yet.
	/// @DnDParent : 1C37710D
	/// @DnDArgument : "var" "sprite_index"
	/// @DnDArgument : "value" "spr_player_fall"
	if(sprite_index == spr_player_fall)
	{
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 3A02DAF8
		/// @DnDComment : // In that case we return
		/// @DnDParent : 123E20E8
		return;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 0AAE4CB3
	/// @DnDComment : This checks if the player is on the ground, before$(13_10)changing the sprite to the walking sprite. This is$(13_10)done to ensure that the walking sprite does not$(13_10)active while the player is in mid-air.
	/// @DnDParent : 1C37710D
	/// @DnDArgument : "expr" "grounded"
	if(grounded)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 047A1910
		/// @DnDComment : Change the instance's sprite to the walking$(13_10)player sprite.$(13_10)$(13_10)We're using this instead of 'Set Sprite', as$(13_10)that action also changes the frame number, which$(13_10)we don't want to change.
		/// @DnDParent : 0AAE4CB3
		/// @DnDArgument : "value" "spr_player_walk"
		/// @DnDArgument : "instvar" "10"
		sprite_index = spr_player_walk;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 784EF231
	/// @DnDComment : // Sets left input flag back to false
	/// @DnDParent : 1C37710D
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "left_input"
	left_input = false;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5101E5B2
/// @DnDComment : // Flag for if a right input is detected
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "right_input"
right_input = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 7E735A7F
/// @DnDArgument : "funcName" "player_right"
function player_right() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 5F8BC202
	/// @DnDComment : This checks if the player is currently in knockback,$(13_10)after being hit by an enemy.
	/// @DnDParent : 7E735A7F
	/// @DnDArgument : "expr" "in_knockback"
	if(in_knockback)
	{
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 54A55155
		/// @DnDComment : // In that case we return
		/// @DnDParent : 5F8BC202
		return;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1D23ED75
	/// @DnDComment : Set the X velocity to move_speed.$(13_10)This makes the character move right.
	/// @DnDParent : 7E735A7F
	/// @DnDArgument : "expr" "move_speed"
	/// @DnDArgument : "var" "vel_x"
	vel_x = move_speed;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2D4B71A7
	/// @DnDComment : This checks if the current sprite is the fall sprite,$(13_10)meaning the player hasn't landed yet.
	/// @DnDParent : 7E735A7F
	/// @DnDArgument : "var" "sprite_index"
	/// @DnDArgument : "value" "spr_player_fall"
	if(sprite_index == spr_player_fall)
	{
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 747614D0
		/// @DnDComment : // In that case we return
		/// @DnDParent : 2D4B71A7
		return;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 755B4265
	/// @DnDComment : This checks if the player is on the ground, before$(13_10)changing the sprite to the walking sprite. This is$(13_10)done to ensure that the walking sprite does not$(13_10)active while the player is in mid-air.
	/// @DnDParent : 7E735A7F
	/// @DnDArgument : "expr" "grounded"
	if(grounded)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 636C9D06
		/// @DnDComment : Change the instance's sprite to the walking$(13_10)player sprite.$(13_10)$(13_10)We're using this instead of 'Set Sprite', as$(13_10)that action also changes the frame number, which$(13_10)we don't want to change.
		/// @DnDParent : 755B4265
		/// @DnDArgument : "value" "spr_player_walk"
		/// @DnDArgument : "instvar" "10"
		sprite_index = spr_player_walk;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 07682FCE
	/// @DnDComment : // Sets right input flag back to false
	/// @DnDParent : 7E735A7F
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "right_input"
	right_input = false;
}