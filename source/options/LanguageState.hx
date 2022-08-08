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
#if sys
import sys.FileSystem;
#end
using StringTools;

class LanguageState extends MusicBeatState
{
    private var grpOptions:FlxTypedGroup<Alphabet>;
    var options:Array<String> = ['English', 'Russian', 'Turkish', 'German', 'French'];
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	function optionEnter(label:String) {
		switch(label) {
            case 'English':
                #if sys
				sys.FileSystem.deleteFile("assets/data/language.txt");
                sys.io.File.saveContent("assets/data/language.txt", "en");
                #end
			case 'Russian':
                #if sys
				sys.FileSystem.deleteFile("assets/data/language.txt");
                sys.io.File.saveContent("assets/data/language.txt", "ru");
                #end
			case 'Turkish':
                #if sys
				sys.FileSystem.deleteFile("assets/data/language.txt");
                sys.io.File.saveContent("assets/data/language.txt", "tr");
                #end
			case 'German':
                #if sys
				sys.FileSystem.deleteFile("assets/data/language.txt");
                sys.io.File.saveContent("assets/data/language.txt", "german");
                #end
			case 'French':
                #if sys
				sys.FileSystem.deleteFile("assets/data/language.txt");
                sys.io.File.saveContent("assets/data/language.txt", "french");
                #end
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
                selectorLeft.color = FlxColor.CYAN;
                add(selectorLeft);
            selectorRight = new Alphabet(0, 0, '<', true, false);
                selectorRight.color = FlxColor.CYAN;
                add(selectorRight);
            
            	var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "THIS OPTIONS BETA! if you want to enter real options click real options", 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

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
                    FlxG.switchState(new options.MenuOptions());
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