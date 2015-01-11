#! /usr/bin/env ruby
require 'smogon'

describe 'Pokedex' do
  it 'returns the requested Pokémon' do
    pokemon = Smogon::Pokedex.get 'Blaziken'

    expect(pokemon.name).to            eq('Blaziken')
    expect(pokemon.base_stats.last).to be 80
    expect(pokemon.moves.length).to    be > 10
  end
end
