# Maze

#### _Epicodus Project in Ruby, 9/12/17_

#### By Kelsey Langlois and L. Devin MacKrell

## Description

_A Ruby Script_

## Setup/Installation Requirements

* Clone this repository

## Specifications

### Room

* Room stores which sides have doors and which have walls.
  * Example input: entry_room
  * Example output: {"north" => "wall", "east" => "door", "west" => "wall", "south" => "wall"}
* Room stores its location (0-indexed, from Northwest corner of maze)
  * Example input: entry_room
  * Example output: [1, 0]
* Room allows user to look in a direction.
  * Example input: entry_room.look("east")
  * Example output: "There is a door."
* Room does not allow user to exit through a wall.
  * Example input: entry_room.exit("north")
  * Example output: "You cannot do that."
* Room allows user to exit through a door, and returns coordinates of next room.
  * Example input: entry_room.exit("east")
  * Example output: [2, 0]

### Maze

* Maze stores all rooms in maze.
  * Example input: room_0_0, room_0_1, room_1_0, room_1_1
  * Example output: [[room_0_0, room_0_1], [room_1_0, room_1_1]]
* Maze stores the room the user is in.
  * Example input: maze.location()
  * Example output: "room_0_1"
* Maze does not allow movement to a room that does not exist.
  * Example input: maze.move([9, 8])
  * Example output: "You cannot do that."
* Maze allows movement to a room that exists, based on its coordinates.
  * Example input: maze.move([0, 1])
  * Example output: "You are now in room_0_1"
* Maze knows when it has been solved.
  * Example input: maze.move([3, 4])
  * Example output: "You have reached the maze's end!"
## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby

### License

Copyright (c) 2017 **Kelsey Langlois & L. Devin MacKrell**

*This software is licensed under the MIT license.*
