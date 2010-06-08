/*

This file is part of the scriptffolding project, http://github.com/tario/scriptffolding

Copyright (c) 2009-2010 Roberto Dario Seminara <robertodarioseminara@gmail.com>

scriptffolding is free software: you can redistribute it and/or modify
it under the terms of the gnu general public license as published by
the free software foundation, either version 3 of the license, or
(at your option) any later version.

scriptffolding is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.  see the
gnu general public license for more details.

you should have received a copy of the gnu general public license
along with scriptffolding.  if not, see <http://www.gnu.org/licenses/>.

*/
function sendScriptAction( controller_name, action_name, id ) {
	parameters = "content=" + escape(codepresswindow.getCode() )
	
	if (id == "") {
	document.location = "/" + controller_name + "/" + action_name + "?" + parameters;
	} else {
	document.location = "/" + controller_name + "/" + action_name + "/" + id + "?" + parameters;
	}
}
  