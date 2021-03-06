# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scope_filters}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Klingemann"]
  s.date = %q{2010-10-22}
  s.description = %q{A Rails plugin that facilitates the creation of toggleable, chainable filter links in collection views, based on defined scopes.}
  s.email = %q{patrick.klingemann@gmail.com}
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
     "app/views/scope_filters/_filter_links.html.erb",
     "lib/scope_filters.rb",
     "lib/scope_filters/extensions.rb",
     "scope_filters.gemspec",
     "test/helper.rb",
     "test/test_scope_filters.rb"
  ]
  s.homepage = %q{http://github.com/pklingem/scope_filters}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Chainable, Toggleable Resource Filters for ActiveRecord Models}
  s.test_files = [
    "test/test_scope_filters.rb",
     "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

