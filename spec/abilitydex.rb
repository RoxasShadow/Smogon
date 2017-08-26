#! /usr/bin/env ruby
require 'smogon'

describe 'Abilitydex' do
  it 'returns infos about the given ability' do
    ability = Smogon::Abilitydex.get('Synchronize')

    expect(ability.name).to eq('Synchronize')
    expect(ability.description.length).to be > 10
    expect(ability.to_s.length).to be > 10
  end

  it 'returns nil with an unknown ability' do
    ability = Smogon::Abilitydex.get('lolwut')
    expect(ability).to be_nil
  end
end
