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

using StringTools;

class Handler
{
	public static function crash(error:String)
		{
            Debug.displayAlert("Reality Crash Handler", error);
		}

}