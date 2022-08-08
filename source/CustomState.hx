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
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
#if sys
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

class CustomState extends MusicBeatState
{
    public static var char1:Character = null;
	#if sys
	public static var hmmmmmmmmmmmmmmmm:String = sys.io.File.getContent('assets/data/language.txt');
	public static var language:String = hmmmmmmmmmmmmmmmm;
	#end
   
    var h5:Bool = false;
    var h6:Bool = false;
    var eventsEnter = false;
    
            
    var interp:Interp = new Interp();

    public static var statename:String;

	public static var hmmbool:Bool;

    override function create()
    {
        //set custom state jsons
        var jsonData = Paths.loadStateJson(statename);
				var data:StateData = cast jsonData;
                realityEngine.EngineMain.discordClient(data.rpc);
				if(data.escapeback == true)
					{
						hmmbool = true;
					}
				for (statespritelayer in data.flxsprites)
					{
						var newstatelayer:FlxSprite = new FlxSprite(statespritelayer.x,statespritelayer.y).loadGraphic(Paths.image(statespritelayer.image));
				        newstatelayer.scrollFactor.set(0, 0);
				        newstatelayer.antialiasing = FlxG.save.data.antialiasing;
						if(statespritelayer.animated == true)
							{
								newstatelayer.frames = Paths.getSparrowAtlas(statespritelayer.sparrowatlas);
							}
						if(statespritelayer.scrollFactor == true)
							{
								newstatelayer.scrollFactor.set();
							}
						newstatelayer.updateHitbox();
				        add(newstatelayer);
					}
                for (statetextlayer in data.flxtext)
					{
                        var shittext:FlxText = new FlxText(statetextlayer.x,statetextlayer.y, 0, statetextlayer.text, statetextlayer.size);
                        shittext.scrollFactor.set();
                        shittext.font = statetextlayer.font;
                        add(shittext);
					}
				 for (alphabetlayer in data.alphabets)
					{	               
						var newalphabetlayer:Alphabet = new Alphabet(alphabetlayer.x, alphabetlayer.y,alphabetlayer.text, true, false);
						if(alphabetlayer.isMenuItem == true)
						{
						      newalphabetlayer.isMenuItem = true;
						}
						add(newalphabetlayer);
					}
		
					if(FileSystem.exists(Paths.hx('custom/custom_states/${statename}')))
						{
							var expr = File.getContent(Paths.hx('custom/custom_states/' + statename));
							var parser = new hscript.Parser();
							parser.allowTypes = true;
							parser.allowJSON = true;
							parser.allowMetadata = true;
							endHscript();
							var ast = parser.parseString(expr);
			
							interp.execute(ast);
						}
			
					hscriptApply('create');
					
		super.create();
    }
	//hscript (haxescript.hx) functions
	public function newHSSprite(xSpr:Float,ySpr:Float,image:String,?spritesheetbool:Bool, ?idleanim:String)
		{
			if(spritesheetbool == null)
				{
					spritesheetbool = false;
				}
			var newFlxSprite:FlxSprite = new FlxSprite(xSpr,ySpr);
			if(spritesheetbool == true)
				{
					newFlxSprite.frames = Paths.getSparrowAtlas(image);
				}
			else{
				newFlxSprite.loadGraphic(Paths.loadImage(image));
			}
			if(spritesheetbool == true)
				{
					newFlxSprite.animation.addByPrefix('idle', idleanim);
					newFlxSprite.animation.play('idle');
				}
			add(newFlxSprite);
		}
	public function newHSText(xSprText:Float,ySprText:Float,hsText:String,sizeHS:Int, ?scrollFactorBool:Bool)
	{
		if(scrollFactorBool == null)
			{
				scrollFactorBool == false;
			}
	    var newFlxText:FlxText = new FlxText(xSprText,ySprText,0,hsText,sizeHS);
		if(scrollFactorBool == true)
			{
				newFlxText.scrollFactor.set();
			}
		else{

		}
		add(newFlxText);
	}
	public function endHscript()
		{
			interp.variables.set("newHSSprite", newHSSprite);
			interp.variables.set("newHSText", newHSText);
			interp.variables.set("add", add);
			interp.variables.set("statename", statename);
			interp.variables.set("remove", remove);
			interp.variables.set("MusicBeatState", MusicBeatState);
			interp.variables.set("PlayState", PlayState);
			interp.variables.set("DiscordClient", DiscordClient);
			interp.variables.set("WiggleEffectType", WiggleEffect.WiggleEffectType);
			interp.variables.set("FlxBasic", flixel.FlxBasic);
			interp.variables.set("FlxCamera", flixel.FlxCamera);
			interp.variables.set("FlxG", flixel.FlxG);
			interp.variables.set("FlxGame", flixel.FlxGame);
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
			interp.variables.set("FlxTypedGroup", flixel.group.FlxGroup.FlxTypedGroup);
			interp.variables.set("FlxMath", flixel.math.FlxMath);
			interp.variables.set("FlxPoint", flixel.math.FlxPoint);
			interp.variables.set("FlxText", flixel.text.FlxText);
			interp.variables.set("CustomState", CustomState);
			interp.variables.set("FlxEase", flixel.tweens.FlxEase);
			interp.variables.set("FlxTween", flixel.tweens.FlxTween);
			interp.variables.set("FlxBar", flixel.ui.FlxBar);
			interp.variables.set("FlxCollision", flixel.util.FlxCollision);
			interp.variables.set("FlxSort", flixel.util.FlxSort);
			interp.variables.set("FlxStringUtil", flixel.util.FlxStringUtil);
			interp.variables.set("FlxTimer", flixel.util.FlxTimer);
			interp.variables.set("FlxRect", flixel.math.FlxRect);
			interp.variables.set("FlxObject", flixel.FlxObject);
			interp.variables.set("FlxSound", flixel.system.FlxSound);
			interp.variables.set("Assets", lime.utils.Assets);
			interp.variables.set("ShaderFilter", openfl.filters.ShaderFilter);
			interp.variables.set("Exception", haxe.Exception);
			interp.variables.set("CurrentPlayState", this);
			interp.variables.set("OpenFlAssets", openfl.utils.Assets);
			interp.variables.set("Parser", hscript.Parser);
			interp.variables.set("Interp", hscript.Interp);
			interp.variables.set("Paths", Paths);
			#if sys
			//sys system
			interp.variables.set("File", sys.io.File);
			interp.variables.set("FileSystem", sys.FileSystem);
			interp.variables.set("FlxGraphic", flixel.graphics.FlxGraphic);
			interp.variables.set("BitmapData", openfl.display.BitmapData);
			#end
			interp.variables.set("create", function()
				{
				});
				interp.variables.set("update", function(elapsed:Float)
				{
				});
				interp.variables.set("stepHit", function()
				{
				});
				interp.variables.set("beatHit", function()
				{
				});
		}

		public function hscriptApply(functionToCall:String, ?params:Array<Any>):Dynamic
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

    override function update(elapsed:Float)
    {
		if(hmmbool == true)
			{
				if(FlxG.keys.justPressed.ESCAPE)
					{
						FlxG.switchState(new MainMenuState());
					}
			}
		hscriptApply("update");
        super.update(elapsed);
    }
    
	override function beatHit()
		{
			hscriptApply('beatHit');
			super.beatHit();
		}
	override function stepHit()
		{
			hscriptApply('stepHit');
		}
}

typedef StateData = {
	var escapeback:Bool;
    var rpc:String;
    var flxsprites:Array<Sprites>;
    var flxtext:Array<Texts>;
	var alphabets:Array<Alphabets>;
}

typedef Sprites =
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

typedef Texts =
{
	var name:String;
	var x:Float;
	var y:Float;
	var text:String;
    var font:String;
    var size:Int;
}

typedef Alphabets =
{
	var name:String;
	var x:Float;
	var y:Float;
	var text:String;
    var isMenuItem:Bool;
}
