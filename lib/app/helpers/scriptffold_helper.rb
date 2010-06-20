=begin

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

=end
module ScriptffoldHelper

  def scriptffold_edit_textarea( options = {})
    language = options[:language] || "ruby"
    linenumbers = options[:linenumbers] || true
    width = options[:width] || "700px"
    height = options[:height] || "200px"

    <<-eos
    <textarea  style="width:#{width};height:#{height};" id="codepresswindow" class="codepress #{language} linenumbers-#{linenumbers ? "on" : "off" }">#{@obj ? @obj[controller.content_field] : ""}</textarea>
    eos
  end

  def scriptffold_edit_buttons( options = {} )
    output = ""


    controller_name = controller.controller_name
    controller.class.script_buttons.each do |button|
      button_width = options[:button_width] || button[:button_width] || controller.class.scriptffold_options[:button_width] || "30px"
      button_height = options[:button_height] || button[:button_height] || controller.class.scriptffold_options[:button_height] || "30px"
      output << "<img style='width:#{button_width}; height:#{button_height};' src=#{button[:icon]} onclick='javascript:sendScriptAction(#{controller_name.inspect}, #{button[:action].inspect}, #{@obj ? @obj.id.to_s.inspect : '""'} )'></img>"
    end

    output
  end

  def scriptffold_js
    <<-eos
    <script src="/scriptffolding/codepress/codepress.js" type="text/javascript"></script>
    <script src="/scriptffolding/script_action.js" type="text/javascript"></script>
    eos
  end

  def scriptffold_edit( options = {} )
    <<-eos
    #{scriptffold_js}
    #{scriptffold_edit_buttons options} <br/>
    #{scriptffold_edit_textarea options}
    eos
  end

end