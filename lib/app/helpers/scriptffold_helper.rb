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
  def scriptffold_edit( options = {} )
#     render :partial => "lslsls/sarasa", :collection => "qpq"

    language = options[:language] || "ruby"
    linenumbers = options[:linenumbers] || true
    width = options[:width] || "700px"
    height = options[:height] || "200px"

    <<-eos
    <script src="/scriptffolding/codepress/codepress.js" type="text/javascript"></script>
    <textarea  style="width:#{width};height:#{height};" id="codepresswindow#{rand(10000)}" class="codepress #{language} linenumbers-#{linenumbers ? "on" : "off" }">
    #{@obj[controller.content_field]}
    </textarea>
    eos
  end

  def scriptffold_index( options = {} )

    output = ""
    @scripts.each do |script|
      name = script[controller.name_field]
      output << "#{h name} <a href='edit/#{script.id}'>edit</a> <br/>"
    end

    output
  end
end