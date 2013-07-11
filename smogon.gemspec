Kernel.load 'lib/smogon/version.rb'

Gem::Specification.new {|s|
	s.name          = 'smogon'
	s.version       = Smogon::version
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'Smogon API in Ruby.'
	s.description   = 'API written in Ruby to get Pokémon infos and movesets from Smogon.'

	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')

	s.add_runtime_dependency 'nokogiri'
}