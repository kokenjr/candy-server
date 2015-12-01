require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    puts "request random command"
    Commander.random(params[:audio])
    render json: {message: "success"}
  end
end
