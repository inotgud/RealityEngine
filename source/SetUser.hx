package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

class SetUser extends MusicBeatState
{
	override function create()
		{
			var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var eventNameEE:FlxUIInputText = new FlxUIInputText(350, 220, 80, "");
		add(eventNameEE);

		var close:FlxButton = new FlxButton(1150, 20, "X", function(){
			FlxG.switchState(new OptionsDirect());
		});
		close.color = FlxColor.RED;
        add(close);

		var button5:FlxButton = new FlxButton(500, 220, "Change U", function(){
			FlxG.save.data.pcplayername = eventNameEE.text;
		});
        add(button5);

		}
		

	
}
