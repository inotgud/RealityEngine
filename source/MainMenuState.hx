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


using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var language:String;
	public static var hmmmmmmmmmmmmmmmm:String;
	public static var Editorsnull:Bool = false;
	public static var redesignedmenustyle = false;

	var curSelected:Int = 0;
	var updateAvailable:Bool = false;
	var bg2:FlxSprite;
	var its:Bool = true;
	var char1:Character;
	var textt:FlxText;
	var textt2:FlxText;
	var textt3:FlxText;
	var textt4:FlxText;
	var button:FlxButton;
	var button2:FlxButton;
	public static var Editorsmainyes:Bool = false;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = CoolUtil.coolTextFile(Paths.txt('data/MainMenuItems')); 

	#else
	var optionShit:Array<String> = 
	[
		'story_mode', 
		'freeplay'
	];
	#end


	var newGaming:FlxText;
	var newGaming2:FlxText;

	public static var firstStart:Bool = true;

	public static var interp:Interp;

	public static var nightly:String = "";

	public static var RealityEngineVer:String = "1.0.0" + nightly;
	public static var gameVer:String = "0.2.8";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;

	public static var finishedFunnyMove:Bool = false;

	override function create()
	{
		#if sys
		hmmmmmmmmmmmmmmmm = sys.io.File.getContent('assets/data/language.txt');
		language = hmmmmmmmmmmmmmmmm;
		#else
		hmmmmmmmmmmmmmmmm = "en";
		language = hmmmmmmmmmmmmmmmm;
		#end
		
		if(FlxG.save.data.redesignedmenustyle == "On")
			{
				MainMenuState.redesignedmenustyle = true;
			}
		else{
			MainMenuState.redesignedmenustyle = false;
		}
		
		clean();
		PlayState.inDaPlay = false;
		realityEngine.EngineMain.discordClient('In the Menus');

		if(FlxG.save.data.menuMusic == null)
			{
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
			}
		else{
			if (!FlxG.sound.music.playing)
				{
					FlxG.sound.playMusic(Paths.music(FlxG.save.data.menuMusic));
				}
		}


		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		
  //hmm
		
		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		if(FlxG.save.data.coloredmenubg == "On")
			{
				bg.color = FlxG.random.color();
			}
		else{
			bg.loadGraphic(Paths.loadImage('menuBG'));
			if(FlxG.save.data.mode == "dark")
				{
					bg.loadGraphic(Paths.loadImage('menuDesat'));
					bg.color = 0x242424;
				}
		}
		add(bg);

		if(redesignedmenustyle == true)
			{
				var redesignedbg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('no/ohno'));
		        redesignedbg.scrollFactor.x = 0;
		        redesignedbg.scrollFactor.y = 0.10;
		        redesignedbg.setGraphicSize(Std.int(redesignedbg.width * 1.1));
		        redesignedbg.updateHitbox();
		        redesignedbg.screenCenter();
		        redesignedbg.antialiasing = FlxG.save.data.antialiasing;
				add(redesignedbg);
			}

		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollowPos);


		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		
		

		magenta = new FlxSprite(-80).loadGraphic(Paths.loadImage('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = FlxG.save.data.antialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		if(FlxG.save.data.readmehm == "Off")
			{
				Editorsnull = true;
			}
	  FlxG.mouse.visible = true;

		var expr = sys.io.File.getContent("assets/custom/custom_states/MainMenuState.hx");
        //HScript
						var parser = new hscript.Parser();
						interp = new Interp();
						var ast = parser.parseString(expr);
						interp.variables.set("add", add);
                        interp.variables.set("remove", remove);
						#if FEATURE_DISCORD
                        interp.variables.set("DiscordClient", DiscordClient);
						#end
                        interp.variables.set("FlxG", flixel.FlxG);
                        interp.variables.set("CustomState", CustomState);
                        interp.variables.set("MenuItem", MenuItem);
                        interp.variables.set("Character", Character);
                        interp.variables.set("FlxGame", flixel.FlxGame);
						interp.variables.set("FlxObject", flixel.FlxObject);
						interp.variables.set("FlxSprite", flixel.FlxSprite);
						interp.variables.set("FlxState", flixel.FlxState);
						interp.variables.set("FlxSubState", flixel.FlxSubState);
						interp.variables.set("FlxGridOverlay", flixel.addons.display.FlxGridOverlay);
						interp.variables.set("FlxTrail", flixel.addons.effects.FlxTrail);
						interp.variables.set("FlxTrailArea", flixel.addons.effects.FlxTrailArea);
						interp.variables.set("FlxEffectSprite", flixel.addons.effects.chainable.FlxEffectSprite);
						interp.variables.set("FlxWaveEffect", flixel.addons.effects.chainable.FlxWaveEffect);
						interp.variables.set("FlxTransitionableState", flixel.addons.transition.FlxTransitionableState);
						interp.variables.set("FlxAtlas", flixel.graphics.atlas.FlxAtlas);
						interp.variables.set("FlxAtlasFrames", flixel.graphics.frames.FlxAtlasFrames);
                        interp.variables.set("FlxMath", flixel.math.FlxMath);
						interp.variables.set("FlxPoint", flixel.math.FlxPoint);
						interp.variables.set("FlxRect", flixel.math.FlxRect);
						interp.variables.set("MusicBeatState", MusicBeatState);
						interp.variables.set("FlxSound", flixel.system.FlxSound);
						interp.variables.set("FlxText", flixel.text.FlxText);
						interp.variables.set("FlxEase", flixel.tweens.FlxEase);
						interp.variables.set("FlxTween", flixel.tweens.FlxTween);
						interp.variables.set("update", function(elapsed:Float)
						{
						});
						interp.variables.set("create", function()
						{
						});

                        

		var scale:Float = 1;

		for (i in 0...optionShit.length)
			{
				var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.x += 250;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.x += -100;
			//menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = true;
			interp.variables.set("items", menuItem);
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
				
			}
			FlxG.camera.follow(camFollowPos, null, 1);

		firstStart = false;

		FlxG.camera.follow(camFollowPos, null, 0.60 * (60 / FlxG.save.data.fpsCap));
		
		var hmain:Int = 0;
		var jsonData = Paths.loadCustomGameJson("custom_game");
		var data:TitleState.CustomGameJson = cast jsonData;
		var h11 = data.mainMenuFont;
		var h10 = data.modversionandtext;
		var versionShit:FlxText = new FlxText(5, FlxG.height - 49, 0, h10, 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

		
        if(language == "en")
			{
				
				
				var versionShit:FlxText = new FlxText(5, FlxG.height - 33, 0, "Reality Engine v" + RealityEngineVer, 12);
                versionShit.scrollFactor.set();
                versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				if(sys.FileSystem.exists('assets/scripts/mainMenu/versionShit.json'))
					{
						var readingVershit:String = sys.io.File.getContent('assets/scripts/mainMenu/versionShit.json');
						if(readingVershit == "add(FlxText);")
							{
								add(versionShit);
							}
						
					}
                

				var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Press E to Editor/Mods - FNF v" + gameVer + "", 12);
				versionShit.scrollFactor.set();
				versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				if(sys.FileSystem.exists('assets/scripts/mainMenu/versionShitTwo.json'))
					{
						var readingVershit:String = sys.io.File.getContent('assets/scripts/mainMenu/versionShitTwo.json');
						if(readingVershit == "add(FlxText);")
							{
								add(versionShit);
							}
						
					}
			}
	
		if(language == "tr")
			{
				var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Reality Engine Surumu" + RealityEngineVer, 12);
                versionShit.scrollFactor.set();
                versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                add(versionShit);

				var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "E ye basarak editorlere ve ya modlara gir - FNF Surumu : " + gameVer + " F e basarak Funkin Mediaya gir", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		if(sys.FileSystem.exists('assets/scripts/mainMenu/versionShit.json'))
			{
				var readingVershit:String = sys.io.File.getContent('assets/scripts/mainMenu/versionShit.json');
				if(readingVershit == "add(FlxText);")
					{
						add(versionShit);
					}
				
			}
		}

		if(language == "ru")
			{	
				var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Reality Engine v" + RealityEngineVer, 12);
                versionShit.scrollFactor.set();
                versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                add(versionShit);

				var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Press E to Editor/Mods - FNF v" + gameVer, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		if(sys.FileSystem.exists('assets/scripts/mainMenu/versionShitTwo.json'))
			{
				var readingVershit:String = sys.io.File.getContent('assets/scripts/mainMenu/versionShitTwo.json');
				if(readingVershit == "add(FlxText);")
					{
						add(versionShit);
					}
				
			}}
		

		

		selec.scrollFactor.set();
		selec.setFormat(h11, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(selec);

		selec.text = optionShit[curSelected] + "";

		

		// NG.core.calls.event.logEvent('swag').send();

		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		interp.execute(ast);
        trace( interp.execute(program) ); 
        callOnHscript("create");

		super.create();
	}

	function OnClickButton():Void
	{
		textt.visible = false;
		textt2.visible = false;
		textt3.visible = false;
		textt4.visible = false;
		bg2.visible = false;
		button.visible = false;
		FlxG.mouse.visible = false;
		Editorsnull = true;
	}

	var selectedSomethin:Bool = false;
    var selec:FlxText = new FlxText(1180, FlxG.height - 20, 0, "" + "", 12);
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 5.6, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));
		
		if(redesignedmenustyle == true)
			{
				if(optionShit[curSelected] == 'story_mode')
					{
						remove(char1);
						char1 = new Character(870, 180, 'bf', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'freeplay')
					{
						remove(char1);
						char1 = new Character(870, 70, 'monster', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'credits')
					{
						remove(char1);
						char1 = new Character(870, 180, 'pico', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'minigames')
					{
						remove(char1);
						char1 = new Character(870, 180, 'gf', false);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'donate')
					{
						remove(char1);
						char1 = new Character(870, 180, 'spirit', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'options')
					{
						remove(char1);
						char1 = new Character(870, 180, 'bf-pixel', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				if(optionShit[curSelected] == 'mods')
					{
						remove(char1);
						char1 = new Character(870, 70, 'monster-christmas', true);
						char1.scrollFactor.set();
						char1.setGraphicSize(Std.int(char1.width * 0.8));
						add(char1);
						char1.dance();
					}
				
			}
		

		if (!selectedSomethin)
		{
			var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
			if(Editorsmainyes == false)
				{
					if (gamepad != null)
						{
							if (gamepad.justPressed.DPAD_UP)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(-1);
								selec.text = optionShit[curSelected] + "";
							}
							if (gamepad.justPressed.DPAD_DOWN)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(1);
								selec.text = optionShit[curSelected] + "";
							}
						}
			
						if (FlxG.keys.justPressed.UP)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'));
							changeItem(-1);
							selec.text = optionShit[curSelected] + "";
						}

						if (FlxG.keys.justPressed.W)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(-1);
								selec.text = optionShit[curSelected] + "";
							}
						if (FlxG.keys.justPressed.E)
						{
							openSubState(new EditorsMain());
							Editorsmainyes = true;
						}
			
						if (FlxG.keys.justPressed.DOWN)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'));
							changeItem(1);
							selec.text = optionShit[curSelected] + "";
						}

						if (FlxG.keys.justPressed.S)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(1);
								selec.text = optionShit[curSelected] + "";
							}
			
						if (controls.BACK)
						{
							if(sys.FileSystem.exists('assets/scripts/mainMenu/Events/back.json'))
								{
							var readSwitch:String = sys.io.File.getContent('assets/scripts/mainMenu/Events/back.json');
							if(readSwitch == "switch TitleState")
								{
									FlxG.switchState(new TitleState());
								}
							if(readSwitch == "switch MainMenuState")
								{
									FlxG.switchState(new MainMenuState());
								}
							if(readSwitch == "switch FreeplayState")
								{
									FlxG.switchState(new FreeplayState());
								}
							if(readSwitch == "switch CreditsState")
								{
									FlxG.switchState(new CreditsState());
								}
							if(readSwitch == "switch EngineEditorsState")
								{
									FlxG.switchState(new EngineEditorsState());
								}
							if(readSwitch == "switch Options")
								{
									FlxG.switchState(new options.MenuOptions());
								}
							if(readSwitch == "switch OptionsOld")
								{
									FlxG.switchState(new OptionsDirect());
								}
							}
						}
			
						if (controls.ACCEPT)
						{
							if (optionShit[curSelected] == 'donate')
							{
								var menuJsonData2 = Paths.loadCustomGameJson("main_menu");
	                            var dataMenuDonate:MenuData = cast menuJsonData2;
								CoolUtil.browserLoad(dataMenuDonate.donateLink);
							}
							else
							{
								selectedSomethin = true;
								FlxG.sound.play(Paths.sound('confirmMenu'));
			
								if (FlxG.save.data.flashing)
									FlxFlicker.flicker(magenta, 1.1, 0.15, false);
			
								
									
								menuItems.forEach(function(spr:FlxSprite)
								{
									
			
									if (curSelected != spr.ID)
									{
										FlxTween.tween(spr, {alpha: 0}, 1.3, {
											ease: FlxEase.quadOut,
											onComplete: function(twn:FlxTween)
											{
												spr.kill();
											}
										});
									}
									else
									{
										if (FlxG.save.data.flashing)
										{
											FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
											{
												goToState();
											});
										}
										else
										{
											new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												goToState();
											});
										}
									}
								});
							}

			
						}
					}
			
				}
			else{
				FlxG.mouse.visible = true;
			}
		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			if(redesignedmenustyle == false)
				{
					spr.screenCenter(X);
				}
			else{

			}
			
		});
	}
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		switch (daChoice)
		{
			
			case 'story_mode':
				FlxG.switchState(new StoryMenuState());
				
			case 'freeplay':
				FlxG.switchState(new FreeplayState());

			case 'credits':
				FlxG.switchState(new CreditsState());

			case 'options':
				FlxG.switchState(new options.MenuOptions());
				//options.MenuOptions.ispause = false;

            case 'mods':
				FlxG.switchState(new ModsMenuState());

            case 'minigames':
				FlxG.switchState(new miniGames.MiniGamesState());
				miniGames.MiniGamesState.h = "mainmenu";

			default:
				if(daChoice == "youtube")
					{
						
					}
				FlxG.switchState(new CustomState());
				CustomState.statename = optionShit[curSelected];

		}
	}

	function changeItem(huh:Int = 0)
	{
		var menuJsonData = Paths.loadCustomGameJson("main_menu");
	    var dataMenu:MenuData = cast menuJsonData;

		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.scale.x = dataMenu.defaultScaleX;
			spr.scale.y = dataMenu.defaultScaleY;
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
             

				spr.scale.x = dataMenu.curSelectedScaleX;
				spr.scale.y = dataMenu.curSelectedScaleY;
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}

	public function callOnHscript(functionToCall:String, ?params:Array<Any>):Dynamic
        {
            if (interp == null)
            {
                return null;
            }
            if (interp.variables.exists(functionToCall))
            {
                var functionH = interp.variables.get(functionToCall);
                if (params == null)
                {
                    var result = null;
                    result = functionH();
                    return result;
                }
                else
                {
                    var result = null;
                    result = Reflect.callMethod(null, functionH, params);
                    return result;
                }
            }
            return null;
        }
}

typedef MenuData = {
	var ?name:String;
	var curSelectedScaleX:Float;
	var curSelectedScaleY:Float;
	var defaultScaleX:Float;
	var defaultScaleY:Float;
	var donateLink:String;
}