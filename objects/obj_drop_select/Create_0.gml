
mouse_left=1;
attack=0;
once_only=0;

raid_tact=1;
raid_vet=1;
raid_assa=1;
raid_deva=1;
raid_scou=1;
raid_term=1;
raid_spec=1;
raid_wounded=obj_controller.select_wounded;
refresh_raid=0;
remove_local=1;

// 

var i;i=-1;formation_current=0;
repeat(100){i+=1;via[i]=0;
    if (i<=50) then force_present[i]=0;
    if (i<=12){formation_possible[i]=0;}
}

r_master=0;
r_honor=0;
r_capts=0;
r_mahreens=0;
r_veterans=0;
r_terminators=0;
r_dreads=0;
r_chaplains=0;
r_champions=0;
r_psykers=0;
r_apothecaries=0;
r_techmarines=0;
// Attack
r_bikes=0;

var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{

ship_names="";
sh_target=0;
p_target=0;
max_ships=0;
ships_selected=0;

purge=0;
purge_method=0;
purge_score=0;
purge_a=0;
purge_b=0;
purge_c=0;
purge_d=0;
tooltip="";
tooltip2="";
all_sel=0;


var i;i=-1;
repeat(61){
    i+=1;
    ship[i]="";
    ship_size[i]=0;
    ship_all[i]=0;
    ship_use[i]=0;
    ship_max[i]=0;
    ship_ide[i]=0;
}
i=500;
ship[i]="Local";
ship_size[i]=0;
ship_all[i]=0;
ship_use[i]=0;
ship_max[i]=0;
ship_ide[i]=-42;


menu=0;



master=0;
honor=0;
capts=0;
mahreens=0;
veterans=0;
terminators=0;
dreads=0;
chaplains=0;
champions=0;
psykers=0;
apothecaries=0;
techmarines=0;
// Attack
bikes=0;
rhinos=0;
whirls=0;
predators=0;
raiders=0;
speeders=0;

// These should be set to a negative value; that is, effectively, how much when it is selected (i.e. *-1)
l_master=0;
l_honor=0;
l_capts=0;
l_mahreens=0;
l_veterans=0;
l_terminators=0;
l_dreads=0;
l_chaplains=0;
l_champions=0;
l_psykers=0;
l_apothecaries=0;
l_techmarines=0;
l_size=0;
// Attack
l_bikes=0;
l_rhinos=0;
l_whirls=0;
l_predators=0;
l_raiders=0;
l_speeders=0;





attacking=0;
sisters=0;
eldar=0;
ork=0;
tau=0;
traitors=0;
tyranids=0;
csm=0;
necrons=0;
demons=0;


var j;j=-1;
repeat(501){j+=1;
    fighting[0,j]=0;veh_fighting[0,j]=0;
    fighting[1,j]=0;veh_fighting[1,j]=0;
    fighting[2,j]=0;veh_fighting[2,j]=0;
    fighting[3,j]=0;veh_fighting[3,j]=0;
    fighting[4,j]=0;veh_fighting[4,j]=0;
    fighting[5,j]=0;veh_fighting[5,j]=0;
    fighting[6,j]=0;veh_fighting[6,j]=0;
    fighting[7,j]=0;veh_fighting[7,j]=0;
    fighting[8,j]=0;veh_fighting[8,j]=0;
    fighting[9,j]=0;veh_fighting[9,j]=0;
    fighting[10,j]=0;veh_fighting[10,j]=0;
}


alarm[1]=1;

}

set_zoom_to_defualt();

function TextSwitchButton() constructor {
    pos_x = 0;
    pos_y = 0;
    str1 = "";
    str2 = "";
    alpha = 1;
    click_alpha = 1;
    locked = false;
    hover = function() {
        var str1_w = string_width(str1);
        var str2_w = string_width(str2);
        return (mouse_x >= pos_x+str1_w+5 && mouse_x <= pos_x+str1_w+str2_w+7 && mouse_y >= pos_y-1 && mouse_y <= pos_y + string_height(str2)+1);
    };
    clicked = function() {
        if (hover() && mouse_check_button_pressed(mb_left)) {
            if (click_alpha > 0.8) click_alpha = 0.8; // Decrease click_alpha when clicked
            if (locked=true){
                audio_play_sound(snd_error, 10, false, 1);
            }
            else audio_play_sound(snd_click_small, 10, false, 1);
            return true;
        } else {
            if (click_alpha < 1) click_alpha += 0.03; // Increase click_alpha when not clicked
            return false;
        }
    };
    draw = function() {
        var str1_w = string_width(str1);
        var str2_w = string_width(str2);
        draw_text(pos_x, pos_y, str1);
        if (hover()) {
            if (alpha > 0.8) alpha -= 0.02; // Decrease alpha when hovered
        } else {
            if (alpha < 1) alpha += 0.03; // Increase alpha when not hovered
        }
        draw_set_alpha(alpha * click_alpha); // Multiply alpha and click_alpha to get the final alpha value
        draw_set_color(c_green);
        draw_rectangle(pos_x+str1_w+5, pos_y-1, pos_x+str1_w+str2_w+7, pos_y+string_height(str2)+1,1);
        draw_text(pos_x+str1_w+6, pos_y,str2);
        draw_set_alpha(1);
    };
}

