if (fading_out) {
    obj_ui_controller.interact_forbid = true;
    if (fading_current < fading_length) {
        var fading_relative = fading_current / fading_length;
        draw_rectangle_color_simple(x, y, room_width, room_height, 0, 0, fading_relative);
        fading_current += 1;
        // show_debug_message(fading_current);
    } else {
        fading_current = 0;
        fading_out = false;
        fading_delay = true;
        fading_delay_current = 0;
    }
}

if (fading_delay) {
    draw_rectangle_color_simple(x, y, room_width, room_height, 0, 0, 1);  // Draw fully opaque rectangle
    fading_delay_current += 1;
    if (fading_delay_current >= delay_length) {
        fading_delay = false;
        fading_in = true;
    }
}

if (fading_in) {
    if (fading_current < fading_length) {
        var fading_relative = fading_current / fading_length;
        draw_rectangle_color_simple(x, y, room_width, room_height, 0, 0, 1 - fading_relative);
        fading_current += 1;
        // show_debug_message(fading_current);
    } else {
        fading_current = 0;
        fading_in = false;
        obj_ui_controller.interact_forbid = false;
        instance_destroy();
    }
}