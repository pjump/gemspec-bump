require "gemspec/bump/version"

module Gemspec
  class Version
    IllegalFormat = Class.new(ArgumentError)

    attr_accessor :data

    def initialize(string_or_array)
      @data = string_or_array
      @data = @data.split('.') if string_or_array.is_a? String
      raise IllegalFormat, to_s unless @data.all? {|item| item.is_a? Integer or item =~ /^\d*$/ }
      @data.map!(&:to_i)
    end

    def ==(other)
      data == other.data
    end

    def to_s
      @data.join(".")
    end

    def apply(diff)
      my_data_r = data.reverse
      diff_data_r = diff.data.reverse
      result = my_data_r.zip(diff_data_r).map do |first, second|
        first = if second =~ /^[+-]/
            first + second.to_i
          else
            (second and second.to_i) or first
          end
        first
      end.reverse
      Version.new(result)
    end
  end

  class VersionDiff
    IllegalFormat = Class.new(ArgumentError)

    attr_accessor :data

    def initialize(string)
      @data = string.split('.')
      raise IllegalFormat, string unless @data.all? {|item| item =~ /^(\+|\-)?\d*$/ }
    end
  end
end
