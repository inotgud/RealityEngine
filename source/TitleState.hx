package;

import hscript.Expr;
import hscript.Parser;
import hscript.Interp;
#if FEATURE_STEPMANIA
import smTools.SMFile;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import flixel.input.keyboard.FlxKey;
import haxe.Json;
import haxe.format.JsonParser;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
using StringTools;

/*typedef customGame = {
	var title:String;
	var description:String;
	var donateLink:String;
	var menuFont:String;
	var modvandt:String;
}
*/
class TitleState extends MusicBeatState
{
	static var initialized:Bool = false;
    
	public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];
	
	//Update System
    var newUpdateAvailable = false;

	public static var hmmmmmmmmmmmmmmmm:String;
	//public static var theRealityenginetitle:String = sys.io.File.getContent('assets/custom/custom_game/title.txt');
	public static var language:String;
	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;
	var ngSpr2:FlxSprite;

	var curWacky:Array<String> = [];

	var updateAvailable:Bool = false;
	var wackyImage:FlxSprite;
	var playScript:Bool = false;
	public static var description:String;
	public static var interp:Interp;
	var bg:FlxSprite;

	override public function create():Void
	{

		openSubState(new OpenDiscord());
		
		if(FlxG.save.data.muteBind == null)
			{
				FlxG.save.data.muteBind = "0";
			}
			if(FlxG.save.data.volUpBind == null)
			{
				FlxG.save.data.volUpBind = "+";
			}
			
		#if sys
		hmmmmmmmmmmmmmmmm = sys.io.File.getContent('assets/data/language.txt');
		language = hmmmmmmmmmmmmmmmm;
		#else
		hmmmmmmmmmmmmmmmm = "en";
		language = hmmmmmmmmmmmmmmmm;
		#end

		var jsonData = Paths.loadCustomGameJson("custom_game");
		var data:CustomGameJson = cast jsonData;
		lime.app.Application.current.window.title = data.gameTitle;
		description = data.gameDescription;

		
		/*if(sys.FileSystem.exists("assets/custom/custom_game/custom_game.json"))
			{
				var list:customGame = Json.parse(string);
				Application.current.window.title = customGame.title;
			}

			*/

		if(FlxG.save.data.redesignedmenustyle == "On")
			{
				MainMenuState.redesignedmenustyle = true;
			}
		else{
			MainMenuState.redesignedmenustyle = false;
		}
		
		trace("Reality Engine Started! Welcome");
		
		// TODO: Refactor this to use OpenFlAssets.
		#if FEATURE_FILESYSTEM
		if (!sys.FileSystem.exists(Sys.getCwd() + "/assets/replays"))
			sys.FileSystem.createDirectory(Sys.getCwd() + "/assets/replays");
		#end

		@:privateAccess
		{
			Debug.logTrace("We loaded " + openfl.Assets.getLibrary("default").assetsLoaded + " assets into the default library");
		}

		

		

		FlxG.autoPause = false;

		FlxG.save.bind('funkin', 'ninjamuffin99');

		PlayerSettings.init();

		RealityEngineData.initSave();

		// It doesn't reupdate the list before u restart rn lmao
		NoteskinHelpers.updateNoteskins();

		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;

		FlxG.mouse.visible = false;

		FlxG.worldBounds.set(0, 0);

		FlxGraphic.defaultPersist = FlxG.save.data.cacheImages;

		MusicBeatState.initSave = true;

		fullscreenBind = FlxKey.fromString(FlxG.save.data.fullscreenBind);

		Highscore.load();

		curWacky = FlxG.random.getObject(getIntroTextShit());

		trace('hello');

		#if sys
		var expr = sys.io.File.getContent("assets/custom/custom_states/TitleState.hx");
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
						interp.variables.set("gfDance", gfDance);
                        interp.variables.set("FlxGame", flixel.FlxGame);
						interp.variables.set("FlxObject", flixel.FlxObject);
						interp.variables.set("FlxSprite", flixel.FlxSprite);
						interp.variables.set("TitleState", TitleState);
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
						interp.variables.set("FlxSound", flixel.system.FlxSound);
						interp.variables.set("FlxText", flixel.text.FlxText);
						interp.variables.set("FlxEase", flixel.tweens.FlxEase);
						interp.variables.set("FlxTween", flixel.tweens.FlxTween);
						interp.variables.set("MusicBeatState", MusicBeatState);
						interp.variables.set("update", function(elapsed:Float)
						{
						});
						interp.variables.set("create", function()
						{
						});

                        interp.execute(ast);
						#end
                        trace( interp.execute(program) ); 
        callOnHscript("create");


		#if desktop
		DiscordClient.initialize();
		
		trace("Application.current.onExit");
		Application.current.onExit.add (function (exitCode) {
			DiscordClient.shutdown();
		});
			#end

		// DEBUG BULLSHIT

		super.create();

		#if FREEPLAY
		FlxG.switchState(new FreeplayState());
		clean();
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		clean();
		#else
		#if !cpp
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		#else
		startIntro();
		#end
		#end
	}

	var logoBl:FlxSprite;
	var backgroundTitle:FlxSprite = new FlxSprite().loadGraphic(Paths.image('TitleBG'));
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function startIntro()
	{
		persistentUpdate = true;

		
		logoBl = new FlxSprite(-150, -100);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = FlxG.save.data.antialiasing;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logoBl.updateHitbox();
		add(logoBl);
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;

        backgroundTitle.screenCenter();
        backgroundTitle.antialiasing = true;

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		//gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		//gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gfDance.antialiasing = FlxG.save.data.antialiasing;
		
		//json parsing
		var gfJsonData = Paths.loadJSON('gfDanceTitle');
		if (gfJsonData == null)
		{
			Debug.logError('Failed to parse JSON data for gf dance');
			return;
		}
		var dataGf:GirlFriendTitleData = cast gfJsonData;
		gfDance.frames = Paths.getSparrowAtlas(dataGf.sparrowatlas);
		for (anim in dataGf.animations)
			{
				var frameRate = anim.frameRate == null ? 24 : anim.frameRate;
				var looped = anim.looped == null ? false : anim.looped;
				var flipX = anim.flipX == null ? false : anim.flipX;
				var flipY = anim.flipY == null ? false : anim.flipY;
		
			    gfDance.animation.addByIndices(anim.name, anim.prefix, anim.frameIndices, "", frameRate, looped, flipX, flipY);
		
			}
		gfDance.x += dataGf.x;
		gfDance.y += dataGf.y;
				

		add(gfDance);
		


		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = FlxG.save.data.antialiasing;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		add(titleText);
		

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.loadImage('logo'));
		logo.screenCenter();
		logo.antialiasing = FlxG.save.data.antialiasing;
		// add(logo);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "ninjamuffin99\nPhantomArcade\nkawaisprite\nevilsk8er", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.loadImage('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = FlxG.save.data.antialiasing;

		ngSpr2 = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.loadImage('engine_logo'));
		add(ngSpr2);
		ngSpr2.visible = false;
		ngSpr2.setGraphicSize(Std.int(ngSpr2.width * 0.8));
		ngSpr2.updateHitbox();
		ngSpr2.screenCenter(X);
		ngSpr2.antialiasing = FlxG.save.data.antialiasing;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});

		FlxG.mouse.visible = false;

		if (initialized)
			skipIntro();
		else
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;
			if(FlxG.save.data.menuMusic == null)
				{
					FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
				}
			else{
				FlxG.sound.playMusic(Paths.music(FlxG.save.data.menuMusic), 0);
			}
			

			FlxG.sound.music.fadeIn(4, 0, 0.7);
			Conductor.changeBPM(102);
			initialized = true;
		}

		// credGroup.add(credTextShit);
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('data/introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;
	var fullscreenBind:FlxKey;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		if (FlxG.keys.anyJustPressed([fullscreenBind]))
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = controls.ACCEPT;
		var hmmtheback:Bool = controls.BACK;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		if (pressedEnter && !transitioning && skippedIntro)
		{
			if (FlxG.save.data.flashing)
				titleText.animation.play('press');
			add(titleText);

			
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			FlxTween.tween(logoBl, {y: -1500}, 3, {ease: FlxEase.backInOut, type: ONESHOT});
			FlxTween.tween(gfDance, {y: 1500}, 3, {ease: FlxEase.backInOut, type: ONESHOT});
			FlxTween.tween(titleText, {y: 1500}, 3, {ease: FlxEase.backInOut, type: ONESHOT});
			FlxTween.tween(camera, {zoom: 3}, 3, {ease: FlxEase.backOut, type: ONESHOT});
			CoolUtil.cameraZoom(camera, 3, 3, FlxEase.backOut, ONESHOT);
			FlxG.camera.flash(FlxColor.RED, 1);

			transitioning = true;
			// FlxG.sound.music.stop();
			
		var http = new haxe.Http("https://raw.githubusercontent.com/Goodbs/RealityEngine/main/RealityVersion.txt");

		http.onData = function(data:String)
		{
			var updateVersion = data.split('\n')[0].trim();
			var curVersion:String = MainMenuState.RealityEngineVer;
			if (updateVersion != curVersion)
			{
				FlxG.save.data.updatessss = data.split('\n')[0].trim();
				newUpdateAvailable = true;
				if(FlxG.save.data.updatenot != true)
					{
						FlxG.switchState(new NewUpdateAvailable());
					}
			    else{
					FlxG.switchState(new MainMenuState());
				}
				
			}
			else{
				FlxG.switchState(new MainMenuState());
			}
		}

		http.request();
		
		FlxG.switchState(new MainMenuState());
			
		}

		if (pressedEnter && !skippedIntro && initialized)
		{
			
			skipIntro();
		}

		if(hmmtheback)
			{
				FlxG.switchState(new ThisExit());
			}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter(X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter(X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override function beatHit()
	{
		super.beatHit();

		logoBl.animation.play('bump', true);
		danceLeft = !danceLeft;

		if (danceLeft)
			gfDance.animation.play('danceRight');
		else
			gfDance.animation.play('danceLeft');

		
		var test1:String = "by";
		var test2:String = "In Partnership";
		var test3:String = "with";

	
		switch (curBeat)
		{
					case 0:
						deleteCoolText();
					case 1:
						deleteCoolText();
					case 2:
							if(language == "en")
							createCoolText(['Reality Engine', 'by']);
							if(language == "ru")
								createCoolText(['Reality Engine', 'by']);
						    if(language == "tr")
							createCoolText(['Reality Engine', 'yapimcilari']);
					case 3:
					   //if (!Main.watermarks)
							addMoreText('GoodTR');
					case 4:
						   ngSpr2.visible = true;	
						  case 5:
								ngSpr2.visible = false;
								deleteCoolText();
								if(language == "en")
								createCoolText(['In Partnership', 'with']);
								if(language == "ru")
									createCoolText(['In Partnership', 'with']);
								if(language == "tr")
								createCoolText(['Aynen', 'sununla ortagiz']);
						  case 6: 
								   addMoreText('Newgrounds');
						ngSpr.visible = true;
					// credTextShit.text += '\nNewgrounds';
					case 7:
						deleteCoolText();
						ngSpr.visible = false;
					case 8:
						remove(bg);
						skipIntro();


		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			Debug.logInfo("Skipping intro...");

			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			remove(credGroup);

			FlxTween.tween(logoBl, {y: -100}, 1.4, {ease: FlxEase.expoInOut});

			logoBl.angle = -4;

			new FlxTimer().start(0.01, function(tmr:FlxTimer)
			{
				if (logoBl.angle == -4)
					FlxTween.angle(logoBl, logoBl.angle, 4, 4, {ease: FlxEase.quartInOut});
				if (logoBl.angle == 4)
					FlxTween.angle(logoBl, logoBl.angle, -4, 4, {ease: FlxEase.quartInOut});
			}, 0);

			// It always bugged me that it didn't do this before.
			// Skip ahead in the song to the drop.
			FlxG.sound.music.time = 9400; // 9.4 seconds

			skippedIntro = true;
		}
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

typedef CustomGameJson = {
	var gameTitle:String;
	var gameDescription:String;
	var mainMenuFont:String;
	var modversionandtext:String;
}

typedef GirlFriendTitleData =
{
	var sparrowatlas:String;
	var x:Float;
	var y:Float;
	var animations:Array<GFTitleAnimationData>;
}

typedef GFTitleAnimationData =
{
	var name:String;
	var prefix:String;
	var ?offsets:Array<Int>;

	/**
	 * Whether this animation is looped.
	 * @default false
	 */
	var ?looped:Bool;

	var ?flipX:Bool;
	var ?flipY:Bool;

	/**
	 * The frame rate of this animation.
	 		* @default 24
	 */
	var ?frameRate:Int;

	var ?frameIndices:Array<Int>;
}