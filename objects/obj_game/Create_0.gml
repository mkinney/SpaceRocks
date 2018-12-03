score = 0;
lives = 3;

draw_set_font(fnt_text);

randomize();

ini_open("savedata.ini");
// get highscore from ini file (set to 0 if there was no highscore)
global.highscore = ini_read_real("score", "highscore", 0);
ini_close();

//gamepad_set_axis_deadzone(0, 0.7);

// websites for sound:
// - beepbox.co
// - boscaceoil.net
// - superflashbros.net/as3sfxr/
// - sfbgames.com/chiptone/


// Elements that could be added
// - multiple levels
// - enemy ships
// - boss fights
// - power ups (shields, lives, lasers)
// - vary spawn rate of asteroids
// - add objectives other than score