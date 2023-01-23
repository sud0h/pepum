package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 100;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic("assets/umsheet.png", true, 32, 32);
		animation.add("walk_Down", [0, 4, 8, 12], 5, true);
		animation.add("walk_Up", [1, 5, 9, 13], 5, true);
		animation.add("walk_Right", [2, 6, 10, 14], 5, true);
		animation.add("walk_Left", [3, 7, 11, 15], 5, true);
		animation.add("idle_Down", [0]);
		animation.add("idle_Up", [1]);
		animation.add("idle_Right", [2]);
		animation.add("idle_Left", [3]);

		drag.x = drag.y = 800;
		setSize(32, 16);
		offset.set(4, 8);
	}

	override public function update(elapsed:Float):Void
	{
		updateMovement();
		super.update(elapsed);
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (up || down || left || right)
		{
			var newAngle:Float = 0;
			if (up)
			{
				newAngle = -90;
				if (left)
					newAngle -= 45;
				else if (right)
					newAngle += 45;
				facing = UP;
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
					newAngle += 45;
				else if (right)
					newAngle -= 45;
				facing = DOWN;
			}
			else if (left)
			{
				newAngle = 180;
				facing = LEFT;
			}
			else if (right)
			{
				newAngle = 0;
				facing = RIGHT;
			}

			// determine our velocity based on angle and speed
			velocity.setPolarDegrees(SPEED, newAngle);
		}
		if (velocity.x != 0 || velocity.y != 0)
		{
			switch (facing)
			{
				case LEFT:
					animation.play("walk_Left");
				case UP:
					animation.play("walk_Up");
				case DOWN:
					animation.play("walk_Down");
				case RIGHT:
					animation.play("walk_Right");
				case _:
			}
		}
		else
		{
			switch (facing)
			{
				case LEFT:
					animation.play("idle_Left");
				case UP:
					animation.play("idle_Up");
				case DOWN:
					animation.play("idle_Down");
				case RIGHT:
					animation.play("idle_Right");
				case _:
			}
		}
	}
}
