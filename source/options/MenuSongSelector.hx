package options;

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
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
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


using StringTools;

class MenuSongSelector extends MusicBeatState
{
        var eventName:FlxUIInputText;
        var button:FlxButton;
        private var grpOptions:FlxTypedGroup<Alphabet>;
        var options:Array<String> = ['Default', 'Old'];
        private static var curSelected:Int = 0;
        public static var menuBG:FlxSprite;
        public static var hm:Bool = false;

        function optionEnter(label:String) {
            switch(label) {
                case 'Default':
                    FlxG.save.data.menuMusic = "freakyMenu";
                case 'Old':
                    FlxG.save.data.menuMusic = "old";
            }
        }
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
                
                button = new FlxButton(150, 20, "Apply Custom Music", funcbutton);
                add(button);
		        eventName = new FlxUIInputText(50, 20, 80, "");
		        add(eventName);
                
                super.create();
            }
        function funcbutton(){
            FlxG.save.data.menuMusic = eventName.text;
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
