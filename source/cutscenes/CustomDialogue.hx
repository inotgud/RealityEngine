package cutscenes;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class CustomDialogue extends MusicBeatSubstate
{
    public static var dialogueBG:FlxSprite;
    public static var dialoguetext:Alphabet;
    override public function create()
        {
            dialogueBG = new FlxSprite(-100).loadGraphic(Paths.loadImage('dialogueBoxNew'));
            dialogueBG.scrollFactor.x = 0;
            dialogueBG.scrollFactor.y = 0.10;
            dialogueBG.setGraphicSize(Std.int(dialogueBG.width * 1.1));
            dialogueBG.updateHitbox();
            dialogueBG.screenCenter();
            dialogueBG.antialiasing = FlxG.save.data.antialiasing;
            add(dialogueBG);
        }
    override public function update(elapsed:Float)
        {
            if(controls.ACCEPT)
                {
                    var jsonData = Paths.json("songs/" + PlayState.SONG.songId + "/dialogue.json");
                    if (jsonData == null)
                    {
                        Debug.logError('Dialogue Error!');
                        return;
                    }
                    var data:DialogueJson = cast jsonData;

                    for (dialoguedata in data.dialogue)
                        {
                            if(dialoguedata.isFinished == true)
                                {
                                    close();
                                }
                            else{
                                remove(dialoguetext);
                                dialoguetext = new Alphabet(90, 430, dialoguedata.message, false, true, 0.0, 0.7);
                                add(dialoguetext);
                            }
                        }
                }
        }
}

typedef DialogueJson = {
    var dialogue:Array<DialogueData>;
}
typedef DialogueData = {
    var character:String;
    var isDad:Bool;
    var message:String;
    var isFinished:Bool;
}