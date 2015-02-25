#! /usr/bin/env ruby
require 'smogon'

describe 'Movesetdex' do
  it 'returns the moveset of given Pokémon and metagame' do
    movesets = Smogon::Movesetdex.get 'Abomasnow', 'UU', 'bw'

    expect(movesets.length).to be > 0
    expect(movesets.to_s.length).to be > 10
    expect(movesets.first.nature.include?('Lonely')).to be_truthy
    expect(movesets.select { |moveset| moveset.tier != 'UU' }.length).to be 0
  end

  it 'returns the moveset of given Pokémon and metagame having some empty field' do
    Smogon::Movesetdex.get 'Metagross', 'OU', 'xy'
  end
end
