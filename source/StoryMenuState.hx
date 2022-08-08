package;

import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxSprite;
#if sys
import sys.io.File;
import sys.FileSystem;
#end
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;
import haxe.Json;
import haxe.format.JsonParser;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
using StringTools;

class StoryMenuState extends MusicBeatState
{
	var weeksArray:Array<String> = [];

	var scoreText:FlxText;

	var curDifficulty:Int = 1;

	var weekShm:Array<String> = CoolUtil.coolTextFile(Paths.txt('custom/custom_weeks/weekList'));

	var weekNames:Array<String> = CoolUtil.coolTextFile(Paths.txt('data/weekNames'));

	var txtWeekTitle:FlxText;

	var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;

	var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<MenuItem>;

	var grpLocks:FlxTypedGroup<FlxSprite>;

	var gradientBG:FlxSprite;

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	override function create()
	{

		PlayState.currentSong = "bruh";
		PlayState.inDaPlay = false;
		#if FEATURE_DISCORD
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Story Mode Menu", null);
		#end

		function getJSON(path:String):SwagWeek
			{
				var rawJson:String = null;
				#if sys
				// we use file.getcontent so it reads from the mods folder
				if (FileSystem.exists(path))
					rawJson = File.getContent(path);
				#else
				#if OpenFlAssets
				if (OpenFlAssets.exists(path))
					rawJson = OpenFlAssets.getText(path);
				#end
				#end
				if (rawJson != null && rawJson.length > 0)
					return cast Json.parse(rawJson);
				return null;
			}

		weeksArray = [];
		for (i in 0...weekShm.length)
		{
			weeksArray.push(weekShm[i]);
			var filethingy:String = 'custom/custom_weeks/' + weeksArray[i] + '.json';
			var swagshit:SwagWeek = getJSON(filethingy);
		}

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
			{
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
				Conductor.changeBPM(102);
			}
		}

		persistentUpdate = persistentDraw = true;

		scoreText = new FlxText(10, 10, 0, "SCORE: 49324858", 36);
		scoreText.setFormat("VCR OSD Mono", 32);

		txtWeekTitle = new FlxText(FlxG.width * 0.7, 10, 0, "", 32);
		txtWeekTitle.setFormat("PhantomMuff 1.5", 32, FlxColor.WHITE, RIGHT);
		txtWeekTitle.alpha = 0.7;

		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.size = scoreText.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		var yellowBG:FlxSprite = new FlxSprite(0, 56).makeGraphic(FlxG.width, 400, 0xFFF9CF51);

