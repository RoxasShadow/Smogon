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
  class Abilitydex 
    def self.get(name)
      begin
        name.downcase.gsub!(/\s/, ?_)
        url = URI::encode "http://www.smogon.com/bw/abilities/#{name}"
        
        smogon = Nokogiri::HTML(open(url))
      rescue
        return nil
      end
      
      ability = Ability.new
      
      s = smogon.xpath('//div[@id="content_wrapper"]')[0]
      ability.name        = s.xpath('.//h1').first.text
      ability._name       = name
      
      ability.description = ''.tap { |d|
        h2 = 0
        s.children.each { |c|
          if c.name == 'h2'          
            h2 += 1
            next
          end
          d << c.text if h2 == 1 && !c.text.strip.empty?
        }
      }
      
      return ability
    end
  end
end