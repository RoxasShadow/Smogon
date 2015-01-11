#! /usr/bin/env ruby
require 'smogon'

describe 'Pokedex' do
  it 'returns the moveset of given Pokémon and metagame' do
    movesets = Smogon::Movesetdex.get 'Abomasnow', 'UU', 'bw'

    expect(movesets.length).to be > 0
    expect(movesets.first.nature.include?('Lonely')).to be_truthy
    expect(movesets.select { |moveset| moveset.tier != 'UU' }.length).to be 0
  end
end
