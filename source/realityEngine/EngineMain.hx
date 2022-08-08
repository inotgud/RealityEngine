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

class EngineMain
{

	public static function discordClient(discord:String)
		{
			#if FEATURE_DISCORD
			DiscordClient.changePresence(discord, null);
			#end
		}

}