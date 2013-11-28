require 'httparty'
require 'nokogiri'

class HtmlParserIncluded < HTTParty::Parser
  SupportedFormats.merge!('text/html' => :html)

  def html
    Nokogiri::HTML(body)
  end
end

class DiamondSE
  attr_accessor :start_row
  include HTTParty
  parser HtmlParserIncluded

  def initialize(start_row=0)
    @start_row = start_row
  end

  def html
    @html ||= self.class.get('http://www.diamondse.info/webService.php', query: query.merge(rowStart: start_row))
  end

  def links
    @links ||= html.search('tr').map{|x| x.search('td a').attr('href').value }
  end

  def skus
    @skus ||= links.map{|x| x.match(/sku=(\w+)$/)[1]}
  end

  def total_query
    @total_query ||= html.search('tr').attr('rel').value.match(/ of (\d+)/)[1]
  end

  def raw_data
    @raw_data ||= html.search('tr').map{|x| x.search('td').map(&:text).reject(&:empty?)}
  end

  def info_text
    @info_text ||= html.search('tr').attr('rel').value
  end

  def data
    @data ||= raw_data.zip(links, skus).map(&:flatten)
  end

  def query
    {
      shape: "Round",
      minCarat: "1.43",
      maxCarat: "3.07",
      minColor: "1",
      maxColor: "3",
      minPrice: "100",
      maxPrice: "1000000",
      minCut: "3",
      maxCut: "1",
      minClarity: "1",
      maxClarity: "4",
      minDepth: "0",
      maxDepth: "90",
      minWidth: "54",
      maxWidth: "60",
      gia: "1",
      ags: "1",
      egl: "0",
      oth: "0",
      currency: "USD",
      rowStart: "0",
      sortCol: "price",
      sortDir: "ASC"
    }
  end
end


top_20 = DiamondSE.new
top_21_40 = DiamondSE.new(20)
top_41_60 = DiamondSE.new(40)

p top_20.data
p top_20.info_text
p top_20.total_query

p top_21_40.data
p top_21_40.info_text
p top_21_40.total_query

p top_41_60.data
p top_41_60.info_text
p top_41_60.total_query
