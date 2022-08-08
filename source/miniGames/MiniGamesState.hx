package miniGames;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end
import miniGames.MiniGamesState;
import miniGames.CharacterTestState;
import miniGames.DrawState;

using StringTools;

class MiniGamesState extends MusicBeatState
{
	var optionShit:Array<String> = ['Character Test', 'Draw Stage'];

	public static var h:String;
	var confirming:Bool = false;

	static var curSelected:Int = 0;

	private var grpOptionShit:FlxTypedGroup<Alphabet>;
	private var char1:Character = null;
	private var char2:Character = null;

	var bg:FlxSprite;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the MiniGames", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFF353535;
		add(bg);

		grpOptionShit = new FlxTypedGroup<Alphabet>();
		add(grpOptionShit);

		char1 = new Character(870, 180, 'monster-christmas', true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);
		char1.visible = false;

		char2 = new Character(870, 180, 'pico', true);
		char2.setGraphicSize(Std.int(char2.width * 0.6));
		add(char2);
		char2.visible = false;

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Coming Soon", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);


		for (i in 0...optionShit.length)
		{
			var creditText:Alphabet = new Alphabet(0, (70 * i) + 30, optionShit[i], true, false);
			creditText.isMenuItem = true;
			creditText.targetY = i;
			grpOptionShit.add(creditText);

			// creditText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// creditText.screenCenter(X);
		}

		changeSelection();



		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;

     

       if(optionShit[curSelected] == 'Character Test')
	    {
             char1.dance();
			 char1.updateHitbox();
			 char1.visible = true;
		}
		else
		{
			char1.visible = false;
		}


		var shiftMult:Int = 1;
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if (upP && !confirming)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			changeSelection(-shiftMult);
		}
		if (downP && !confirming)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			changeSelection(shiftMult);
		}

		if (controls.BACK && !confirming)
			if(h == "mainmenu")
				{
					LoadingState.loadAndSwitchState(new MainMenuState());
				}
				else{
					LoadingState.loadAndSwitchState(new EngineEditorsState());
				}
		

		if (controls.ACCEPT && !confirming)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			confirming = true;
			FlxFlicker.flicker(grpOptionShit.members[curSelected], 1, 0.06, true, false, function(flick:FlxFlicker)
			{
				switch (optionShit[curSelected])
				{
					case 'Character Test':
						LoadingState.loadAndSwitchState(new miniGames.CharacterTestState());
					case 'Draw Stage':
						LoadingState.loadAndSwitchState(new miniGames.DrawState());
				}
				FlxG.sound.music.volume = 0;
				confirming = false;
			});
		}
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = optionShit.length - 1;
		if (curSelected >= optionShit.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptionShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}