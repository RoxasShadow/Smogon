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
  module Type
    class Base
      def initialize(response)
        attributes.each do |attr|
          public_send("#{attr}=", response[attr])
        end
      end

      def to_h
        attributes.zip(
          attributes.map { |attr| public_send(attr) }
        ).to_h
      end

      def to_s
        attributes.map do |attr|
          "#{attr.capitalize}: #{public_send(attr)}"
        end.join("\n")
      end

      def url
        "http://www.smogon.com/dex/#{::Smogon::API::METAGAME}/#{self.TYPE}/#{name}"
      end

      private

      def attributes
        self.class::ATTRIBUTES
      end
    end
  end
end
