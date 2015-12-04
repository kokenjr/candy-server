require 'fileutils'
class FileManagerController < ApplicationController
  def index
  end
  def upload
    if !params[:files].blank? && !params[:command].blank?
      command = params[:command].downcase.strip.gsub(" ", "-")
      file_utils = FileUtils.mkdir_p("public/sounds/#{command}")
      directory = file_utils.first
      params[:files].each do |file|
        path = File.join(directory, file.original_filename)
        File.open(path, "wb") do |open_file|
          open_file.write(file.read)
        end
      end
    end
    redirect_to 'index'
  end
end
