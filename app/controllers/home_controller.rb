class HomeController < ApplicationController
  def index
    @title = 'Pole Map'
    poles = []
    Dir.foreach "#{Rails.root}/lib/assets/" do |json_file|
      pole_data = { xcoord: 'x', ycoord: 'y', poles: 0, crossarms: 0, insulator: 0 }
      next if json_file.to_s == '.'
      next if json_file.to_s == '..'

      json =  JSON.parse File.read "#{Rails.root}/lib/assets/" + json_file
      json['pole'].each do |coord|
        pole_data[:xcoord] = coord[0]
        pole_data[:ycoord] = coord[1]
      end
      json['esri_data']['assets'].each do |asset|
        pole_data[:poles] = asset[0] unless asset[0].nil?
        pole_data[:crossarms] = asset[1] unless asset[1].nil?
        pole_data[:insulator] = asset[2] unless asset[2].nil?
      end
      poles.push(pole_data)
    end
    @poles = poles
  end
end
