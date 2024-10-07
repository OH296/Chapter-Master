/**
 * @arg {String} disadvantage disadvantage name e.g. "Shitty Luck"
 * @return {Bool}
 */
function scr_has_disadv(disadvantage){
	try {
		var result = array_contains(obj_ini.dis, disadvantage);
	} catch (_exception){
		show_debug_message(_exception);
		result = false;
	}
	return result;
	// var disadv_count = array_length(obj_ini.dis);
	// for(var i = 0; i < disadv_count; i++){
	// 	if(obj_ini.dis[i] == disadvantage){
	// 		return true;
	// 	}
	// }
	// return false;
}