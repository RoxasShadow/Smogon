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
  class API
    METAGAME = 'sm'
    ENDPOINT = 'http://www.smogon.com/dex/_rpc/dump-'.freeze

    class << self
      def request(what, name, remote = false)
        name = aliasize(name)

        if remote
          return JSON.parse(req(
            URI(ENDPOINT + what.to_s),
            { gen: METAGAME, alias: name }
          ))
        end

        unless @_basics
          @_basics = JSON.parse(req(
            URI(ENDPOINT + 'basics'),
            { gen: METAGAME }
          ))
        end

        @_basics[what.to_s].find do |x|
          aliasize(x['name']) == name
        end
      end

      def using_metagame(metagame, &block)
        default_metagame = METAGAME.dup
        METAGAME.replace aliasize(metagame)
        instance_eval(&block).tap do
          METAGAME.replace default_metagame
        end
      end

      private

      def aliasize(string)
        string.downcase.gsub(' ', '_').gsub(/[^a-z0-9_\-]/i, '')
      end

      def req(uri, body)
        request = Net::HTTP::Post.new(uri)
        request.body = body.to_json
        request.content_type = 'application/json; charset=utf-8'

        Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(request)
        end.body
      end
    end
  end
end
