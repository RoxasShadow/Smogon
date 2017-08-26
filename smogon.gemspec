Kernel.load 'lib/smogon/version.rb'

Gem::Specification.new do |s|
	s.name          = 'smogon'
	s.version       = Smogon::VERSION
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'APIs wrapper to get data from Smogon.'
	s.description   = 'APIs wrapper to get (Poké|Ability|Item|Move|Moveset)dex data from Smogon'
	s.licenses      = 'GPL-3.0'

	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
	s.test_files    = Dir.glob('spec/**/*.rb')

	s.add_dependency 'json', '~> 2.1'

  s.add_development_dependency 'rake',  '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
end
