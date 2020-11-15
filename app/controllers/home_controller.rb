class HomeController < ApplicationController
  def index
    @title = 'Pole Map'
    poles = []
    Dir.foreach "#{Rails.root}/lib/assets/" do |json_file|
      pole_data = {}
      next if json_file.to_s == '.'
      next if json_file.to_s == '..'

      json =  JSON.parse File.read "#{Rails.root}/lib/assets/" + json_file
      json['pole'].each do |coord|
        pole_data[:xcoord] = coord[1][0]
        pole_data[:ycoord] = coord[1][1]
      end
      json['esri_data']['assets'].each do |asset|
        pole_data[asset[0].to_sym] = asset[1]
      end
      poles.push(pole_data)
    end
    @poles = poles
  end
end
