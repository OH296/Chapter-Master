hover = 0;
shop = "";
click = 0;
click2 = 0;
discount = 1;
construction_started = 0;
eta = 0;
target_comp = obj_controller.new_vehicles;

slate_panel =  new data_slate();
scroll_point=0;
tooltip_show = 0;
tooltip = "";
tooltip_stat1 = 0;
tooltip_stat2 = 0;
tooltip_stat3 = 0;
tooltip_stat4 = 0;
tooltip_other = "";
last_item = "";
forge_master = scr_role_count("Forge Master", "", "units");
if (array_length(forge_master)>0){
    forge_master=forge_master[0];
} else {
    forge_master="none";
}

var research = obj_controller.production_research;

shop = "equipment";
/*if (obj_controller.menu=55) then shop="equipment";
if (obj_controller.menu=56) then shop="vehicles";
if (obj_controller.menu=57) then shop="warships";
if (obj_controller.menu=58) then shop="equipment2";*/
if (instance_number(obj_shop) > 1) {
    var war;
    war = instance_nearest(0, 0, obj_shop);
    shop = war.shop;
    with(war) {
        instance_destroy();
    }
    x = 0;
    y = 0;
}

var research = obj_controller.production_research;
var research_pathways = obj_controller.production_research_pathways;
var i, rene;
i = -1;
rene = 0;
repeat(80) {
    i += 1;
    item[i] = "";
    x_mod[i] = 0;
    item_stocked[i] = 0;
    mc_stocked[i] = 0;
    item_cost[i] = 0;
    nobuy[i] = 0;
    forge_cost[i]=0;
    noforge[i] = false;
    sellers[i] = ["Mechanicus"];
    tooltip_overide[i]=0;
}
if (obj_controller.faction_status[eFACTION.Imperium] = "War") {
    rene = 1;
    with(obj_temp6) {
        instance_destroy();
    }
    with(obj_star) {
        var u;
        u = 0;
        repeat(4) {
            u += 1;
            if (p_type[u] = "Forge") and(p_owner[u] = 1) then instance_create(x, y, obj_temp6);
        }
    }
    if (instance_exists(obj_temp6)) then rene = 0;
    with(obj_temp6) {
        instance_destroy();
    }
}

tab_buttons = {
    "equipment":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
    "armour":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
    "vehicles":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
    "ships":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
}  
var require_tool_tip = "Requires: #"

