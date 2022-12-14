package options;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
import openfl.display.FPS;
import openfl.Lib;

using StringTools;

class MiscState extends MusicBeatState
{
    private var grpOptions:FlxTypedGroup<Alphabet>;
    var options:Array<String> = ['FPS Counter', 'Flashing Lights', 'Watermark', 'Antialiasing'];
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
    public static var hm:Bool = false;

	function optionEnter(label:String) {
		switch(label) {
            case 'FPS Counter':
                FlxG.save.data.fps = !FlxG.save.data.fps;
                (cast(Lib.current.getChildAt(0), Main)).toggleFPS(FlxG.save.data.fps);
            case 'Flashing Lights':
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = true;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
                openSubState(new options.Question());
             case 'Watermark':
                Question.isAntialiasing = false;
                Question.isWatermark = true;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
                openSubState(new options.Question());
            case 'Antialiasing':
                Question.isAntialiasing = true;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
		}
	}

    var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create()
        {
            // Updating Discord Rich Presence
            #if FEATURE_DISCORD
            DiscordClient.changePresence("In the Options", null);
            #end

            //COLORED BG
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

            grpOptions = new FlxTypedGroup<Alphabet>();
		    add(grpOptions);

            

            for (i in 0...options.length)
                {
                    var optionText:Alphabet = new Alphabet(0, (70 * i), options[i], true, false);
                    optionText.isMenuItem = true;
                    optionText.screenCenter();
                    optionText.targetY = i;
                    optionText.y += (100 * (i - (options.length / 2))) + 50;
                    grpOptions.add(optionText);
                }
                
            selectorLeft = new Alphabet(0, 0, '>', true, false);
                add(selectorLeft);
            selectorRight = new Alphabet(0, 0, '<', true, false);
                add(selectorRight);
            
            changeSelection();
            
            super.create();
        }
    override function update(elapsed:Float)
        {
            super.update(elapsed);
            if(FlxG.keys.justPressed.UP)
                {
                  changeSelection(-1);
                  hm = true;
                }
            if(FlxG.keys.justPressed.DOWN)
                {
                   changeSelection(1);
                   hm = false;
                }
            if(controls.ACCEPT)
                {
                    optionEnter(options[curSelected]);
                }
            if(controls.BACK)
                {
                    FlxG.switchState(new options.MenuOptions());
                }
         
        }
    function changeSelection(huh:Int = 0) {
            curSelected += huh;
            if (curSelected < 0)
                curSelected = options.length - 1;
            if (curSelected >= options.length)
                curSelected = 0;
    
            var bullShit:Int = 0;
    
            for (item in grpOptions.members)
                {
                    item.targetY = bullShit - curSelected;
                    bullShit++;
        
                    item.alpha = 0.6;
                    // item.setGraphicSize(Std.int(item.width * 0.8));
        
                    if (item.targetY == 0)
                    {
                        item.alpha = 1;
                        // item.setGraphicSize(Std.int(item.width));
                    }
                }
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        
}