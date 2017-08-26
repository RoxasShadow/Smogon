#! /usr/bin/env ruby
require 'smogon'

describe 'Pokemon' do
  it 'returns the name of the pokémon, given its ID' do
    name = Smogon::Type::Pokemon.id2name(1)
    expect(name).to eq 'bulbasaur'
  end
end
