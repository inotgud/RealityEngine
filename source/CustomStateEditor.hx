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
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.effects.FlxFlicker;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end
import miniGames.MiniGamesState;

using StringTools;

class EngineEditorsState extends MusicBeatState
{
	var bg:FlxSprite;
	var theTextBox:FlxInputText;
	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
        
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = FlxColor.RED;
		add(bg);


		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

	}
}