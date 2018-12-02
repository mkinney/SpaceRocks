if (keyboard_check_pressed(vk_enter)) {
	switch (room) {
		case rm_start:
			room_goto(rm_game);
			break;
			
		case rm_win:
		case rm_gameover:
		
			// save highscore
			if (score > global.highscore) {
				ini_open("savedata.ini");
				ini_write_real("score", "highscore", score);
				ini_close();
				global.highscore = score;
			}
			game_restart();
			break;
	}
}

if (room == rm_gameover) {
	if (keyboard_check_pressed(ord(("R")))) {
		// reset high score
		global.highscore = 0;
	}
}

if (room == rm_game) {
	if (score >= 1000.0) {
		room_goto(rm_win);
		audio_play_sound(snd_win, 1, false);
	}

	if (lives <= 0) {
		room_goto(rm_gameover);
		audio_play_sound(snd_lose, 1, false);
	}
}