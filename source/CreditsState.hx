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
	var credits:Array<CreditsMetadata> = [];
	var iconArray:Array<AttachedSprite> = [];
	var descBox:AttachedSprite;

	static var curSelected:Int = 0;

	private var grpCredits:FlxTypedGroup<Alphabet>;

	var descText:FlxText;
	var bg:FlxSprite;
	var colorTween:FlxTween;

	override function create()
	{
		var initCreditlist = CoolUtil.coolTextFile(Paths.txt('data/creditsList'));
        
		initCreditlist = CoolUtil.coolTextFile(Paths.txt('data/creditsList'));

		for (i in 0...initCreditlist.length)
		{
			var data:Array<String> = initCreditlist[i].split(':');
			credits.push(new CreditsMetadata(data[0], data[1]));
		}

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
		descText.text = 'what';
		descText.borderSize = 2.4;
		add(descText);

		grpCredits = new FlxTypedGroup<Alphabet>();
		add(grpCredits);

		var contentt1:String = sys.io.File.getContent('assets/data/creditsColors/' + curSelected + '.txt');
			if(contentt1 == "ORANGE")
			{
				bg.color = FlxColor.ORANGE;
			}
			if(contentt1 == "RED")
			{
				bg.color = FlxColor.RED;
			}
			if(contentt1 == "BROWN")
			{
				bg.color = FlxColor.BROWN;
			}
			if(contentt1 == "WHITE")
			{
				bg.color = FlxColor.WHITE;
			}
			if(contentt1 == "YELLOW")
			{
				bg.color = FlxColor.YELLOW;
			}
			if(contentt1 == "GREEN")
			{
				bg.color = FlxColor.GREEN;
			}
			if(contentt1 == "BLACK")
			{
				bg.color = FlxColor.BLACK;
			}
			if(contentt1 == "CYAN")
			{
				bg.color = FlxColor.CYAN;
			}
			if(contentt1 == "BLUE")
			{
				bg.color = FlxColor.BLUE;
			}
			if(contentt1 == "PINK")
			{
				bg.color = FlxColor.PINK;
			}
			if(contentt1 == "PURPLE")
			{
				bg.color = FlxColor.PURPLE;
			}
			if(contentt1 == "KAWAISPRITECOLOR")
			{
				bg.color = 0xFF757EFF;
			}

		for (i in 0...credits.length)
		{
			var creditText:Alphabet = new Alphabet(0, (70 * i) + 30, credits[i].modderName, true, false);
			creditText.isMenuItem = true;
			creditText.targetY = i;
			creditText.x += 570;
			grpCredits.add(creditText);

			var icon:AttachedSprite = new AttachedSprite('credits/' + credits[i].modderName);
			icon.sprTracker = creditText;

			iconArray.push(icon);
			add(icon);

			// creditText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// creditText.screenCenter(X);
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
		add(descText);

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
			var contentt1:String = sys.io.File.getContent('assets/data/creditsColors/' + curSelected + '.txt');
			if(contentt1 == "RED")
			{
				bg.color = FlxColor.RED;
			}
			if(contentt1 == "BROWN")
			{
				bg.color = FlxColor.BROWN;
			}
			if(contentt1 == "WHITE")
			{
				bg.color = FlxColor.WHITE;
			}
			if(contentt1 == "YELLOW")
			{
				bg.color = FlxColor.YELLOW;
			}
			if(contentt1 == "GREEN")
			{
				bg.color = FlxColor.GREEN;
			}
			if(contentt1 == "BLACK")
			{
				bg.color = FlxColor.BLACK;
			}
			if(contentt1 == "CYAN")
			{
				bg.color = FlxColor.CYAN;
			}
			if(contentt1 == "BLUE")
			{
				bg.color = FlxColor.BLUE;
			}
			if(contentt1 == "PINK")
			{
				bg.color = FlxColor.PINK;
			}
			if(contentt1 == "PURPLE")
			{
				bg.color = FlxColor.PURPLE;
			}
			if(contentt1 == "KAWAISPRITECOLOR")
			{
				bg.color = 0xFF757EFF;
			}
		}
		if (downP)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			changeSelection(shiftMult);
			var contentt1:String = sys.io.File.getContent('assets/data/creditsColors/' + curSelected + '.txt');
			if(contentt1 == "RED")
			{
				bg.color = FlxColor.RED;
			}
			if(contentt1 == "BROWN")
			{
				bg.color = FlxColor.BROWN;
			}
			if(contentt1 == "WHITE")
			{
				bg.color = FlxColor.WHITE;
			}
			if(contentt1 == "YELLOW")
			{
				bg.color = FlxColor.YELLOW;
			}
			if(contentt1 == "GREEN")
			{
				bg.color = FlxColor.GREEN;
			}
			if(contentt1 == "BLACK")
			{
				bg.color = FlxColor.BLACK;
			}
			if(contentt1 == "CYAN")
			{
				bg.color = FlxColor.CYAN;
			}
			if(contentt1 == "BLUE")
			{
				bg.color = FlxColor.BLUE;
			}
			if(contentt1 == "PINK")
			{
				bg.color = FlxColor.PINK;
			}
			if(contentt1 == "PURPLE")
			{
				bg.color = FlxColor.PURPLE;
			}
			if(contentt1 == "KAWAISPRITECOLOR")
			{
				bg.color = 0xFF757EFF;
			}
		}

		if(controls.ACCEPT)
		{
			var content:String = sys.io.File.getContent('assets/data/' + curSelected + '.txt');
			CoolUtil.browserLoad(content);
		}

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = credits.length - 1;
		if (curSelected >= credits.length)
			curSelected = 0;

		descText.text = credits[curSelected].desc;

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

class CreditsMetadata
{
	public var modderName:String = "";
	public var desc:String = "";

	public function new(name:String, desc:String)
	{
		this.modderName = name;
		this.desc = desc;
	}
}