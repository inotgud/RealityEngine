package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import openfl.desktop.ClipboardTransferMode;
import openfl.desktop.ClipboardFormats;
import openfl.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.FlxSubState;
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
import miniGames.MiniGamesState;

using StringTools;

class EditorsMainButton extends FlxButton{

}
class EditorsMain extends MusicBeatSubstate
{
    var bg2:FlxSprite;
    var bg3:FlxSprite;
    var bg:FlxSprite;
	override function create(){
        bg2 = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg2.alpha = 0.6;
		bg2.scrollFactor.set();
		add(bg2);
        bg = new FlxSprite(-100).loadGraphic(Paths.loadImage('no/menuBGSub'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.scrollFactor.set();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);
        FlxG.mouse.visible = true;
        var button2:FlxButton = new FlxButton(155, 115, "Stage Editor", function(){
			MainMenuState.Editorsmainyes = false;
			FlxG.switchState(new engineEditors.StageEditor());
		});
        add(button2);

		var button3:FlxButton = new FlxButton(155, 140, "Character E", function(){
			MainMenuState.Editorsmainyes = false;
			MainMenuState.Editorsnull = true;
			FlxG.switchState(new engineEditors.CharacterEditor());
		});
        add(button3);

		var button4:FlxButton = new FlxButton(155, 165, "Week Editor", function(){
			MainMenuState.Editorsmainyes = false;
			MainMenuState.Editorsnull = true;
			FlxG.switchState(new engineEditors.WeekEditor());
		});
        add(button4);

		var button5:FlxButton = new FlxButton(155, 190, "Mini Games", function(){
			MainMenuState.Editorsmainyes = false;
			FlxG.switchState(new miniGames.MiniGamesState());
		});
        add(button5);

		var button6:FlxButton = new FlxButton(155, 215, "Event Editor", function(){
			MainMenuState.Editorsmainyes = false;
			FlxG.switchState(new engineEditors.MidSongEventEditor());
		});
        add(button6);

		var button8:FlxButton = new FlxButton(155, 240, "Credits Editor", function(){
			Debug.displayAlert("Credits Editor", "Credits Editor is under maintenance for a while, add credits from json. Sorry for that");
		});
        add(button8);

		var button7:FlxButton = new FlxButton(155, 265, "Other...", function(){
			MainMenuState.Editorsmainyes = false;
			FlxG.switchState(new EngineEditorsState());
		});
        add(button7);

		/*
		var close:FlxButton = new FlxButton(310, 50, "X", function(){
			MainMenuState.Editorsmainyes = false;
			close();
		});
		close.color = FlxColor.RED;
        add(close);
		*/
        
		super.create();
    }
    override function update(elapsed:Float){
		if(controls.BACK)
			{
				MainMenuState.Editorsmainyes = false;
				close();
			}
		super.update(elapsed);
    }

    function stageEditorFunc():Void
		{
			
		}
}