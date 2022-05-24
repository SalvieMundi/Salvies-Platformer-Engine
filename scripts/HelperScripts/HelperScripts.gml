/// @function							is_in_list(item, list);
/// @desc								returns if the provided item is in the list object
/// @arg {any} item						the item to search the list for
/// @arg {array, ds_list} list			the list to search through
function is_in_list(item, list) {
	// if list is an array
	if (is_array(list)) {
		// get length once so we aren't re-evaluating
		var len = array_length(list);
		// loop through array
		for (var i=0; i<len; i++) {
			if (item == list[i]) return true;
		}
		return false;
	// else, if list is a ds list
	} else {
		if (ds_list_find_index(list,item) == -1) return false;
		else return true;
	}
}

/// @function							wave(min, max, duration, offset);
/// @desc								returns a value that will wave back and forth between min and max over duration
/// @arg {real} min						value to start at
/// @arg {real} max						value to end at
/// @arg {real} duration				time in seconds to produce one wave
/// @arg {real} [offset]				offset in seconds, optional
function wave(origin, destination, duration, offset = 0) {
	a4 = (argument1 - argument0) * 0.5;
	return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;
}

/// @function							chance_percent(percent);
/// @desc								randomly returns true percent amount of the time
/// @arg {real} percent					percent of the time to return true, 0 to 1 or 0 to 100
function chance_percent(percent) {
	if (percent <= 1) return argument0 > random(1);
	else return argument0 > random(100);
}

/// @function							chance_over_time(seconds);
/// @desc								randomly returns true roughly every amount of seconds on average
/// @arg {real} seconds					how often the function should return true on average
function chance_over_time(seconds) {
	return irandom(seconds*fps) == 0;
}

/// @function							snap_direction(direction);
/// @desc								snaps a given direction to the closest cardinal direction
/// @arg {real} direction				the direction to snap
function snap_direction(direction) {
	if (direction < 45 || direction >= 315) return 0;
	if (direction < 135 && direction >= 45) return 90;
	if (direction < 225 && direction >= 135) return 180;
	if (direction < 315 && direction >= 225) return 270;
}

/// @function							wrap(value, min, max);
/// @desc								wraps a given value between min and max
/// @arg {real} value					the value to wrap
/// @arg {real} min						the minimum that the value can be
/// @arg {real} max						the maximum that the value can be
function wrap(value, min, max) {
	if (argument0 mod 1 == 0)
	{
	    while (argument0 > argument2 || argument0 < argument1)
	    {
	        if (argument0 > argument2)
	            argument0 += argument1 - argument2 - 1;
	        else if (argument0 < argument1)
	            argument0 += argument2 - argument1 + 1;
	    }
	    return(argument0);
	}
	else
	{
	    var vOld = argument0 + 1;
	    while (argument0 != vOld)
	    {
	        vOld = argument0;
	        if (argument0 < argument1)
	            argument0 = argument2 - (argument1 - argument0);
	        else if (argument0 > argument2)
	            argument0 = argument1 + (argument0 - argument2);
	    }
	    return(argument0);
	}
}

/// @function							null(object);
/// @desc								returns true if the object is any of the common null flags
/// @arg {any} object					the object to check for null
function null(object) {
	switch (object) {
		case undefined : return true; break;
		case pointer_null : return true; break;
		case noone : return true; break;
		case asset_unknown : return true; break;
		default : return false; break;
	}
}

/// @function							round_to_smallest_power_two(number);
/// @desc								returns the smallest power of two that can accomodate the given number
/// @arg {real} number					the number to round upwards from
function round_to_smallest_power_two(number) {
	if (number > 8192) return 16384;
	else if (number > 4096) return 8192;
	else if (number > 2048) return 4096;
	else if (number > 1024) return 2048;
	else if (number > 512) return 1024;
	else if (number > 256) return 512;
	else if (number > 128) return 256;
	else if (number > 64) return 128;
	else if (number > 32) return 64;
	else if (number > 16) return 32;
	else if (number > 8) return 16;
	else if (number > 4) return 8;
	else if (number > 2) return 4;
	else return 2;
}

/// @function							compare_depth(elm1, elm2);
/// @desc								used to sort elements of an array by their depths
/// @arg {instance} elm1				current instance element in the array
/// @arg {instance} elm2				next instance element in the array
function compare_depth(elm1, elm2) {
	return elm2.depth - elm1.depth;
}

/// @function							dont_draw_self();
/// @desc								simple script which does not draw self unless debug is turned on
function dont_draw_self() {
	if (global.debug.isOn) draw_self();
}
