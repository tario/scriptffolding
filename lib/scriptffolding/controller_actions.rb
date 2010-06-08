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


module Scriptffolding
  module ControllerActions
    def new
    end

    def save
      obj = model_class.new( content_field => params[:content], name_field => params[:name] )
      obj.save
    end

    def edit
      obj = model_class.find(params[:id])
      if obj
        @obj = obj
      end
    end

    def update
      obj = model_class.find(params[:id])
      obj.name = params[:name]
      obj.content = params[:content]
      obj.save
    end

    def index
      @scripts = model_class.all
    end

    def model_class
      model_name.to_s.capitalize.gsub(/s$/, "").constantize
    end
    def model_name
      self.class.script_model_name
    end
    def content_field
      self.class.script_content_field
    end
    def name_field
      self.class.script_name_field
    end
  end
end