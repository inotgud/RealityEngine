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


class Question extends MusicBeatSubstate
{
    public var grpOptions:FlxTypedGroup<Alphabet>;
    public var blackBox:FlxSprite;
    public var options:Array<String> = ['On', 'Off'];
    public var optionTextin:Alphabet;
    public var onSaveData:String;
    public var onSaveItem:String;
    var optionText:Alphabet;
    public static var isScroll:Bool = false;
    public static var isRedesigned:Bool = false;
    public static var isTap:Bool = false;
    public static var isColored:Bool = false;
    public static var isScrollSpeed:Bool = false;
    public static var scrollInt:Int = 1;
    public static var isBotPlay:Bool = false;
    private static var curSelected:Int = 0;
    public static var isFPS:Bool = false;
    public static var isFlashing:Bool = false;
    public static var isWatermark:Bool = false;
    public static var isMenuSong:Bool = false;
    public static var isAntialiasing:Bool = false;
    public static var isMidSongEvent:Bool = false;
    public static var isSystemCursor:Bool = false;
    function optionEnter(label:String) {
		switch(label) {
            case 'On':
                if(isBotPlay)
                    {
                        FlxG.save.data.botplay = "on";
                    }
                 if(isTap)
                    {
                        FlxG.save.data.ghost = "Enabled";
                    }
                if (isFPS)
                    {
                        
                    }
                if (isFlashing)
                    {
                        FlxG.save.data.flashing  = "on";
                    }
                if (isWatermark)
                    {
                        Main.watermarks = !Main.watermarks;
                        FlxG.save.data.watermark = "on";
                        Main.watermarks = FlxG.save.data.watermark;
                    }
                if(isColored)
                    {
                        FlxG.save.data.coloredmenubg = "On";
                    }
                if(isAntialiasing)
                    {
                        FlxG.save.data.antialiasing = "on";
                    }
                if(isSystemCursor)
                    {
                        FlxG.save.data.systemCursorData = true;
                        FlxG.mouse.useSystemCursor = true;
                    }

            case 'Off':
                if(isBotPlay)
                    {
                        FlxG.save.data.botplay = "off";
                    }
                if(isTap)
                    {
                        FlxG.save.data.ghost = "Disabled";
                    }
                if (isFPS)
                    {
                        FlxG.save.data.fps = "off";
                        (cast(Lib.current.getChildAt(0), Main)).toggleFPS(FlxG.save.data.fps);
                    }
                if (isFlashing)
                    {
                        FlxG.save.data.flashing  = "off";
                    }
                if (isWatermark)
                    {
                        Main.watermarks = !Main.watermarks;
                        FlxG.save.data.watermark = "off";
                        Main.watermarks = FlxG.save.data.watermark;
                    }
                if(isColored)
                    {
                        FlxG.save.data.coloredmenubg = "Off";
                    }
                if(isAntialiasing)
                    {
                        FlxG.save.data.antialiasing = "off";
                    }
                if(isSystemCursor)
                    {
                        FlxG.save.data.systemCursorData = false;
                        FlxG.mouse.useSystemCursor = false;
                    }
            case 'Down Scroll':
                FlxG.save.data.downscroll = "Downscroll";
             case 'Up Scroll':
                FlxG.save.data.downscroll = "Upscroll";
            case 'Bf':
                FlxG.save.data.abfd = "Bf";
                close();
            case 'Dad':
                FlxG.save.data.abfd = "Dad";
                close();
		}
	}

    var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

    override function create()
        {
            if(isScrollSpeed == true)
                {
                    options = [Std.string(scrollInt)];
                }
            if(isScroll == true)
                {
                    options = ['Down Scroll','Up Scroll'];
                }
             if(isTap == true)
                {
                    options = ['Enabled','Disabled'];
                }
                if(isMidSongEvent == true)
                    {
                        options = ['Bf','Dad'];
                    }
           
            blackBox = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		    add(blackBox);
       
            FlxTween.tween(blackBox, {alpha: 0.7}, 1, {ease: FlxEase.expoInOut});

            blackBox.alpha = 0.6;

            grpOptions = new FlxTypedGroup<Alphabet>();
		    add(grpOptions);

            

            for (i in 0...options.length)
                {
                    optionText = new Alphabet(0, (70 * i), options[i], true, false);
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
                if(isScrollSpeed)
                    {
                        if(controls.RIGHT)
                            {
                                scrollInt + 0.1;
                                remove(optionText);
                                options = [Std.string(scrollInt)];
                                add(optionText);
                            }
                        if(controls.LEFT)
                            {
                                scrollInt - 0.1;
                                remove(optionText);
                                options = [Std.string(scrollInt)];
                                add(optionText);
                            }
                    }
                if(controls.BACK)
                    {
                        close();
                    }
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
                        if(isScrollSpeed)
                            {
                                FlxG.save.data.scrollSpeed = scrollInt;
                            }
                            else{
                        optionEnter(options[curSelected]);
                        }
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
