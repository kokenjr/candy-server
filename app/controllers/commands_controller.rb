require 'fileutils'
class CommandsController < ApplicationController
  before_action :authenticate_user!
  def index
    @commands = []
    directory = "public/sounds"
    Dir.entries(directory).each do |file|
      is_directory = File.directory? File.join(directory, file)
      if is_directory && file != "." && file != ".."
        @commands << file.gsub("-", " ")
      end
    end
  end
  def random
    begin
      Commander.random(params[:audio])
      flash[:success] = "CANDYBOT played audio"
    rescue => e
      logger.error "Error playing audio: #{e.message}"
      flash[:danger] = "Error playing audio"
    end
    redirect_to root_path
  end
  def say
    begin
      Commander.say(params[:text])
      flash[:success] = "CANDYBOT spoke"
    rescue => e
      logger.error "Error with text to speech: #{e.message}"
      flash[:danger] = "Error getting CANDYBOT to speak"
    end
    redirect_to root_path
  end
  def status
    begin
      Commander.status(params[:state])
      flash[:success] = "CANDYBOT changed state to #{params[:state]}"
    rescue => e
      logger.error "Error setting state: #{e.message}"
      flash[:danger] = "Error setting state"
    end
    redirect_to root_path
  end
  def upload
    if !params[:files].blank? && !params[:command].blank?
      if params[:command].match(/^[a-zA-Z\s]*$/)
        command = params[:command].downcase.strip.gsub(" ", "-")
        file_utils = FileUtils.mkdir_p("public/sounds/#{command}")
        directory = file_utils.first
        params[:files].each do |file|
          path = File.join(directory, file.original_filename)
          File.open(path, "wb") do |open_file|
            open_file.write(file.read)
          end
        end
        open("vendor/blather/.config/blather/commands.conf", 'a') do |f|
          f.puts "candy #{command.gsub("-", " ")}:../../script/random.sh 80 #{command}"
        end
        Commander.restart_blather
        flash[:success] = "Uploaded command successfully"
      else
        flash[:danger] = "Command can't contain special characters"
      end
    end
    redirect_to root_path
  end
end
