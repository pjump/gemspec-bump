$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

$gemspec = Gem::Specification.load(Dir["*.gemspec"][0]) 
require $gemspec.name.tr('-','/')

require 'minitest/autorun'
require 'minitest/documentation'

Minitest::Test.i_suck_and_my_tests_are_order_dependent!
Minitest.should_shuffle_suites = false

