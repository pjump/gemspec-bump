require 'minitest_helper'

describe "Gemspec::Version" do
  include Gemspec

  describe "Valid versions" do

    valid_versions = %w[1.1 1.0.0  443.432.432.432]
    valid_versions.each do |valid_version|
      it "should recognize #{valid_version} as a valid version" do
        Gemspec::Version.new(valid_version)
      end
    end
  end

  describe "Invalid versions" do

    invalid_versions = %w[1a.1 fdas1.0.0  443.432.432.432_pre 1.+4.0, -1.3.4 ]
    invalid_versions.each do |valid_version|
      it "should not recognize #{valid_version} as a valid version" do
        assert_raises(Gemspec::Version::IllegalFormat) { Gemspec::Version.new(valid_version) }
      end
    end
  end

  describe "Applying version diff" do
    #version, diff, result
    [
    %w[1.0.0 1.+1.0 1.1.0],
    %w[1.0.1 1.+1.2 1.1.2],
    %w[1.1.1 1.-1.2 1.0.2],
    %w[1.1.1 +1.2 1.2.2],
    %w[1.1.1.1 +3.+1.2 1.4.2.2],
    ].each do |version, diff, result|
      it "should combine #{version} with #{diff} into #{result}" do
        assert_equal Gemspec::Version.new(result), Gemspec::Version.new(version).apply(Gemspec::VersionDiff.new(diff)) 
      end
    end
  end

end

describe "Gemspec::VersionDiff" do
  describe "Valid diffs" do

    valid_diffs = %w[1.1 1.0.0  443.432.432.432]
    valid_diffs += %w[1.+1 1.-1.0  443.-432.432.+432 -1.0.4]
    valid_diffs.each do |valid_diff|
      it "should recognize #{valid_diff} as a valid diff" do
        Gemspec::VersionDiff.new(valid_diff)
      end
    end
  end

  describe "Invalid diffs" do

    invalid_diffs = %w[1a.1 fdas1.0.0  443.432.432.432_pre 1.+a4.0, -a1.3.4 ]
    invalid_diffs.each do |valid_diff|
      it "should not recognize #{valid_diff} as a valid diff" do
        assert_raises(Gemspec::VersionDiff::IllegalFormat) { Gemspec::VersionDiff.new(valid_diff) }
      end
    end
  end
end
