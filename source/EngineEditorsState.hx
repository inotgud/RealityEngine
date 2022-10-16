package;

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
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end
import miniGames.MiniGamesState;

using StringTools;

class EngineEditorsState extends MusicBeatState
{
	var optionShit:Array<String> = 
	[/*'Custom State Editor',*/
	'Credits Editor',
	'Events Editor',
	'Stage Editor',
	'Character Editor',
	'Week Editor',
	'Chart Editor',
	'Mods',
	'Minigames'];

	var confirming:Bool = false;

	static var curSelected:Int = 0;

	private var grpOptionShit:FlxTypedGroup<Alphabet>;
	private var char1:Character = null;
	private var char2:Character = null;

	var bgColors:Array<String> = ['#314d7f', '#4e7093', '#70526e', '#594465'];
	var colorRotation:Int = 1;

	var bg:FlxSprite;
	var bg2:FlxSprite;
	var creditText:Alphabet;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('editorsbg'));
		bg.color = 0xFF353535;
		add(bg);

		bg2 = new FlxSprite().loadGraphic(Paths.image('editors1'));
		add(bg2);

		grpOptionShit = new FlxTypedGroup<Alphabet>();
		add(grpOptionShit);

		char1 = new Character(870, 180, 'bf', true);
		char1.setGraphicSize(Std.int(char1.width * 0.8));
		add(char1);
		char1.visible = false;

		char2 = new Character(870, 180, 'pico', true);
		char2.setGraphicSize(Std.int(char2.width * 0.6));
		add(char2);
		char2.visible = false;

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Coming Soon", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("PhantomMuff 1.5", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);


		for (i in 0...optionShit.length)
		{
			creditText = new Alphabet(0, (70 * i) + 30, optionShit[i], true, false);
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

     

       if(optionShit[curSelected] == 'Character Editor')
	    {
             char1.dance();
			 char1.updateHitbox();
			 char1.visible = true;
		}
		else
		{
			char1.visible = false;
		}

		if(optionShit[curSelected] == 'Week Editor')
			{
				 char2.dance();
				 char2.updateHitbox();
				 char2.visible = true;
			}
		else
			{
				char2.visible = false;
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
			FlxG.switchState(new MainMenuState());

		if (controls.ACCEPT && !confirming)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			confirming = true;
			FlxFlicker.flicker(grpOptionShit.members[curSelected], 1, 0.06, true, false, function(flick:FlxFlicker)
			{
				switch (optionShit[curSelected])
				{
					/*case 'Custom State Editor':
						LoadingState.loadAndSwitchState(new CustomStateEditor());
						*/

					case 'Events Editor':
						FlxG.switchState(new engineEditors.MidSongEventEditor());

					case 'Credits Editor':
						Debug.displayAlert("Credits Editor", "Credits Editor is under maintenance for a while, add credits from json. Sorry for that");

					case 'Stage Editor':
						FlxG.switchState(new engineEditors.StageEditor());

					case 'Character Editor':
						LoadingState.loadAndSwitchState(new engineEditors.CharacterEditor());

					case 'Week Editor':
						LoadingState.loadAndSwitchState(new engineEditors.WeekEditor());

					case 'Mods':
						LoadingState.loadAndSwitchState(new ModsMenuState());

					case 'Chart Editor':
						LoadingState.loadAndSwitchState(new ChartingState());

					case 'Minigames':
						LoadingState.loadAndSwitchState(new miniGames.MiniGamesState());
						miniGames.MiniGamesState.h = "normal";
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