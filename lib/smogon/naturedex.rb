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
  class Naturedex
    NATURES = [
      {
        hp: 1.0,
        patk: 1.1,
        pdef: 1.0,
        spatk: 0.9,
        spdef: 1.0,
        spe: 1.0,
        name: 'Adamant'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Bashful'
      },
      {
        hp: 1.0,
        patk: 0.9,
        pdef: 1.1,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Bold'
      },
      {
        hp: 1.0,
        patk: 1.1,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 0.9,
        name: 'Brave'
      },
      {
        hp: 1.0,
        patk: 0.9,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.1,
        spe: 1.0,
        name: 'Calm'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 0.9,
        spdef: 1.1,
        spe: 1.0,
        name: 'Careful'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Docile'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 0.9,
        spatk: 1.0,
        spdef: 1.1,
        spe: 1.0,
        name: 'Gentle'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Hardy'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 0.9,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.1,
        name: 'Hasty'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.1,
        spatk: 0.9,
        spdef: 1.0,
        spe: 1.0,
        name: 'Impish'
      },
      {
        hp: 1,
        patk: 1,
        pdef: 1,
        spatk: 0.9,
        spdef: 1,
        spe: 1.1,
        name: 'Jolly'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.1,
        spatk: 1.0,
        spdef: 0.9,
        spe: 1.0,
        name: 'Lax'
      },
      {
        hp: 1.0,
        patk: 1.1,
        pdef: 0.9,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Lonely'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 0.9,
        spatk: 1.1,
        spdef: 1.0,
        spe: 1.0,
        name: 'Mild'
      },
      {
        hp: 1.0,
        patk: 0.9,
        pdef: 1.0,
        spatk: 1.1,
        spdef: 1.0,
        spe: 1.0,
        name: 'Modest'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 0.9,
        spe: 1.1,
        name: 'Naive'
      },
      {
        hp: 1.0,
        patk: 1.1,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 0.9,
        spe: 1.0,
        name: 'Naughty'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.1,
        spdef: 1.0,
        spe: 0.9,
        name: 'Quiet'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Quirky'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.1,
        spdef: 0.9,
        spe: 1.0,
        name: 'Rash'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.1,
        spatk: 1.0,
        spdef: 1.0,
        spe: 0.9,
        name: 'Relaxed'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.1,
        spe: 0.9,
        name: 'Sassy'
      },
      {
        hp: 1.0,
        patk: 1.0,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.0,
        name: 'Serious'
      },
      {
        hp: 1.0,
        patk: 0.9,
        pdef: 1.0,
        spatk: 1.0,
        spdef: 1.0,
        spe: 1.1,
        name: 'Timid'
      }
    ]

    def self.get(hash)
      NATURES.each do |nature|
        boost = nature.dup
        boost.delete :name
        return nature[:name] if hash == boost || hash == Hash[boost.map { |(k, v)| [k.to_s, v] }]
      end

      nil
    end
  end
end
