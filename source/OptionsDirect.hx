import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
#if sys
import sys.io.Process;
#end
class OptionsDirect extends MusicBeatState
{
	override function create()
	{
		

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = true;

		var bgColors:Array<String> = ['#314d7f', '#4e7093', '#70526e', '#594465'];
		var colorRotation:Int = 1;

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.loadImage("menuDesat"));

		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = FlxG.save.data.antialiasing;
		add(menuBG);

		FlxTween.color(menuBG, 2, menuBG.color, FlxColor.fromString(bgColors[colorRotation]));

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(menuBG, 2, menuBG.color, FlxColor.fromString(bgColors[colorRotation]));
			if (colorRotation < (bgColors.length - 1))
				colorRotation++;
			else
				colorRotation = 0;
		}, 0);

		openSubState(new OptionsMenu());
	}
}