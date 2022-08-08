package;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
import haxe.Json;

using StringTools;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	static var currentLevel:String;

	static public function setCurrentLevel(name:String)
	{
		currentLevel = name.toLowerCase();
	}

	public static function getPath(file:String, type:AssetType, library:Null<String>)
	{
		if (library != null)
			return getLibraryPath(file, library);

		if (currentLevel != null)
		{
			var levelPath = getLibraryPathForce(file, currentLevel);
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;

			levelPath = getLibraryPathForce(file, "shared");
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;
		}

		return getPreloadPath(file);
	}

	/**
	 * For a given key and library for an image, returns the corresponding BitmapData.
	 		* We can probably move the cache handling here.
	 * @param key 
	 * @param library 
	 * @return BitmapData
	 */

	static public function loadImage(key:String, ?library:String):FlxGraphic
	{
		var path = image(key, library);

		#if FEATURE_FILESYSTEM
		if (Caching.bitmapData != null)
		{
			if (Caching.bitmapData.exists(key))
			{
				Debug.logTrace('Loading image from bitmap cache: $key');
				// Get data from cache.
				return Caching.bitmapData.get(key);
			}
		}
		#end

		if (OpenFlAssets.exists(path, IMAGE))
		{
			var bitmap = OpenFlAssets.getBitmapData(path);
			return FlxGraphic.fromBitmapData(bitmap);
		}
		else
		{
			Debug.logWarn('Could not find image at path $path');
			return null;
		}
	}

	static public function loadJSON(key:String, ?library:String):Dynamic
	{
		var rawJson = OpenFlAssets.getText(Paths.json(key, library)).trim();

		// Perform cleanup on files that have bad data at the end.
		while (!rawJson.endsWith("}"))
		{
			rawJson = rawJson.substr(0, rawJson.length - 1);
		}

		try
		{
			// Attempt to parse and return the JSON data.
			return Json.parse(rawJson);
		}
		catch (e)
		{
			Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
			Debug.logError(e.message);

			// Return null.
			return null;
		}
	}

	static public function loadWeekJSON(key:String, ?library:String):Dynamic
		{
			var rawJson = OpenFlAssets.getText(Paths.jsonWeek(key, library)).trim();
	
			// Perform cleanup on files that have bad data at the end.
			while (!rawJson.endsWith("}"))
			{
				rawJson = rawJson.substr(0, rawJson.length - 1);
			}
	
			try
			{
				// Attempt to parse and return the JSON data.
				return Json.parse(rawJson);
			}
			catch (e)
			{
				Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
				Debug.logError(e.message);
	
				// Return null.
				return null;
			}
		}

	static public function loadCharacterJSON(key:String, ?library:String):Dynamic
		{
			var rawJson = OpenFlAssets.getText(Paths.jsonChar(key, library)).trim();
	
			// Perform cleanup on files that have bad data at the end.
			while (!rawJson.endsWith("}"))
			{
				rawJson = rawJson.substr(0, rawJson.length - 1);
			}
	
			try
			{
				// Attempt to parse and return the JSON data.
				return Json.parse(rawJson);
			}
			catch (e)
			{
				Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
				Debug.logError(e.message);
	
				// Return null.
				return null;
			}
		}

		static public function loadStageJson(key:String, ?library:String):Dynamic
			{
				var rawJson = OpenFlAssets.getText(Paths.jsonstage(key, library)).trim();
		
				// Perform cleanup on files that have bad data at the end.
				while (!rawJson.endsWith("}"))
				{
					rawJson = rawJson.substr(0, rawJson.length - 1);
				}
		
				try
				{
					// Attempt to parse and return the JSON data.
					return Json.parse(rawJson);
				}
				catch (e)
				{
					Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
					Debug.logError(e.message);
		
					// Return null.
					return null;
				}
			}

			static public function loadOptionsJson(key:String, ?library:String):Dynamic
				{
					var rawJson = OpenFlAssets.getText(Paths.jsonoptions(key, library)).trim();
			
					// Perform cleanup on files that have bad data at the end.
					while (!rawJson.endsWith("}"))
					{
						rawJson = rawJson.substr(0, rawJson.length - 1);
					}
			
					try
					{
						// Attempt to parse and return the JSON data.
						return Json.parse(rawJson);
					}
					catch (e)
					{
						Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
						Debug.logError(e.message);
			
						// Return null.
						return null;
					}
				}

			static public function loadStateJson(key:String, ?library:String):Dynamic
				{
					var rawJson = OpenFlAssets.getText(Paths.jsonstate(key, library)).trim();
			
					// Perform cleanup on files that have bad data at the end.
					while (!rawJson.endsWith("}"))
					{
						rawJson = rawJson.substr(0, rawJson.length - 1);
					}
			
					try
					{
						// Attempt to parse and return the JSON data.
						return Json.parse(rawJson);
					}
					catch (e)
					{
						Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
						Debug.logError(e.message);
			
						// Return null.
						return null;
					}
				}

				static public function loadMenuChar(key:String, ?library:String):Dynamic
					{
						var rawJson = OpenFlAssets.getText(Paths.jsonmenuchar(key, library)).trim();
				
						// Perform cleanup on files that have bad data at the end.
						while (!rawJson.endsWith("}"))
						{
							rawJson = rawJson.substr(0, rawJson.length - 1);
						}
				
						try
						{
							// Attempt to parse and return the JSON data.
							return Json.parse(rawJson);
						}
						catch (e)
						{
							Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
							Debug.logError(e.message);
				
							// Return null.
							return null;
						}
					}

				static public function loadCustomGameJson(key:String, ?library:String):Dynamic
					{
						var rawJson = OpenFlAssets.getText(Paths.jsoncustomgame(key, library)).trim();
				
						// Perform cleanup on files that have bad data at the end.
						while (!rawJson.endsWith("}"))
						{
							rawJson = rawJson.substr(0, rawJson.length - 1);
						}
				
						try
						{
							// Attempt to parse and return the JSON data.
							return Json.parse(rawJson);
						}
						catch (e)
						{
							Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
							Debug.logError(e.message);
				
							// Return null.
							return null;
						}
					}
	
	
	static public function loadJSON2(key:String, ?library:String):Dynamic
		{
			var rawJson = OpenFlAssets.getText(Paths.json2(key, library)).trim();
	
			// Perform cleanup on files that have bad data at the end.
			while (!rawJson.endsWith("}"))
			{
				rawJson = rawJson.substr(0, rawJson.length - 1);
			}
	
			try
			{
				// Attempt to parse and return the JSON data.
				return Json.parse(rawJson);
			}
			catch (e)
			{
				Debug.logError("AN ERROR OCCURRED parsing a JSON file.");
				Debug.logError(e.message);
	
				// Return null.
				return null;
			}
		}

	static public function getLibraryPath(file:String, library = "preload")
	{
		return if (library == "preload" || library == "default") getPreloadPath(file); else getLibraryPathForce(file, library);
	}

	inline static function getLibraryPathForce(file:String, library:String)
	{
		return '$library:assets/$library/$file';
	}

	inline static function getPreloadPath(file:String)
	{
		return 'assets/$file';
	}

	inline static public function ihateee(path:String) {
		return path.toLowerCase().replace(' ', '-');
	}

	inline static public function file(file:String, ?library:String, type:AssetType = TEXT)
	{
		return getPath(file, type, library);
	}

	inline static public function lua(key:String, ?library:String)
	{
		return getPath('data/$key.lua', TEXT, library);
	}

	inline static public function hx(key:String, ?library:String)
		{
			return getPath('$key.hx', TEXT, library);
		}

	inline static public function formatToSongPath(path:String)
		{
			return path.toLowerCase().replace(' ', '-');
		}

	inline static public function RealityJson(key:String, ?library:String)
		{
			return getPath('$key.json', TEXT, library);
		}

	inline static public function video(key:String, ?library:String)
		{
			trace('assets/videos/$key.mp4');
			return getPath('videos/$key.mp4', BINARY, library);
		}
	inline static public function luaImage(key:String, ?library:String)
	{
		return getPath('data/$key.png', IMAGE, library);
	}

	inline static public function txt(key:String, ?library:String)
	{
		return getPath('$key.txt', TEXT, library);
	}

	inline static public function weektxt(key:String, ?library:String)
	{
		return getPath('custom/custom_weeks/weekSettings/$key.txt', TEXT, library);
	}

	inline static public function xml(key:String, ?library:String)
	{
		return getPath('data/$key.xml', TEXT, library);
	}

	inline static public function json(key:String, ?library:String)
	{
		return getPath('data/$key.json', TEXT, library);
	}

	inline static public function weekcustomjson(key:String, ?library:String)
	{
		return getPath('custom/custom_weeks/$key.json', TEXT, library);
	}

	inline static public function jsonWeek(key:String, ?library:String)
		{
			return getPath('custom/$key.json', TEXT, library);
		}

	inline static public function jsonChar(key:String, ?library:String)
		{
			return getPath('custom/$key.json', TEXT, library);
		}

	inline static public function jsonmenuchar(key:String, ?library:String)
		{
			return getPath('custom/custom_menu_characters/$key.json', TEXT, library);
		}
	inline static public function jsonstage(key:String, ?library:String)
		{
			return getPath('custom/custom_stages/$key.json', TEXT, library);
		}
	inline static public function jsonoptions(key:String, ?library:String)
		{
			return getPath('data/options/$key.json', TEXT, library);
		}
	inline static public function jsonstate(key:String, ?library:String)
		{
			return getPath('custom/custom_states/$key.json', TEXT, library);
		}
	inline static public function jsoncustomgame(key:String, ?library:String)
		{
			return getPath('custom/custom_game/$key.json', TEXT, library);
		}

	inline static public function json2(key:String, ?library:String)
	{
		return getPath('custom/custom_game/$key.json', TEXT, library);
	}

	static public function sound(key:String, ?library:String)
	{
		return getPath('sounds/$key.$SOUND_EXT', SOUND, library);
	}

	inline static public function soundRandom(key:String, min:Int, max:Int, ?library:String)
	{
		return sound(key + FlxG.random.int(min, max), library);
	}

	inline static public function music(key:String, ?library:String)
	{
		return getPath('music/$key.$SOUND_EXT', MUSIC, library);
	}

	inline static public function voices(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
			case 'm.i.l.f':
				songLowercase = 'milf';
		}
		var result = 'songs:assets/songs/${songLowercase}/Voices.$SOUND_EXT';
		// Return null if the file does not exist.
		return doesSoundAssetExist(result) ? result : null;
	}

             
	inline static public function inst(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
			case 'm.i.l.f':
				songLowercase = 'milf';
		}
		return 'songs:assets/songs/${songLowercase}/Inst.$SOUND_EXT';
	}

	static public function listSongsToCache()
	{
		// We need to query OpenFlAssets, not the file system, because of Polymod.
		var soundAssets = OpenFlAssets.list(AssetType.MUSIC).concat(OpenFlAssets.list(AssetType.SOUND));

		// TODO: Maybe rework this to pull from a text file rather than scan the list of assets.
		var songNames = [];

		for (sound in soundAssets)
		{
			// Parse end-to-beginning to support mods.
			var path = sound.split('/');
			path.reverse();

			var fileName = path[0];
			var songName = path[1];

			if (path[2] != 'songs')
				continue;

			// Remove duplicates.
			if (songNames.indexOf(songName) != -1)
				continue;

			songNames.push(songName);
		}

		return songNames;
	}

	static public function doesSoundAssetExist(path:String)
	{
		if (path == null || path == "")
			return false;
		return OpenFlAssets.exists(path, AssetType.SOUND) || OpenFlAssets.exists(path, AssetType.MUSIC);
	}

	inline static public function doesTextAssetExist(path:String)
	{
		return OpenFlAssets.exists(path, AssetType.TEXT);
	}

	inline static public function image(key:String, ?library:String)
	{
		return getPath('images/$key.png', IMAGE, library);
	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}

	static public function getSparrowAtlas(key:String, ?library:String, ?isCharacter:Bool = false)
	{
		if (isCharacter)
		{
			return FlxAtlasFrames.fromSparrow(loadImage('characters/$key', library), file('images/characters/$key.xml', library));
		}
		return FlxAtlasFrames.fromSparrow(loadImage(key, library), file('images/$key.xml', library));
	}

	static public function getskinSparrowAtlas(key:String, ?library:String, ?isCharacter:Bool = false)
		{
			library = "skins";
			return FlxAtlasFrames.fromSparrow(loadImage(key, library), file('images/$key.xml', library));
		}

	static public function getSkinSparrowAtlas(key:String, ?library:String, ?isCharacter:Bool = false)
		{
			library = "skins";
			if (isCharacter)
			{
				return FlxAtlasFrames.fromSparrow(loadImage('characters/$key', library), file('images/characters/$key.xml', library));
			}
			return FlxAtlasFrames.fromSparrow(loadImage(key, library), file('images/$key.xml', library));
		}

	/**
	 * Senpai in Thorns uses this instead of Sparrow and IDK why.
	 */
	inline static public function getPackerAtlas(key:String, ?library:String, ?isCharacter:Bool = false)
	{
		if (isCharacter)
		{
			return FlxAtlasFrames.fromSpriteSheetPacker(loadImage('characters/$key', library), file('images/characters/$key.txt', library));
		}
		return FlxAtlasFrames.fromSpriteSheetPacker(loadImage(key, library), file('images/$key.txt', library));
	}
}