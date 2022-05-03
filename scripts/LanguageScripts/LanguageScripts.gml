/// @function			string_retrieve(path,line)
/// @desc				opens a file and returns a specific line from it, then closes the file
/// @arg path			path to the file to retrieve the string from
/// @arg line			the specific line being retrieved
function string_retrieve(path,line) {
	var fl = file_open(path,file.read);
	var str = file_read_line_number(fl, line);
	file_close(fl);
	return str;
}

/// @function			string_retrieve_lang_file()
/// @desc				opens a language file and returns all lines from it, then closes the file
function string_retrieve_lang_file() {
	var fl = pointer_null;
	
	if (global.language.current == langType.english) fl = file_open("en.txt",file.read);
	if (global.language.current == langType.french) fl = file_open("fr.txt",file.read);
	if (global.language.current == langType.spanish) fl = file_open("sp.txt",file.read);
	
	var str = file_read_all_lines(fl);
	file_close(fl);
	return str;
}

/// @function			string_retrieve_lang(line)
/// @desc				returns a specific line from the language file array
/// @arg line			the specific line being retrieved
function string_retrieve_lang(line) {
	return global.language.text[line-1];
}

/// @function			change_language(lang)
/// @desc				changes the game's language
/// @arg lang			the specific lang to change to
function change_language(lang) {
	global.language.current = lang;
	global.language.text = string_retrieve_lang_file();
	//save this option selection
	game_restart();
}