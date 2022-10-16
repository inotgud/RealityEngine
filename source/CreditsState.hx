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
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

class CreditsState extends MusicBeatState
{
	var iconArray:Array<AttachedSprite> = [];
	var descBox:AttachedSprite;

	static var curSelected:Int = 0;

	private var grpCredits:FlxTypedGroup<Alphabet>;

	var descText:FlxText;
	var bg:FlxSprite;
	var jsonData = Paths.loadCreditJSON('credits.json');

	var colorTween:FlxTween;

	override function create()
	{
		var jsonData = Paths.loadCreditJSON('credits.json');
	     if (jsonData == null)
	     {
				Debug.logError('Failed to parse credits JSON!');
				return;
		}

		var data:CreditsJson = cast jsonData;

		/* 
			if (FlxG.sound.music != null)
			{
				if (!FlxG.sound.music.playing)
					FlxG.sound.playMusic(Paths.music('freakyMenu'));
			}
		 */

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = FlxColor.PINK;
		add(bg);

		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("muff.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descBox.sprTracker = descText;
		descText.scrollFactor.set();
		descText.text = '';
		descText.borderSize = 2.4;

		grpCredits = new FlxTypedGroup<Alphabet>();
		add(grpCredits);

		for (credit in data.credits)
			{
				bg.color = FlxColor.fromString("#" + credit.color);
			}

				for (credit in data.credits)
				{
					var creditText:Alphabet = new Alphabet(0, (70 * 10) + 30, credit.name, true, false);
					creditText.isMenuItem = true;
					creditText.x += 570;
					grpCredits.add(creditText);
		
					var icon:AttachedSprite = new AttachedSprite('credits/' + credit.name);
					icon.sprTracker = creditText;
		
					iconArray.push(icon);
					add(icon);
				}
		var versionShit:FlxText = new FlxText(950, FlxG.height - 25, 0, "Press E to Credits Editor", 12);
                versionShit.scrollFactor.set();
                versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                //add(versionShit);
				
		changeSelection();
		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);

		var descText:FlxText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("muff.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		descBox.sprTracker = descText;

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;

		var shiftMult:Int = 1;

		/*if (FlxG.keys.justPressed.E)
			{
				FlxG.switchState(new CreditsEditor());
			}
			*/
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if (upP)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			changeSelection(-shiftMult);
			var jsonData2 = Paths.loadCreditJSON('credits.json');
			if (jsonData2 == null)
			{
				   Debug.logError('Failed to parse credits JSON!');
				   return;
		   }
	
		   var data2:CreditsJson = cast jsonData2;
				for (credit in data2.credits)
					{
						remove(bg);
		                bg.color = FlxColor.fromString("#" + credit.color);
		                add(bg);
		                descText.text = credit.desc;
					}
			
		}
		if (downP)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			changeSelection(shiftMult);
			var jsonData2 = Paths.loadCreditJSON('credits.json');
		if (jsonData2 == null)
		{
			   Debug.logError('Failed to parse credits JSON!');
			   return;
	   }

	   var data2:CreditsJson = cast jsonData2;
			for (credit in data2.credits)
				{
					remove(bg);
	                bg.color = FlxColor.fromString("#" + credit.color);
	                 add(bg);
	                descText.text = credit.desc;
				}
			
		  }

		if (FlxG.mouse.wheel != 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeSelection(-FlxG.mouse.wheel);
			}

		if(controls.ACCEPT)
		{
			/*var jsonData2 = Paths.loadCreditJSON('credits.json');
			if (jsonData2 == null)
			{
				   Debug.logError('Failed to parse credits JSON!');
				   return;
		   }
	
		   var data2:CreditsJson = cast jsonData2;
		   for (credit in data2.credits)
			{
			var content:String = credit.link;
			CoolUtil.browserLoad(content);
			}*/
		}

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
	}

	function changeSelection(change:Int = 0)
	{
		var jsonData2 = Paths.loadCreditJSON('credits.json');
		if (jsonData2 == null)
		{
			   Debug.logError('Failed to parse credits JSON!');
			   return;
	   }

	   var data2:CreditsJson = cast jsonData2;
	   
		curSelected += change;

				if (curSelected < 0)
					curSelected = data2.length - 1;
				if (curSelected >= data2.length)
					curSelected = 0;


				
		// selector.y = (70 * curSelected) + 30;
		var bullShit:Int = 0;

		for (item in grpCredits.members)
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
	}
}

typedef CreditsJson = {
	var length:Int;
    var credits:Array<CreditsJsonData>;
}

typedef CreditsJsonData = {
    var name:String;
    var link:String;
	var desc:String;
    var color:String;
} 
