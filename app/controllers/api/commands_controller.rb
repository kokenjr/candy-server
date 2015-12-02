require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    Commander.random(params[:audio].strip)
    render json: {message: "success"}
  end
  def say
    Commander.say(params[:text].strip)
    render json: {message: "success"}
  end
  def status
    Commander.status(params[:state])
    render json: {message: "success"}
  end
end
