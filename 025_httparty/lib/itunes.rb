require 'httparty'
require 'json'

class Itunes
  def top25
    response = HTTParty.get 'https://itunes.apple.com/us/rss/topsongs/limit=25/json'
    JSON.parse(response.body)["feed"]["entry"].map { |song| song["title"]["label"] }
  end

  def top10
    response = HTTParty.get 'https://itunes.apple.com/us/rss/topsongs/limit=10/json'
    JSON.parse(response.body)["feed"]["entry"].map { |song| song["title"]["label"] }
  end
end
