enum Colors {
    White,
    Silver,
    Fenrisian_Grey,
    Grey,
    Codex_Grey,
    Dark_Metal,
    Dark_Grey,
    Black,
    Red,
    Sanguine_Red,
    Dark_Red,
    Gold,
    Orange,
    Brown,
    Deathwing,
    Bone,
    Yellow,
    Dark_Gold,
    Copper,
    Lime,
    Green,
    Firedrake_Green,
    Light_Caliban_Green,
    Caliban_Green,
    Dark_Green,
    Cyan,
    Turqoise,
    Light_Blue,
    Blue,
    Enchanted_Blue,
    Ultramarine,
    Purple,
    Pink,
}

function scr_colors_initialize() {

    var colors_array = [
        ["White", 229, 229, 229],
        ["Silver", 178, 178, 178],
        ["Fenrisian Grey", 144, 155, 183],
        ["Grey", 127, 127, 127],
        ["Codex Grey", 112, 117, 110],
        ["Dark Metal", 105, 105, 105],
        ["Dark Grey", 70, 70, 70],
        ["Black", 35, 35, 35],
        ["Red", 200, 0, 0],
        ["Sanguine Red", 150, 0, 0],
        ["Dark Red", 124, 0, 0],
        ["Gold", 229, 162, 22],
        ["Orange", 255, 156, 0],
        ["Brown", 112, 66, 0],
        ["Deathwing", 238, 204, 163],
        ["Bone", 245, 236, 205],
        ["Yellow", 255, 220, 0],
        ["Dark Gold", 204, 150, 38],
        ["Copper", 184, 115, 51],
        ["Lime", 0, 190, 0],
        ["Green", 0, 160, 0],
        ["Firedrake Green", 27, 115, 43],
        ["Light Caliban Green", 30, 102, 59],
        ["Caliban Green", 6, 63, 43],
        ["Dark Green", 0, 70, 0],
        ["Cyan", 0, 228, 255],
        ["Turqoise", 0, 131, 147],
        ["Light Blue", 0, 150, 255],
        ["Blue", 0, 0, 220],
        ["Enchanted Blue", 58, 110, 158],
        ["Ultramarine", 21, 92, 165],
        ["Purple", 117, 0, 217],
        ["Pink", 255, 0, 198],
    ];

	global.colors_count = array_length(colors_array);
    for (var i = 0; i < global.colors_count; i++) {
        col[i] = colors_array[i][0];
        col_r[i] = colors_array[i][1];
        col_g[i] = colors_array[i][2];
        col_b[i] = colors_array[i][3];
    }
}