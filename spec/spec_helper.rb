require('rspec')
require('pg')
require('room')
require('maze')

DB = PG.connect({:dbname => 'maze_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM rooms *;")
  end
end
