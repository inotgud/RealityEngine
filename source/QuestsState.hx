package;

import hscript.Expr;
import hscript.Parser;
import hscript.Interp;
import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import miniGames.MiniGamesState;
#if sys
import sys.io.Process;
import sys.io.Process;
#end
import flixel.FlxSubState;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
#if FEATURE_FILESYSTEM
import sys.io.File;
import Sys;
import sys.FileSystem;
#end
import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import realityEngine.EngineMain;
import FreeplayState;

import flixel.util.FlxSave;
using StringTools;

class QuestsState extends MusicBeatState
{
	var accepteds = false;
	private var grpQuests:FlxTypedGroup<Alphabet>;
	var quests:Array<String>;
	var isAvailable = true;
    var curSelected:Int = 0;
	override function create()
		{
			var httpC = new haxe.Http("https://google.com");

        httpC.onError = function(status) {
            isAvailable = false;
        };

        httpC.request();

			realityEngine.EngineMain.discordClient('Quests');
			var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat2'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		if(isAvailable == true)
			{
				bg.color = FlxColor.CYAN;
			}
		else{
			bg.color = FlxColor.fromRGB(0, 171, 171);
		}
		add(bg);

		if(isAvailable == true)
			{
				var	modText:Alphabet = new Alphabet(40, 40, "QUESTS", true, false);
				modText.isMenuItem = false;
				add(modText);
			}
		else{
			var	modText:Alphabet = new Alphabet(40, 40, "QUESTS", true, false);
			modText.isMenuItem = false;
			add(modText);
			var	modTexts:Alphabet = new Alphabet(643, 40, "no connection", true, false);
			modTexts.isMenuItem = false;
			modTexts.color = FlxColor.RED;
			add(modTexts);
		}


		
	


		var http = new haxe.Http("https://raw.githubusercontent.com/Goodbs/RealityEngineOnlineData/main/quests.txt");

		http.onData = function(data:String)
		{
			//sys.io.File.saveContent("assets/data/quests.txt", data.split('\n')[0].trim());
			var text = data.split('\n')[0].trim();
			//quests = CoolUtil.coolTextFile(Paths.txt('data/quests.txt'));
					
		grpQuests = new FlxTypedGroup<Alphabet>();
		add(grpQuests);
        var hmm = new Process("curl", ["https://raw.githubusercontent.com/Goodbs/RealityEngineOnlineData/main/quests.txt"]).stdout.readAll().toString();
		quests =  hmm.substr(1,hmm.length-2).split(",").map(Std.string);
        for (i in 0...quests.length)
            {
				var iconArray:Array<AttachedSprite> = [];
                var optionText:Alphabet = new Alphabet(0, (70 * i), quests[i], true, false);
                optionText.isMenuItem = true;
                optionText.screenCenter();
                optionText.targetY = i;
                optionText.y += (100 * (i - (quests.length / 2))) + 50;
                grpQuests.add(optionText);

				var icon:AttachedSprite = new AttachedSprite('defaultQuests/' + quests[i]);
			icon.sprTracker = optionText;

			iconArray.push(icon);
			add(icon);
            }
		}

		

		http.request();

		changeSelection();

		super.create();
		}
		var hmmssxcc:String = "";
		function changeSelection(huh:Int = 0) {
            curSelected += huh;
            if (curSelected < 0)
                curSelected = quests.length - 1;
            if (curSelected >= quests.length)
                curSelected = 0;
    
            var bullShit:Int = 0;
            for (item in grpQuests.members)
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
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
	override function update(elapsed:Float)
		{
			if(accepteds != true)
				{
					if(FlxG.keys.justPressed.ESCAPE)
						{
							FlxG.switchState(new MainMenuState());
						}
				}
				else{
					if(FlxG.keys.justPressed.ESCAPE)
						{
							FlxG.switchState(new QuestsState());
						}
				}
			if(isAvailable == true)
				{
		
	
			if(FlxG.keys.justPressed.UP)
                {
					FlxG.sound.play(Paths.sound('scrollMenu'));
                  changeSelection(-1);
                }
            if(FlxG.keys.justPressed.DOWN)
                {
					FlxG.sound.play(Paths.sound('scrollMenu'));
                   changeSelection(1);
                }
    		if (FlxG.mouse.wheel != 0)
			    {
				    FlxG.sound.play(Paths.sound('scrollMenu'));
				    changeSelection(-FlxG.mouse.wheel);
			     }
            if(controls.ACCEPT)
                {
					accepteds = true;
					var bgs:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
					bgs.alpha = 0.6;
					bgs.scrollFactor.set();
					add(bgs);

					var bg2:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('im'));
					bg2.scrollFactor.x = 0;
					bg2.scrollFactor.y = 0.10;
					bg2.setGraphicSize(Std.int(bg2.width * 1.1));
					bg2.updateHitbox();
					bg2.screenCenter();
					bg2.antialiasing = FlxG.save.data.antialiasing;
					add(bg2);

					var hmmST:String = "";
					var	modText:Alphabet = new Alphabet(360, 128, quests[curSelected] ,true, false);
					modText.isMenuItem = false;
					add(modText);
					var httpss = new haxe.Http("https://raw.githubusercontent.com/Goodbs/RealityEngineOnlineData/main/questDesc/" + quests[curSelected] + ".txt");

		            httpss.onData = function(data:String)
		            {
						var text = data.split('\n')[0].trim();
						var text2;
						var httpssssss = new haxe.Http("https://raw.githubusercontent.com/Goodbs/RealityEngineOnlineData/main/questData/" + curSelected + ".txt");

						var coolutilread:String = "";
						if(FileSystem.exists("assets/data/questsData/" + quests[curSelected] + ".txt"))
							{
								coolutilread =sys.io.File.getContent('assets/data/questsData/' + quests[curSelected] + ".txt");
							}
						else{
							coolutilread = "Not";
						}
						 
					var _gameSave = new FlxSave();
					var mod:FlxText = new FlxText(210, FlxG.height - 470, 0,  text + " - Done? " + coolutilread, -180);
					mod.scrollFactor.set();
					mod.setFormat("PhantomMuff1.5RealityEngine", 36, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
					add(mod);
		            }

					httpss.request();

                }
		}
		super.update(elapsed);
	}
}
