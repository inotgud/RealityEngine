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

class GamePlaySub extends MusicBeatState
{
    private var grpOptions:FlxTypedGroup<Alphabet>;
    var options:Array<String> = ['Toggle Dark Mode', 'Toggle Light Mode', 'Toggle Practatice Mode','Set Menu Music', 'Edit Keybindings','Update Announcaments On','Colored Menu','Redesigned Menu', 'Set Username', 'Scroll Speed', 'Offset Thing', 'Ghost Tap', 'Bot Play', 'Down Scroll', 'Reset Button On', 'Reset Button Off', 'Customize Gameplay'];
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
    public static var hm:Bool = false;

	function optionEnter(label:String) {
		switch(label) {
            case 'Toggle Dark Mode':
                FlxG.save.data.mode = "dark";
            case 'Toggle Light Mode':
                FlxG.save.data.mode = "light";
            case 'On Cutscenes':
                FlxG.save.data.oncutscenes = "true";
            case 'Off Cutscenes':
                FlxG.save.data.oncutscenes = "false";
            case 'Toggle Practatice Mode':
               if(FlxG.save.data.practaticeMode == "on")
                {
                    FlxG.save.data.practaticeMode = "off";
                }
                else{
                    FlxG.save.data.practaticeMode = "on";
                }
            case 'Set Menu Music':
               FlxG.switchState(new options.MenuSongSelector());
            case 'Update Announcaments On':
				FlxG.save.data.updatenotification = "true";
            case 'Colored Menu':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = true;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
				openSubState(new options.Question());
			case 'Redesigned Menu':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = true;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
				openSubState(new options.Question());
			case 'Set Username':
				FlxG.switchState(new SetUser());
			case 'Ghost Tap':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = true;
                openSubState(new options.Question());
            case 'Edit Keybindings':
				openSubState(new KeyBindMenu());
            case 'Bot Play':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isTap = false;
                Question.isBotPlay = true;
                Question.isScroll = false;
                openSubState(new options.Question());
            case 'Down Scroll':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = false;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = true;
                Question.isTap = false;
                openSubState(new options.Question());
            case 'Scroll Speed':
                Question.isMenuSong = false;
                Question.isAntialiasing = false;
                Question.isWatermark = false;
                Question.isFlashing = false;
                Question.isFPS = false;
                Question.isScrollSpeed = true;
                Question.isRedesigned = false;
                Question.isColored = false;
                Question.isBotPlay = false;
                Question.isScroll = false;
                Question.isTap = false;
                openSubState(new options.Question());
            case 'Reset Button On':
                FlxG.save.data.resetButton = "on";
            case 'Reset Button Off':
                FlxG.save.data.resetButton = "off";
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