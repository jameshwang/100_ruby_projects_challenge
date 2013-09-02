require 'net/http'
require 'json'
require 'awesome_print'

class TopSongs
  ITUNES_URL = 'https://itunes.apple.com/us/rss/topsongs/limit=10/explicit=true/json'

  def top_songs
    translate_from_raw_json.each_with_index.each_with_object({}) do |song_and_index, hash|
      hash[song_and_index.last + 1] = song_and_index.first["title"]["label"]
    end
  end

  private

  def pull_top_songs
    @raw_song_list = @raw_song_list || JSON.parse(Net::HTTP.get(URI(ITUNES_URL)))
  end

  def translate_from_raw_json
    pull_top_songs["feed"]["entry"]
  end
end

ap TopSongs.new.top_songs

