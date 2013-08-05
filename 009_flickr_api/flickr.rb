require 'rest-client'
require 'json'
require 'yaml'

URL = "http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_[mstzb].jpg"

SEARCH_URL = "http://api.flickr.com/services/rest"

config = YAML.load(File.open('config.yml'))

class PicturePicker
  def self.pull_pictures(limit = 5)
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
