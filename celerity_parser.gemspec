# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{celerity_parser}
  s.version = "0.1.1"
  s.platform = %q{java}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Young"]
  s.date = %q{2009-06-22}
  s.email = %q{alex@blackkettle.org}
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
     "celerity_parser.gemspec",
     "lib/celerity_parser.rb",
     "lib/celerity_parser/html_node.rb",
     "lib/celerity_parser/html_parser.rb",
     "test/helper.rb",
     "test/test_celerity_parser.rb",
     "test/test_html_node.rb",
     "test/test_html_parser.rb"
  ]
  s.homepage = %q{http://github.com/regularfry/celerity_parser}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{celerity_parser}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Thin wrapper around a native Java HTML parser}
  s.test_files = [
    "test/helper.rb",
     "test/test_html_node.rb",
     "test/test_html_parser.rb",
     "test/test_celerity_parser.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jarib-celerity>, [">= 0.0.6.10"])
    else
      s.add_dependency(%q<jarib-celerity>, [">= 0.0.6.10"])
    end
  else
    s.add_dependency(%q<jarib-celerity>, [">= 0.0.6.10"])
  end
end
