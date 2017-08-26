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

      def initialize(response, moves)
        @name       = response['name']
        @evolutions = response['evos']
        @genfamily  = response['genfamily']
        @moves      = moves

        alts = response['alts'][0]
        @base_stats = alts.fetch_values(*STATS)
        @weight     = alts['weight']
        @height     = alts['height']
        @abilities  = alts['abilities']
      end

      def self.id2name(id)
        begin
          Nokogiri::HTML(open("http://www.marriland.com/pokedex/#{id}")).xpath('//div[@class="overview"]/h2')[0].text
        rescue
          nil
        end
      end
    end
  end
end
