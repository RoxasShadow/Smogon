# Smogon-API

API to get (Poké|Ability|Item|Move|Moveset)dex from Smogon.

`Installation: [sudo] gem install smogon`


    require 'smogon'
    
    puts Smogon::Pokedex.get    'Blaziken'
    puts Smogon::Abilitydex.get 'Synchronize'
    puts Smogon::Itemdex.get    'Leftovers'
    puts Smogon::Movedex.get    'Reflect'
    puts Smogon::Movesetdex.get 'Blaziken', 'uber', 'bw'
