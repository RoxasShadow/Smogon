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
  class Movedex
    def self.get(name, fields = nil)
      incapsulate = fields == nil

      fields ||= [
        'name',
        'alias',
        'description',
        'power',
        'accuracy',
        'pp',
        'type' => ['name'],
      ]

      response = API.request 'move', name, fields
      return nil      if response.is_a?(String) || response.empty? || response.first.empty?
      return response if not incapsulate

      response = response.first

      Move.new.tap do |move|
        move.name        = response['name'       ]
        move._name       = response['alias'      ]
        move.description = response['description']
        move.type        = response['type'       ].values.join(' / ')
        move.power       = response['power'      ]
        move.accuracy    = response['accuracy'   ]
        move.pp          = response['pp'         ]
      end
    end
  end
end
