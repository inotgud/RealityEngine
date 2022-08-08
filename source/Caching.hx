
package;

import lime.app.Application;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets as OpenFlAssets;
import flixel.ui.FlxBar;
import haxe.Exception;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
#if FEATURE_FILESYSTEM
import sys.FileSystem;
import sys.io.File;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.input.keyboard.FlxKey;

using StringTools;

class Caching extends MusicBeatState
{
	var toBeDone = 0;
	var done = 0;

	var loaded = false;

	var text:FlxText;
	var RealityLogo:FlxSprite;

	public static var bitmapData:Map<String, FlxGraphic>;

	var images = [];
	var music = [];
	var charts = [];

	override function create()
	{
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

		bitmapData = new Map<String, FlxGraphic>();

		text = new FlxText(FlxG.width / 2, FlxG.height / 2 + 300, 0, "Loading...");
		text.size = 34;
		text.alignment = FlxTextAlign.CENTER;
		text.alpha = 0;

		RealityLogo = new FlxSprite(FlxG.width / 2, FlxG.height / 2).loadGraphic(Paths.loadImage('RealityEngineLogo'));
		RealityLogo.x -= RealityLogo.width / 2;
		RealityLogo.y -= RealityLogo.height / 2 + 100;
		text.y -= RealityLogo.height / 2 - 125;
		text.x -= 170;
		RealityLogo.setGraphicSize(Std.int(RealityLogo.width * 0.6));
		if (FlxG.save.data.antialiasing != null)
			RealityLogo.antialiasing = FlxG.save.data.antialiasing;
		else
			RealityLogo.antialiasing = true;

		RealityLogo.alpha = 0;

		FlxGraphic.defaultPersist = FlxG.save.data.cacheImages;

		#if FEATURE_FILESYSTEM
		if (FlxG.save.data.cacheImages)
		{
			

			// TODO: Refactor this to use OpenFlAssets.
			for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters")))
			{
				if (!i.endsWith(".png"))
					continue;
				images.push(i);
			}

			for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/noteskins")))
			{
				if (!i.endsWith(".png"))
					continue;
				images.push(i);
			}
		}

	

		// TODO: Get the song list from OpenFlAssets.
		music = Paths.listSongsToCache();
		#end

		toBeDone = Lambda.count(images) + Lambda.count(music);

		var bar = new FlxBar(10, FlxG.height - 50, FlxBarFillDirection.LEFT_TO_RIGHT, FlxG.width, 40, null, "done", 0, toBeDone);
		bar.color = FlxColor.PURPLE;

		add(bar);

		add(RealityLogo);
		add(text);

		

		#if FEATURE_MULTITHREADING
		// update thread

		sys.thread.Thread.create(() ->
		{
			while (!loaded)
			{
				if (toBeDone != 0 && done != toBeDone)
				{
					var alpha = HelperFunctions.truncateFloat(done / toBeDone * 100, 2) / 100;
					RealityLogo.alpha = alpha;
					text.alpha = alpha;
					text.text = "Loading... (" + done + "/" + toBeDone + ")";
				}
			}
		});

		// cache thread
		sys.thread.Thread.create(() ->
		{
			cache();
		});
		#end

		super.create();
	}

	var calledDone = false;

	override function update(elapsed)
	{
		super.update(elapsed);
	}

	function cache()
	{
		#if FEATURE_FILESYSTEM
		

		for (i in images)
		{
			var replaced = i.replace(".png", "");

			// var data:BitmapData = BitmapData.fromFile("assets/shared/images/characters/" + i);
			var imagePath = Paths.image('characters/$i', 'shared');
			
			var data = OpenFlAssets.getBitmapData(imagePath);
			var graph = FlxGraphic.fromBitmapData(data);
			graph.persist = true;
			graph.destroyOnNoUse = false;
			bitmapData.set(replaced, graph);
			done++;
		}

		for (i in music)
		{
			var inst = Paths.inst(i);
			if (Paths.doesSoundAssetExist(inst))
			{
				FlxG.sound.cache(inst);
			}

			var voices = Paths.voices(i);
			if (Paths.doesSoundAssetExist(voices))
			{
				FlxG.sound.cache(voices);
			}

			done++;
		}

		

		loaded = true;


		FlxG.switchState(new TitleState());
	}
}
#end
