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
  class Movesetdex
    def self.get(name, tier = nil, metagame = nil)
      response = if metagame
        API.using_metagame(metagame.downcase) do
          API.request(:pokemon, name, true)
        end
      else
        API.request(:pokemon, name, true)
      end

      return nil unless response

      strategies = response['strategies']

      if (tier = tier&.upcase)
        strategies = [strategies.find do |strategy|
          strategy['format'] == tier
        end]
      end

      [].tap do |movesets|
        strategies.each do |strategy|
          # overview, comments
          tier = strategy['format']
          movesets.concat(
            strategy['movesets'].map do |moveset|
              Type::Moveset.new(name, tier, moveset)
            end
          )
        end
      end
    end
  end
end
