package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.io.Input;

class SetVals extends FlxState
{
	var inftext:FlxText;
	var inptext:FlxInputText;
	var done:FlxButton;
	var input:String;
	var error:FlxText;

	override public function create()
	{
		super.create();

		error = new FlxText(0, 0, 0, "").setFormat(null, 16, FlxColor.RED);
		error.screenCenter(X);
		add(error);
		inftext = new FlxInputText(0, 0, 0, "Type the equation to graph: ", 32);
		inftext.screenCenter();
		add(inftext);
		inptext = new FlxInputText(0, 0, 0, "y=", 32);
		inptext.screenCenter();
		inptext.y = inptext.y + 50;
		add(inptext);
		done = new FlxButton(0, 0, "Graph it!", () ->
		{
			check();
		});
		add(done);
		done.screenCenter();
		done.y = inptext.y + 100;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		input = inptext.text;
		Main.sequation = input;
		trace(input);
		inptext.screenCenter();
		inptext.y = inptext.y + 50;
	}

	function check()
	{
		if (input.substring(0, 3) == "y=")
		{
			// more checks
			var expression = input.substring(2);
			trace(expression);
			FlxG.switchState(new Graph());
		}
		else
		{
			error.text = "Invalid equation";
		}

		FlxG.switchState(new Graph());
	}
}
