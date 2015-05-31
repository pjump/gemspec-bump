require "gemspec/bump/version"

module Gemspec
  class Version
    IllegalFormat = Class.new(ArgumentError)

    def initialize(string)
      @data = string.split('.').reverse
      raise IllegalFormat, string unless @data.all? {|item| item =~ /^\d*$/ }
    end
  end

  class VersionDiff
    IllegalFormat = Class.new(ArgumentError)

    def initialize(string)
      @data = string.split('.').reverse
      raise IllegalFormat, string unless @data.all? {|item| item =~ /^(\+|\-)?\d*$/ }
    end
  end

  module Bump

    
  end
end
