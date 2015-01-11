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
  class Pokemon
    attr_accessor :name, :_name, :types, :tier, :abilities, :base_stats, :moves
    
    def to_s
      "Name: #{@name}\nAbility: #{@abilities.join(', ')}\nType: #{@types.join(?/)}\nTier: #{@tier}\nBase stats: #{@base_stats.join(?/)}\nMoves: #{@moves.join(', ')}"
    end
    
    def url
      "http://www.smogon.com/dex/#{API::GENERATION}/pokemon/#{@_name}"
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