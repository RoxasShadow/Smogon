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
  class API
    class << self
      ENDPOINT   = 'http://www.smogon.com/dex/api/query?q='
      GENERATION = 'xy'

      def request(what, name, fields)
        query = {
          what => { 'gen' => GENERATION, 'alias' => aliasize(name) }
          '$'  => fields
        }

        response = JSON.parse open("#{ENDPOINT}#{JSON.generate(body)}").read
        response['status'] == 'success' ? response['result'] : response['message']
      end

    private

      def aliasize(string)
        string.downcase.gsub(/[^a-z]/i, '')
      end
  end
end
