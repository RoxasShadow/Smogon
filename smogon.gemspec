Kernel.load 'lib/smogon/version.rb'

Gem::Specification.new do |s|
	s.name          = 'smogon'
	s.version       = Smogon::VERSION
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'APIs for Smogon.'
	s.description   = 'APIs to get (Poké|Ability|Item|Move|Moveset)dex from Smogon'
	s.licenses      = 'GPL-3'

	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
	s.test_files    = Dir.glob('spec/**/*.rb')

	s.add_dependency 'json', '~> 1.8'

  s.add_development_dependency 'rake',  '~> 10.4'
  s.add_development_dependency 'rspec', '~> 3.1'
end
