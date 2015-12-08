require 'fileutils'
class CommandsController < ApplicationController
  before_action :authenticate_user!
  def index
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
