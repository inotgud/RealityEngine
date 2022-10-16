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
using StringTools;

class MenuOptions extends MusicBeatState
{
    var description:String;
    private var grpOptions:FlxTypedGroup<Alphabet>;
    var options:Array<String>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
    var icon:String;
    var descText:FlxText;
    var iconArray:Array<HealthIcon> = [];
    var optionText:Alphabet;

	function optionEnter(label:String) {
		switch(label) {
            case 'Language':
				FlxG.switchState(new options.LanguageState());
                description = "Your Friday Night Language";
			case 'Gameplay':
				FlxG.switchState(new options.GamePlaySub());
                description = "Gameplay option";
			case 'Appearance':
				FlxG.switchState(new options.AppearanceSub());
                description = "Appearance";
			case 'Misc':
				FlxG.switchState(new options.MiscState());
                description = "Misc";
			case 'Saves':
				FlxG.switchState(new options.SavesState());
                description = "Your PC FNF Option";
            case 'Real Options':
                FlxG.switchState(new OptionsDirect());
                description = "Old Options";
            default:
                CustomOptions.optionName = options[curSelected];
                FlxG.switchState(new options.CustomOptions());
                description = "";
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

            //OPTIONS JSON
            var jsonData = Paths.loadOptionsJson("options");
				if (jsonData == null)
				{
					Debug.logError('Options Error!');
					return;
				}
                //set options json
				var data:OptionJson = cast jsonData;
                options = data.options;
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
                    var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
                    optionText.screenCenter();
                    optionText.y += (100 * (i - (options.length / 2))) + 50;
                    grpOptions.add(optionText);
                    
                }
                
            selectorLeft = new Alphabet(0, 0, '>', true, false);
            selectorLeft.color = FlxColor.CYAN;
            add(selectorLeft);

            selectorRight = new Alphabet(0, 0, '<', true, false);
            selectorRight.color = FlxColor.CYAN;
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
                  
                }
            if(FlxG.keys.justPressed.DOWN)
                {
                   changeSelection(1);
                }
            if(controls.ACCEPT)
                {
                    optionEnter(options[curSelected]);
                }
            if(controls.BACK)
                {
                    FlxG.switchState(new MainMenuState());
                }
            if (FlxG.mouse.wheel != 0)
                {
                    changeSelection(-FlxG.mouse.wheel);
                }
            
        }
        function close() {
            super.closeSubState();
        }
    function changeSelection(huh:Int = 0) {
            curSelected += huh;
            if (curSelected < 0)
                curSelected = options.length - 1;
            if (curSelected >= options.length)
                curSelected = 0;
    
            var bullShit:Int = 0;
    
            for (item in grpOptions.members) {
                item.targetY = bullShit - curSelected;
                bullShit++;



                item.alpha = 0.6;
                if (item.targetY == 0) {
                    item.alpha = 1;
                    selectorLeft.x = item.x - 63;
                    selectorLeft.y = item.y;
                    selectorRight.x = item.x + item.width + 15;
                    selectorRight.y = item.y;
                }
            }
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        
}

typedef OptionJson = {
    var options:Array<String>;
}