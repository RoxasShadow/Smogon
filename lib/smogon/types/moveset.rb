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
    class Moveset < Base
      ATTRIBUTES = %w(
        pokemon name tier items abilities natures moves evs ivs
      ).freeze

      attr_accessor(*ATTRIBUTES)

      def initialize(pokemon = nil, tier = nil, moveset = nil)
        return if !pokemon

        @pokemon = pokemon
        @name = moveset['name']
        # @description = moveset['description']
        @tier = tier
        @items = moveset['items']
        @abilities = moveset['abilities']
        @natures = moveset['natures']
        @moves = moveset['moveslots']
        @evs = moveset['evconfigs'].map(&:values)
        @ivs = moveset['ivconfigs'].map(&:values)
      end

      def url
        "http://www.smogon.com/dex/#{::Smogon::API::METAGAME}/pokemon/#{pokemon}"
      end
    end
  end
end
