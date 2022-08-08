package;

import hscript.Expr;
import hscript.Parser;
import hscript.Interp;
import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import miniGames.MiniGamesState;
#if sys
import sys.io.Process;
import sys.io.Process;
#end
import flixel.FlxSubState;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
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
import realityEngine.EngineMain;
import FreeplayState;


using StringTools;

class OpenDiscord extends MusicBeatSubstate
{
	var hmm:Bool = false;
	override function create(){
		FlxG.mouse.visible = true;
		if(hmm == true)
			{
				close();
			}
	var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('joinDC'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var save:FlxButton = new FlxButton(550, 550, "Join Discord", function(){
			FlxG.openURL("https://discord.gg/VjG7PZ6ksy");
			hmm = true;
			close();
		});
        add(save);

		super.create();
	}

	override function update(elapsed:Float)
		{
			if(FlxG.keys.justPressed.ESCAPE)
				{
					hmm = true;
					close();
				}
			super.update(elapsed);
		}


}