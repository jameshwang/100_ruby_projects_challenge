require 'rubygems'
require 'mechanize'

class WootMainProduct
  attr_accessor :website_uri, :web_page
  def initialize(website_uri)
    @website_uri = website_uri
    pull_web_page
  end

  def title
    @title ||= web_page.search('div#summary h2').text
  end

  def price
    @price ||= web_page.search('div#summary span.price').text
  end

  def img
    @img ||= web_page.search('#todays-deal a img').attr('src').value
  end

  def print
    puts title
    puts price
    puts img
  end

  private

  def pull_web_page
    Mechanize.new.get(website_uri) {|page| self.web_page = page }
  end
end

class WootPlusProductsController
  attr_accessor :web_page, :woot_plus_products
  def initialize(web_page)
    @web_page = web_page
  end

  def img_list
    @img_list ||= web_page.search('#wootplus ul.event-tiles li a img').map{|x| x.attr('src') }
  end

  def title_list
    @title_list ||= web_page.search('#wootplus ul.event-tiles li a h1').map(&:text)
  end

  def link_list
    @link_list ||= web_page.search('#wootplus ul.event-tiles li a').map{|x| x.attr('href')}
  end

  def print
    puts title_list.zip(img_list, link_list)
  end

  def woot_plus_products
    @woot_plus_products ||= link_list.first(2).map { |e| WootPlusProduct.new(e) }
  end

  private

  class WootPlusProduct < WootMainProduct
    def img_list
      @img_list ||= web_page.search('section.offer-list ul li img').map{|x| x.attr('src') }
    end

    def title_list
      @title_list ||= web_page.search('section.offer-list ul li div.info h2').map(&:text)
    end

    def price_list
      @price_list ||= web_page.search('section.offer-list ul li div.info span.price').map(&:text)
    end

    def print
      puts title_list.zip(price_list, img_list)
    end
  end
end



a = WootMainProduct.new('http://woot.com')
a.print
WootPlusProductsController.new(a.web_page).print
woot_plus_products = WootPlusProductsController.new(a.web_page).woot_plus_products
woot_plus_products.map(&:print)


