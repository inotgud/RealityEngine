package realityEngine;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
import haxe.Json;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
#if sys
import sys.FileSystem;
import sys.io.File;
#end
using StringTools;

class Script
{

	public static function createRealitySprite(image:String, locX:Int, locY:Int, visible:Bool)
		{
			var RealitySprite:FlxSprite = new FlxSprite(Std.parseInt(locX), Std.parseInt(locY)).loadGraphic(Paths.loadImage(image));
            if(visible == true)
                {
                    RealitySprite.visible = true;
                }
            if(visible == false)
                {
                    RealitySprite.visible = false;
                }
            if(visible == null)
                 {
                    RealitySprite.visible = true;
                }
            add(RealitySprite);
		}
    public static function bgLoad(image:String, colored:Bool)
        {
            var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage(image));
            bg.scrollFactor.x = 0;
            bg.scrollFactor.y = 0.10;
            bg.setGraphicSize(Std.int(bg.width * 1.1));
            bg.updateHitbox();
            bg.screenCenter();
            bg.antialiasing = FlxG.save.data.antialiasing;
            if(colored == true)
                {
                    bg.color = FlxG.random.color();
                }
            add(bg);
        }
    public static function loadFuckScript(scriptPath:String)
        {
            if(sys.FileSystem.exists(scriptPath + "/browserLoad.txt"))
                {
                    var browserLink:String = sys.io.File.getContent(scriptPath + "/browserLoad.txt");
                    CoolUtil.browserLoad(browserLink);
                }
            if(sys.FileSystem.exists(scriptPath + "/switchState.txt"))
                {
                    var switched:String = sys.io.File.getContent(scriptPath + "/switchState.txt");
                    if(switched == "MainMenuState")
                        {
                            FlxG.switchState(new MainMenuState());
                        }
                    if(switched == "FreeplayState")
                        {
                            FlxG.switchState(new FreeplayState());
                        }
                    if(switched == "ModsMenuState")
                        {
                            FlxG.switchState(new ModsMenuState());
                        }
                    if(switched == "EngineEditorsState")
                        {
                            FlxG.switchState(new EngineEditorsState());
                        }
                    if(switched == "EditorsMain")
                        {
                            openSubState(new EditorsMain());
                        }
                }
             var RealitySprites:String = "";
             var spriteCount:Int = sys.io.File.getContent(scriptPath + "/spriteCount.txt");
             var xsprite:Int = sys.io.File.getContent(scriptPath + "/FlxSprite" + spriteCount + "/spriteX.txt");
             var ysprite:Int = sys.io.File.getContent(scriptPath + "/FlxSprite" + spriteCount + "/spriteY.txt");
             var imagse:String = sys.io.File.getContent(scriptPath + "/FlxSprite" + spriteCount + "/image.txt");
                switch (RealitySprites)
                {
                    default: {
                        if(spriteCount == 0)
                            {

                            }
                            else{
                                createRealitySprite(imagse, xsprite,ysprite, true);
                            }
                       
                    }
                    
                }
        }

}