#--
# Copyright(C) 2013 Giovanni Capuano <webmaster@giovannicapuano.net>
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
    attr_accessor :name, :_name, :types, :tier, :abilities, :base_stats
    
    def to_s
      "Name: #{name}\nAbility: #{abilities.join(', ')}\nType: #{types.join(?/)}\nTier: #{tier}\nBase stats: #{base_stats.join(?/)}"
    end
    
    def url
      "http://www.smogon.com/bw/pokemon/#{_name}"
    end
  end
end