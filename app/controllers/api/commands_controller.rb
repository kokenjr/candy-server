require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    if !params[:audio].blank?
      Commander.random(params[:audio].strip.downcase)
      render json: {message: "success"}
    else
      render json: {message: "audio param blank"}, status: :bad_request
    end
  end
  def say
    if !params[:text].blank?
      Commander.say(params[:text].strip.downcase)
      render json: {message: "success"}
    else
      render json: {message: "text param blank"}, status: :bad_request
    end
  end
  def status
    if !params[:state].blank?
      Commander.status(params[:state].downcase)
      render json: {message: "success"}
    else
      ender json: {message: "state param blank"}, status: :bad_request
    end
  end
end
