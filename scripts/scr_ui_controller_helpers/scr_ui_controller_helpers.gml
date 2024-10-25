function screen_fade_in() {
    instance_create_depth(0, 0, -9999, obj_screen_fade)
    obj_screen_fade.fading_in = true;
}

function screen_fade_out() {
    instance_create_depth(0, 0, -9999, obj_screen_fade)
    obj_screen_fade.fading_out = true;
}

function set_interaction_cooldown(cooldown = 60) {
    instance_create_depth(0, 0, -9999, obj_interaction_cooldown)
    obj_interaction_cooldown.interaction_cooldown = cooldown;
}