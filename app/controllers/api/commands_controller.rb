require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    puts "request random command"
    Commander.random(params[:audio].strip)
    render json: {message: "success"}
  end
  def say
    puts "request say command"
    Commander.say(params[:text].strip)
    render json: {message: "success"}
  end
end
