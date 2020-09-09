# -*- encoding: utf-8 -*-
# stub: open_street_map 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "open_street_map".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["JungleCoders".freeze, "Anton Bogdanov".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-02-13"
  s.description = "Integration with OpenStrretMap API".freeze
  s.email = ["kortirso@gmail.com".freeze]
  s.homepage = "https://github.com/WebGents/open_street_map".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.1".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "OpenStrretMap API".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.57.2"])
    s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.16"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.57.2"])
    s.add_dependency(%q<httparty>.freeze, ["~> 0.16"])
  end
end
