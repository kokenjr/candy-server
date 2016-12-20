require 'rufus-scheduler'
require 'commander'

scheduler = Rufus::Scheduler.new

scheduler.every '20m' do
  sleep rand(1..600)
  Commander.say_random_things
end
