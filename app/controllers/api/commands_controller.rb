require 'commander'
class Api::CommandsController < Api::BaseController
  def random
    begin
      if !params[:audio].blank?
        Commander.random(params[:audio])
        render json: {message: "success"}
      else
        render json: {message: "audio param blank"}, status: :bad_request
      end
    rescue => e
      render json: {message: e.message}, status: :bad_request
    end
  end
  def say
    begin
      if !params[:text].blank?
        Commander.say(params[:text])
        render json: {message: "success"}
      else
        render json: {message: "text param blank"}, status: :bad_request
      end
    rescue => e
      render json: {message: e.message}, status: :bad_request
    end
  end
  def status
    begin
      if !params[:state].blank?
        Commander.status(params[:state])
        render json: {message: "success"}
      else
        ender json: {message: "state param blank"}, status: :bad_request
      end
    rescue => e
      render json: {message: e.message}, status: :bad_request
    end
  end
end
