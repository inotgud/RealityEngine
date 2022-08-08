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
import flash.text.TextField;
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
import sys.io.File;
import flixel.addons.ui.FlxUITabMenu;


using StringTools;

class CreditsEditor extends MusicBeatState
{
	//input texts
	var eventName:FlxUIInputText;
	var eventName2:FlxUIInputText;

	//buttons
	var createButton:FlxButton;
	var saveButtons:FlxButton;

	//flx texts
	var versionShit:FlxText;
	var selec:FlxText;

	var options:Array<String> = ['Credit Name'];
	var creditText:Alphabet;
	private var grpOptions:FlxTypedGroup<Alphabet>;
	var bg:FlxSprite;
	var setColorButton:FlxButton;

	var UI_box:FlxUITabMenu;

	var content:String = sys.io.File.getContent('assets/data/creditsList.txt');

	override function create()
		{
			bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = FlxColor.PINK;
		add(bg);

			grpOptions = new FlxTypedGroup<Alphabet>();
		    add(grpOptions);

			for (i in 0...options.length)
				{
		    creditText = new Alphabet(0, (70 * i) + 30, "Credit Name", true, false);
			creditText.isMenuItem = true;
			creditText.targetY = i;
			creditText.x += 570;
			grpOptions.add(creditText);
			
			}

			var tabs = [
				{name: "Credits", label: 'Credits'},
			];
	
			UI_box = new FlxUITabMenu(null, tabs, true);
			UI_box.scrollFactor.set();
			UI_box.resize(300, 400);
			UI_box.x = FlxG.width / 2 + 40;
			UI_box.y = 220;
			add(UI_box);
			UI_box.x += 250;

			versionShit = new FlxText(5, FlxG.height - 49, 0, "WHITE", 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);
		versionShit.visible = false;

		selec = new FlxText(1180, FlxG.height - 20, 0, "" + "", 12);
		selec.scrollFactor.set();
		selec.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(selec);


			eventName = new FlxUIInputText(109, 20, 80, "Credit Name");
			UI_box.add(eventName);

			eventName2 = new FlxUIInputText(109, 100, 80, "Number of Credits");
			UI_box.add(eventName2);

			saveButtons = new FlxButton(9, 100, "Save", function(){
				/*
				var fileDir:String = "assets/data/creditsList.txt";
				File.append(fileDir, false);
			    
				var names = new List<String>();

				names.add(selec.text);

				var output;
			    
				for (i in names)
					{
						output = File.append(fileDir, false);
						output.writeString(i + "\n");
						output.close();
					}
*/
				sys.io.File.saveContent("assets/data/creditsColors/" + eventName2.text + ".txt", versionShit.text);
				sys.io.File.copy("assets/images/credits/ExampleCredits.png", "assets/images/credits/" + selec.text + ".png");
				sys.FileSystem.deleteFile("assets/data/creditsList.txt");
				sys.io.File.saveContent("assets/data/creditsList.txt", content + "\n" + eventName.text);
			});
			UI_box.add(saveButtons);

			createButton = new FlxButton(9, 20, "Change", buttonoption);
			UI_box.add(createButton);

			setColorButton = new FlxButton(9, 60, "Set Color", colorSet);
			UI_box.add(setColorButton);

			super.create();
		}

		function buttonoption()
		{
			for (i in 0...options.length)
				{
			grpOptions.remove(creditText);
		    creditText = new Alphabet(0, (70 * i) + 30, eventName.text, true, false);
			creditText.isMenuItem = true;
			creditText.targetY = i;
			creditText.x += 570;
			grpOptions.add(creditText);
			remove(selec);
			selec.text = eventName.text;
			
			}
		}
	override function update(elapsed:Float)
		{
			if(FlxG.keys.justPressed.ESCAPE)
				{
					FlxG.switchState(new CreditsState());
				}
			super.update(elapsed);
		}
	function colorSet()
		{
			//freeplaystate, xd
			var scoreText:FlxText = new FlxText(FlxG.width * 0, 5, 0, "", 32);
			scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
			
			var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 16, 0).makeGraphic(Std.int(FlxG.width * 3.6), 85, 0xFF000000);
			scoreBG.alpha = 0.6;
			add(scoreBG);
			
			FlxG.camera.flash(FlxColor.WHITE, 1);
			setColorButton.visible = false;
			var red:FlxButton = new FlxButton(150, 60, "Red", function(){
				versionShit.text = "RED";

				bg.color = FlxColor.RED;
				FlxG.camera.flash(FlxColor.RED, 1);
			});

			red.color = FlxColor.RED;
		    add(red);
			var brown:FlxButton = new FlxButton(250, 60, "Brown", function(){
				versionShit.text = "BROWN";

				bg.color = FlxColor.BROWN;
				FlxG.camera.flash(FlxColor.BROWN, 1);
			});
			brown.color = FlxColor.BROWN;
		    add(brown);
			var white:FlxButton = new FlxButton(350, 60, "White", function(){
				versionShit.text = "WHITE";

				bg.color = FlxColor.WHITE;
				FlxG.camera.flash(FlxColor.WHITE, 1);
			});
			white.color = FlxColor.WHITE;
		    add(white);
			var yellow:FlxButton = new FlxButton(450, 60, "Yellow", function(){
				versionShit.text = "YELLOW";
				bg.color = FlxColor.YELLOW;
				FlxG.camera.flash(FlxColor.YELLOW, 1);
			});
			yellow.color = FlxColor.YELLOW;
		    add(yellow);
			var green:FlxButton = new FlxButton(550, 60, "Green", function(){
				versionShit.text = "GREEN";

				bg.color = FlxColor.GREEN;
				FlxG.camera.flash(FlxColor.GREEN, 1);
			});
			green.color = FlxColor.GREEN;
		    add(green);

			var black:FlxButton = new FlxButton(650, 60, "Black", function(){
				versionShit.text = "BLACK";

				bg.color = FlxColor.BLACK;
				FlxG.camera.flash(FlxColor.BLACK, 1);
			});
			black.color = FlxColor.BLACK;
		    add(black);
			
			var cyan:FlxButton = new FlxButton(750, 60, "Cyan", function(){
				versionShit.text = "CYAN";

				bg.color = FlxColor.CYAN;
				FlxG.camera.flash(FlxColor.CYAN, 1);
			});
			cyan.color = FlxColor.CYAN;
		    add(cyan);

			var blue:FlxButton = new FlxButton(850, 60, "Blue", function(){
				versionShit.text = "BLUE";

				bg.color = FlxColor.BLUE;
				FlxG.camera.flash(FlxColor.BLUE, 1);
			});
			blue.color = FlxColor.BLUE;
		    add(blue);

			var pink:FlxButton = new FlxButton(950, 60, "Pink", function(){
				versionShit.text = "PINK";

				bg.color = FlxColor.PINK;
				FlxG.camera.flash(FlxColor.PINK, 1);
			});
			pink.color = FlxColor.PINK;
		    add(pink);

			var purple:FlxButton = new FlxButton(1050, 60, "Purple", function(){
				versionShit.text = "PURPLE";

				bg.color = FlxColor.PURPLE;
				FlxG.camera.flash(FlxColor.PURPLE, 1);
			});
			purple.color = FlxColor.PURPLE;
		    add(purple);
		}

}
