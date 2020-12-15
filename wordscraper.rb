require 'httparty'
require 'nokogiri'
require 'open-uri'

# scraper gets all of the data from the worldometers coronavirus website.
class Scraper

  attr_accessor :parsePage

  def initialize
    doc = HTTParty.get("https://www.dictionary.com/e/word-of-the-day/")

    # @ symbolizes instance variables.
    @parsePage ||= Nokogiri::HTML(doc)
  end

  # scraper = Scraper.new
  # puts parsePage.css('title').text

  def getWordData
    parsePage.css('div.otd-item-headword__word')
  end
  
  def getPronunciationData
	parsePage.css('div.otd-item-headword__pronunciation')
  end
  
  def getdefinition
	parsePage.css('div.otd-item-headword__pos-blocks')
  end

end

scraper = Scraper.new
data = scraper.getWordData
puts "Word for today is: \n"
puts "\n"
puts data[0].text.strip
puts "\n"
data2= scraper.getPronunciationData
puts "pronunciation: \n"
puts "\n"
puts data2[0].text.strip
puts "\n"
data3= scraper.getdefinition
puts "Word information: \n"
puts "\n"
puts data3[0].text.strip




