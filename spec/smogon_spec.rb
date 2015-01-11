#! /usr/bin/env ruby
# require 'smogon'

# describe 'Smogon' do
#   it 'returns the requested Pokémon' do
#     pokemon = Smogon::Pokedex.get  'Blaziken'
#     pokemon.name.should            eql('Blaziken')
#     pokemon.base_stats.last.should eql('80')
#     pokemon.moves.any?.should      be_true
#   end

#   it 'search the given ability' do
#     ability = Smogon::Abilitydex.get 'Synchronize'
#     ability.name.should              eql('Synchronize')
#   end

#   it 'returns the given item' do
#     item = Smogon::Itemdex.get 'Leftovers'
#     item.name.should           eql('Leftovers')
#   end

#   it 'returns the given move' do
#     move = Smogon::Movedex.get 'Reflect'
#     move.name.should           eql('Reflect')
#     move.type.should           eql('Psychic')
#     move.pp.should             eql('20')
#   end

#   it 'returns the moveset of the given Pokémon and metagame' do
#     moveset = Smogon::Movesetdex.get                'Blaziken', 'uber', 'bw'
#     moveset.any?.should                             be_true
#     moveset.first.nature.include?('Jolly').should   be_true
#   end

#   it 'returns the name of the Pokémon relative to the given ID' do
#     Smogon::Pokemon.id2name(111).should eql('Rhyhorn')
#     moveset = Smogon::Movesetdex.get                'Blaziken', 'uber', 'bw'
#     moveset.any?.should                             be_true
#     moveset.first.nature.include?('Jolly').should   be_true
#   end
# end