if (shop = "equipment") {
    i = 0;

    i += 1;
    item[i] = "Combat Knife";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 1;

    i += 1;
    item[i] = "Chainsword";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 4;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Eviscerator";
    item_cost[i] = 20;
    sellers[i] = ["Ecclesiarchy"];
    if (obj_controller.in_forge){
        if (research.chain[0] < 1){
            noforge[i] = true;
            tooltip_overide[i] = $"{require_tool_tip} {research_pathways.chain[0][0]}"
        }   
    }
    item_stocked[i] = scr_item_count(item[i]);

    i += 1;
    item[i] = "Chainaxe";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;

    i += 1;
    item[i] = "Power Axe";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 40;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Power Sword";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 25;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

	i += 1;
    item[i] = "Power Spear";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 40;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Crozius Arcanum";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 75;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Power Fist";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Lightning Claw";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Chainfist";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 75;
    if (research.power_fields[0] < 2 && research.chain[0] < 1){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Force Staff";
    item_stocked[i] = scr_item_count(item[i]);
    if (research.psi[0] < 1){
        noforge[i] = true;
    }
    item_cost[i] = 70;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
	i += 1;
    item[i] = "Force Sword";
    item_stocked[i] = scr_item_count(item[i]);
    if (research.psi[0] < 1){
        noforge[i] = true;
    }
    item_cost[i] = 55;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
	i += 1;
    item[i] = "Force Axe";
    item_stocked[i] = scr_item_count(item[i]);
    if (research.psi[0] < 1){
        noforge[i] = true;
    }
    item_cost[i] = 60;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Thunder Hammer";
    if (research.power_fields[0] < 2){
        noforge[i] = true;
    }    
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 90;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Lascutter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 15;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Boarding Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 20;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Storm Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (research.power_fields[0]<2){
        noforge[i] = true;
    }  
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Company Standard";
    nobuy[i] = 1;
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 0;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Bolt Pistol";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;

    i += 1;
    item[i] = "Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;

    i += 1;
    item[i] = "Stalker Pattern Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 80;
    if (research.bolt[0] < 1){
        noforge[i] = true;
    }  

    i += 1;
    x_mod[i] = 9;
    item[i] = "Combiflamer";
    item_stocked[i] = scr_item_count(item[i]);
    if (research.bolt[0] < 1){
        noforge[i] = true;
    }
    item_cost[i] = 35;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Heavy Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (research.bolt[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Storm Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (research.bolt[0] < 2){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Flamer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 25;
    if (research.flame[0] < 1){
        noforge[i] = true;
    }

    i += 1;
    item[i] = "Heavy Flamer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 40;
    if (research.flame[0] < 1){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Incinerator";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (research.flame[0] < 1){
        noforge[i] = true;
    }

    i += 1;
    item[i] = "Integrated Bolters";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 120;

    i += 1;
    item[i] = "Meltagun";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    if (research.melta[0]=0){
        noforge[i] = true;
    }

    i += 1;
    item[i] = "Multi-Melta";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (research.melta[0]=0){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Plasma Pistol";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (research.plasma[0] < 1){
        noforge[i] = true;
    }
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Plasma Gun";
    if (research.plasma[0] < 1){
        noforge[i] = true;
    }
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Plasma Cannon";
    if (research.plasma[0] < 1){
        noforge[i] = true;
    }
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 300;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }    
    i += 1;
    x_mod[i] = 9;
    item[i] = "Archeotech Laspistol";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Hellrifle";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;

    i += 1;
    item[i] = "Sniper Rifle";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;

    i += 1;
    item[i] = "Missile Launcher";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 70;

    i += 1;
    item[i] = "Lascannon";
    item_stocked[i] = scr_item_count(item[i]);
    if (research.las[0] < 1){
        noforge[i] = true;
    }
    item_cost[i] = 70;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    var mc = 0;
    repeat(i) {
        mc++;
        if (item[mc] != ""){
            mc_stocked[mc] = scr_item_count(item[mc], "master_crafted");
        }
    }
}
if (shop = "equipment2") {
    i = 0;

    i += 1;
    item[i] = "MK3 Iron Armour";
    item_stocked[i] = scr_item_count("MK3 Iron Armour");
    nobuy[i] = 1;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    if (obj_controller.in_forge){
        if (research.armour[1].armour[0]<2){
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            for (var r = research.armour[1].armour[0]; r < 3;r++){
                tooltip_overide[i] += $"     {research_pathways.armour[1].armour[0][r]}#";
            }
        }            
    }

    i += 1;
    var mk_4_able = false;
    var mk_4_tool_tip = ""
    item[i] = "MK4 Maximus";
    item_stocked[i] = scr_item_count("MK4 Maximus");
    if (obj_controller.in_forge){
        if (research.armour[1].stealth[0] > 0 && research.armour[1].armour[0] > 1){
            mk_4_able=true;
        } else {
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            if (research.armour[1].stealth[0] < 1){
                tooltip_overide[i] += $"     {research_pathways.armour[1].stealth[0][0]}#";
                for (var r = research.armour[1].armour[0]; r < 2;r++){
                    tooltip_overide[i] += $"     {research_pathways.armour[1].armour[0][r]}#";
                }
            }
            mk_4_tool_tip = tooltip_overide[i];
        }

    }
    nobuy[i] = 1;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "MK5 Heresy";
    item_stocked[i] = scr_item_count("MK5 Heresy");
    item_cost[i] = 45;
    nobuy[i] = 1;
    if (rene == 1) {
        nobuy[i] = 0;
    }
    if (obj_controller.in_forge){
        if (research.armour[0] < 2){
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            if (research.armour[0] < 1){
                tooltip_overide[i] += $"     {research_pathways.armour[0][0]}#";
            }
        }
    }

    i += 1;
    item[i] = "MK6 Corvus";
    item_stocked[i] = scr_item_count("MK6 Corvus");
    item_cost[i] = 35;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    if (obj_controller.in_forge){
        if (research.armour[1].stealth[0] = 0){
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            if (research.armour[1].stealth[0] < 1){
                tooltip_overide[i] += $"     {research_pathways.armour[1].stealth[0][0]}#";
            }
        }
    }

    i += 1;
    item[i] = "MK7 Aquila";
    item_stocked[i] = scr_item_count("MK7 Aquila");
    item_cost[i] = 20;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    if (obj_controller.in_forge){
        if (research.armour[0] < 1){
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            if (research.armour[0] < 1){
                tooltip_overide[i] += $"     {research_pathways.armour[0][0]}#";
            }
        }
    }

    i += 1;
    item[i] = "MK8 Errant";
    item_stocked[i] = scr_item_count("MK8 Errant");
    nobuy[i] = 1;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    if (obj_controller.in_forge){
        if (research.armour[0] < 1){
            noforge[i] = true;
            tooltip_overide[i] = "Requires : #";
            if (research.armour[0] < 2 && mk_4_able){
                tooltip_overide[i] += $"     {research_pathways.armour[0][1]}#";
            } else {
                tooltip_overide[i] = mk_4_tool_tip;
                tooltip_overide[i] += $"#     {research_pathways.armour[0][1]}#";
            }
        }
    }    

    i += 1;
    item[i] = "Scout Armour";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;

    i += 1;
    item[i] = "Artificer Armour";
    item_stocked[i] = scr_item_count("Artificer Armour");
    item_cost[i] = 300;
    nobuy[i] = 1;
    if (research.armour[1].stealth[0] < 1 && research.armour[1].armour[0] < 2){
        tooltip_overide[i] = mk_4_tool_tip;
        noforge[i] = true;
    }

    i += 1;
    item[i] = "Terminator Armour";
    item_stocked[i] = scr_item_count("Terminator Armour");
    nobuy[i] = 1;
    item_cost[i] = 400;
    if (research.armour[1].stealth[0] < 1 && research.armour[1].armour[0] < 2){
        tooltip_overide[i] = mk_4_tool_tip;
        noforge[i] = true;
    }
    if (obj_controller.stc_wargear < 6) {
        tooltip_overide[i] = require_tool_tip;
        tooltip_overide[i] += "#STC wargear component 6";
        noforge[i] = true;
    } 
    // if (rene=1){nobuy[i]=1;item_cost[i]=0;}

    i += 1;
    item[i] = "Tartaros";
    item_stocked[i] = scr_item_count("Tartaros");
    nobuy[i] = 1;
    item_cost[i] = 500;
    if (research.armour[1].stealth[0] < 1 && research.armour[1].armour[0] < 2){
        tooltip_overide[i] = mk_4_tool_tip;
        noforge[i] = true;
    }
    if (obj_controller.stc_wargear < 6) {
        tooltip_overide[i] = require_tool_tip;
        tooltip_overide[i] += "#STC wargear component 6";
        noforge[i] = true;
    } 

    i += 1;
    x_mod[i] = 9;
    item[i] = "Jump Pack";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 20;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Weapons Pack";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 25;    
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Servo Arms";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Bionics";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Narthecium";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Psychic Hood";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Rosarius";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Iron Halo";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 250;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Plasma Bomb";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 175;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Exterminatus";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 2500;

    mc=0;
    repeat(i) {
        mc += 1;
        if (item[mc] != ""){
            mc_stocked[i] = scr_item_count(item[mc], "master_crafted");
        }
    }    

}


if (shop = "vehicles") {
    i = 0;

    i += 1;
    item[i] = "Rhino";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 120;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Predator";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 240;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Autocannon Turret";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon Turret";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Bolter Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 38;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Flamer Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Lascannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Land Raider";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 500;
    if (obj_controller.stc_vehicles < 6) {
        noforge[i] = 1;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Heavy Bolter Mount";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 28;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Assault Cannon Mount";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Flamestorm Cannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Hurricane Bolter Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 70;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 120;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Whirlwind";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 180;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "HK Missile";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Land Speeder";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 40;
    if (obj_controller.stc_vehicles < 6) {
        noforge[i] = 1;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Bolters";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 8;
    if (obj_controller.stc_vehicles >= 6) {
        nobuy[i] = 0;
        item_cost[i] = 200;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}

    i += 1;
    item[i] = "Bike";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 35;

    i += 1;
    item[i] = "Dreadnought";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 250;
    if (obj_controller.in_forge){
        if (obj_controller.stc_wargear >= 6) {
            if (research.armour[1].stealth[0] < 1 && research.armour[1].armour[0] < 2){
                noforge[i] = true;
                tooltip_overide[i] = require_tool_tip;
                if (research.armour[1].stealth[0] < 1){
                    tooltip_overide[i] += $"     {research_pathways.armour[1].stealth[0][0]}#";
                    for (var r = research.armour[1].armour[0]; r < 2;r++){
                        tooltip_overide[i] += $"     {research_pathways.armour[1].armour[0][r]}#";
                    }
                }
            }
        } else {
            noforge[i] = true;
            tooltip_overide[i] = require_tool_tip;
            tooltip_overide[i] += "#STC wargear component : 6";
        }
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Close Combat Weapon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 45;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Force Staff";
    item_stocked[i] = scr_item_count(item[i]);
    if (obj_controller.in_forge){
        if (research.psi[0] < 1){
            noforge[i] = true;
        }
    }
    item_cost[i] = 80;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Heavy Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 110;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 110;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Autocannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 80;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Inferno Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 115;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Flamestorm Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 135;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Assault Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 75;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin-Linked Assault Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 150;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Whirlwind Missile Launcher";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 90;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Conversion Beam Projector";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Void Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 250;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
}

if (obj_controller.stc_wargear >= 6) {
    nobuy[i] = 0;
    item_cost[i] = 700;
}

if (shop = "warships") {
    i = 0;

    i += 1;
    item[i] = "Battle Barge";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 20000;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Strike Cruiser";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 8000;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Gladius";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 2250;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Hunter";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 3000;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Cyclonic Torpedo";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    if (rene == 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
}

if (shop == "production"){
    i = 0;
    var research_item;
    if (research.flame[0] == 0){
        i++;
        item[i] = ["research", research_pathways.flame[0][research.flame[0]], ["flame"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows basic Flame weapon Construction";
    }
    if (research.psi[0] == 0){
        i++;
        item[i] = ["research", research_pathways.psi[0][research.psi[0]], ["psi"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows Force Weapon construction";
    }
    if (research.las[0] == 0){
        i++;
        item[i] = ["research", research_pathways.las[0][research.las[0]], ["las"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows Construction of advanced Las Weaponry";
    }    
    if (research.chain[0] == 0){
        i++;
        item[i] = ["research", research_pathways.chain[0][research.chain[0]], ["chain"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows construction of advanced chain weaponry";
    }         
    if (research.plasma[0] == 0){
        i++;
        item[i] = ["research", research_pathways.plasma[0][research.plasma[0]], ["plasma"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows basic Plasma weapon Construction";
    }
    if (research.bolt[0] == 1){
        i++;
        item[i] = ["research",research_pathways.bolt[0][research.bolt[0]], ["bolt"]];
		item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows Advanced Bolt weapon Construction";
    }
    if (research.power_fields[0] < 2){
        i++;
        item[i] = ["research",research_pathways.power_fields[0][research.power_fields[0]], ["power_fields"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows Advanced Power Weapon Construction";
    }
    if (research.melta[0] == 0){
        i++;
        item[i] = ["research",research_pathways.melta[0][research.melta[0]], ["melta"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows basic Melta weaponry construction";
    }
    if (research.armour[0]>0){
        if (research.armour[1].stealth[0] == 0){
            i++;
            item[i] = ["research","Advanced Servo Motors", ["armour", "stealth"]];
            item_stocked[i] = 0;
            forge_cost[i] = 3000;
            tooltip_overide[i] = $"Allows Mk6 construction#Required for {research_pathways.armour[1].armour[0]} ";
        }
        if (research.armour[1].armour[0] == 0){
            i++;
            item[i] = ["research","Advanced Ceramite Bonding", ["armour", "armour"]];
            item_stocked[i] = 0;
            forge_cost[i] = 3000;
            tooltip_overide[i] = "Required for Mk3 construction#Required for MK8 construction#Required for Terminator Armour Construction";
        } else if (research.armour[1].armour[0] == 2){
            i++;
            item[i] = ["research","Ceremite Void Hardening", ["armour", "armour"]];
            item_stocked[i] = 0;
            forge_cost[i] = 3000;
            tooltip_overide[i] = "Required for Mk3 construction#";
        }
        if  (research.armour[0]==1){
            i++;
            item[i] = ["research",research_pathways.armour[0][1], ["armour"]];
            item_stocked[i] = 0;
            forge_cost[i] = 3000;
            tooltip_overide[i] = "Required for MK8 construction";               
        }        
        if (research.armour[1].stealth[0] >0 && research.armour[1].armour[0] ==1){
            i++;
            item[i] =  ["research","Enhanced Nerve Interfacing", ["armour", "armour"]];
            item_stocked[i] = 0;
            forge_cost[i] = 3000;
            tooltip_overide[i] = "Allows Mk4 construction";
        }
    } else if (research.armour[0]==0){
        i++;
        item[i] = ["research",research_pathways.armour[0][0], ["armour"]];
        item_stocked[i] = 0;
        forge_cost[i] = 3000;
        tooltip_overide[i] = "Allows Mk7 construction#Required for MK8 construction#Required for Terminator Armour Construction";        
    } 
}

var forge_multiplier = 10;
for (var l = 1; l <= i; l++){
    if (forge_cost[l] = 0 && noforge[l] = false) {
        forge_cost[l] = item_cost[l] * forge_multiplier;
    }
}

with(obj_p_fleet) {
    if (capital_number > 0) and(action = "") {
        var you;
        you = instance_nearest(x, y, obj_star);
        if (you.trader > 0) then obj_shop.discount = 0.8;
    }
}

with(obj_star) {
    if (array_contains(p_owner, 1)) and(trader > 0) then obj_shop.discount = 0.8;
}

if (shop = "equipment") or(shop = "equipment2") {
    var disc;
    disc = 1;
    if (obj_controller.stc_wargear >= 1) then disc = 0.92;
    if (obj_controller.stc_wargear >= 3) then disc = 0.86;
    if (obj_controller.stc_wargear >= 5) then disc = 0.75;
    var mc = 0;
    repeat(i) {
        mc++;
        if (forge_cost[mc] > 1) then forge_cost[mc] = round(forge_cost[mc] * disc);
    }
}

if (shop = "vehicles") {
    var disc;
    disc = 1;
    if (obj_controller.stc_vehicles >= 1) then disc = 0.92;
    if (obj_controller.stc_vehicles >= 3) then disc = 0.86;
    if (obj_controller.stc_vehicles >= 5) then disc = 0.75;
    var mc = 0;
    repeat(31) {
        mc += 1;
        var ahuh;
        ahuh = 1;
        if (mc >= 7) and(mc <= 12) then ahuh = 0;
        if (ahuh = 1) {
            if (forge_cost[mc] > 1) then forge_cost[mc] = round(forge_cost[mc] * disc);
        }
    }
}

legitimate_items = i;
if (shop = "warships") {
    var disc;
    disc = 1;
    if (obj_controller.stc_ships >= 1) then disc = 0.92;
    if (obj_controller.stc_ships >= 3) then disc = 0.86;
    if (obj_controller.stc_ships >= 5) then disc = 0.75;
    i = 0;
    repeat(31) {
        i += 1;
        if (item_cost[i] > 1) then item_cost[i] = round(item_cost[i] * disc);
    }
}

imperium_modifier = (((obj_controller.disposition[eFACTION.Imperium] - 50) / 200) * -1) + 1;
mechanicus_modifier = (((obj_controller.disposition[eFACTION.Mechanicus] - 50) / 200) * -1) + 1;
inquisition_modifier = (((obj_controller.disposition[eFACTION.Inquisition] - 50) / 200) * -1) + 1;
ecclesiarchy_modifier = (((obj_controller.disposition[eFACTION.Ecclesiarchy] - 50) / 200) * -1) + 1;

if (rene == 1) {
    imperium_modifier += 1;
    mechanicus_modifier += 1;
    inquisition_modifier += 1;
    ecclesiarchy_modifier += 1;
}

if (forge_master!="none"){
    forge_master_cha_modifier = (((forge_master.charisma - 30) / 200) * -1) + 1;
    forge_master_tec_modifier = (((forge_master.technology - 50) / 200) * -1) + 1;
    if (forge_master.has_trait("flesh_is_weak")){
        forge_master_tec_modifier -= 0.1;
    };
} else {
    forge_master_tec_modifier = 1.7;
    forge_master_cha_modifier = 1.7;
}
mechanicus_modifier *= forge_master_tec_modifier;

i = 0;
repeat(array_length(item_cost)-2){
    i += 1;

    if (shop != "warships"){
        item_cost[i] *= 2;
    }

    var best_modifier = 1;
    if (rene != 1){
        // Check each sellers
        for (var g = 0; g < array_length_1d(sellers[i]); g++) {
            var current_modifier;
            // Determine the modifier for the current sellers
            if (array_contains(sellers[i], "Imperium")) {
                current_modifier = imperium_modifier;
            } else if (array_contains(sellers[i], "Mechanicus")) {
                current_modifier = mechanicus_modifier;
            } else if (array_contains(sellers[i], "Inquisition")) {
                current_modifier = inquisition_modifier;
            } else if (array_contains(sellers[i], "Ecclesiarchy")) {
                current_modifier = ecclesiarchy_modifier;
            } else {
                continue;  // Skip this iteration if the sellers is not recognized
            }
            // If the current modifier is better than the best one found so far, update the best modifier and sellers
            if (current_modifier < best_modifier) {
                best_modifier = current_modifier;
            }
        }
        // Now, best_modifier is the best modifier among all sellerss, and best_sellers is the sellers with the best modifier
	}

	item_cost[i] *= max(discount * forge_master_cha_modifier * best_modifier, 0.2);
    item_cost[i] = max(round(item_cost[i]), 1);
}


/* */
/*  */
