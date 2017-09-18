#!/usr/bin/env ruby

require 'spec_helper'

describe('Room') do
  it "stores which sides have doors and which have walls" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.sides()).to(eq({"north" => "wall", "east" => "door", "south" => "wall", "west" => "wall"}))
  end

  it "stores room's location" do
    room = Room.new([1,0], ["wall", "door", "wall", "wall"])
    expect(room.coordinates()).to(eq([1,0]))
  end

  describe('#look') do
    it "allows user to look in a direction" do
      room = Room.new([1,0], ["wall", "door", "wall", "wall"])
      expect(room.look("north")).to(eq("wall"))
    end
  end

  describe('#exit') do
    it "does not allow user to exit through a wall" do
      room = Room.new([1,0], ["wall", "door", "wall", "wall"])
      expect(room.exit("north")).to(eq("You cannot do that."))
    end

    it "does allow user to exit through a door" do
      room1 = Room.new([1,0], ["wall", "door", "wall", "wall"])
      room1.save
      room2 = Room.new([2,0], ["door", "wall", "wall", "door"])
      room2.save
      expect(room1.exit("east")).to(eq(room2))
    end
  end

  describe('#save') do
    it "saves a room to the database" do
      room = Room.new([1,0], ["wall", "door", "wall", "wall"])
      room.save
      expect(Room.find([1,0])).to(eq(room))
    end
  end

  describe('#==') do
    it "says two objects are equal if they have the same coordinates, sides, and id" do
      room1 = Room.new([1,0], ["wall", "door", "wall", "wall"], 1)
      room2 = Room.new([1,0], ["wall", "door", "wall", "wall"], 1)
      expect(room1).to(eq(room2))
    end
  end

  describe('.find') do
    it "locates a room by its coordinates" do
      room = Room.new([1,0], ["wall", "door", "wall", "wall"])
      room.save
      expect(Room.find([1,0])).to(eq(room))
    end
  end
end
