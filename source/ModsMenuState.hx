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
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end
import flash.geom.Rectangle;

using StringTools;

class ModsMenuState extends MusicBeatState
{
	var mods:Array<ModsMetadata> = [];
	var button:FlxButton;

	static var curSelected:Int = 0;

	var cornerSize:Int = 11;

	private var grpMods:FlxTypedGroup<Alphabet>;
    public var modIcon:FlxSprite;
	var descText:FlxText;
	var selector:AttachedSprite;
	var bg:FlxSprite;
	var colorTween:FlxTween;
    var modSelectedName:String;
	var ending:Bool = false;
	var modText:Alphabet;
	var hmmended:Bool;
	override function create()
	{
		

		var initCreditlist = CoolUtil.coolTextFile(Paths.txt('modList'));
        
		initCreditlist = CoolUtil.coolTextFile(Paths.txt('modList'));

		for (i in 0...initCreditlist.length)
		{
			var data:Array<String> = initCreditlist[i].split(':');
			mods.push(new ModsMetadata(data[0], data[1]));
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

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("muff.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.text = 'what';
		descText.borderSize = 2.4;
		add(descText);
        
		modIcon = new FlxSprite(870, 180).loadGraphic('mods/' + mods[curSelected].modName + '/icon.png');
		modIcon.setGraphicSize(Std.int(modIcon.width * 0.8));
		add(modIcon);

		grpMods = new FlxTypedGroup<Alphabet>();
		add(grpMods);

		for (i in 0...mods.length)
		{
		    modText = new Alphabet(0, (70 * i) + 30, mods[i].modName, true, false);
			modText.isMenuItem = true;
			modText.targetY = i;
			grpMods.add(modText);

			// creditText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// creditText.screenCenter(X);
		}

		changeSelection();
		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);

		var descText:FlxText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("muff.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		//button = new FlxButton(150, 20, "Create Mod", createMod);
        //add(button);

		remove(modText);
		modSelectedName = mods[curSelected].modName;
		selectMod(modSelectedName);
		
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var rightP = controls.RIGHT_P;
		var leftP = controls.LEFT_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;

		var shiftMult:Int = 1;
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if(!hmmended)
			{
				if (upP)
					{
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
						changeSelection(-shiftMult);
						remove(modText);
						modSelectedName = mods[curSelected].modName;
						selectMod(modSelectedName);
						FlxG.camera.flash(FlxColor.BLACK, 0.5);
					}
					if (downP)
					{
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
						changeSelection(shiftMult);
						remove(modText);
						modSelectedName = mods[curSelected].modName;
						selectMod(modSelectedName);
						FlxG.camera.flash(FlxColor.BLACK, 0.5);
					}
					if (rightP)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
							changeSelection(shiftMult);
							remove(modText);
							modSelectedName = mods[curSelected].modName;
							selectMod(modSelectedName);
							FlxG.camera.flash(FlxColor.BLACK, 0.5);
						}
						if (leftP)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
								changeSelection(shiftMult);
								remove(modText);
								modSelectedName = mods[curSelected].modName;
								selectMod(modSelectedName);
								FlxG.camera.flash(FlxColor.BLACK, 0.5);
							}
			
		if (controls.BACK)
					FlxG.switchState(new MainMenuState());
		if(controls.ACCEPT)
			{

			}
			}
			else{
				if(controls.BACK)
					{
						FlxG.switchState(new ModsMenuState());
					}
			}

	}

	function createMod():Void
	{
		hmmended = true;
		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuBGBlue'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var bgHM:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('no/menuBGMods'));
		bgHM.scrollFactor.x = 0;
		bgHM.scrollFactor.y = 0.10;
		bgHM.setGraphicSize(Std.int(bgHM.width * 1.1));
		bgHM.updateHitbox();
		bgHM.screenCenter();
		bgHM.antialiasing = FlxG.save.data.antialiasing;
		add(bgHM);

		var eventNameEE:FlxUIInputText = new FlxUIInputText(350, 235, 80, "");
		add(eventNameEE);

		var close:FlxButton = new FlxButton(1150, 20, "X", function(){
			FlxG.switchState(new ModsMenuState());
		});
		close.color = FlxColor.RED;
        add(close);

		

	}
	function changeSelection(change:Int = 0)
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = mods.length - 1;
		if (curSelected >= mods.length)
			curSelected = 0;

