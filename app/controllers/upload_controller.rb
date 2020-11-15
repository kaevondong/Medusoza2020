class UploadController < ApplicationController
  def index
    @title = 'Upload'
  end

  def show
  end

  def create 
    require 'net/http'
    require 'json'
    begin
      uri = URI('https://18.191.45.207:5000/api/models/predict/pole')
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.path)
      bounding_boxes = "{"
      
      params[:attachment].each do |image|
        form_data = [['image', File.open(image.tempfile)]]
        request.set_form form_data, 'multipart/form-data'
        response = http.request(request)

        bounding_boxes += "\n\"" + image.original_filename + response.read_body[3,(response.read_body.length - 5)] + ","
        puts response.read_body
      end

      bounding_boxes = bounding_boxes[0,bounding_boxes.length-1]
      File.open('bounding_boxes.json', 'w') do |f|
        f.write(bounding_boxes + "\n}")
      end

    rescue => e
      puts "failed #{e}"
    end
    redirect_back(fallback_location: root_path)
  end

  def new
  end

  def edit
  end
end
