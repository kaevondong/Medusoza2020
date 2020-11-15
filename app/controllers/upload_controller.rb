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
        # req.body = {"image" => params[:attachment]}.to_json
        # res = http.request(req)
        # puts "response #{res.body}"
        # puts JSON.parse(res.body)

        form_data = [['image', File.open(params[:attachment].tempfile)]]
        request.set_form form_data, 'multipart/form-data'
        response = http.request(request)
        puts response.read_body
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
