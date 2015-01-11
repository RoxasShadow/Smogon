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
  class Pokedex
    def self.get(name, fields = nil)
      incapsulate = fields == nil
      
      fields ||= [
        'name',
        'alias',
        'alts' => [
          { 'types'     => %w(name)      },
          { 'tags'      => %w(shorthand) },
          { 'abilities' => %w(name)      },
          'hp', 'patk', 'pdef', 'spatk', 'spdef', 'spe'
        ],
        'moves' => ['name']
      ]

      response = API.request 'pokemon', name, fields
      return nil      if response.is_a?(String) || response.empty? || response.first.empty?
      return response if not incapsulate

      response = response.first
      pokedex  = response['alts'][0]
      
      Pokemon.new.tap do |pokemon|
        pokemon.name  = response['name']
        pokemon._name = response['alias']

        pokemon.types     = pokedex['types'].collect(&:values).flatten
        pokemon.tier      = pokedex['tags'][0]['shorthand']
        pokemon.abilities = pokedex['abilities'].collect(&:values).flatten

        pokemon.base_stats = [].tap do |base_stats|
          ['hp', 'patk', 'pdef', 'spatk', 'spdef', 'spe'].each do |stat|
            base_stats << pokedex[stat]
          end
        end

        pokemon.moves = response['moves'].collect(&:values).flatten
      end
    end
  end
end