		descText.text = mods[curSelected].desc;

		// selector.y = (70 * curSelected) + 30;
		var bullShit:Int = 0;

		for (item in grpMods.members)
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

	function selectMod(modName:String):Void
		{
			//FlxG.camera.flash(FlxColor.WHITE, 1);
			var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat'));
			bg.scrollFactor.x = 0;
			bg.scrollFactor.y = 0.10;
			bg.setGraphicSize(Std.int(bg.width * 1.1));
			bg.updateHitbox();
			bg.screenCenter();
			bg.antialiasing = FlxG.save.data.antialiasing;
			bg.color = FlxColor.fromString(sys.io.File.getContent('mods/' + mods[curSelected].modName + '/color.txt'));
			add(bg);
			ending = true;
			var modText2:Alphabet = new Alphabet(0, (70 * 1) + -130, mods[curSelected].modName, true, false);
			modText2.isMenuItem = false;
			modText2.y += 290;
			modText2.x +=300;
			selector = new AttachedSprite();
			selector.xAdd = -205;
			selector.yAdd = -68;
			selector.alphaMult = 0.5;
			makeSelectorGraphic();
			selector.sprTracker = modText2;
			add(selector);
			add(modText2);

			modIcon = new FlxSprite(52, 125).loadGraphic('mods/' + mods[curSelected].modName + '/icon.png');
			modIcon.setGraphicSize(Std.int(modIcon.width * 0.4));
			add(modIcon);
			button = new FlxButton(150, 20, "Create Mod", createMod);
			//add(button);
			
		}

		// by psych engine
		function makeSelectorGraphic()
			{
				selector.makeGraphic(1100, 450, FlxColor.BLACK);
				selector.pixels.fillRect(new Rectangle(0, 190, selector.width, 5), 0x0);
				selector.alpha = 0.6;
		
				// Why did i do this? Because i'm a lmao stupid, of course
				// also i wanted to understand better how fillRect works so i did this shit lol???
				selector.pixels.fillRect(new Rectangle(0, 0, cornerSize, cornerSize), 0x0);														 //top left
				drawCircleCornerOnSelector(false, false);
				selector.pixels.fillRect(new Rectangle(selector.width - cornerSize, 0, cornerSize, cornerSize), 0x0);							 //top right
				drawCircleCornerOnSelector(true, false);
				selector.pixels.fillRect(new Rectangle(0, selector.height - cornerSize, cornerSize, cornerSize), 0x0);							 //bottom left
				drawCircleCornerOnSelector(false, true);
				selector.pixels.fillRect(new Rectangle(selector.width - cornerSize, selector.height - cornerSize, cornerSize, cornerSize), 0x0); //bottom right
				drawCircleCornerOnSelector(true, true);
			}

			// by psych engine
			function drawCircleCornerOnSelector(flipX:Bool, flipY:Bool)
				{
					var antiX:Float = (selector.width - cornerSize);
					var antiY:Float = flipY ? (selector.height - 1) : 0;
					if(flipY) antiY -= 2;
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 1), Std.int(Math.abs(antiY - 8)), 10, 3), FlxColor.BLACK);
					if(flipY) antiY += 1;
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 2), Std.int(Math.abs(antiY - 6)),  9, 2), FlxColor.BLACK);
					if(flipY) antiY += 1;
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 3), Std.int(Math.abs(antiY - 5)),  8, 1), FlxColor.BLACK);
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 4), Std.int(Math.abs(antiY - 4)),  7, 1), FlxColor.BLACK);
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 5), Std.int(Math.abs(antiY - 3)),  6, 1), FlxColor.BLACK);
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 6), Std.int(Math.abs(antiY - 2)),  5, 1), FlxColor.BLACK);
					selector.pixels.fillRect(new Rectangle((flipX ? antiX : 8), Std.int(Math.abs(antiY - 1)),  3, 1), FlxColor.BLACK);
				}
}

class ModsMetadata
{
	public var modName:String = "";
	public var desc:String = "";

	public function new(name:String, desc:String)
	{
		this.modName = name;
		this.desc = desc;
	}
}