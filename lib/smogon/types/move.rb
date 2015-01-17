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
  class Move
    attr_accessor :name, :_name, :description, :type, :power, :accuracy, :pp

    def to_s
      "Name: #{@name}\nDescription: #{@description}\nType: #{@type}\nPower: #{@power}\nAccuracy: #{@accuracy}\nPP: #{@pp}"
    end

    def url
      "http://www.smogon.com/dex/#{API::METAGAME}/moves/#{@_name}"
    end

    %i(priority damage target).each do |m|
      define_method(m) { '' }
    end
  end
end
