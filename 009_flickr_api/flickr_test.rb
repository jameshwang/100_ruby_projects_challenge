require 'minitest/autorun'
require_relative 'flickr'

describe PicturePicker do
  it "pulls a random set of 5 pictures" do
    # picture = ["http://farm1.staticflickr.com/1/1_1_s.jpg"]
    assert_instance_of Array, PicturePicker.pull_pictures
    assert_equal 5, PicturePicker.pull_pictures.size
  end
end
