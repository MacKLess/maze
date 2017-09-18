#!/usr/bin/env ruby
require "pry"

class Room
  attr_reader(:coordinates, :sides, :id)
  def initialize(coordinates, sides, id = nil)
    @coordinates = coordinates
    @sides = {"north" => sides[0], "east" => sides[1], "south" => sides[2], "west" => sides[3]}
    @id = id
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
      return self.class.find(new_coordinates)
    else
      return "You cannot do that."
    end
  end

  def save
    result = DB.exec("INSERT INTO rooms (north, east, south, west, xcoord, ycoord) VALUES ('#{@sides["north"]}', '#{@sides["east"]}', '#{@sides["south"]}', '#{@sides["west"]}', #{@coordinates[0]}, #{@coordinates[1]}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(other_room)
    coord_equal = @coordinates == other_room.coordinates
    sides_equal = @sides == other_room.sides
    id_equal = @id == other_room.id
    ((coord_equal & sides_equal) & id_equal)
  end

  def self.find(coordinates)
    results = DB.exec("SELECT * FROM rooms WHERE xcoord = #{coordinates[0]} AND ycoord = #{coordinates[1]}")
    result = results.first
    Room.new(coordinates, [result.fetch("north"), result.fetch("east"), result.fetch("south"), result.fetch("west")], result.fetch("id").to_i)
  end
end
