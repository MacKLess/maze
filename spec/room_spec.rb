#!/usr/bin/env ruby

require 'rspec'
require 'room'

describe('Room') do
  it "stores which sides have doors and which have walls" do
    room = Room.new([0,0], ["wall", "door", "wall", "wall"])
    expect(room.sides()).to(eq({"north" => "wall", "east" => "door", "south" => "wall", "west" => "wall"}))
  end
  it "stores room's location" do
    room = Room.new([0,0], ["wall", "door", "wall", "wall"])
    expect(room.coordinates()).to(eq([0,0]))
  end
  it "allows user to look in a direction" do
    room = Room.new([0,0], ["wall", "door", "wall", "wall"])
    expect(room.look("north")).to(eq("wall"))
  end
end
