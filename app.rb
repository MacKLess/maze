require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/room')
require('pg')
require('pry')

DB = PG.connect({:dbname => "maze_test"})

room1 = Room.new([1,0], ["wall", "door", "wall", "wall"], nil, "the entrance")
room1.save
room2 = Room.new([2,0], ["door", "wall", "wall", "door"], nil, "the antechamber")
room2.save

get('/') do
  erb(:index)
end

get('/location/:x_y') do
  coordinates = params[:x_y].split("-").map { |coord| coord.to_i }
  @room = Room.find(coordinates)
  erb(:location)
end

post('/action/look/:x_y') do
  @direction = params["look-direction"]
  coordinates = params[:x_y].split("-").map { |coord| coord.to_i }
  @room = Room.find(coordinates)
  erb(:look)
end

post('/action/move/:x_y') do
  @direction = params["move-direction"]
  coordinates = params[:x_y].split("-").map { |coord| coord.to_i }
  @room = Room.find(coordinates)
  @new_room = @room.exit(@direction)
  erb(:move)
end
