require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    puts "request random command"
    Commander.random
    render json: {message: "success"}
  end
end
