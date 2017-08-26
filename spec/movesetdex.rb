#! /usr/bin/env ruby
require 'smogon'

describe 'Movesetdex' do
  it 'returns the moveset of given Pokémon and metagame' do
    movesets = Smogon::Movesetdex.get('Abomasnow', 'UU', 'bw')

    expect(movesets.count).to eq 2
    expect(movesets.first.natures).to eq(%w(Sassy Calm))
    expect(movesets.select { |moveset| moveset.tier != 'UU' }.length).to be 0
  end

  it 'returns the moveset of given Pokémon and metagame having some empty field' do
    Smogon::Movesetdex.get 'Metagross', 'OU', 'XY'
  end
end
