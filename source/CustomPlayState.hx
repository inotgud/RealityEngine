/* package;

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

class CustomPlayState extends MusicBeatState
{
	var stagepath:String;
	var char1:Character;
	var char2:Character;
	var char3:Character;
	var charnew:Character;
	var charselect:String = "bf";
	var charselect2:String = "dad";
	var eventName:FlxUIInputText;
	var eventNamee:FlxUIInputText;
	var eventNameEE:FlxUIInputText;
	var eventNameEEe:FlxUIInputText;
	var button:FlxButton;
	var eventName2:FlxUIInputText;
	var eventName3:FlxUIInputText;
	var button2:FlxButton;
	var button3:FlxButton;
	var button4:FlxButton;
	var button5:FlxButton;
	var button6:FlxButton;
	var button7:FlxButton;
	var button8:FlxButton;
    var songChange:FlxUIInputText;
	var versionShit:FlxText;
	var bg:FlxSprite;
	var bg2:FlxSprite;
	var front:FlxSprite;
	override function create()
	{
		#if FEATURE_DISCORD
        DiscordClient.changePresence("Stage Editor", null);
        #end

		FlxG.mouse.visible = true;

		bg = new FlxSprite(-100).loadGraphic(Paths.loadImage('stageback'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		front = new FlxSprite(-650, 450).loadGraphic(Paths.loadImage('stagefront', 'shared'));
		front.setGraphicSize(Std.int(front.width * 1.1));
		front.updateHitbox();
	    front.antialiasing = FlxG.save.data.antialiasing;
		front.scrollFactor.set(0.9, 0.9);
        add(front);

		bg2 = new FlxSprite(-100).loadGraphic(Paths.loadImage('stagecurtains'));
		bg2.scrollFactor.x = 0;
		bg2.scrollFactor.y = 0.10;
		bg2.setGraphicSize(Std.int(bg2.width * 1.1));
		bg2.updateHitbox();
		bg2.screenCenter();
		bg2.antialiasing = FlxG.save.data.antialiasing;
		add(bg2);

		char3 = new Character(300, 110, "gf", false);
		char3.setGraphicSize(Std.int(char3.width * 0.8));
		add(char3);

		char1 = new Character(770, 350, charselect, true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);

		char2 = new Character(100, 30, charselect2, false);
		char2.setGraphicSize(Std.int(char1.width * 0.8));
		add(char2);

		versionShit = new FlxText(5, FlxG.height - 18, 0, "Controls - Zooms E/Q - " + stagepath, 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);
 
		button = new FlxButton(150, 20, "Change Char", nullFunction);
        add(button);
		eventName = new FlxUIInputText(50, 20, 80, "");
		add(eventName);
		eventName2 = new FlxUIInputText(300, 20, 80, "");
		add(eventName2);
		button2 = new FlxButton(400, 20, "Oppont. C.", nullFunction);
        add(button2);
		songChange = new FlxUIInputText(850, 60, 80, "");
        eventNamee = new FlxUIInputText(850, 60, 80, "");
		add(eventNamee);
		button4 = new FlxButton(850, 20, "Song Ch", function(){
			
		});
        add(button4);
		button5 = new FlxButton(950, 20, "Play", function(){
            PlayState.sicks = 0;
			PlayState.bads = 0;
			PlayState.shits = 0;
			PlayState.goods = 0;
			PlayState.campaignMisses = 0;
			PlayState.SONG = Song.conversionChecks(Song.loadFromJson(songChange.text, ""));
            PlayState.SONG.player1 = eventName.text;
            PlayState.SONG.player2 = eventName2.text;
			PlayState.campaignScore = 0;
			new FlxTimer().start(1, function(tmr:FlxTimer)
                {
                    LoadingState.loadAndSwitchState(new PlayState(), true);
                });
		});
        add(button5);
		
		super.create();
    }

	function nullFunction():Void
		{
			
		}
	function PasteFunction():Void
	{
		var c = Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT, ClipboardTransferMode.CLONE_PREFERRED);
		eventName2.text = c;		
	}

	override function update(elapsed:Float)
	{
            if (controls.BACK)
                    {
                            FlxG.switchState(new EngineEditorsState());
                    }
		if (FlxG.keys.pressed.E) 
		{
			FlxG.camera.zoom += elapsed * FlxG.camera.zoom;
		}
		if (FlxG.keys.pressed.Q) 
		{
			FlxG.camera.zoom -= elapsed * FlxG.camera.zoom;
		}
		super.update(elapsed);
	}

}

*/