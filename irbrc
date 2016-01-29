#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'irbtools'
require 'interactive_editor'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
