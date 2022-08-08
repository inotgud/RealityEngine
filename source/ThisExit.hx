package;

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
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import flixel.addons.display.FlxBackdrop;
import flash.system.System;

using StringTools;

class ThisExit extends MusicBeatState
{
	public static var hmmmmmmmmmmmmmmmm:String = sys.io.File.getContent('assets/data/language.txt');
	public static var language:String = hmmmmmmmmmmmmmmmm;

	var options:Array<String> = ['Yes', 'No'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
    public static var menuText:Alphabet;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Yes':
                System.exit(0);
			case 'No':
                FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(new TitleState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {

        var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('TitleBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		if(language == "en")
			{
				menuText = new Alphabet(0, 0, "Quit - Are you sure", true, false);
				menuText.screenCenter();
				menuText.y -= 150;
				add(menuText);
			}
			if(language == "tr")
				{
					menuText = new Alphabet(0, 0, "Cikmak istermisin", true, false);
					menuText.screenCenter();
					menuText.y -= 150;
					add(menuText);
				}
				if(language == "ru")
					{
						menuText = new Alphabet(0, 0, "Quit - Are you sure", true, false);
						menuText.screenCenter();
						menuText.y -= 150;
						add(menuText);
					}
    

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
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true, false);
		add(selectorRight);

		changeSelection();

		super.create();

       
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.UP) {
			changeSelection(-1);
		}
		if (FlxG.keys.justPressed.DOWN) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
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