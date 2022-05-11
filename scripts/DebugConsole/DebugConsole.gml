/// @function		debug_console_routing(command)
/// @desc			Routes console commands to the proper GML script
/// @arg command
function debug_console_routing(command) {
	
	array_push(global.debug.console.history,command);
	
	if (array_length(global.debug.console.history) > 5) {
		for (var i=0; i<array_length(global.debug.console.history); i++) {
			if (i < 5) global.debug.console.history[i] = global.debug.console.history[i+1];
			else array_pop(global.debug.console.history);
		}
	}
	
	global.debug.console.entry = 0;
	
	command = string_copy(command, 2, string_length(command));
	
	if (string_last_pos("exit", command) == 1) {
		debugging_exit(command);
	} else if (string_last_pos("set ", command) == 1) {
		debugging_set(command);	
	} else if (string_last_pos("get ", command) == 1) {
		debugging_get(command);	
	} else if (string_last_pos("help", command) == 1) {
		debugging_help(command);	
	} else {
		global.debug.console.log += "Unknown command! Please use /help for a list of commands.\n\n";
	}
}

/// @function		debugging_exit(command)
/// @desc			Exits the debugging console, or the game if specified
/// @arg command
function debugging_exit(command) {
	if (command == "exit game") game_end();
	else if (command == "exit" || command == "exit debug" || command == "exit console") {
		global.debug.isOn = false;
		global.debug.console.isSelected = false;
		global.controls.inputBlocked = false;
	}
	else global.debug.console.log += "Unknown command! Please use:\n/exit debug\n/exit game\n\n";
}

/// @function		debugging_get(command)
/// @desc			Gets the value of a variable in-game
/// @arg command
function debugging_get(command) {
	
	var object = "";
	var variable = "";
	var value = "";
	var structName = ".";
	var struct = pointer_null;
	
	if (string_count(" ", command) == 2) {
		command = string_copy(command, 5, string_length(command)-4);
		object = string_copy(command, 1, string_pos(" ", command)-1);
		command = string_copy(command, string_length(object)+2, string_length(command)-(string_length(object)+1));
		variable = command;
		
		if (object != "global") {
			with (all) {
				if (object_get_name(self.object_index) == object) { 
					if (string_count(".", variable) > 0) {
						var myV = variable;
						while (string_count(".", myV) > 0) {
							structName = string_copy(myV, 1, string_pos(".", myV)-1);
							if (variable_instance_exists(self.id, structName)) {
								struct = variable_instance_get(self.id, structName);
								myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
							} else if (!null(struct) && !null(structName) && variable_struct_exists(struct, structName)) {
								struct = variable_struct_get(struct, structName);
								myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
							} else {
								global.debug.console.log += "No such struct [" + structName + "] exists in object [" + object + "]\n\n";
								return;
							}
						}
						if (variable_struct_exists(struct, myV)) {
							value = variable_struct_get(struct, myV);
							global.debug.console.log += "[" + string(self.id) + "]'s [" + string(variable) + "] is [" + string(value) + "]\n\n";
							
						} else {
							global.debug.console.log += "No such variable [" + myV + "] exists in struct [" + structName + "] of object [" + object + "]\n\n";
							return;
						}
					} else {
						value = variable_instance_get(self.id, variable);
						global.debug.console.log += "[" + string(self.id) + "]'s [" + string(variable) + "] is [" + string(value) + "]\n\n";
					}
				}
			}
		} else {
			if (string_count(".", variable) > 0) {
				var myV = variable;
				while (string_count(".", myV) > 0) {
					structName = string_copy(myV, 1, string_pos(".", myV)-1);
					if (variable_global_exists(structName)) {
						struct = variable_global_get(structName);
						myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
					} else if (!null(struct) && !null(structName) && variable_struct_exists(struct, structName)) {
						struct = variable_struct_get(struct, structName);
						myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
					}  else {
						global.debug.console.log += "No such struct [" + structName + "] exists as a global\n\n";
						return;
					}
				}
				if (variable_struct_exists(struct, myV)) {
					value = variable_struct_get(struct, myV);
					global.debug.console.log += "[" + string(variable) + "] is [" + string(value) + "]\n\n";
				} else {
					global.debug.console.log += "No such variable [" + myV + "] exists in struct [" + structName + "]\n\n";
					return;
				}
			} else {
				value = variable_global_get(variable);
				global.debug.console.log += "[" + string(variable) + "] is [" + string(value) + "]\n\n";
			}
		}
	} else if (string_count(" ", command) == 1) {
		command = string_copy(command, 5, string_length(command)-4);
		variable = command;
		
		if (string_count(".", variable) > 0) {
			var myV = variable;
			while (string_count(".", myV) > 0) {
				structName = string_copy(myV, 1, string_pos(".", myV)-1);
				if (variable_global_exists(structName)) {
					struct = variable_global_get(structName);
					myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
				} else if (!null(struct) && !null(structName) && variable_struct_exists(struct, structName)) {
					struct = variable_struct_get(struct, structName);
					myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
				}  else {
					global.debug.console.log += "No such struct [" + structName + "] exists as a global\n\n";
					return;
				}
			}
			if (variable_struct_exists(struct, myV)) {
				value = variable_struct_get(struct, myV);
				global.debug.console.log += "[" + string(variable) + "] is [" + string(value) + "]\n\n";
			} else {
				global.debug.console.log += "No such variable [" + myV + "] exists in struct [" + structName + "]\n\n";
				return;
			}
		} else {
			value = variable_global_get(variable);
			global.debug.console.log += "[" + string(variable) + "] is [" + string(value) + "]\n\n";
		}
	} else {
		global.debug.console.log += "Incorrect formatting. Please use:\n/get [object] [variable]\n/set [global variable]\n\n";
	}
}

