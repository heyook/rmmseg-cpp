# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rmmseg/version'

Gem::Specification.new do |s|
  s.name        = "rmmseg-cpp"
  s.version     = RMMSeg::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pluskid", "Lin He"]
  s.email       = ["he9lin@gmail.com"]
  s.homepage    = "http://github.com/heyook/rmmseg-cpp"
  s.summary     = "A high performance Chinese word segmentation utility for
Ruby."
  s.description = "An re-implementation of rmmseg (Chinese word segmentation library for Ruby) in C++"

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("{bin,data,ext,lib}/**/*") + %w(LICENSE README.md)
  s.executables  = ['rmmseg']
  s.require_path = 'lib'
end
