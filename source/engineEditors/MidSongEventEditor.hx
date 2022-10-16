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
import options.Question;
import flixel.addons.ui.FlxButtonPlus;
import sys.FileSystem;
import sys.io.File;

using StringTools;

class MidSongEventEditor extends MusicBeatState
{
    var bg:FlxSprite;
    var eventName:FlxUIInputText;
    var eventName2:FlxUIInputText;
    var eventName3:FlxUIInputText;
    var eventName4:FlxUIInputText;
    var eventName5:FlxUIInputText;
    var eventName6:FlxUIInputText;
    var char1:Character;
    public static var song:String = "";
    public var eventNamesss:FlxUIInputText = new FlxUIInputText(35, 320, 80, "curStep");
    public var eventNamesss2:FlxUIInputText = new FlxUIInputText(35, 360, 80, "Character Name");
    public var eventNa:FlxUIInputText = new FlxUIInputText(350, 210, 477, "Song Name", 50);
    public var button4:FlxButton = new FlxButton(35, 250, "Apply", function(){

    });
    public static var code:String = "function beatHit(){";
    public static var codetested:String ="";
    var versionShit:FlxText;

    function stagebg()
        {

        }
	override function create()
        {
            FlxG.mouse.visible = true;
            FlxG.save.data.abfd = "";
            char1 = new Character(10, 240, 'bf', true);
		    char1.setGraphicSize(Std.int(char1.width * 0.8));

            char1.dance();
            if(song == "")
                {
                    var bgNormal:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuDesat'));
                    bgNormal.scrollFactor.x = 0;
                    bgNormal.scrollFactor.y = 0.10;
                    bgNormal.setGraphicSize(Std.int(bgNormal.width * 1.1));
                    bgNormal.updateHitbox();
                    bgNormal.screenCenter();
                    bgNormal.antialiasing = FlxG.save.data.antialiasing;
                    bgNormal.color = FlxColor.GRAY;
                    add(bgNormal);
                    eventNa = new FlxUIInputText(350, 210, 477, "Song Name", 50);
                    eventNa.setFormat("PhantomMuff1.5RealityEngine", 26, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                    add(eventNa);
                    var button:FlxButtonPlus = new FlxButtonPlus(350, 260, ss, "Apply", 477,25);
                    add(button);
                    

                }
                else{
                    createS2();
        }
        }
        function ss()
        {
            song = eventNa.text;
            createS2();
        }
        function createS2(){

            FlxG.mouse.visible = true;
            bg = new FlxSprite(-100).loadGraphic(Paths.loadImage('stageback'));
            bg.scrollFactor.x = 0;
            bg.scrollFactor.y = 0.10;
            bg.setGraphicSize(Std.int(bg.width * 1.1));
            bg.updateHitbox();
            bg.screenCenter();
            bg.antialiasing = FlxG.save.data.antialiasing;
            add(bg);
    
            var bg2:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('book'));
		bg2.scrollFactor.x = 0;
		bg2.scrollFactor.y = 0.10;
		bg2.setGraphicSize(Std.int(bg2.width * 1.1));
		bg2.updateHitbox();
		bg2.screenCenter();
		bg2.antialiasing = FlxG.save.data.antialiasing;
		add(bg2);

        versionShit = new FlxText(900,40,0,"Logs",30, false);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 24, FlxColor.BLACK, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

            var button3:FlxButton = new FlxButton(35, 90, "Add Character Switch Event", selectbfordad);
            add(button3);

            var button4:FlxButton = new FlxButton(35, 130, "Add Play Anim Event", addanimevent);
            add(button4);

            var button5:FlxButton = new FlxButton(35, 170, "Test", testscript);
            add(button5);

            var button5:FlxButton = new FlxButton(35, 220, "Save", savescript);
            add(button5);
         
		    add(char1);
        }
        function selectbfordad()
            {
                if(FlxG.save.data.abfd == "")
                    {
                        Question.isMenuSong = false;
                        Question.isAntialiasing = false;
                        Question.isWatermark = false;
                        Question.isFlashing = false;
                        Question.isFPS = false;
                        Question.isScrollSpeed = false;
                        Question.isRedesigned = false;
                        Question.isColored = false;
                        Question.isBotPlay = false;
                        Question.isScroll = false;
                        Question.isTap = false;
                        Question.isMidSongEvent = true;
                        openSubState(new options.Question());

                    }
                else{
                    charswitchevent();
                }
            }
    function charswitchevent(){
        
        button4 = new FlxButton(35, 280, "Apply", charswitcheventstep2);
        add(eventNamesss);

        add(eventNamesss2);

        add(button4);
    }
    function charswitcheventstep2()
        {
            code = code + "\n" +  "applyEvent(" + eventNamesss.text + ',"characterSwitch' + FlxG.save.data.abfd + '",'+'"' + eventNamesss2.text + '"' + ");";
            FlxG.save.data.abfd = "";
            trace (code);
            remove(char1);
            char1 = new Character(10, 100, eventNamesss2.text, true);
		    char1.setGraphicSize(Std.int(char1.width * 0.8));
            add(char1);
            char1.dance();
        }
    function testscript(){
        codetested = code;
        PlayState.oldcode = codetested;
        code = code + "\n" + "}";
        PlayState.eventeditortestscript = code;
        PlayState.eventeditortesting = true;
        PlayState.olds = song;
        FreeplayState.loadSongInFreePlay(song, 1 ,false);
    }

    function savescript(){
        code = code + "\n" + "}";
         if(FileSystem.exists(Paths.json("songs/" + song + "/" + song)))
            {
                sys.io.File.saveContent(Paths.hx("data/songs/" + song + "/hscript"), code);
            }
    }

    function addanimevent()
        {

        }
    override function update(elapsed:Float)
        {
            if(FlxG.keys.justPressed.ESCAPE)
                {
                    FlxG.switchState(new MainMenuState());
                }
            super.update(elapsed);
        }
}
