# Smogon-API

Unofficial API for Smogon (poké|move|ability)dex written in Ruby with Nokogiri.

`Installation: [sudo] gem install smogon`


    require 'smogon'
    
    puts Smogon::Pokedex.get    'Blaziken'
    puts Smogon::Movedex.get    'Blaziken', 'uber'
    puts Smogon::Abilitydex.get 'Synchronize'