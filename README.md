# Smogon-API

Unofficial API for Smogon (poké|move)dex written in Ruby with Nokogiri.

`Installation: [sudo] gem install smogon`


    require 'smogon'
    
    puts Smogon::Movedex.get 'Blaziken', 'uber'
    puts Smogon::Pokedex.get 'Blaziken'