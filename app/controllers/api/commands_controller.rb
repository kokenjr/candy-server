require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    Commander.random(params[:audio].strip.downcase)
    render json: {message: "success"}
  end
  def say
    Commander.say(params[:text].strip.downcase)
    render json: {message: "success"}
  end
  def status
    Commander.status(params[:state].downcase)
    render json: {message: "success"}
  end
end
