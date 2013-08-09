require 'rubygems'
require 'rest-client'
require 'json'
require 'yaml'
require 'sinatra'
require 'json'


SEARCH_URL = "http://api.flickr.com/services/rest"

class PicturePicker
  def initialize(lat = 37.7577, lon = -122.437)
    @lat = lat
    @lon = lon
  end
  def pull_pictures(text, limit = 10)
    config = YAML.load(File.open('config.yml'))
    options = {
      method: "flickr.photos.search",
      text: text,
      api_key: config['api_key'],
      lat: @lat,
      lon: @lon,
      per_page: limit,
      format: "json",
      nojsoncallback: 1
    }
    photos = JSON.parse(RestClient.get(SEARCH_URL, params: options))["photos"]["photo"]
    photos.map do |photo|
      "http://farm#{photo["farm"]}.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}_s.jpg"
    end
  end
end

get "/" do
  puts params
  content_type :json
  flickr_pictures = PicturePicker.new
  flickr_pictures.pull_pictures(params['text']).to_json
end

get "/pictures" do
  @flickr_pictures = PicturePicker.new.pull_pictures(params['text'])
  haml :pictures, :format => :html5
end
