package miniGames;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
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

class CharacterTestState extends MusicBeatState
{
    public static var char1:Character = null;
	public static var textboxhi:FlxInputText;
	public static var versionShit:FlxText;
	public static var scale:Float = 1;

	var name:Int = 0;
	var charnamee:String = "dad";
	var eventName:FlxUIInputText;
	var notes:FlxSprite;
	var button:FlxButton;
	override function create()
	{
		FlxG.mouse.visible = true;
        var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('stageback'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var front:FlxSprite = new FlxSprite(-650, 450).loadGraphic(Paths.loadImage('stagefront', 'shared'));
		front.setGraphicSize(Std.int(front.width * 1.1));
		front.updateHitbox();
	    front.antialiasing = FlxG.save.data.antialiasing;
		front.scrollFactor.set(0.9, 0.9);
        add(front);

		char1 = new Character(500, 300, "bf", true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);
		char1.dance();

		notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesidle'));
		notes.scale.x = scale;
		notes.scale.y = scale;
		notes.screenCenter(X);
		add(notes);
		
		button = new FlxButton(150, 20, "Change Character", OnClickButton);
        add(button);
		eventName = new FlxUIInputText(50, 20, 80, "");
		add(eventName);

		versionShit = new FlxText(5, FlxG.height - 18, 0, "Controls - Zooms E/Q", 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);


		super.create();
    }

	function OnClickButton():Void
		{
			remove(char1);
			char1 = new Character(500, 30, eventName.text, true);
		    char1.setGraphicSize(Std.int(char1.width * 0.8));
		    add(char1);
			char1.dance();
		}
	
	override function update(elapsed:Float)
	{
		

		if (controls.BACK)
			{
				FlxG.switchState(new MiniGamesState());
			}

		if(controls.ACCEPT) 
		{
			 char1.dance();
			 char1.updateHitbox();
			 char1.visible = true;
             remove(notes);
			 notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesidle'));
			 notes.scale.x = scale;
			 notes.scale.y = scale;
			 notes.screenCenter(X);
			 add(notes);
		}


		if(FlxG.keys.justPressed.DOWN) 
			{
				 char1.playAnim('singDOWN');
				 char1.updateHitbox();
				 char1.visible = true;
				 remove(notes);
				 notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesdown'));
				 notes.scale.x = scale;
				 notes.scale.y = scale;
				 notes.screenCenter(X);
				 add(notes);
			}

		if(FlxG.keys.justPressed.LEFT) 
			{
					 char1.playAnim('singLEFT');
					 char1.updateHitbox();
					 char1.visible = true;
					 remove(notes);
					 notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesleft'));
					 notes.scale.x = scale;
					 notes.scale.y = scale;
					 notes.screenCenter(X);
					 add(notes);
			}
		if(FlxG.keys.justPressed.RIGHT) 
			{
					char1.playAnim('singRIGHT');
					char1.updateHitbox();
					char1.visible = true;
                    remove(notes);
					notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesright'));
					notes.scale.x = scale;
					notes.scale.y = scale;
					notes.screenCenter(X);
					add(notes);
			}
		if(FlxG.keys.justPressed.UP) 
			{
					char1.playAnim('singUP');
					char1.updateHitbox();
					char1.visible = true;
					remove(notes);
					notes = new FlxSprite(0, 0).loadGraphic(Paths.loadImage('notes/notesup'));
					notes.scale.x = scale;
					notes.scale.y = scale;
					notes.screenCenter(X);
					add(notes);
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
