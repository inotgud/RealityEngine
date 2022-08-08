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
import flixel.addons.ui.FlxUITabMenu;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end

using StringTools;

class StageEditor extends MusicBeatState
{
	var char1:Character;
	var char2:Character;
	var char3:Character;
	var charnew:Character;
	var charselect:String = "bf";
	var charselect2:String = "dad";
	var versionShit:FlxText;
	var bg:FlxSprite;
	var bg2:FlxSprite;
	var front:FlxSprite;
	var eventName:FlxUIInputText;
	var eventName2:FlxUIInputText;
	var eventName3:FlxUIInputText;
	var eventName4:FlxUIInputText;
	var eventName5:FlxUIInputText;
	var UI_box:FlxUITabMenu;
	public static var hmmm:String = sys.io.File.getContent('assets/images/no/novar/a.txt');
	public static var code:String = "{" + "\n" + hmmm + "camZoom" + hmmm + ": 1," + "\n" +  hmmm + "stagesprites" + hmmm + ": [";
	override function create()
	{
		#if FEATURE_DISCORD
        DiscordClient.changePresence("Stage Editor", null);
        #end

		FlxG.mouse.visible = true;

		/*
		This old stage editor some codes...
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
		*/

		char3 = new Character(300, 110, "gf", false);
		char3.setGraphicSize(Std.int(char3.width * 0.8));
		add(char3);

		char1 = new Character(770, 350, charselect, true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);

		char2 = new Character(100, 30, charselect2, false);
		char2.setGraphicSize(Std.int(char1.width * 0.8));
		add(char2);

		versionShit = new FlxText(5, FlxG.height - 18, 0, "Controls - Zooms E/Q", 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

		
		eventName = new FlxUIInputText(9, 30, 80, "layername");
		eventName2 = new FlxUIInputText(109, 30, 80, "image");
		eventName3 = new FlxUIInputText(9, 80, 80, "x");
		eventName4 = new FlxUIInputText(109, 80, 80, "y");

		var hmm:FlxButton = new FlxButton(9, 160, "Add Layer", addStageLayer);
		eventName5 = new FlxUIInputText(109, 160, 80, "ModName");

		var tabs = [
			{name: "Stage", label: 'Stage'},
		];

		UI_box = new FlxUITabMenu(null, tabs, true);
		UI_box.scrollFactor.set();
		UI_box.resize(300, 400);
		UI_box.x = FlxG.width / 2 + 40;
		UI_box.y = 20;
		add(UI_box);
		UI_box.x += 250;
		UI_box.add(eventName);
		UI_box.add(eventName2);
		UI_box.add(eventName3);
		UI_box.add(eventName4);
		UI_box.add(eventName5);
		UI_box.add(hmm);

		var save:FlxButton = new FlxButton(100, 150, "Save", saveStage);
        add(save);
		super.create();
    }

	function nullFunction():Void
		{
			
		}
	
	function addStageLayer():Void
		{
			remove(char1);
			remove(char2);
			remove(char3);
			var stagenewlayer:FlxSprite = new FlxSprite(Std.parseFloat(eventName3.text),Std.parseFloat(eventName4.text)).loadGraphic(Paths.image(eventName2.text));
			stagenewlayer.scrollFactor.set(0, 0);
			stagenewlayer.antialiasing = FlxG.save.data.antialiasing;
			stagenewlayer.updateHitbox();
			add(stagenewlayer);
			add(char1);
			add(char2);
			add(char3);

			code = code + "{" + "\n" + hmmm + "name" + hmmm + ":" + hmmm + eventName.text + hmmm + ",";
			code = code +  "\n" + hmmm + "x" + hmmm + ":" + eventName3.text + ",";
			code = code +  "\n" + hmmm + "y" + hmmm + ":" + eventName4.text + ",";
			code = code + "\n" + hmmm + "image" + hmmm + ":" + hmmm + eventName2.text + hmmm + ",";
			code = code + "\n" + hmmm + "active" + hmmm + ": false" + ",";
			code = code + "\n" + hmmm + "scrollFactor" + hmmm + ": true" + ",";
			code = code + "\n" + hmmm + "animated" + hmmm + ": false" + ",";
			code = code + "\n" + hmmm + "sparrowatlas" + hmmm + ":" + hmmm + hmmm + ",";
			code = code + "\n" + hmmm + "startanim" + hmmm + ":" + hmmm + hmmm;
			code = code + "\n" + "}";
			code = code + "\n" + ",";
		}

		function saveStage():Void
		{
			var content:String = sys.io.File.getContent("assets/data/stageList.txt");
			code = code + "\n" + "    ]";
			code = code + "\n" + "}";
            sys.io.File.saveContent("mods/" + eventName5.text + "/custom/custom_stages/" + eventName.text + ".json", code);
			sys.io.File.saveContent("assets/data/stageList.txt", content + "\n" + eventName.text);
		}
	function PasteFunction():Void
	{
		var c = Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT, ClipboardTransferMode.CLONE_PREFERRED);		
	}
	
	override function update(elapsed:Float)
	{
        if (FlxG.keys.justPressed.ESCAPE)
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
