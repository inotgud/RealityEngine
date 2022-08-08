package engineEditors;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import openfl.desktop.ClipboardTransferMode;
import openfl.desktop.ClipboardFormats;
import openfl.desktop.Clipboard;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUITabMenu;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import StoryMenuState;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end

using StringTools;

class WeekEditor extends MusicBeatState
{
	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var txt:FlxText;
	var txtTracklist:FlxText;
	var txtTracklist2:FlxText;
	var txtTracklist3:FlxText;

	//INPUT TEXTS
	var eventName:FlxUIInputText;
	var eventName2:FlxUIInputText;
	var eventName3:FlxUIInputText;
	var eventName4:FlxUIInputText;
	var eventName5:FlxUIInputText;

	//BUTTONS
	var createButton:FlxButton;
	var testButton:FlxButton;

	var song1:String;
	var song2:String;
	var song3:String;
	var name4:String;


	var content:String;

	//OTHERS
	var UI_box:FlxUITabMenu;
	var UI_options:FlxUITabMenu;
	var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;
	var scoreText:FlxText;
	override function create()
		{
			#if sys
			content = sys.io.File.getContent('assets/custom/custom_weeks/weekList.txt');
			#end
			#if FEATURE_DISCORD
            DiscordClient.changePresence("Week Editor", null);
            #end

			var yellowBG:FlxSprite = new FlxSprite(0, 56).makeGraphic(FlxG.width, 400, 0xFFF9CF51);
			add(yellowBG);			
			
			var tabs = [
				{name: "Settings", label: 'Settings'},
				{name: "Week", label: 'Week'}
			];

			UI_box = new FlxUITabMenu(null, tabs, true);
		    UI_box.scrollFactor.set();
		    UI_box.resize(400, 300);
		    UI_box.x = FlxG.width / 2 + 40;
		    UI_box.y = 20;
		    super.create();

			var close:FlxButton = new FlxButton(1150, 20, "X", function(){
				FlxG.switchState(new MainMenuState());
			});
			close.color = FlxColor.RED;
			add(close);

		    eventName = new FlxUIInputText(9, 30, 80, "song1");
			eventName2 = new FlxUIInputText(109, 30, 80, "song2");
			eventName3 = new FlxUIInputText(209, 30, 80, "song3");

			//EVENTNAME 4????????????
			eventName5 = new FlxUIInputText(9, 70, 80, "week_name");


			createButton = new FlxButton(159, 70, "Create Week", createWeek);


			var hmm:FlxButton = new FlxButton(650, 20, "Set Song 1", function(){
				song1 = eventName.text;
			});
			var hmm2:FlxButton = new FlxButton(750, 20, "Set Song 2", function(){
				song2 = eventName2.text;
			});
			var hmm3:FlxButton = new FlxButton(850, 20, "Set Song 3", function(){
				song3 = eventName3.text;
			});

			var hmm4:FlxButton = new FlxButton(950, 20, "Set Week Name", function(){
				name4 = eventName5.text;
			});

			var tabs = [
				{name: "Week", label: 'Week'}
			];

		UI_box = new FlxUITabMenu(null, tabs, true);
		UI_box.scrollFactor.set();
		UI_box.resize(300, 400);
		UI_box.x = FlxG.width / 2 + 40;
		UI_box.y = 20;
		add(UI_box);
		UI_box.x += 250;

		UI_box.add(eventName);
		UI_box.add(createButton);
		UI_box.add(eventName5);
		UI_box.add(eventName3);
		UI_box.add(eventName2);
			
		var eng = new FlxSprite(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 100);
        eng.loadGraphic("assets/images/Menu_Tracks.png");
        add(eng);
		
		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.screenCenter(X);

		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 100, 0, "", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = 0xFFe55777;
		add(txtTracklist);

		txtTracklist2 = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 120, 0, "", 32);
		txtTracklist2.alignment = CENTER;
		txtTracklist2.font = rankText.font;
		txtTracklist2.color = 0xFFe55777;
		add(txtTracklist2);
		
		txtTracklist3 = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height + 120, 0, "", 32);
		txtTracklist3.alignment = CENTER;
		txtTracklist3.font = rankText.font;
		txtTracklist3.color = 0xFFe55777;
		add(txtTracklist3);

		remove(grpWeekCharacters);
		grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();
		grpWeekCharacters.add(new MenuCharacter(450, 25, 0.7, true));
		grpWeekCharacters.members[0].setCharacter("tankman");
		add(grpWeekCharacters);

		scoreText = new FlxText(10, 10, 0, "WEEK SCORE: 49324858", 36);
		scoreText.setFormat("VCR OSD Mono", 32);
		add(scoreText);

		}

		function testThisWeek()
			{
				txtTracklist.text = eventName.text;
				txtTracklist2.text = eventName2.text;
				txtTracklist3.text = eventName3.text;
			}
		function eventHandlerChange()
			{
				txtTracklist.text = eventName.text;
			}
		function eventHandlerChange2()
			{
				txtTracklist2.text = eventName2.text;
			}
		function eventHandlerChange3()
			{
				txtTracklist3.text = eventName3.text;
			}
		function createWeek()
			{
				#if sys
				var abc:String = sys.io.File.getContent('assets/images/no/examp.txt');
			var abcd:String = sys.io.File.getContent('assets/images/no/novar/a.txt');
			var ehmmm:String = sys.io.File.getContent('assets/images/no/novar/b.txt');
				txt = new FlxText(0, 0, FlxG.width,
					abc
					+ abcd + eventName.text + abcd + ","
	
					+ abcd + eventName2.text + abcd + ","
	
					+ abcd + eventName3.text + abcd
					+ ehmmm,
					32);

				sys.io.File.saveContent("assets/custom/custom_weeks/" + eventName5.text + ".json", txt.text);
				sys.FileSystem.deleteFile("assets/custom/custom_weeks/weekList.txt");
				sys.io.File.saveContent("assets/custom/custom_weeks/weekList.txt", content + "\n" + eventName5.text);
				#else
				Debug.displayAlert("Failed!", "Use FNF Reality Engine to pc");
				#end
			}
    override function update(elapsed:Float)
		{
			if(FlxG.keys.justPressed.ESCAPE)
				{
					FlxG.switchState(new MainMenuState());
				}
			super.update(elapsed);
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
