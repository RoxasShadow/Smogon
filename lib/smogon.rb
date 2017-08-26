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

require 'net/http'
require 'open-uri'
require 'json'

require 'smogon/api'
require 'smogon/naturedex'

require 'smogon/types/base'
require 'smogon/types/pokemon'
require 'smogon/types/ability'
require 'smogon/types/item'
require 'smogon/types/move'
require 'smogon/types/moveset'

require 'smogon/pokedex'
require 'smogon/abilitydex'
require 'smogon/itemdex'
require 'smogon/movedex'
require 'smogon/movesetdex'

require 'smogon/version'