		grpWeekText = new FlxTypedGroup<MenuItem>();
		add(grpWeekText);

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);


		trace("Line 70");

		for (i in 0...weekShm.length)
		{
			var weekThing:MenuItem = new MenuItem(0, yellowBG.y + yellowBG.height + 10, i);
			weekThing.y += ((weekThing.height + 20) * i);
			weekThing.targetY = i;
			grpWeekText.add(weekThing);

			weekThing.screenCenter(X);
			weekThing.antialiasing = FlxG.save.data.antialiasing;
			// weekThing.updateHitbox();

			// Needs an offset thingie
		}

		trace("Line 96");


		difficultySelectors = new FlxGroup();
		add(difficultySelectors);

		trace("Line 124");

		leftArrow = new FlxSprite(grpWeekText.members[0].x + grpWeekText.members[0].width + 10, grpWeekText.members[0].y + 10);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		leftArrow.antialiasing = FlxG.save.data.antialiasing;
		difficultySelectors.add(leftArrow);

		sprDifficulty = new FlxSprite(leftArrow.x + 130, leftArrow.y);
		sprDifficulty.frames = ui_tex;
		sprDifficulty.animation.addByPrefix('easy', 'EASY');
		sprDifficulty.animation.addByPrefix('normal', 'NORMAL');
		sprDifficulty.animation.addByPrefix('hard', 'HARD');
		sprDifficulty.animation.addByPrefix('insane', 'INSANE');
		sprDifficulty.animation.play('easy');
		sprDifficulty.antialiasing = FlxG.save.data.antialiasing;
		changeDifficulty();

		difficultySelectors.add(sprDifficulty);

		rightArrow = new FlxSprite(sprDifficulty.x + sprDifficulty.width + 50, leftArrow.y);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');
		rightArrow.antialiasing = FlxG.save.data.antialiasing;
		difficultySelectors.add(rightArrow);

		trace("Line 150");

		add(yellowBG);
        var eng = new FlxSprite(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 100);
        eng.loadGraphic("assets/images/Menu_Tracks.png");
        add(eng);
		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 100, 0, "", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = 0xFFe55777;
		add(txtTracklist);
		// add(rankText);
		add(scoreText);
		add(txtWeekTitle);

		#if sys
		if(sys.FileSystem.exists("assets/custom/custom_weeks/weekSettings/" + weeksArray[curWeek] + "/loadChar.txt"))
			{
				remove(grpWeekCharacters);
				grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();
				grpWeekCharacters.add(new MenuCharacter(450, 25, 0.7, true));
				var readCharacters:String = sys.io.File.getContent("assets/custom/custom_weeks/weekSettings/" + weeksArray[curWeek] + "/loadChar.txt");
				grpWeekCharacters.members[0].setCharacter(readCharacters);
				add(grpWeekCharacters);
				//grpWeekCharacters.updateHitbox();
			}
		else{
			remove(grpWeekCharacters);
		}
		#end
		updateText();

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;

				item.alpha = 0.6;
			bullShit++;
		}

		trace("Line 165");

		super.create();
	}

	

	override function update(elapsed:Float)
	{
		// scoreText.setFormat('VCR OSD Mono', 32);
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.5));

		if(MainMenuState.language == "en")
			{
				scoreText.text = "WEEK SCORE:" + lerpScore;
			}
			if(MainMenuState.language == "tr")
				{
					scoreText.text = "HAFTA SKORU:" + lerpScore;
				}
				if(MainMenuState.language == "ru")
					{
						scoreText.text = "ОЦЕНКА НЕДЕЛИ:" + lerpScore;
					}
		

		txtWeekTitle.text = weekNames[curWeek].toUpperCase();
		txtWeekTitle.x = FlxG.width - (txtWeekTitle.width + 10);

		// FlxG.watch.addQuick('font', scoreText.font);

		difficultySelectors.visible = true;

		grpLocks.forEach(function(lock:FlxSprite)
		{
			lock.y = grpWeekText.members[lock.ID].y;
		});

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

				if (gamepad != null)
				{
					if (gamepad.justPressed.DPAD_UP)
					{
						changeWeek(-1);
					}
					if (gamepad.justPressed.DPAD_DOWN)
					{
						changeWeek(1);
					}

					if (gamepad.pressed.DPAD_RIGHT)
						rightArrow.animation.play('press')
					else
						rightArrow.animation.play('idle');
					if (gamepad.pressed.DPAD_LEFT)
						leftArrow.animation.play('press');
					else
						leftArrow.animation.play('idle');

					if (gamepad.justPressed.DPAD_RIGHT)
					{
						changeDifficulty(1);
					}
					if (gamepad.justPressed.DPAD_LEFT)
					{
						changeDifficulty(-1);
					}
				}

				if (FlxG.keys.justPressed.UP)
				{
					changeWeek(-1);
				}

				if (FlxG.keys.justPressed.DOWN)
				{
					changeWeek(1);
				}

				if (FlxG.keys.justPressed.SEVEN)
				{
					FlxG.switchState(new engineEditors.WeekEditor());
				}

				
				if (FlxG.keys.justPressed.E)
				{
					FlxG.switchState(new engineEditors.WeekEditor());
				}

				if (controls.RIGHT)
					rightArrow.animation.play('press')
				else
					rightArrow.animation.play('idle');

				if (controls.LEFT)
					leftArrow.animation.play('press');
				else
					leftArrow.animation.play('idle');

				if (controls.RIGHT_P)
					changeDifficulty(1);
				if (controls.LEFT_P)
					changeDifficulty(-1);
			}

			if (controls.ACCEPT)
			{
				selectWeek();
			}
		}

		if (controls.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new MainMenuState());
		}

		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;


	function selectWeek()
	{
			if (stopspamming == false)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				grpWeekText.members[curWeek].startFlashing();
				stopspamming = true;
			}

			PlayState.storyPlaylist = loadFromWeekJson(weeksArray[curWeek]).songs;
			PlayState.isStoryMode = true;
			selectedWeek = true;
			PlayState.songMultiplier = 1;

			PlayState.isSM = false;

			PlayState.storyDifficulty = curDifficulty;

			var diff:String = ["-easy", "", "-hard", "-insane"][PlayState.storyDifficulty];
			PlayState.sicks = 0;
			PlayState.bads = 0;
			PlayState.shits = 0;
			PlayState.goods = 0;
			PlayState.campaignMisses = 0;
			PlayState.SONG = Song.conversionChecks(Song.loadFromJson(PlayState.storyPlaylist[0], diff));
			PlayState.storyWeek = curWeek;
			PlayState.campaignScore = 0;
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
						LoadingState.loadAndSwitchState(new PlayState(), true);		
			});
		
	}

	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 3;
		if (curDifficulty > 3)
			curDifficulty = 0;

		sprDifficulty.offset.x = 0;

		switch (curDifficulty)
		{
			case 0:
				sprDifficulty.animation.play('easy');
				sprDifficulty.offset.x = 20;
			case 1:
				sprDifficulty.animation.play('normal');
				sprDifficulty.offset.x = 70;
			case 2:
				sprDifficulty.animation.play('hard');
				sprDifficulty.offset.x = 20;
			case 3:
				sprDifficulty.animation.play('insane');
				sprDifficulty.offset.x = 70;
		}

		sprDifficulty.alpha = 0;

		// USING THESE WEIRD VALUES SO THAT IT DOESNT FLOAT UP
		sprDifficulty.y = leftArrow.y - 15;
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end

		FlxTween.tween(sprDifficulty, {y: leftArrow.y + 15, alpha: 1}, 0.07);
	}

	
	function loadFromWeekJson(jsonInput:String):SwagWeek
		{
			var rawJson = null;

	
			if (rawJson == null)
			{
				// why the fuck did i do this lmao
				#if sys
				rawJson = File.getContent(Paths.RealityJson('custom/custom_weeks/' + jsonInput)).trim();
				#else
				#if OpenFlAssets
				rawJson = Assets.getText(Paths.RealityJson('custom/custom_weeks/' + jsonInput)).trim();
				#end
				#end
			}
	
			#if desktop
			while (!rawJson.endsWith("}"))
			{
				rawJson = rawJson.substr(0, rawJson.length - 1);
				// LOL GOING THROUGH THE BULLSHIT TO CLEAN IDK WHATS STRANGE
			}
			#end
	
			var swagShit:SwagWeek = cast Json.parse(rawJson);
			return swagShit;
		}

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{
		curWeek += change;

		if (curWeek >= weeksArray.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = weeksArray.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			if (item.targetY == Std.int(0))
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}
		#if sys
		if(sys.FileSystem.exists("assets/custom/custom_weeks/weekSettings/" + weeksArray[curWeek] + "/loadChar.txt"))
			{
				remove(grpWeekCharacters);
				grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();
				grpWeekCharacters.add(new MenuCharacter(450, 25, 0.7, true));
				var readCharacters:String = sys.io.File.getContent("assets/custom/custom_weeks/weekSettings/" + weeksArray[curWeek] + "/loadChar.txt");
				grpWeekCharacters.members[0].setCharacter(readCharacters);
				add(grpWeekCharacters);
				//grpWeekCharacters.updateHitbox();
			}
		else{
			remove(grpWeekCharacters);
		}
		#end

		FlxG.sound.play(Paths.sound('scrollMenu'));

		updateText();
	}

	function updateText()
	{
		txtTracklist.text = "\n";
		var stringThing:Array<Dynamic> = loadFromWeekJson(weeksArray[curWeek]).songs;

		for (i in stringThing)
			txtTracklist.text += "\n" + i;

		txtTracklist.text = txtTracklist.text.toUpperCase();

		txtTracklist.screenCenter(X);
		txtTracklist.x -= FlxG.width * 0.35;

		txtTracklist.text += "\n";

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end
	}

	override function beatHit()
		{
			super.beatHit();
	
			if (curBeat % 2 == 0)
			{
				grpWeekCharacters.members[0].bopHead();
			}
		}

}

typedef SwagWeek =
{
	var songs:Array<Dynamic>;
}


class Week
{
	public var songs:Array<Dynamic>;

	public function new(swagWeek:SwagWeek)
	{
		songs = swagWeek.songs;
	}

	public static function createWeek():SwagWeek
	{
		var week:SwagWeek = {
			songs: ["Bopeebo", "Fresh", "Dad Battle"]
		};
		return week;
	}
}