#!/usr/bin/env ruby

require 'rspec'
require 'room'

describe('Room') do
  it "stores which sides have doors and which have walls" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.sides()).to(eq({"north" => "wall", "east" => "door", "south" => "wall", "west" => "wall"}))
  end
  it "stores room's location" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.coordinates()).to(eq([1,0]))
  end
  it "allows user to look in a direction" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.look("north")).to(eq("wall"))
  end
  it "does not allow user to exit through a wall" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.exit("north")).to(eq("You cannot do that."))
  end
  it "does allow user to exit through a door" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.exit("east")).to(eq([2,0]))
  end
end
