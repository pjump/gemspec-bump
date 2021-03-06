# coding: utf-8

#Naming utils, git utils, and default boilerplate
require 'gemspec'

#This is a place to put custom overrides to Gemspec.boilerplate
begin; require_relative 'gemspec.rb'; rescue LoadError; end

Gem::Specification.new do |s|

  #Name is the name of the project root directory
  s.name           = Gemspec.base_dirname(__FILE__)

  Gemspec.boilerplate(s)

  #s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."

  #####Must change
  s.summary       = %q{A version bumper}
  s.description   = %q{A flexible and concise version bumper that can, in a single command, take care of all the git ceremony in a git-flow compatible fashion . }
  s.licenses      = %w[GPL-2.0]


  #####Unlikely to change
  s.email         = [ `git config user.email`.chomp ]
  s.homepage      = "https://github.com/#{`git config github.username`.chomp}/#{s.name}.git"
  $? == 0 or s.homepage = nil
  ###################################

  #Dependencies
  s.add_dependency 'gemspec', '~> 0'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'minitest-documentation'

end
