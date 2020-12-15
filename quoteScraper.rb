require 'httparty'
require 'nokogiri'
require 'open-uri'

# scraper gets all of the data from the worldometers coronavirus website.
class QuoteScraper

  attr_accessor :parsePage

  def initialize
    doc = HTTParty.get("https://www.beagreatteacher.com/daily-fun-fact/")

    # @ symbolizes instance variables.
    @parsePage ||= Nokogiri::HTML(doc)
  end

#function to get quote, joke and fact data
  def getQuoteData
    parsePage.css('p')
  end

end

qscraper = QuoteScraper.new
data = qscraper.getQuoteData
puts "Quote for today is: "
puts "\n"
puts data[1].text.strip		# .strip removes additional space 
puts "\n"
puts "Fact for today is: "
puts "\n"
puts data[3].text.strip
puts "\n"
puts "Joke for today is: "
puts "\n"
puts data[2].text.strip
puts "\n"





