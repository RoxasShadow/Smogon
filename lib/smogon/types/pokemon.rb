#--
# Copyright(C) 2017 Giovanni Capuano <webmaster@giovannicapuano.net>
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
  module Type
    class Pokemon < Base
      ATTRIBUTES = %w(
        name base_stats weight height types abilities evolutions genfamily moves
      ).freeze

      attr_accessor(*ATTRIBUTES)

      TYPE = 'pokemon'.freeze
      STATS = %w(hp atk def spa spd spe).freeze

      def initialize(response = nil, moves = nil)
        return unless response

        @name       = response['name']
        @evolutions = response['evos']
        @genfamily  = response['genfamily']

        if moves.include?('Hidden Power Fire')
          moves.delete_if { |move| move.start_with?('Hidden Power ') }
          moves << 'Hidden Power'
        end
        @moves = moves.uniq

        alts = response['alts'][0]
        @base_stats = alts.fetch_values(*STATS)
        @weight     = alts['weight']
        @height     = alts['height']
        @types      = alts['types']
        @abilities  = alts['abilities']
      end

      def self.id2name(id)
        response = open("http://pokeapi.co/api/v2/pokemon/#{id}")
        JSON.parse(response.read)['name']
      end
    end
  end
end
