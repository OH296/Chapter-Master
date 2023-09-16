// TODO refactor

if (instance_exists(obj_ncombat)) then exit;
if (instance_exists(obj_fleet)) then exit;
if (global.load>0) then exit;
if (invis==true) then exit;

if (is_test_map==true){
    draw_set_color(c_yellow);
    draw_set_alpha(0.5);
    draw_line_width(room_width/2,room_height/2,(room_width/2)+lengthdir_x(3000,terra_direction),(room_height/2)+lengthdir_y(3000,terra_direction),4);
    draw_set_alpha(1);
}
// if (instance_exists(obj_turn_end)) then exit;

script_execute(scr_ui_manage,0,0,0,0,0);
script_execute(scr_ui_advisors,0,0,0,0,0);
script_execute(scr_ui_diplomacy,0,0,0,0,0);
script_execute(scr_ui_settings,0,0,0,0,0);

// Main UI
if (zoomed=0) and (zui=0){
    draw_sprite(spr_new_ui,0,__view_get( e__VW.XView, 0 )+0,__view_get( e__VW.YView, 0 )+0);
    
    // Buttons here
    draw_sprite(spr_ui_but_4,0,__view_get( e__VW.XView, 0 )+1374,__view_get( e__VW.YView, 0 )+8);
    draw_sprite(spr_ui_but_4,0,__view_get( e__VW.XView, 0 )+1484,__view_get( e__VW.YView, 0 )+8);
    
    draw_sprite(spr_ui_but_1,new_buttons_frame,__view_get( e__VW.XView, 0 )+34,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_1,new_buttons_frame,__view_get( e__VW.XView, 0 )+179,__view_get( e__VW.YView, 0 )+838+y_slide);
    
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+357,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+473,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+590,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+706,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+822,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_3,new_buttons_frame,__view_get( e__VW.XView, 0 )+938,__view_get( e__VW.YView, 0 )+838+y_slide);
    
    draw_sprite(spr_ui_but_1,new_buttons_frame,__view_get( e__VW.XView, 0 )+1130,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_1,new_buttons_frame,__view_get( e__VW.XView, 0 )+1275,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_sprite(spr_ui_but_2,new_buttons_frame,__view_get( e__VW.XView, 0 )+1420,__view_get( e__VW.YView, 0 )+838+y_slide);
    
    // Highlight here
    draw_set_blend_mode(bm_add);
    
    draw_set_alpha(h_options*2);if (h_options>0) then draw_sprite(spr_ui_hov_4,0,__view_get( e__VW.XView, 0 )+1374,__view_get( e__VW.YView, 0 )+8+y_slide);
    draw_set_alpha(h_menu*2);if (h_menu>0) then draw_sprite(spr_ui_hov_4,0,__view_get( e__VW.XView, 0 )+1484,__view_get( e__VW.YView, 0 )+8+y_slide);
    
    draw_set_alpha(h_manage*2);if (h_manage>0) then draw_sprite(spr_ui_hov_1,0,__view_get( e__VW.XView, 0 )+34,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_settings*2);if (h_settings>0) then draw_sprite(spr_ui_hov_1,0,__view_get( e__VW.XView, 0 )+179,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_diplomacy*2);if (h_diplomacy>0) then draw_sprite(spr_ui_hov_1,0,__view_get( e__VW.XView, 0 )+1130,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_log*2);if (h_log>0) then draw_sprite(spr_ui_hov_1,0,__view_get( e__VW.XView, 0 )+1275,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_turn*2);if (h_turn>0) then draw_sprite(spr_ui_hov_2,0,__view_get( e__VW.XView, 0 )+1420,__view_get( e__VW.YView, 0 )+838+y_slide);
    
    draw_set_alpha(h_apothecarium*2);if (h_apothecarium>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+357,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_reclusium*2);if (h_reclusium>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+473,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_librarium*2);if (h_librarium>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+590,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_armoury*2);if (h_armoury>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+706,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_recruitment*2);if (h_recruitment>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+822,__view_get( e__VW.YView, 0 )+838+y_slide);
    draw_set_alpha(h_fleet*2);if (h_fleet>0) then draw_sprite(spr_ui_hov_3,0,__view_get( e__VW.XView, 0 )+938,__view_get( e__VW.YView, 0 )+838+y_slide);
    
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    
    // Text here
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_font(fnt_cul_18);
    
    draw_text(__view_get( e__VW.XView, 0 )+1427,__view_get( e__VW.YView, 0 )+14,string_hash_to_newline("Help"));
    draw_text(__view_get( e__VW.XView, 0 )+1537,__view_get( e__VW.YView, 0 )+14,string_hash_to_newline("Menu"));
    
    if (y_slide>0) then draw_set_alpha((100-(y_slide*2))/100);
    
    draw_text(__view_get( e__VW.XView, 0 )+1488,__view_get( e__VW.YView, 0 )+843+y_slide,string_hash_to_newline("End Turn"));
    draw_set_font(fnt_cul_14);
    draw_text(__view_get( e__VW.XView, 0 )+416,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Apothecarium"));
    draw_text(__view_get( e__VW.XView, 0 )+530,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Reclusium"));
    draw_text(__view_get( e__VW.XView, 0 )+647,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Librarium"));
    draw_text(__view_get( e__VW.XView, 0 )+764,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Armamentarium"));
    draw_text(__view_get( e__VW.XView, 0 )+878,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Recruitment"));
    draw_text(__view_get( e__VW.XView, 0 )+994,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Fleet"));
    draw_text(__view_get( e__VW.XView, 0 )+1198,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Diplomacy"));
    draw_text(__view_get( e__VW.XView, 0 )+1344,__view_get( e__VW.YView, 0 )+847+y_slide,string_hash_to_newline("Event Log"));
    draw_text_ext(__view_get( e__VW.XView, 0 )+102,__view_get( e__VW.YView, 0 )+838+y_slide,string_hash_to_newline("Chapter#Management"),18,999);
    draw_text_ext(__view_get( e__VW.XView, 0 )+250,__view_get( e__VW.YView, 0 )+838+y_slide,string_hash_to_newline("Chapter#Settings"),18,999);
    
    // Low alpha line here?
    draw_set_alpha(0.15);
    
    if (l_options>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_options>94){l_hei=134-l_options;l_why=min(l_options-96,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_options+1374,__view_get( e__VW.YView, 0 )+10+1,__view_get( e__VW.XView, 0 )+l_options+1374,__view_get( e__VW.YView, 0 )+10+37-l_why);
    }
    if (l_menu>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_menu>94){l_hei=134-l_menu;l_why=min(l_menu-96,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_menu+1484,__view_get( e__VW.YView, 0 )+10+1,__view_get( e__VW.XView, 0 )+l_menu+1484,__view_get( e__VW.YView, 0 )+10+37-l_why);
    }
    if (l_manage>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_manage>131){l_hei=171-l_manage;l_why=min(l_manage-133,11);}
        draw_line(__view_get( e__VW.XView, 0 )+l_manage+34,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_manage+34,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_settings>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_settings>131){l_hei=171-l_settings;l_why=min(l_settings-133,11);}
        draw_line(__view_get( e__VW.XView, 0 )+l_settings+179,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_settings+179,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_apothecarium>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_apothecarium>101){l_hei=141-l_apothecarium;l_why=min(l_apothecarium-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_apothecarium+357,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_apothecarium+357,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_reclusium>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_reclusium>101){l_hei=141-l_reclusium;l_why=min(l_reclusium-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_reclusium+473,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_reclusium+473,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_librarium>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_librarium>101){l_hei=141-l_librarium;l_why=min(l_librarium-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_librarium+590,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_librarium+590,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_armoury>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_armoury>101){l_hei=141-l_armoury;l_why=min(l_armoury-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_armoury+706,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_armoury+706,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_recruitment>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_recruitment>101){l_hei=141-l_recruitment;l_why=min(l_recruitment-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_recruitment+822,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_recruitment+822,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_fleet>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_fleet>101){l_hei=141-l_fleet;l_why=min(l_fleet-103,11);}
       draw_line(__view_get( e__VW.XView, 0 )+l_fleet+938,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_fleet+938,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_diplomacy>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_diplomacy>131){l_hei=171-l_diplomacy;l_why=min(l_diplomacy-133,11);}
        draw_line(__view_get( e__VW.XView, 0 )+l_diplomacy+1130,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_diplomacy+1130,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_log>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_log>131){l_hei=171-l_log;l_why=min(l_log-133,11);}
        draw_line(__view_get( e__VW.XView, 0 )+l_log+1275,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_log+1275,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    if (l_turn>0){var l_hei,l_why;l_hei=37;l_why=0;if (l_turn>131){l_hei=171-l_turn;l_why=min(l_turn-133,11);}
        draw_line(__view_get( e__VW.XView, 0 )+l_turn+1420,__view_get( e__VW.YView, 0 )+840+y_slide+1+l_why,__view_get( e__VW.XView, 0 )+l_turn+1420,__view_get( e__VW.YView, 0 )+840+y_slide+37);
    }
    
    draw_set_alpha(1);
    draw_sprite(spr_new_banner,0,__view_get( e__VW.XView, 0 )+1439+new_banner_x,__view_get( e__VW.YView, 0 )+62);
    draw_sprite(spr_new_ui_cover,0,__view_get( e__VW.XView, 0 )+0,__view_get( e__VW.YView, 0 )+(900-17));
    
    if (string_count("custom",obj_ini.icon_name)>0){
    
        var cusl;cusl=string_replace(obj_ini.icon_name,"custom","");cusl=real(cusl);
        if (obj_cuicons.spr_custom[cusl]>0) and (obj_cuicons.spr_custom_icon[cusl]!=-1){
            draw_sprite_stretched(obj_cuicons.spr_custom_icon[cusl],0,__view_get( e__VW.XView, 0 )+1451+new_banner_x,__view_get( e__VW.YView, 0 )+73,141,141);
        }
    }
    if (string_count("custom",obj_ini.icon_name)=0){
        var icon_sprite,icc;icon_sprite=spr_icon;icc=obj_ini.icon;
        
        if (icc<=20) then scr_image("creation",icc,__view_get( e__VW.XView, 0 )+1451+new_banner_x,__view_get( e__VW.YView, 0 )+73,141,141);
        
        if (icc>20){icon_sprite=spr_icon_chapters;icc-=19;
        draw_sprite(icon_sprite,icc,__view_get( e__VW.XView, 0 )+1451+new_banner_x,__view_get( e__VW.YView, 0 )+73);}
    }
    
    draw_set_color(38144);
    draw_set_font(fnt_menu);
    draw_set_halign(fa_center);
    
    draw_text(__view_get( e__VW.XView, 0 )+662,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
    draw_text(__view_get( e__VW.XView, 0 )+662.5,__view_get( e__VW.YView, 0 )+17.5,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
    
    if (obj_controller.faction_status[2]!="War"){
        if (penitent_max=0){
            draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline("Loyal"));
            draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17.5,string_hash_to_newline("Loyal"));
        }
        if (penitent_max>0){
            var endb,endb2;endb=0;endb2="";
            endb=min(0,(((penitent_turn+1)*(penitent_turn+1))-120)*-1);
            if (endb<0) then endb2=" "+string(endb);draw_set_color(c_red);
            draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
            draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17.5,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
            draw_set_color(38144);
            // TODO Need a tooltip for here to display the actual amounts
        }
    }
    if (obj_controller.faction_status[2]="War"){
        draw_set_color(255);
        draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline("Renegade"));
        draw_text(__view_get( e__VW.XView, 0 )+887,__view_get( e__VW.YView, 0 )+17.5,string_hash_to_newline("Renegade"));
        draw_set_color(38144);
    }
    
    var wid;wid=1;repeat(10){if ((string_width(string_hash_to_newline(string(global.chapter_name)))*wid)>140) then wid-=0.1;}
    draw_text_transformed(__view_get( e__VW.XView, 0 )+1520+new_banner_x,__view_get( e__VW.YView, 0 )+208,string_hash_to_newline(string(global.chapter_name)),wid,1,0);
    draw_text_transformed(__view_get( e__VW.XView, 0 )+1520.5+new_banner_x,__view_get( e__VW.YView, 0 )+208.5,string_hash_to_newline(string(global.chapter_name)),wid,1,0);
    
    var yf;yf="";if (year_fraction<10) then yf="00"+string(year_fraction);
    if (year_fraction>=10) and (year_fraction<100) then yf="0"+string(year_fraction);
    if (year_fraction>=100) then yf=string(year_fraction);
    draw_text(__view_get( e__VW.XView, 0 )+1520+new_banner_x,__view_get( e__VW.YView, 0 )+228,string_hash_to_newline(string(check_number)+" "+string(yf)+" "+string(year)+".M"+string(millenium)));
    
    var inc;inc="";if (income_last>0) then inc="+"+string(round(income_last));if (income_last<0) then inc=string(round(income_last));
    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
    
    draw_sprite(spr_new_resource,0,__view_get( e__VW.XView, 0 )+14,__view_get( e__VW.YView, 0 )+16);draw_set_color(16291875);
    draw_text(__view_get( e__VW.XView, 0 )+36,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(floor(requisition))+string(inc)));
    draw_text(__view_get( e__VW.XView, 0 )+36.5,__view_get( e__VW.YView, 0 )+16.5,string_hash_to_newline(string(floor(requisition))+string(inc)));
    
    draw_sprite(spr_new_resource,1,__view_get( e__VW.XView, 0 )+133+32,__view_get( e__VW.YView, 0 )+17);draw_set_color(1164001);
    draw_text(__view_get( e__VW.XView, 0 )+157+32,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(loyalty)));
    draw_text(__view_get( e__VW.XView, 0 )+157.5+32,__view_get( e__VW.YView, 0 )+16.5,string_hash_to_newline(string(loyalty)));
    
    draw_sprite(spr_new_resource,2,__view_get( e__VW.XView, 0 )+250,__view_get( e__VW.YView, 0 )+17);draw_set_color(c_red);
    draw_text(__view_get( e__VW.XView, 0 )+267,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(gene_seed)));
    draw_text(__view_get( e__VW.XView, 0 )+267.5,__view_get( e__VW.YView, 0 )+16.5,string_hash_to_newline(string(gene_seed)));
    
    draw_sprite(spr_new_resource,3,__view_get( e__VW.XView, 0 )+373-10,__view_get( e__VW.YView, 0 )+17);draw_set_color(16291875);
    draw_text(__view_get( e__VW.XView, 0 )+395-10,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(marines)+"/"+string(command)));
    draw_text(__view_get( e__VW.XView, 0 )+395.5-10,__view_get( e__VW.YView, 0 )+16.5,string_hash_to_newline(string(marines)+"/"+string(command)));
}

draw_set_font(fnt_40k_14b);
draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_alpha(1);

if (global.cheat_debug == true){
    draw_text((__view_get((0 << 0), 0) + 1124), (__view_get((1 << 0), 0) + 7), string_hash_to_newline("DEBUG MODE"));
}

script_execute(scr_ui_popup,0,0,0,0,0);
