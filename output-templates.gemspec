lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'output/templates/version'

Gem::Specification.new do |spec|
  spec.name = 'output-templates'
  spec.version = Output::Templates::VERSION
  spec.authors = ['Gareth Visagie']
  spec.email = ['gareth@gjvis.com', 'ggp-dev@digital.cabinet-office.gov.uk']

  spec.summary = 'Templates for generating Pension Wise output documents'
  spec.homepage = 'https://github.com/guidance-guarantee-programme/output-templates'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'NONE'
  spec.required_ruby_version = '>= 3.0'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'actionview'
  spec.add_dependency 'sassc'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'cucumber', '~> 2.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.6'
end
