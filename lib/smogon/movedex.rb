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
  class Movedex 
    def self.get(name)
      begin
        name   = name.downcase.gsub /\s/, ?_
        url    = URI::encode "http://www.smogon.com/bw/moves/#{name}"
        smogon = Nokogiri::HTML open(url)
      rescue
        return nil
      end
      
      Move.new.tap { |move|      
        move.name  = smogon.xpath('//div[@id="content_wrapper"]/h1').first.text
        move._name = name
        
        move.description = ''.tap { |d|
          h2 = 0
          ul = 0
          dl = 0
          smogon.xpath('//div[@id="content_wrapper"]').children.each { |c|
            if c.name == 'h2'
              h2 += 1
              next
            end
            if c.name == 'ul'
              ul += 1
              next
            end
            if c.name == 'dl'
              dl += 1
              next
            end
            break if ul >= 2 || dl >= 2
            d << c.text if h2 == 1 && !c.text.strip.empty?
          }
        }
        
        info = smogon.xpath('//table[@class="info"]/tr')[1].xpath('.//td')
        move.type     = info[0].text
        move.power    = info[1].text
        move.accuracy = info[2].text
        move.pp       = info[3].text
        move.priority = info[4].text
        move.damage   = info[5].text.strip
        move.target   = info[6].text.strip
      }
    end
  end
end
