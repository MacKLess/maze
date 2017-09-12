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
    if @sides[direction] == "door"
      new_coordinates = @coordinates
      if direction == "north"
        new_coordinates[1] += 1
      elsif direction == "east"
        new_coordinates[0] += 1
      elsif direction == "south"
        new_coordinates[1] -= 1
      else
        new_coordinates[0] -= 1
      end
      return new_coordinates
    else
      return "You cannot do that."
    end
  end


end
