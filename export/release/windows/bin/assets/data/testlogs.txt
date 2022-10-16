function endsong()
{
if(SONG.songName == "bopeebo")
{
completeQuest();
File.saveContent("assets/data/questsData/Play Bopeebo.txt", "Completed");
}
if(SONG.songName == "monster")
{
completeQuest();
File.saveContent("assets/data/questsData/Monster.txt", "Completed");
}
if(SONG.songName == "blammed")
{
completeQuest();
File.saveContent("assets/data/questsData/Blammed's Lights.txt", "Completed");
}
if(SONG.songName == "stress")
{
completeQuest();
File.saveContent("assets/data/questsData/You are NOT Tankman.txt", "Completed");
}
}
