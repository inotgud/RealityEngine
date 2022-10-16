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
import flixel.addons.ui.FlxButtonPlus;
import lime.app.Application;
import realityEngine.EngineMain;
import FreeplayState;


using StringTools;

class NewUpdateAvailable extends MusicBeatState
{
    var updateVersionString = "";
    override function create()
        {
            if(FlxG.save.data.updatenot == true)
                {
                    FlxG.switchState(new MainMenuState());
                }
            var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat2'));
            bg.scrollFactor.x = 0;
            bg.scrollFactor.y = 0.10;
            bg.setGraphicSize(Std.int(bg.width * 1.1));
            bg.updateHitbox();
            bg.screenCenter();
            bg.antialiasing = FlxG.save.data.antialiasing;
            add(bg);
			var updateVersion = "";

            var http = new haxe.Http("https://raw.githubusercontent.com/Goodbs/RealityEngine/main/RealityVersion.txt");

		http.onData = function(data:String)
		{
			updateVersion = data.split('\n')[0].trim();
            var	updateText:Alphabet = new Alphabet(40, 40, "NEW UPDATE AVAILABLE" + updateVersion, true, false);
            updateText.isMenuItem = false;
            add(updateText);
		}

		http.request();

        var	updateText:Alphabet = new Alphabet(40, 200, "New Version released", true, false);
        updateText.isMenuItem = false;
        add(updateText);

        var button:FlxButtonPlus = new FlxButtonPlus(460, 300, function(){
            CoolUtil.browserLoad("https://github.com/Goodbs/RealityEngine/releases/latest");
            FlxG.switchState(new MainMenuState());
        }, "Download Update", 100,25);
        add(button);

        var button:FlxButtonPlus = new FlxButtonPlus(575, 300, function(){
            FlxG.save.data.updatenot = true;
            FlxG.switchState(new MainMenuState());
        }, "No", 100,25);
        add(button);
      

            FlxG.save.data.updatessss = "";
            super.create();
        }
    override function update(elapsed:Float)
        {
            super.update(elapsed);
        }
}