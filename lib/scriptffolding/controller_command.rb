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
require "scriptffolding/controller_actions"
ActionController::Base.class_eval do

  class << self
    attr_accessor :script_model_name
    attr_accessor :script_content_field
    attr_accessor :script_buttons
    attr_accessor :scriptffold_options


    def add_script_button(options)
      self.script_buttons ||= Array.new
      self.script_buttons << options
    end
  end

  def self.scriptffold( model_name = nil, options = {})
    self.script_model_name = model_name || :script
    self.script_content_field = options[:content_field] || :content
    self.scriptffold_options = options

    default_buttons = options[:default_buttons] || [:save]

    if default_buttons.include? :save
      scriptffold_button :action => "save", :icon => "/scriptffolding/save.png"
    end

    self.class_eval do
      include Scriptffolding::ControllerActions
    end
  end

  def self.scriptffold_button( options )
    self.add_script_button(options)
  end
end

