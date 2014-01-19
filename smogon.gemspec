Kernel.load 'lib/smogon/version.rb'

Gem::Specification.new { |s|
	s.name          = 'smogon'
	s.version       = Smogon::version
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'API for Smogon.'
	s.description   = 'API to get (Poké|Ability|Item|Move|Moveset)dex from Smogon'
  s.licenses      = 'GPL-3'

	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*_spec.rb')

	s.add_dependency 'nokogiri'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
}
