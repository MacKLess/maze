#!/usr/bin/env ruby

class Room
  attr_reader(:coordinates, :sides)
  def initialize(coordinates, sides)
    @coordinates = coordinates
    @sides = {"north" => sides[0], "east" => sides[1], "south" => sides[2], "west" => sides[3]}
  end

  def look(direction)
    @sides[direction]
  end

  def exit(direction)
  end


end
