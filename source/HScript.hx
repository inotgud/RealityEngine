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
import sys.FileSystem;
import sys.io.File;

using StringTools;

class HScript extends MusicBeatState
{            
    public static var interp:Interp;

    public function new(file:String)
    {
        var expr = file;
        //HScript
		var parser = new hscript.Parser();
		interp = new Interp();
		var ast = parser.parseString(expr);
		interp.variables.set("add", add);
        interp.variables.set("remove", remove);
        interp.variables.set("DiscordClient", DiscordClient);
        interp.variables.set("FlxG", flixel.FlxG);
        interp.variables.set("CustomState", CustomState);
        interp.variables.set("FlxButton", flixel.ui.FlxButton);
        interp.variables.set("Character", Character);
        interp.variables.set("FlxGame", flixel.FlxGame);
		interp.variables.set("FlxObject", flixel.FlxObject);
		interp.variables.set("FlxSprite", flixel.FlxSprite);
		interp.variables.set("FlxState", flixel.FlxState);
		interp.variables.set("FlxSubState", flixel.FlxSubState);
	    interp.variables.set("FlxGridOverlay", flixel.addons.display.FlxGridOverlay);
		interp.variables.set("FlxTrail", flixel.addons.effects.FlxTrail);
        interp.variables.set("Paths", Paths);
        interp.variables.set("Stage", Stage);
        interp.variables.set("PlayState", PlayState);
        interp.variables.set("HScript", HScript);
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
        interp.variables.set("beatHit", function()
						{
						});

        interp.execute(ast);
        trace( interp.execute(program) ); 

        super();
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
