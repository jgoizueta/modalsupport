# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{modalsupport}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Javier Goizueta"]
  s.date = %q{2011-02-08}
  s.description = %q{additional support extensions to ActiveSupport and HoboSupport}
  s.email = %q{jgoizueta@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/modalsupport.rb",
     "lib/modalsupport/array.rb",
     "lib/modalsupport/enumerable.rb",
     "lib/modalsupport/file.rb",
     "lib/modalsupport/full.rb",
     "lib/modalsupport/mixins/bracket_constructor.rb",
     "lib/modalsupport/mixins/state_equivalent.rb",
     "lib/modalsupport/regexp.rb",
     "lib/modalsupport/ruby_engine.rb",
     "lib/modalsupport/ruby_platform.rb",
     "lib/modalsupport/ruby_version.rb",
     "lib/modalsupport/string.rb",
     "modalsupport.gemspec",
     "test/helper.rb",
     "test/test_bracket_constructor.rb",
     "test/test_cross_each.rb",
     "test/test_grep.rb",
     "test/test_gsub.rb",
     "test/test_match.rb",
     "test/test_paralell_each.rb",
     "test/test_product.rb",
     "test/test_relative_path.rb",
     "test/test_rotate.rb",
     "test/test_slice.rb",
     "test/test_state_equivalent.rb",
     "test/test_unindent.rb"
  ]
  s.homepage = %q{http://github.com/jgoizueta/modalsupport}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{simple extensions to core classes}
  s.test_files = [
    "test/helper.rb",
     "test/test_bracket_constructor.rb",
     "test/test_cross_each.rb",
     "test/test_grep.rb",
     "test/test_gsub.rb",
     "test/test_match.rb",
     "test/test_paralell_each.rb",
     "test/test_product.rb",
     "test/test_relative_path.rb",
     "test/test_rotate.rb",
     "test/test_slice.rb",
     "test/test_state_equivalent.rb",
     "test/test_unindent.rb",
     "test/tstr.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end