/// @function		debugging_help(command)
/// @desc			Shows help in the debug console
/// @arg command
function debugging_help(command) {
	
	var section = "";
	
	if (string_count(" ", command) == 1) {
		section = string_copy(command, string_pos(" ", command)+1, string_length(command)-string_pos(" ", command));
		
		if (section == "set") global.debug.console.log += "SET\nSets a variable in all objects or a global to a specified value\n\n/set [object] [variable] [value]\n/set [global variable] [value]\n\n";
		else if (section == "exit") global.debug.console.log += "EXIT\nExits debug mode or the game\n/exit [\"debug\" or \"game\"]\n\n";
		else if (section == "get") global.debug.console.log += "GET\nGets a variable from a global or specific instance\n/get [object] [variable]\n/get [global variable]\n\n";
	} else {
		global.debug.console.log += "COMMANDS\n/exit\n/get\n/help\n/set\nTo see more info, type:\n/help [command]\n\n";
	}
}

/// @function		debugging_set(command)
/// @desc			Changes variables in the game
/// @arg command
function debugging_set(command) {
	
	var object = "";
	var variable = "";
	var value = "";
	var structName = ".";
	var struct = pointer_null;
	
	if (string_count(" ", command) == 3) {
		command = string_copy(command, 5, string_length(command)-4);
		object = string_copy(command, 1, string_pos(" ", command)-1);
		command = string_copy(command, string_length(object)+2, string_length(command)-(string_length(object)+1));
		variable = string_copy(command, 1, string_pos(" ", command)-1);
		command = string_copy(command, string_length(variable)+2, string_length(command)-(string_length(variable)+1));
		value = command;
		
		if (string_length(string_digits(value)) == string_length(string_replace(value,".",""))) value = real(value);
		else if (value == "true") value = true;
		else if (value == "false") value = false;
		
		with (all) {
			if (object_get_name(self.object_index) == object) { 
				if (string_count(".", variable) > 0) {
					var myV = variable;
					while (string_count(".", myV) > 0) {
						structName = string_copy(myV, 1, string_pos(".", myV)-1);
						if (variable_instance_exists(self.id, structName)) {
							struct = variable_instance_get(self.id, structName);
							myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
						} else if (!null(struct) && !null(structName) && variable_struct_exists(struct, structName)) {
							struct = variable_struct_get(struct, structName);
							myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
						}  else {
							global.debug.console.log += "No such struct [" + structName + "] exists in object [" + object + "]\n\n";
							return;
						}
					}
					if (variable_struct_exists(struct, myV)) {
						variable_struct_set(struct, myV, value);
					} else {
						global.debug.console.log += "No such variable [" + myV + "] exists in struct [" + structName + "] of object [" + object + "]\n\n";
						return;
					}
				} else {
					variable_instance_set(self.id, variable, value);
				}
			}
		}
		
		global.debug.console.log += "Set [" + variable + "] in all [" + object + "]'s to [" + string(value) + "]\n\n";
		
	} else if (string_count(" ", command) == 2) {
		command = string_copy(command, 5, string_length(command)-4);
		variable = string_copy(command, 1, string_pos(" ", command)-1);
		command = string_copy(command, string_length(variable)+2, string_length(command)-(string_length(variable)+1));
		value = command;
		
		if (string_length(string_digits(value)) == string_length(string_replace(value,".",""))) value = real(value);
		else if (value == "true") value = true;
		else if (value == "false") value = false;
		
		if (string_count(".", variable) > 0) {
			var myV = variable;
			while (string_count(".", myV) > 0) {
				structName = string_copy(myV, 1, string_pos(".", myV)-1);
				if (variable_global_exists(structName)) {
					struct = variable_global_get(structName);
					myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
				} else if (!null(struct) && !null(structName) && variable_struct_exists(struct, structName)) {
					struct = variable_struct_get(struct, structName);
					myV = string_copy(myV, string_length(structName)+2, string_length(myV)-(string_length(structName)+1));
				}  else {
					global.debug.console.log += "No such struct [" + structName + "] exists as a global\n\n";
					return;
				}
			}
			if (variable_struct_exists(struct, myV)) {
				variable_struct_set(struct, myV, value);
			} else {
				global.debug.console.log += "No such variable [" + myV + "] exists in struct [" + structName + "]\n\n";
				return;
			}
		} else {
			var myV = variable;
			variable_global_set(myV, value);
		}
		
		global.debug.console.log += "Set [global." + variable + "] to [" + string(value) + "]\n\n";
	} else {
		global.debug.console.log += "Incorrect formatting. Please use:\n/set [object] [variable] [value]\n/set [global variable] [value]\n\n";
	}
}