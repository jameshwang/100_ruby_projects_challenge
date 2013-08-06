require 'rest-client'
require 'json'
require 'yaml'
require 'sinatra'
require 'json'

SEARCH_URL = "http://api.flickr.com/services/rest"

class PicturePicker
  def self.pull_pictures(limit = 5)
    config = YAML.load(File.open('config.yml'))
    options = {
      method: "flickr.photos.search",
      api_key: config['api_key'],
      lat: 37.7577,
      lon: -122.437,
      per_page: limit,
      format: "json",
      nojsoncallback: 1
    }
    photos = JSON.parse(RestClient.get(SEARCH_URL, params: options))["photos"]["photo"]
    photos.map do |photo|
      "http://farm#{photo["farm"]}.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}_m.jpg"
    end
  end
end

get "/" do
  content_type :json
  PicturePicker.pull_pictures.to_json
end
