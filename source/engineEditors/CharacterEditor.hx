package engineEditors;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import openfl.desktop.ClipboardTransferMode;
import openfl.desktop.ClipboardFormats;
import openfl.desktop.Clipboard;
import flixel.ui.FlxButton;
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
#if FEATURE_DISCORD
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import sys.io.File;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.FlxUITabMenu;


using StringTools;

class CharacterEditor extends MusicBeatState
{
    var isblocked:Bool = false;
    var enabledchar:Bool = false;
    var characterlisttxt:String = sys.io.File.getContent("assets/data/characterList.txt");
    public static var hmmm:String = sys.io.File.getContent('assets/images/no/novar/a.txt');
    //Strings
    var characters:Array<String> = CoolUtil.coolTextFile(Paths.txt('data/characterList'));
    var selectedChar:String;
    var code:String;
    //Characters
    var char1:Character;
    //UI_BOX
    var UI_box:FlxUITabMenu;
    //Texts
    var versionShit:FlxText;
    override function create()
    {
        #if FEATURE_DISCORD
        DiscordClient.changePresence("Character Editor", null);
        #end
        //stage
        var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.loadImage('stageback', 'shared'));
        bg.antialiasing = FlxG.save.data.antialiasing;
        bg.scrollFactor.set(0.9, 0.9);
        bg.active = false;
        add(bg);

