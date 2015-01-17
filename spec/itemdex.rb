#! /usr/bin/env ruby
require 'smogon'

describe 'Itemdex' do
  it 'returns infos about the given item' do
    item = Smogon::Itemdex.get 'Leftovers'

    expect(item.name).to eq('Leftovers')
    expect(item.description.length).to be > 10
    expect(item.to_s.length).to be > 10
  end
end
