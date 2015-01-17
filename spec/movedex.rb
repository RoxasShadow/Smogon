#! /usr/bin/env ruby
require 'smogon'

describe 'Movedex' do
  it 'returns infos about the given move' do
    move = Smogon::Movedex.get 'Extreme Speed'

    expect(move.name).to eq('Extreme Speed')
    expect(move.type).to eq('Normal')
    expect(move.pp).to   be 5
  end
end
