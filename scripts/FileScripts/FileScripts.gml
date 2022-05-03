enum file
{
	read,
	write,
	append
}

/// @function			file_open(path,mode)
/// @desc				opens a file and returns the file variable
/// @arg path			path to the file
/// @arg mode			determines whether file is for read, write or append
function file_open(path,mode) {
	if (file_exists(path)) {
		if (mode = file.read) return file_text_open_read(path);
		if (mode = file.write) return file_text_open_write(path);
		if (mode = file.append) return file_text_open_append(path);
	} else {
		if (mode = file.write) return file_text_open_write(path);
		else return pointer_null;
	}
}

/// @function			file_close(file)
/// @desc				closes a previously opened file
/// @arg file			the file variable given by openFile
function file_close(fl) {
	file_text_close(fl);
}

/// @function			file_read_line(file)
/// @desc				returns a line from a file opened for reading
/// @arg file			the file variable given by openFile
function file_read_line(fl) {
	if (!file_text_eof(fl)) return string_replace(string_replace(file_text_readln(fl), "\n", ""), "\r", "");
	else return "";
}

/// @function			file_read_all_lines(file)
/// @desc				returns the entire file as an array of strings, separated by line breaks
/// @arg file			the file variable given by openFile
function file_read_all_lines(fl) {
	var num = 0;
	var str = [];
	
	while (!file_text_eof(fl))
	{
	    str[num++] = file_text_readln(fl);
	}
	
	return str;
}

/// @function			file_write_line(file,str)
/// @desc				writes a line of text to a file, auto-inserts line breaks
/// @arg file			the file variable given by openFile
/// @arg str			the string to write
function file_write_line(fl,str) {
	if (is_string(str)) file_text_write_string(fl,string_replace(str,"\n",""));
	else if (is_ptr(str)) file_text_write_string(fl,"");
	else file_text_write_string(fl,string(str));
	file_text_writeln(fl);
}

/// @function			file_write(file,str)
/// @desc				writes text to a file, does not insert line breaks
/// @arg file			the file variable given by openFile
/// @arg str			the string to write
function file_write(fl,str) {
	if (is_string(str)) file_text_write_string(fl,str);
	else if (is_ptr(str)) file_text_write_string(fl,"");
	else file_text_write_string(fl,string(str));
}

/// @function			file_write_lines(file,strArray)
/// @desc				writes all lines in a string array to a file, auto-inserts line breaks
/// @arg file			the file variable given by openFile
/// @arg strArray		an array of strings
function file_write_lines(fl,strArray) {
	for (var i=0; i<array_length(strArray); i++) {
		file_write_line(fl, strArray[i]);
	}
}

/// @function			file_read_line_number(file,lineNumber)
/// @desc				returns a user specified line from a file opened for reading
/// @arg file			the file variable given by openFile
/// @arg lineNumber		the line number you are looking for
function file_read_line_number(fl,lineNumber) {
	for (var i=0; i<(lineNumber-1); i++) {
		if (!file_text_eof(fl)) file_text_readln(fl);
	}
	
	return file_read_line(fl);
}