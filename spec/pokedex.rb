#! /usr/bin/env ruby
require 'smogon'

describe 'Pokedex' do
  it 'returns the requested Pokémon' do
    pokemon = Smogon::Pokedex.get('Blaziken')

    expect(pokemon.name).to            eq('Blaziken')
    expect(pokemon.base_stats.last).to be 80
    expect(pokemon.moves.length).to    be > 10
    expect(pokemon.to_s.length).to     be > 10
  end

  it 'returns the requested Pokémon containing special chars' do
    pokemon = Smogon::Pokedex.get('Porygon-Z')
    expect(pokemon.name).to eq('Porygon-Z')
  end

  it 'returns the requested Pokémon containing numbers' do
    pokemon = Smogon::Pokedex.get('Porygon2')
    expect(pokemon.name).to eq('Porygon2')
  end
end
