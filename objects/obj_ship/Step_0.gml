// game pad factor allows us to make the game
// pad react faster than the arrow keys, if we want
var gp_factor = 1;

/// LEFT
if (keyboard_check(vk_left)) {
	image_angle += 5;
}
if (gamepad_button_check(0, gp_padl)) {
	image_angle += 5 * gp_factor;
}

/// RIGHT
if (keyboard_check(vk_right)) {
	image_angle -= 5;
}
if (gamepad_button_check(0, gp_padr)) {
	image_angle -= 5 * gp_factor;
}

/// UP
if (keyboard_check(vk_up)) {
	motion_add(image_angle, .05);
}
if (gamepad_button_check(0, gp_padu)) {
	motion_add(image_angle, .05 * gp_factor);
}

/// DOWN
if (keyboard_check(vk_down)) {
	motion_add(image_angle, -.05);
}
if (gamepad_button_check(0, gp_padd)) {
	motion_add(image_angle, -.05 * gp_factor);
}

/// FIRING
// allow for first game pad any shoulder buttons
if (keyboard_check_pressed(vk_space) or
	gamepad_button_check_pressed(0, gp_shoulderl) or
	gamepad_button_check_pressed(0, gp_shoulderlb) or
	gamepad_button_check_pressed(0, gp_shoulderr) or
	gamepad_button_check_pressed(0, gp_shoulderrb)) {

	var bullet_inst = instance_create_layer(x, y, "Instances", obj_bullet);
	bullet_inst.direction = image_angle;
	audio_play_sound(snd_zap, 1, false);
}

move_wrap(true, true, sprite_width/2);