        var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.loadImage('stagefront', 'shared'));
        stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
        stageFront.updateHitbox();
        stageFront.antialiasing = FlxG.save.data.antialiasing;
        stageFront.scrollFactor.set(0.9, 0.9);
        stageFront.active = false;
        add(stageFront);

        var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.loadImage('stagecurtains', 'shared'));
        stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
        stageCurtains.updateHitbox();
        stageCurtains.antialiasing = FlxG.save.data.antialiasing;
        stageCurtains.scrollFactor.set(1.3, 1.3);
        stageCurtains.active = false;
        add(stageCurtains);
        //---------------------------------
        var tabs = [
			{name: "Character", label: 'Character'},
		];
        UI_box = new FlxUITabMenu(null, tabs, true);
		UI_box.scrollFactor.set();
		UI_box.resize(300, 400);
		UI_box.x = FlxG.width / 2 + 40;
		UI_box.y = 20;
		add(UI_box);
		UI_box.x += 250;

        var player1DropDown = new FlxUIDropDownMenu(10, 100, FlxUIDropDownMenu.makeStrIdLabelArray(characters, true), function(character:String)
            {
                selectedChar = characters[Std.parseInt(character)];
                remove(char1);
                char1 = new Character(500, 300, selectedChar, true);
                switch(char1.curCharacter)
                {
                    case 'senpai':
                        char1.setGraphicSize(Std.int(char1.width * 6));
                        char1.updateHitbox();
                        char1.antialiasing = false;
                    case 'dad':
                        char1.y -= 310;
                    case 'gf':
                        char1.flipX = true;
                }
                char1.setGraphicSize(Std.int(char1.width * 0.8));
                add(char1);
                char1.updateHitbox();
                char1.dance();
                enabledchar = true;
            });
            player1DropDown.selectedLabel = selectedChar;
        UI_box.add(player1DropDown);

		versionShit = new FlxText(5, FlxG.height - 18, 0, "Controls - Zooms E/Q | Location Down/Up | Press M to create character", 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

        super.create();
    }
    override public function update(elapsed:Float)
        {
            if(enabledchar)
                {
                    if(FlxG.keys.justPressed.UP)
                        {
                            char1.y -= 20;
                        }
                    if(FlxG.keys.justPressed.DOWN)
                        {
                            char1.y += 20;
                        }
                }

            if (FlxG.keys.pressed.E) 
                {
                    FlxG.camera.zoom += elapsed * FlxG.camera.zoom;
                }
                if (FlxG.keys.pressed.Q) 
                {
                    FlxG.camera.zoom -= elapsed * FlxG.camera.zoom;
                }
            if(isblocked == true)
                {

                }
                else{
                    if (FlxG.keys.justPressed.M)
                        {
                            characterCreator();
                        }
                }
            if(FlxG.keys.justPressed.ESCAPE)
                {
                    FlxG.switchState(new MainMenuState());
                }
            super.update(elapsed);
        }
        //everything xd
    var save:FlxButton;
    var eventName:FlxUIInputText;
    var swagBG:FlxSprite;
    function characterCreator()
        {
            swagBG = new FlxSprite().makeGraphic(1000, 500, FlxColor.BLACK, false);
            swagBG.screenCenter();
            swagBG.scrollFactor.set();
            swagBG.alpha = 0.5;
            add(swagBG);

            eventName = new FlxUIInputText(555, 280, 80, "charactername");
            save = new FlxButton(555, 337, "Apply", ee);
            add(save);
            add(eventName);
        }
    var charactername:String;
    function ee()
        {
            charactername = eventName.text;
            code = "{" + "\n" + "   " + hmmm + "name" + hmmm +":" + hmmm + eventName.text + " SE" + hmmm + ",";
            remove(save);
            remove(eventName);
            eventName = new FlxUIInputText(555, 280, 80, "character_asset");
            save = new FlxButton(555, 337, "Apply", ee2);
            add(save);
            add(eventName);
        }
        var UI_box2:FlxUITabMenu;
        var eventNameHmm:FlxButton;
        var eventNameHmm2:FlxButton;
        var eventName2:FlxUIInputText;
        var eventName3:FlxUIInputText;
        var eventName4:FlxUIInputText;
        var eventName5:FlxUIInputText;
        var eventNameHmmSave:FlxButton;
        var modName:FlxUIInputText;
    function ee2()
        {
            isblocked = true;
            code = code + "\n" + "   " + hmmm + "asset" + hmmm +":" + hmmm + eventName.text + hmmm + ",";
            code = code + "\n" + "   " + hmmm + "barColor" + hmmm +":" + hmmm + "#000000" + hmmm + ",";
            code = code + "\n" + "   " + hmmm + "startingAnim" + hmmm +":" + hmmm + "idle" + hmmm + ",";
            code = code + "\n" + "   " + hmmm + "animations" + hmmm +": [";
            remove(save);
            remove(eventName);
            remove(swagBG);
            var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat'));
            bg.scrollFactor.x = 0;
            bg.scrollFactor.y = 0.10;
            bg.setGraphicSize(Std.int(bg.width * 1.1));
            bg.updateHitbox();
            bg.screenCenter();
            bg.antialiasing = FlxG.save.data.antialiasing;
            bg.active = false;
            add(bg);

            var tabs2 = [
                {name: "Character", label: 'Character Maker'},
            ];
            UI_box2 = new FlxUITabMenu(null, tabs2, true);
            UI_box2.scrollFactor.set();
            UI_box2.resize(300, 400);
            UI_box2.x = FlxG.width / 2 + 40;
            UI_box2.y = 20;
            add(UI_box2);
            UI_box2.x += 250;	
		    eventNameHmm = new FlxButton(9, 30, "Add Animation", addAnimation);
            UI_box2.add(eventNameHmm);
            eventNameHmmSave = new FlxButton(99, 30, "Save", saveCharacter);
            UI_box2.add(eventNameHmmSave);
            modName = new FlxUIInputText(189, 30, 80, "Mod Name");
            UI_box2.add(modName);
        }
    function addAnimation()
        {
            swagBG = new FlxSprite().makeGraphic(1000, 500, FlxColor.BLACK, false);
            swagBG.screenCenter();
            swagBG.scrollFactor.set();
            swagBG.alpha = 0.5;
            add(swagBG);

            eventName = new FlxUIInputText(190, 153, 80, "Anim Name");
            add(eventName);
            eventName2 = new FlxUIInputText(190, 193, 80, "Anim Prefix");
            add(eventName2);
            eventName3 = new FlxUIInputText(190, 233, 80, "Offset X");
            add(eventName3);
            eventName4 = new FlxUIInputText(190, 273, 80, "Offset Y");
            add(eventName4);
            eventName5 = new FlxUIInputText(190, 323, 80, "flipX(true/false)");
            add(eventName5);
            eventNameHmm2 = new FlxButton(190, 363, "Apply", addAnimationCode);
            add(eventNameHmm2);
        }
    function addAnimationCode()
        {
            code = code + "\n" + "{" + "\n" + "      " + hmmm + "name" + hmmm + ":" + hmmm + eventName.text + hmmm + ",";
            code = code + "\n" + "      " + hmmm + "prefix" + hmmm + ":" + hmmm + eventName2.text + hmmm + ",";
            code = code + "\n" + "      " + hmmm + "offsets" + hmmm + ":" + "[" + eventName3.text + "," + eventName4.text + "],";
            code = code + "\n" + "      " + hmmm + "flipX" + hmmm + ":" + eventName5.text;
            code = code + "\n" + "    },";
        }
    function saveCharacter(){
        code = code + "\n" + "  ]" + "\n" + "}";
        code.replace(",E","hmm");
        sys.io.File.saveContent("mods/" + modName.text + "/custom/custom_characters/" + charactername + ".json", code);
        sys.io.File.saveContent("assets/data/characterList.txt", characterlisttxt + "\n" + charactername);
    }
}
