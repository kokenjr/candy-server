require 'rufus-scheduler'
require 'commander'

scheduler = Rufus::Scheduler.new

scheduler.interval '30s' do
  Commander.say_random_things
end
