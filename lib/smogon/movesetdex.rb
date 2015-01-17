#--
# Copyright(C) 2015 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# This file is part of Smogon-API.
#
# Smogon-API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Smogon-API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Smogon-API.  If not, see <http://www.gnu.org/licenses/>.
#++

module Smogon
  class Movesetdex
    def self.get(name, tier = nil, metagame = nil, fields = nil)
      incapsulate = fields == nil

      fields ||= [
        'name',
        'movesets' => [
          'name',
          { 'tags'      => %w(shorthand) },
          { 'items'     => %w(name)      },
          { 'abilities' => %w(name)      },
          { 'natures'   => %w(hp patk pdef spatk spdef spe) },
          { 'moveslots' => [ 'slot', { 'move' => %(name) } ] },
          { 'evconfigs' => %w(hp patk pdef spatk spdef spe) }
        ]
      ]

      response = if metagame
        API.using_metagame(metagame) do
          API.request 'pokemon', name, fields
        end
      else
        API.request 'pokemon', name, fields
      end
      return nil      if response.is_a?(String) || response.empty? || response.first.empty?
      return response if not incapsulate

      response = response.first

      results = [].tap do |movesets|
        response['movesets'].each do |movesetdex|
          movesets << Moveset.new.tap do |moveset|
            moveset.pokemon = response['name']
            moveset.name    = movesetdex['name']
            moveset.tier    = movesetdex['tags'][0]['shorthand']
            moveset.item    = movesetdex['items'].collect(&:values).flatten
            moveset.ability = movesetdex['abilities'].collect(&:values).flatten
            moveset.nature  = Naturedex.get(movesetdex['natures'].first)

            moveset.moves = []
            movesetdex['moveslots'].each do |moveslot|
              slot = moveslot['slot'] - 1

              if moveset.moves[slot]
                moveset.moves[slot] << moveslot['move_name']
              else
                moveset.moves << [ moveslot['move_name'] ]
              end
            end

            moveset.evs = [].tap do |evs|
              ['hp', 'patk', 'pdef', 'spatk', 'spdef', 'spe'].each do |stat|
                evs << movesetdex['evconfigs'].first[stat]
              end
            end.join ' / '
          end
        end
      end

      tier ? results.reject { |moveset| moveset.tier.downcase != tier.downcase } : results
    end
  end
end
