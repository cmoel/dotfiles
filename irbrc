#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'awesome_print'
require 'interactive_editor'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

class Object
  def mate(method_name)
    file, line = method(method_name).source_location
    `mate '#{file}' -l #{line}`
  end
end
