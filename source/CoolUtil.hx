package;

import flixel.FlxG;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import flixel.FlxState;
import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ['Easy', "Normal", "Hard", "Insane"];

	public static var daPixelZoom:Float = 6;
    
	public static var difficulties:Array<String> = [];

	public static function difficultyFromInt(difficulty:Int):String
	{
		return difficultyArray[difficulty];
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = OpenFlAssets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	inline public static function boundTo(value:Float, min:Float, max:Float):Float {
		return Math.max(min, Math.min(max, value));
	}
	
	public static function coolStringFile(path:String):Array<String>
	{
		var daList:Array<String> = path.trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}



	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

           public static function browserLoad(site:String) {
		#if linux
		Sys.command('/usr/bin/xdg-open', [site]);
		#else
		FlxG.openURL(site);
		#end
	}

	public static function addBG(f:FlxState) {
		var p = Paths.image("menuBG");
		if (!Assets.exists(p)) p = Paths.image("menuBG");
		var bg = new FlxSprite(0,0).loadGraphic(p);
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.screenCenter();
		bg.antialiasing = true;
		f.add(bg);
		return bg;
	}

	public static function addBG2(f:FlxState) {
		var p = Paths.image("stageback");
		if (!Assets.exists(p)) p = Paths.image("stageback");
		var bg = new FlxSprite(0,0).loadGraphic(p);
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.screenCenter();
		bg.antialiasing = true;
		f.add(bg);
		return bg;
	}

	public static function cameraZoom(target, zoomLevel:Float, speed, style, type)
		{
			FlxTween.tween(target, {zoom: zoomLevel}, speed, {ease: style, type: type});
		}
}
