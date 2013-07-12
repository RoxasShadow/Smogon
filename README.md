# Smogon-API

Unofficial API for Smogon (Poké|Ability|Move|Moveset)dex written in Ruby with Nokogiri.

`Installation: [sudo] gem install smogon`


    require 'smogon'
    
    puts Smogon::Pokedex.get    'Blaziken'
    puts Smogon::Abilitydex.get 'Synchronize'
    puts Smogon::Movedex.get    'Reflect'
    puts Smogon::Movesetdex.get 'Blaziken', 'uber'
