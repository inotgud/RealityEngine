package;

import hscript.Expr;
import hscript.Parser;
import hscript.Interp;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Stage extends MusicBeatState
{
	public var curStage:String = '';
	public var camZoom:Float; // The zoom of the camera to have at the start of the game
	public var hideLastBG:Bool = false; // True = hide last BGs and show ones from slowBacks on certain step, False = Toggle visibility of BGs from SlowBacks on certain step
	// Use visible property to manage if BG would be visible or not at the start of the game
	public var tweenDuration:Float = 2; // How long will it tween hiding/showing BGs, variable above must be set to True for tween to activate
	public var toAdd:Array<Dynamic> = []; // Add BGs on stage startup, load BG in by using "toAdd.push(bgVar);"
	// Layering algorithm for noobs: Everything loads by the method of "On Top", example: You load wall first(Every other added BG layers on it), then you load road(comes on top of wall and doesn't clip through it), then loading street lights(comes on top of wall and road)
	public var swagBacks:Map<String,
		Dynamic> = []; // Store BGs here to use them later (for example with slowBacks, using your custom stage event or to adjust position in stage debug menu(press 8 while in PlayState with debug build of the game))
	public var swagGroup:Map<String, FlxTypedGroup<Dynamic>> = []; // Store Groups
	public var animatedBacks:Array<FlxSprite> = []; // Store animated backgrounds and make them play animation(Animation must be named Idle!! Else use swagGroup/swagBacks and script it in stepHit/beatHit function of this file!!)
	public var layInFront:Array<Array<FlxSprite>> = [[], [], []]; // BG layering, format: first [0] - in front of GF, second [1] - in front of opponent, third [2] - in front of boyfriend(and technically also opponent since Haxe layering moment)
	public var slowBacks:Map<Int,
		Array<FlxSprite>> = []; // Change/add/remove backgrounds mid song! Format: "slowBacks[StepToBeActivated] = [Sprites,To,Be,Changed,Or,Added];"
	public static var interp:Interp;

	// BGs still must be added by using toAdd Array for them to show in game after slowBacks take effect!!
	// BGs still must be added by using toAdd Array for them to show in game after slowBacks take effect!!
	// All of the above must be set or used in your stage case code block!!
	public var positions:Map<String, Map<String, Array<Int>>> = [
		// Assign your characters positions on stage here!
		'halloween' => ['spooky' => [100, 300], 'monster' => [100, 200]],
		'philly' => ['pico' => [100, 400]],
		'limo' => ['bf-car' => [1030, 230]],
		'mall' => ['bf-christmas' => [970, 450], 'parents-christmas' => [-400, 100]],
		'mallEvil' => ['bf-christmas' => [1090, 450], 'monster-christmas' => [100, 150]],
		'school' => [
			'gf-pixel' => [580, 430],
			'bf-pixel' => [970, 670],
			'senpai' => [250, 460],
			'senpai-angry' => [250, 460]
		],
		'schoolEvil' => ['gf-pixel' => [580, 430], 'bf-pixel' => [970, 670], 'spirit' => [-50, 200]]
	];

	public function new(daStage:String)
	{
		super();
		this.curStage = daStage;
		camZoom = 1.05; // Don't change zoom here, unless you want to change zoom of every stage that doesn't have custom one
		if (PlayStateChangeables.Optimize)
			return;

		switch (daStage)
		{
			case 'halloween':
				{
					var hallowTex = Paths.getSparrowAtlas('halloween_bg');

					var halloweenBG = new FlxSprite(-200, -80);
					halloweenBG.frames = hallowTex;
					halloweenBG.animation.addByPrefix('idle', 'halloweem bg0');
					halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
					halloweenBG.animation.play('idle');
					halloweenBG.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['halloweenBG'] = halloweenBG;
					toAdd.push(halloweenBG);
				}
			case 'philly':
				{
					var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('philly/sky', 'shared'));
					bg.scrollFactor.set(0.1, 0.1);
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var city:FlxSprite = new FlxSprite(-10).loadGraphic(Paths.loadImage('philly/city', 'shared'));
					city.scrollFactor.set(0.3, 0.3);
					city.setGraphicSize(Std.int(city.width * 0.85));
					city.updateHitbox();
					swagBacks['city'] = city;
					toAdd.push(city);

					var phillyCityLights = new FlxTypedGroup<FlxSprite>();
					if (FlxG.save.data.distractions)
					{
						swagGroup['phillyCityLights'] = phillyCityLights;
						toAdd.push(phillyCityLights);
					}

					for (i in 0...5)
					{
						var light:FlxSprite = new FlxSprite(city.x).loadGraphic(Paths.loadImage('philly/win' + i, 'shared'));
						light.scrollFactor.set(0.3, 0.3);
						light.visible = false;
						light.setGraphicSize(Std.int(light.width * 0.85));
						light.updateHitbox();
						light.antialiasing = FlxG.save.data.antialiasing;
						phillyCityLights.add(light);
					}

					var streetBehind:FlxSprite = new FlxSprite(-40, 50).loadGraphic(Paths.loadImage('philly/behindTrain', 'shared'));
					swagBacks['streetBehind'] = streetBehind;
					toAdd.push(streetBehind);

					var phillyTrain = new FlxSprite(2000, 360).loadGraphic(Paths.loadImage('philly/train', 'shared'));
					if (FlxG.save.data.distractions)
					{
						swagBacks['phillyTrain'] = phillyTrain;
						toAdd.push(phillyTrain);
					}

					trainSound = new FlxSound().loadEmbedded(Paths.sound('train_passes', 'shared'));
					FlxG.sound.list.add(trainSound);

					// var cityLights:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.win0.png);

					var street:FlxSprite = new FlxSprite(-40, streetBehind.y).loadGraphic(Paths.loadImage('philly/street', 'shared'));
					swagBacks['street'] = street;
					toAdd.push(street);
				}
			case 'limo':
				{
					camZoom = 0.90;

					var skyBG:FlxSprite = new FlxSprite(-120, -50).loadGraphic(Paths.loadImage('limo/limoSunset', 'shared'));
					skyBG.scrollFactor.set(0.1, 0.1);
					skyBG.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['skyBG'] = skyBG;
					toAdd.push(skyBG);

					var bgLimo:FlxSprite = new FlxSprite(-200, 480);
					bgLimo.frames = Paths.getSparrowAtlas('limo/bgLimo', 'shared');
					bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
					bgLimo.animation.play('drive');
					bgLimo.scrollFactor.set(0.4, 0.4);
					bgLimo.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['bgLimo'] = bgLimo;
					toAdd.push(bgLimo);

					var fastCar:FlxSprite;
					fastCar = new FlxSprite(-300, 160).loadGraphic(Paths.loadImage('limo/fastCarLol', 'shared'));
					fastCar.antialiasing = FlxG.save.data.antialiasing;
					fastCar.visible = false;

					if (FlxG.save.data.distractions)
					{
						var grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
						swagGroup['grpLimoDancers'] = grpLimoDancers;
						toAdd.push(grpLimoDancers);

						for (i in 0...5)
						{
							var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
							dancer.scrollFactor.set(0.4, 0.4);
							grpLimoDancers.add(dancer);
							swagBacks['dancer' + i] = dancer;
						}

						swagBacks['fastCar'] = fastCar;
						layInFront[2].push(fastCar);
						resetFastCar();
					}

					var overlayShit:FlxSprite = new FlxSprite(-500, -600).loadGraphic(Paths.loadImage('limo/limoOverlay', 'shared'));
					overlayShit.alpha = 0.5;
					// add(overlayShit);

					// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

					// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

					// overlayShit.shader = shaderBullshit;

					var limoTex = Paths.getSparrowAtlas('limo/limoDrive', 'shared');

					var limo = new FlxSprite(-120, 550);
					limo.frames = limoTex;
					limo.animation.addByPrefix('drive', "Limo stage", 24);
					limo.animation.play('drive');
					limo.antialiasing = FlxG.save.data.antialiasing;
					layInFront[0].push(limo);
					swagBacks['limo'] = limo;
				}
			case 'mall':
				{
					camZoom = 0.80;

					var bg:FlxSprite = new FlxSprite(-1000, -500).loadGraphic(Paths.loadImage('christmas/bgWalls', 'shared'));
					bg.antialiasing = FlxG.save.data.antialiasing;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var upperBoppers = new FlxSprite(-240, -90);
					upperBoppers.frames = Paths.getSparrowAtlas('christmas/upperBop', 'shared');
					upperBoppers.animation.addByPrefix('idle', "Upper Crowd Bob", 24, false);
					upperBoppers.antialiasing = FlxG.save.data.antialiasing;
					upperBoppers.scrollFactor.set(0.33, 0.33);
					upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 0.85));
					upperBoppers.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['upperBoppers'] = upperBoppers;
						toAdd.push(upperBoppers);
						animatedBacks.push(upperBoppers);
					}

					var bgEscalator:FlxSprite = new FlxSprite(-1100, -600).loadGraphic(Paths.loadImage('christmas/bgEscalator', 'shared'));
					bgEscalator.antialiasing = FlxG.save.data.antialiasing;
					bgEscalator.scrollFactor.set(0.3, 0.3);
					bgEscalator.active = false;
					bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 0.9));
					bgEscalator.updateHitbox();
					swagBacks['bgEscalator'] = bgEscalator;
					toAdd.push(bgEscalator);

					var tree:FlxSprite = new FlxSprite(370, -250).loadGraphic(Paths.loadImage('christmas/christmasTree', 'shared'));
					tree.antialiasing = FlxG.save.data.antialiasing;
					tree.scrollFactor.set(0.40, 0.40);
					swagBacks['tree'] = tree;
					toAdd.push(tree);

					var bottomBoppers = new FlxSprite(-300, 140);
					bottomBoppers.frames = Paths.getSparrowAtlas('christmas/bottomBop', 'shared');
					bottomBoppers.animation.addByPrefix('idle', 'Bottom Level Boppers', 24, false);
					bottomBoppers.antialiasing = FlxG.save.data.antialiasing;
					bottomBoppers.scrollFactor.set(0.9, 0.9);
					bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
					bottomBoppers.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['bottomBoppers'] = bottomBoppers;
						toAdd.push(bottomBoppers);
						animatedBacks.push(bottomBoppers);
					}

					var fgSnow:FlxSprite = new FlxSprite(-600, 700).loadGraphic(Paths.loadImage('christmas/fgSnow', 'shared'));
					fgSnow.active = false;
					fgSnow.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['fgSnow'] = fgSnow;
					toAdd.push(fgSnow);

					var santa = new FlxSprite(-840, 150);
					santa.frames = Paths.getSparrowAtlas('christmas/santa', 'shared');
					santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
					santa.antialiasing = FlxG.save.data.antialiasing;
					if (FlxG.save.data.distractions)
					{
						swagBacks['santa'] = santa;
						toAdd.push(santa);
						animatedBacks.push(santa);
					}
				}
			case 'mallEvil':
				{
					var bg:FlxSprite = new FlxSprite(-400, -500).loadGraphic(Paths.loadImage('christmas/evilBG', 'shared'));
					bg.antialiasing = FlxG.save.data.antialiasing;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					var evilTree:FlxSprite = new FlxSprite(300, -300).loadGraphic(Paths.loadImage('christmas/evilTree', 'shared'));
					evilTree.antialiasing = FlxG.save.data.antialiasing;
					evilTree.scrollFactor.set(0.2, 0.2);
					swagBacks['evilTree'] = evilTree;
					toAdd.push(evilTree);

					var evilSnow:FlxSprite = new FlxSprite(-200, 700).loadGraphic(Paths.loadImage("christmas/evilSnow", 'shared'));
					evilSnow.antialiasing = FlxG.save.data.antialiasing;
					swagBacks['evilSnow'] = evilSnow;
					toAdd.push(evilSnow);
				}
			case 'school':
				{
					// defaultCamZoom = 0.9;

					var bgSky = new FlxSprite().loadGraphic(Paths.loadImage('weeb/weebSky', 'shared'));
					bgSky.scrollFactor.set(0.1, 0.1);
					swagBacks['bgSky'] = bgSky;
					toAdd.push(bgSky);

					var repositionShit = -200;

					var bgSchool:FlxSprite = new FlxSprite(repositionShit, 0).loadGraphic(Paths.loadImage('weeb/weebSchool', 'shared'));
					bgSchool.scrollFactor.set(0.6, 0.90);
					swagBacks['bgSchool'] = bgSchool;
					toAdd.push(bgSchool);

					var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.loadImage('weeb/weebStreet', 'shared'));
					bgStreet.scrollFactor.set(0.95, 0.95);
					swagBacks['bgStreet'] = bgStreet;
					toAdd.push(bgStreet);

					var fgTrees:FlxSprite = new FlxSprite(repositionShit + 170, 130).loadGraphic(Paths.loadImage('weeb/weebTreesBack', 'shared'));
					fgTrees.scrollFactor.set(0.9, 0.9);
					swagBacks['fgTrees'] = fgTrees;
					toAdd.push(fgTrees);

					var bgTrees:FlxSprite = new FlxSprite(repositionShit - 380, -800);
					var treetex = Paths.getPackerAtlas('weeb/weebTrees', 'shared');
					bgTrees.frames = treetex;
					bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
					bgTrees.animation.play('treeLoop');
					bgTrees.scrollFactor.set(0.85, 0.85);
					swagBacks['bgTrees'] = bgTrees;
					toAdd.push(bgTrees);

					var treeLeaves:FlxSprite = new FlxSprite(repositionShit, -40);
					treeLeaves.frames = Paths.getSparrowAtlas('weeb/petals', 'shared');
					treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
					treeLeaves.animation.play('leaves');
					treeLeaves.scrollFactor.set(0.85, 0.85);
					swagBacks['treeLeaves'] = treeLeaves;
					toAdd.push(treeLeaves);

					var widShit = Std.int(bgSky.width * 6);

					bgSky.setGraphicSize(widShit);
					bgSchool.setGraphicSize(widShit);
					bgStreet.setGraphicSize(widShit);
					bgTrees.setGraphicSize(Std.int(widShit * 1.4));
					fgTrees.setGraphicSize(Std.int(widShit * 0.8));
					treeLeaves.setGraphicSize(widShit);

					fgTrees.updateHitbox();
					bgSky.updateHitbox();
					bgSchool.updateHitbox();
					bgStreet.updateHitbox();
					bgTrees.updateHitbox();
					treeLeaves.updateHitbox();

					var bgGirls = new BackgroundGirls(-100, 190);
					bgGirls.scrollFactor.set(0.9, 0.9);

					// if (PlayState.SONG.songId.toLowerCase() == 'roses')
					if (GameplayCustomizeState.freeplaySong == 'roses')
					{
						if (FlxG.save.data.distractions)
							bgGirls.getScared();
					}

					bgGirls.setGraphicSize(Std.int(bgGirls.width * CoolUtil.daPixelZoom));
					bgGirls.updateHitbox();
					if (FlxG.save.data.distractions)
					{
						swagBacks['bgGirls'] = bgGirls;
						toAdd.push(bgGirls);
					}
				}
			case 'schoolEvil':
				{
					var waveEffectBG = new FlxWaveEffect(FlxWaveMode.ALL, 2, -1, 3, 2);
					var waveEffectFG = new FlxWaveEffect(FlxWaveMode.ALL, 2, -1, 5, 2);

					var posX = 400;
					var posY = 200;

					var bg:FlxSprite = new FlxSprite(posX, posY);
					bg.frames = Paths.getSparrowAtlas('weeb/animatedEvilSchool', 'shared');
					bg.animation.addByPrefix('idle', 'background 2', 24);
					bg.animation.play('idle');
					bg.scrollFactor.set(0.8, 0.9);
					bg.scale.set(6, 6);
					swagBacks['bg'] = bg;
					toAdd.push(bg);

					/* 
						var bg:FlxSprite = new FlxSprite(posX, posY).loadGraphic(Paths.loadImage('weeb/evilSchoolBG'));
						bg.scale.set(6, 6);
						// bg.setGraphicSize(Std.int(bg.width * 6));
						// bg.updateHitbox();
						add(bg);
						var fg:FlxSprite = new FlxSprite(posX, posY).loadGraphic(Paths.loadImage('weeb/evilSchoolFG'));
						fg.scale.set(6, 6);
						// fg.setGraphicSize(Std.int(fg.width * 6));
						// fg.updateHitbox();
						add(fg);
						wiggleShit.effectType = WiggleEffectType.DREAMY;
						wiggleShit.waveAmplitude = 0.01;
						wiggleShit.waveFrequency = 60;
						wiggleShit.waveSpeed = 0.8;
					 */

					// bg.shader = wiggleShit.shader;
					// fg.shader = wiggleShit.shader;

					/* 
						var waveSprite = new FlxEffectSprite(bg, [waveEffectBG]);
						var waveSpriteFG = new FlxEffectSprite(fg, [waveEffectFG]);
						// Using scale since setGraphicSize() doesnt work???
						waveSprite.scale.set(6, 6);
						waveSpriteFG.scale.set(6, 6);
						waveSprite.setPosition(posX, posY);
						waveSpriteFG.setPosition(posX, posY);
						waveSprite.scrollFactor.set(0.7, 0.8);
						waveSpriteFG.scrollFactor.set(0.9, 0.8);
						// waveSprite.setGraphicSize(Std.int(waveSprite.width * 6));
						// waveSprite.updateHitbox();
						// waveSpriteFG.setGraphicSize(Std.int(fg.width * 6));
						// waveSpriteFG.updateHitbox();
						add(waveSprite);
						add(waveSpriteFG);
					 */
				}
		    case 'warzone':
				{
					camZoom = 0.9;

					PlayState.zoomText = true;
					
					var sky:FlxSprite = new FlxSprite(-400,-400).loadGraphic(Paths.image('warzone/tankSky'));
					sky.scrollFactor.set(0, 0);
					sky.antialiasing = true;
					sky.setGraphicSize(Std.int(sky.width * 1.5));
					swagBacks['sky'] = sky;
					toAdd.push(sky);

					
					var clouds:FlxSprite = new FlxSprite(FlxG.random.int(-700, -100), FlxG.random.int(-20, 20)).loadGraphic(Paths.image('warzone/tankClouds'));
					clouds.scrollFactor.set(0.1, 0.1);
					clouds.velocity.x = FlxG.random.float(5, 15);
					clouds.antialiasing = true;
					clouds.updateHitbox();
					swagBacks['clouds'] = clouds;
					toAdd.push(clouds);

					var mountains:FlxSprite = new FlxSprite(-300,-20).loadGraphic(Paths.image('warzone/tankMountains'));
					mountains.scrollFactor.set(0.2, 0.2);
					mountains.setGraphicSize(Std.int(1.2 * mountains.width));
					mountains.updateHitbox();
					mountains.antialiasing = true;
					swagBacks['mountains'] = mountains;
					toAdd.push(mountains);

					var buildings:FlxSprite = new FlxSprite(-200,0).loadGraphic(Paths.image('warzone/tankBuildings'));
					buildings.scrollFactor.set(0.3, 0.3);
					buildings.setGraphicSize(Std.int(buildings.width * 1.1));
					buildings.updateHitbox();
					buildings.antialiasing = true;
					swagBacks['buildings'] = buildings;
					toAdd.push(buildings);

					var ruins:FlxSprite = new FlxSprite(-200,0).loadGraphic(Paths.image('warzone/tankRuins'));
					ruins.scrollFactor.set(0.35, 0.35);
					ruins.setGraphicSize(Std.int(ruins.width * 1.1));
					ruins.updateHitbox();
					ruins.antialiasing = true;
					swagBacks['ruins'] = ruins;
					toAdd.push(ruins);

					var smokeLeft:FlxSprite = new FlxSprite(-200,-100);
								smokeLeft.frames = Paths.getSparrowAtlas('warzone/smokeLeft');
								smokeLeft.animation.addByPrefix('idle', 'SmokeBlurLeft ', 24, true);
								smokeLeft.scrollFactor.set(0.4, 0.4);
								smokeLeft.antialiasing = true;
								smokeLeft.animation.play('idle');
								swagBacks['smokeLeft'] = smokeLeft;
								toAdd.push(smokeLeft);
				
								var smokeRight:FlxSprite = new FlxSprite(1100,-100);
								smokeRight.frames = Paths.getSparrowAtlas('warzone/smokeRight');
								smokeRight.animation.addByPrefix('idle', 'SmokeRight ', 24, true);
								smokeRight.scrollFactor.set(0.4, 0.4);
								smokeRight.antialiasing = true;
								smokeRight.animation.play('idle');
								
								swagBacks['smokeRight'] = smokeRight;
					toAdd.push(smokeRight);

								var tower:FlxSprite = new FlxSprite(100, 120);
								tower.frames = Paths.getSparrowAtlas('warzone/tankWatchtower');
								tower.animation.addByPrefix('idle', 'watchtower gradient color', 24, false);
								tower.antialiasing = true;

								swagBacks['tower'] = tower;
					toAdd.push(tower);

								var tankRolling:FlxSprite = new FlxSprite(300,300);
								tankRolling.frames = Paths.getSparrowAtlas('tankRolling');
								tankRolling.animation.addByPrefix('idle', 'BG tank w lighting ', 24, true);
								tankRolling.scrollFactor.set(0.5, 0.5);
								tankRolling.antialiasing = true;
								tankRolling.animation.play('idle');
								
								swagBacks['tankRolling'] = tankRolling;
					toAdd.push(tankRolling);
				
								var ground:FlxSprite = new FlxSprite(-420, -150).loadGraphic(Paths.image('warzone/tankGround'));
								ground.scrollFactor.set();
								ground.antialiasing = true;
								ground.setGraphicSize(Std.int(ground.width * 1.15));
								ground.scrollFactor.set(1, 1);

								ground.updateHitbox();
								swagBacks['ground'] = ground;
					toAdd.push(ground);
					var foreGround0 = new FlxSprite(-500, 600);
					foreGround0.scrollFactor.set(1.7, 1.5);
					foreGround0.antialiasing = FlxG.save.data.antialiasing;
					foreGround0.frames = Paths.getSparrowAtlas('warzone/tank0');
					foreGround0.animation.addByPrefix('idle', 'fg tankhead far right instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround0.animation.play('idle');
					swagBacks['foreGround0'] = foreGround0;
					layInFront[2].push(foreGround0);

					if (FlxG.save.data.distractions)
					{
						var foreGround1 = new FlxSprite(-300, 750);
						foreGround1.scrollFactor.set(2, 0.2);
						foreGround1.antialiasing = FlxG.save.data.antialiasing;
						foreGround1.frames = Paths.getSparrowAtlas('warzone/tank1');
						foreGround1.animation.addByPrefix('idle', 'fg tankhead 5 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround1.animation.play('idle');
						swagBacks['foreGround1'] = foreGround1;
						layInFront[2].push(foreGround1);
					}

					var foreGround2 = new FlxSprite(450, 940);
					foreGround2.scrollFactor.set(1.5, 1.5);
					foreGround2.antialiasing = FlxG.save.data.antialiasing;
					foreGround2.frames = Paths.getSparrowAtlas('warzone/tank2');
					foreGround2.animation.addByPrefix('idle', 'foreground man 3 instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround2.animation.play('idle');
					swagBacks['foreGround2'] = foreGround2;
					layInFront[2].push(foreGround2);

					if (FlxG.save.data.distractions)
					{
						var foreGround3 = new FlxSprite(1300, 900);
						foreGround3.scrollFactor.set(1.5, 1.5);
						foreGround3.antialiasing = FlxG.save.data.antialiasing;
						foreGround3.frames = Paths.getSparrowAtlas('warzone/tank3');
						foreGround3.animation.addByPrefix('idle', 'fg tankman bobbin 3 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround3.animation.play('idle');
						swagBacks['foreGround3'] = foreGround3;
						layInFront[2].push(foreGround3);
					}

					var foreGround4 = new FlxSprite(1620, 710);
					foreGround4.scrollFactor.set(1.5, 1.5);
					foreGround4.antialiasing = FlxG.save.data.antialiasing;
					foreGround4.frames = Paths.getSparrowAtlas('warzone/tank4');
					foreGround4.animation.addByPrefix('idle', 'fg tankhead far right instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround4.animation.play('idle');
					swagBacks['foreGround4'] = foreGround4;
					layInFront[2].push(foreGround4);

					if (FlxG.save.data.distractions)
					{
						var foreGround5 = new FlxSprite(1400, 1290);
						foreGround5.scrollFactor.set(3.5, 2.5);
						foreGround5.antialiasing = FlxG.save.data.antialiasing;
						foreGround5.frames = Paths.getSparrowAtlas('warzone/tank5');
						foreGround5.animation.addByPrefix('idle', 'fg tankhead 4 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround5.animation.play('idle');
						swagBacks['foreGround5'] = foreGround5;
						layInFront[2].push(foreGround5);
					}

				}
				case 'warzone-stress':
					{
						camZoom = 0.9;

					PlayState.zoomText = true;
					
					var sky:FlxSprite = new FlxSprite(-400,-400).loadGraphic(Paths.image('warzone/tankSky'));
					sky.scrollFactor.set(0, 0);
					sky.antialiasing = true;
					sky.setGraphicSize(Std.int(sky.width * 1.5));
					swagBacks['sky'] = sky;
					toAdd.push(sky);

					
					var clouds:FlxSprite = new FlxSprite(FlxG.random.int(-700, -100), FlxG.random.int(-20, 20)).loadGraphic(Paths.image('warzone/tankClouds'));
					clouds.scrollFactor.set(0.1, 0.1);
					clouds.velocity.x = FlxG.random.float(5, 15);
					clouds.antialiasing = true;
					clouds.updateHitbox();
					swagBacks['clouds'] = clouds;
					toAdd.push(clouds);

					var mountains:FlxSprite = new FlxSprite(-300,-20).loadGraphic(Paths.image('warzone/tankMountains'));
					mountains.scrollFactor.set(0.2, 0.2);
					mountains.setGraphicSize(Std.int(1.2 * mountains.width));
					mountains.updateHitbox();
					mountains.antialiasing = true;
					swagBacks['mountains'] = mountains;
					toAdd.push(mountains);

					var buildings:FlxSprite = new FlxSprite(-200,0).loadGraphic(Paths.image('warzone/tankBuildings'));
					buildings.scrollFactor.set(0.3, 0.3);
					buildings.setGraphicSize(Std.int(buildings.width * 1.1));
					buildings.updateHitbox();
					buildings.antialiasing = true;
					swagBacks['buildings'] = buildings;
					toAdd.push(buildings);

					var ruins:FlxSprite = new FlxSprite(-200,0).loadGraphic(Paths.image('warzone/tankRuins'));
					ruins.scrollFactor.set(0.35, 0.35);
					ruins.setGraphicSize(Std.int(ruins.width * 1.1));
					ruins.updateHitbox();
					ruins.antialiasing = true;
					swagBacks['ruins'] = ruins;
					toAdd.push(ruins);

					var smokeLeft:FlxSprite = new FlxSprite(-200,-100);
								smokeLeft.frames = Paths.getSparrowAtlas('warzone/smokeLeft');
								smokeLeft.animation.addByPrefix('idle', 'SmokeBlurLeft ', 24, true);
								smokeLeft.scrollFactor.set(0.4, 0.4);
								smokeLeft.antialiasing = true;
								smokeLeft.animation.play('idle');
								swagBacks['smokeLeft'] = smokeLeft;
								toAdd.push(smokeLeft);
				
								var smokeRight:FlxSprite = new FlxSprite(1100,-100);
								smokeRight.frames = Paths.getSparrowAtlas('warzone/smokeRight');
								smokeRight.animation.addByPrefix('idle', 'SmokeRight ', 24, true);
								smokeRight.scrollFactor.set(0.4, 0.4);
								smokeRight.antialiasing = true;
								smokeRight.animation.play('idle');
								
								swagBacks['smokeRight'] = smokeRight;
					toAdd.push(smokeRight);

								var tower:FlxSprite = new FlxSprite(100, 120);
								tower.frames = Paths.getSparrowAtlas('warzone/tankWatchtower');
								tower.animation.addByPrefix('idle', 'watchtower gradient color', 24, false);
								tower.antialiasing = true;

								swagBacks['tower'] = tower;
					toAdd.push(tower);

								var tankRolling:FlxSprite = new FlxSprite(300,300);
								tankRolling.frames = Paths.getSparrowAtlas('tankRolling');
								tankRolling.animation.addByPrefix('idle', 'BG tank w lighting ', 24, true);
								tankRolling.scrollFactor.set(0.5, 0.5);
								tankRolling.antialiasing = true;
								tankRolling.animation.play('idle');
								
								swagBacks['tankRolling'] = tankRolling;
					toAdd.push(tankRolling);
				
								var ground:FlxSprite = new FlxSprite(-420, -150).loadGraphic(Paths.image('warzone/tankGround'));
								ground.scrollFactor.set();
								ground.antialiasing = true;
								ground.setGraphicSize(Std.int(ground.width * 1.15));
								ground.scrollFactor.set(1, 1);

								ground.updateHitbox();
								swagBacks['ground'] = ground;
					toAdd.push(ground);
					var foreGround0 = new FlxSprite(-500, 600);
					foreGround0.scrollFactor.set(1.7, 1.5);
					foreGround0.antialiasing = FlxG.save.data.antialiasing;
					foreGround0.frames = Paths.getSparrowAtlas('warzone/tank0');
					foreGround0.animation.addByPrefix('idle', 'fg tankhead far right instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround0.animation.play('idle');
					swagBacks['foreGround0'] = foreGround0;
					layInFront[2].push(foreGround0);

					if (FlxG.save.data.distractions)
					{
						var foreGround1 = new FlxSprite(-300, 750);
						foreGround1.scrollFactor.set(2, 0.2);
						foreGround1.antialiasing = FlxG.save.data.antialiasing;
						foreGround1.frames = Paths.getSparrowAtlas('warzone/tank1');
						foreGround1.animation.addByPrefix('idle', 'fg tankhead 5 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround1.animation.play('idle');
						swagBacks['foreGround1'] = foreGround1;
						layInFront[2].push(foreGround1);
					}

					var foreGround2 = new FlxSprite(450, 940);
					foreGround2.scrollFactor.set(1.5, 1.5);
					foreGround2.antialiasing = FlxG.save.data.antialiasing;
					foreGround2.frames = Paths.getSparrowAtlas('warzone/tank2');
					foreGround2.animation.addByPrefix('idle', 'foreground man 3 instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround2.animation.play('idle');
					swagBacks['foreGround2'] = foreGround2;
					layInFront[2].push(foreGround2);

					if (FlxG.save.data.distractions)
					{
						var foreGround3 = new FlxSprite(1300, 900);
						foreGround3.scrollFactor.set(1.5, 1.5);
						foreGround3.antialiasing = FlxG.save.data.antialiasing;
						foreGround3.frames = Paths.getSparrowAtlas('warzone/tank3');
						foreGround3.animation.addByPrefix('idle', 'fg tankman bobbin 3 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround3.animation.play('idle');
						swagBacks['foreGround3'] = foreGround3;
						layInFront[2].push(foreGround3);
					}

					var foreGround4 = new FlxSprite(1620, 710);
					foreGround4.scrollFactor.set(1.5, 1.5);
					foreGround4.antialiasing = FlxG.save.data.antialiasing;
					foreGround4.frames = Paths.getSparrowAtlas('warzone/tank4');
					foreGround4.animation.addByPrefix('idle', 'fg tankhead far right instance ', Std.int(24 * PlayState.songMultiplier));
					foreGround4.animation.play('idle');
					swagBacks['foreGround4'] = foreGround4;
					layInFront[2].push(foreGround4);

					if (FlxG.save.data.distractions)
					{
						var foreGround5 = new FlxSprite(1400, 1290);
						foreGround5.scrollFactor.set(3.5, 2.5);
						foreGround5.antialiasing = FlxG.save.data.antialiasing;
						foreGround5.frames = Paths.getSparrowAtlas('warzone/tank5');
						foreGround5.animation.addByPrefix('idle', 'fg tankhead 4 instance ', Std.int(24 * PlayState.songMultiplier));
						foreGround5.animation.play('idle');
						swagBacks['foreGround5'] = foreGround5;
						layInFront[2].push(foreGround5);
					}

					}
			default:
				{
					curStage = 	PlayState.SONG.stage;
				var jsonData = Paths.loadStageJson(curStage);
				if (jsonData == null)
				{
					Debug.logError('Stage Error!');
					return;
				}
				var data:StageData = cast jsonData;
				
				camZoom = data.camzoom;
				for (stagespritelayer in data.stagesprites)
					{
						var stagenewlayer:FlxSprite = new FlxSprite(stagespritelayer.x,stagespritelayer.y).loadGraphic(Paths.image(stagespritelayer.image));
				        stagenewlayer.scrollFactor.set(0, 0);
				        stagenewlayer.antialiasing = FlxG.save.data.antialiasing;
						if(stagespritelayer.animated == true)
							{
								stagenewlayer.frames = Paths.getSparrowAtlas(stagespritelayer.sparrowatlas);
							}
						if(stagespritelayer.scrollFactor == true)
							{
								stagenewlayer.scrollFactor.set();
							}
				        swagBacks['stagenewlayer'] = stagenewlayer;
						stagenewlayer.updateHitbox();
						if(stagespritelayer.name == "stageFront")
							{
								stagenewlayer.scrollFactor.set(0.9, 0.9);
								stagenewlayer.setGraphicSize(Std.int(stagenewlayer.width * 1.1));
							}
						if(stagespritelayer.name == "stageCurtains")
							{
								stagenewlayer.scrollFactor.set(1.3, 1.3);
								stagenewlayer.setGraphicSize(Std.int(stagenewlayer.width * 0.9));
							}
						if(stagespritelayer.animated == true)
							{
								stagenewlayer.animation.play(stagespritelayer.startanim);
							}
				        toAdd.push(stagenewlayer);
					}
					
		}
	}
}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (!PlayStateChangeables.Optimize)
		{
			switch (curStage)
			{
				case 'philly':
					if (trainMoving)
					{
						trainFrameTiming += elapsed;

						if (trainFrameTiming >= 1 / 24)
						{
							updateTrainPos();
							trainFrameTiming = 0;
						}
					}
					// phillyCityLights.members[curLight].alpha -= (Conductor.crochet / 1000) * FlxG.elapsed;
			}
		}
	}

	override function stepHit()
	{
		super.stepHit();

		if (!PlayStateChangeables.Optimize)
		{
			var array = slowBacks[curStep];
			if (array != null && array.length > 0)
			{
				if (hideLastBG)
				{
					for (bg in swagBacks)
					{
						if (!array.contains(bg))
						{
							var tween = FlxTween.tween(bg, {alpha: 0}, tweenDuration, {
								onComplete: function(tween:FlxTween):Void
								{
									bg.visible = false;
								}
							});
						}
					}
					for (bg in array)
					{
						bg.visible = true;
						FlxTween.tween(bg, {alpha: 1}, tweenDuration);
					}
				}
				else
				{
					for (bg in array)
						bg.visible = !bg.visible;
				}
			}
		}
	}

	override function beatHit()
	{
		super.beatHit();

		if (FlxG.save.data.distractions && animatedBacks.length > 0)
		{
			for (bg in animatedBacks)
				bg.animation.play('idle', true);
		}

		if (!PlayStateChangeables.Optimize)
		{
			switch (curStage)
			{
				case 'halloween':
					if (FlxG.random.bool(Conductor.bpm > 320 ? 100 : 10) && curBeat > lightningStrikeBeat + lightningOffset)
					{
						if (FlxG.save.data.distractions)
						{
							lightningStrikeShit();
							trace('spooky');
						}
					}
				case 'school':
					if (FlxG.save.data.distractions)
					{
						swagBacks['bgGirls'].dance();
					}
				case 'limo':
					if (FlxG.save.data.distractions)
					{
						swagGroup['grpLimoDancers'].forEach(function(dancer:BackgroundDancer)
						{
							dancer.dance();
						});

						if (FlxG.random.bool(10) && fastCarCanDrive)
							fastCarDrive();
					}
				case "philly":
					if (FlxG.save.data.distractions)
					{
						if (!trainMoving)
							trainCooldown += 1;

						if (curBeat % 4 == 0)
						{
							var phillyCityLights = swagGroup['phillyCityLights'];
							phillyCityLights.forEach(function(light:FlxSprite)
							{
								light.visible = false;
							});

							curLight = FlxG.random.int(0, phillyCityLights.length - 1);

							phillyCityLights.members[curLight].visible = true;
							// phillyCityLights.members[curLight].alpha = 1;
						}
					}

					if (curBeat % 8 == 4 && FlxG.random.bool(Conductor.bpm > 320 ? 150 : 30) && !trainMoving && trainCooldown > 8)
					{
						if (FlxG.save.data.distractions)
						{
							trainCooldown = FlxG.random.int(-4, 0);
							trainStart();
							trace('train');
						}
					}
			}
		}
	}

	// Variables and Functions for Stages
	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;
	var curLight:Int = 0;

	function lightningStrikeShit():Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2, 'shared'));
		swagBacks['halloweenBG'].animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		if (PlayState.boyfriend != null)
		{
			PlayState.boyfriend.playAnim('scared', true);
			PlayState.gf.playAnim('scared', true);
		}
		else
		{
			GameplayCustomizeState.boyfriend.playAnim('scared', true);
			GameplayCustomizeState.gf.playAnim('scared', true);
		}
	}

	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;
	var trainSound:FlxSound;

	function trainStart():Void
	{
		if (FlxG.save.data.distractions)
		{
			trainMoving = true;
			trainSound.play(true);
		}
	}

	var startedMoving:Bool = false;

	function updateTrainPos():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (trainSound.time >= 4700)
			{
				startedMoving = true;

				if (PlayState.gf != null)
					PlayState.gf.playAnim('hairBlow');
				else
					GameplayCustomizeState.gf.playAnim('hairBlow');
			}

			if (startedMoving)
			{
				var phillyTrain = swagBacks['phillyTrain'];
				phillyTrain.x -= 400;

				if (phillyTrain.x < -2000 && !trainFinishing)
				{
					phillyTrain.x = -1150;
					trainCars -= 1;

					if (trainCars <= 0)
						trainFinishing = true;
				}

				if (phillyTrain.x < -4000 && trainFinishing)
					trainReset();
			}
		}
	}

	function trainReset():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (PlayState.gf != null)
				PlayState.gf.playAnim('hairFall');
			else
				GameplayCustomizeState.gf.playAnim('hairFall');

			swagBacks['phillyTrain'].x = FlxG.width + 200;
			trainMoving = false;
			// trainSound.stop();
			// trainSound.time = 0;
			trainCars = 8;
			trainFinishing = false;
			startedMoving = false;
		}
	}

	var fastCarCanDrive:Bool = true;

	function resetFastCar():Void
	{
		if (FlxG.save.data.distractions)
		{
			var fastCar = swagBacks['fastCar'];
			fastCar.x = -12600;
			fastCar.y = FlxG.random.int(140, 250);
			fastCar.velocity.x = 0;
			fastCar.visible = false;
			fastCarCanDrive = true;
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
    

	function fastCarDrive()
	{
		if (FlxG.save.data.distractions)
		{
			FlxG.sound.play(Paths.soundRandom('carPass', 0, 1, 'shared'), 0.7);

			swagBacks['fastCar'].visible = true;
			swagBacks['fastCar'].velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
			fastCarCanDrive = false;
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				resetFastCar();
			});
		}
	}
}

typedef StageData = {
	var camzoom:Int;
	var stagesprites:Array<StageSpriteData>;
}

typedef StageSpriteData =
{
	var name:String;
	var x:Float;
	var y:Float;
	var image:String;
	var active:Bool;
	var scrollFactor:Bool;
	var animated:Bool;
	var sparrowatlas:String;
	var startanim:String;
}