formation = new TextSwitchButton();
target = new TextSwitchButton();

function SwitchButton() constructor {
    pos_x = 0;
    pos_y = 0;
    str1 = "";
    alpha = 1;
    click_alpha = 1;
    locked = false;
    hover = function() {
        var str1_w = string_width(str1);
        var str1_h = string_height(str1);
        return (mouse_x >= pos_x-2 && mouse_x <= pos_x+str1_w+1 && mouse_y >= pos_y-4 && mouse_y <= pos_y+str1_h+1);
    };
    clicked = function() {
        if (hover() && mouse_check_button_pressed(mb_left)) {
            if (click_alpha > 0.8) click_alpha = 0.8; // Decrease click_alpha when clicked
            if (locked=true){
                audio_play_sound(snd_error, 10, false, 1);
            }
            else audio_play_sound(snd_click_small, 10, false, 1);
            return true;
        } else {
            if (click_alpha < 1) click_alpha += 0.03; // Increase click_alpha when not clicked
            return false;
        }
    };
    draw = function() {
        var str1_w = string_width(str1);
        var str1_h = string_height(str1);
        if (locked=true){
            if (alpha > 0.5) alpha -= 0.03;
        }
        else{
            if (hover()) {
                if (alpha > 0.8) alpha -= 0.02; // Decrease alpha when hovered
            } else {
                if (alpha < 1) alpha += 0.03; // Increase alpha when not hovered
            }
        }
        draw_set_alpha(alpha * click_alpha); // Multiply alpha and click_alpha to get the final alpha value
        draw_set_color(c_green);
        draw_rectangle(pos_x-2, pos_y-4, pos_x+str1_w+1, pos_y+str1_h+1,1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_text(pos_x, pos_y,str1);
        draw_set_alpha(1);
    };
}

btn_attack = new SwitchButton();
btn_back = new SwitchButton();

function ToggleButton() constructor {
    pos_x = 0;
    pos_y = 0;
    str1 = "";
    width = 0;
    state_alpha = 1;
    hover_alpha = 1;
    active = true;
    text_halign = fa_left;
    text_color = c_gray;
    button_color = c_gray;

    hover = function() {
        var str1_h = string_height(str1);
        return (mouse_x >= pos_x-2 && mouse_x <= pos_x+width+1 && mouse_y >= pos_y-4 && mouse_y <= pos_y+str1_h+1);
    };

    clicked = function() {
        if (hover() && mouse_check_button_pressed(mb_left) && obj_controller.cooldown <= 0) {
            active = !active; // Toggle the active state when clicked
            audio_play_sound(snd_click_small, 10, false, 1);
            return true;
        }
        else{
            return false;
        }
    };

    draw = function() {
        var str1_h = string_height(str1);
        var text_padding = width * 0.03;
        var text_x = pos_x + text_padding;
        var text_y = pos_y + text_padding;
        var total_alpha;

        if (text_halign == fa_center) {
            text_x = pos_x + (width / 2);
        }

        if (!active){
            if (state_alpha > 0.5) state_alpha -= 0.05;
        }
        else{
            if (state_alpha < 1) state_alpha += 0.05;
            if (hover()) {
                if (hover_alpha > 0.8) hover_alpha -= 0.02; // Decrease state_alpha when hovered
            } else {
                if (hover_alpha < 1) hover_alpha += 0.03; // Increase state_alpha when not hovered
            }
        }

        total_alpha = state_alpha * hover_alpha;
        draw_rectangle_color_simple(pos_x, pos_y, pos_x + width, pos_y + str1_h, 1, button_color, total_alpha);
        draw_set_halign(text_halign);
        draw_set_valign(fa_top);
        draw_text_color_simple(text_x, text_y, str1, text_color, total_alpha);
        draw_set_alpha(1);
        draw_set_halign(fa_left);
    };
}

var captions = ["Tactical", "Veteran", "Assault", "Devastator", "Scout", "Terminator", "Specialist", "Wounded"];
squad_buttons = [];
for (var i = 0; i < 8; i++) {
    var button = new ToggleButton();
    squad_buttons[i] = button;
    button.str1 = captions[i];
    button.text_halign = fa_center;
    button.text_color = CM_GREEN_COLOR;
    button.button_color = CM_GREEN_COLOR;
    button.width = 90;
}
