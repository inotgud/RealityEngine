package engineEditors;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import openfl.desktop.ClipboardTransferMode;
import openfl.desktop.ClipboardFormats;
import openfl.desktop.Clipboard;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end

using StringTools;

class MidSongEventEditor extends MusicBeatState
{
    var bg:FlxSprite;
    var eventName:FlxUIInputText;
    var eventName2:FlxUIInputText;
    var eventName3:FlxUIInputText;
    var eventName4:FlxUIInputText;
    var eventName5:FlxUIInputText;
    var eventName6:FlxUIInputText;
    var char1:Character;

    public static var code:String = "function beatHit()";

    function stagebg()
        {

        }
	override function create()
        {
            bg = new FlxSprite(-100).loadGraphic(Paths.loadImage('stageback'));
            bg.scrollFactor.x = 0;
            bg.scrollFactor.y = 0.10;
            bg.setGraphicSize(Std.int(bg.width * 1.1));
            bg.updateHitbox();
            bg.screenCenter();
            bg.antialiasing = FlxG.save.data.antialiasing;
            add(bg);

            
            eventName = new FlxUIInputText(35, 105, 80, "curStep");
            add(eventName);
    
            var button3:FlxButton = new FlxButton(35, 130, "Character Switch", charswitchcode);
            add(button3);

            eventName2 = new FlxUIInputText(135, 130, 80, "charname");
            add(eventName2);

            eventName3 = new FlxUIInputText(205, 130, 80, "dad,bf,gf");
            add(eventName3);
    
            var button4:FlxButton = new FlxButton(35, 178, "Play Anim", functionplayanim);
            add(button4);

            eventName4 = new FlxUIInputText(135, 178, 80, "dad,bf,gf");
            add(eventName4);

            eventName5 = new FlxUIInputText(205, 178, 80, "animname");
            add(eventName5);

            eventName6 = new FlxUIInputText(35, 238, 80, "modchartname");
            add(eventName6);

            var save:FlxButton = new FlxButton(1150, 150, "Save", save);
            add(save);

            char1 = new Character(870, 180, 'bf', true);
		    char1.setGraphicSize(Std.int(char1.width * 0.8));
            char1.dance();
		    add(char1);
    
        }
    function charswitchcode()
        {
            code = code + "\n" + "if curStep == " + eventName.text + "\n" + eventName3.text + ":changeCharacter('" + eventName2.text + "', 30,30)" + "\n" + "end";
        }
    function functionplayanim()
        {
            code = code + "\n" + "if curStep == " + eventName.text + "\n" + eventName4.text + ":playAnim('" + eventName5.text + "')" + "\n" + "end";
        }

    //-------------------------------------------------------

    function save()
        {
            code = code + "\n" + "end";
            sys.io.File.saveContent("assets/" + eventName6.text + ".lua", code);
        }

    override function update(elapsed:Float)
        {
            if(FlxG.keys.justPressed.ESCAPE)
                {
                    FlxG.switchState(new MainMenuState());
                }
            super.update(elapsed);
        }
}
