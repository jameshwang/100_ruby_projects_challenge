require 'rubygems'
require 'mechanize'

agent = Mechanize.new

job_queries = [
  "ruby",
  "ruby on rails",
  "javascript",
  "iOS",
  "iPhone",
  "iPad"
]

locations = [
  "San Francisco, CA",
  "San Jose, CA",
  "San Francisco Bay Area, CA",
  "Los Angeles County, CA",
  "Orange County, CA"
]

searches = job_queries.product(locations).map do |combo|
  {query: combo.first, location: combo[1]}
end


searches.each do |s|
  agent.get('http://indeed.com') do |page|
    search_result = page.form_with(name: 'jobsearch') do |search|
      search.q = s[:query]
      search.l = s[:location]
    end.submit

    p [s[:query], s[:location], search_result.search('div#searchCount').text.match(/of (\d+,\d+|\d+)/)[1]].join(": ")
  end
end
