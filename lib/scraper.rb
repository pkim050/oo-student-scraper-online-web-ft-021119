require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    arr = []
    doc = Nokogiri::HTML(open(index_url))
    #temp = "div.student-card"
    temp = doc.css("div.roster-cards-container div.student-card")
    temp.each do |element|
      hash = {
        name: element.css("h4.student-name").text,
        location: element.css("p.student-location").text,
        profile_url: element.css("a").first['href']
      }
      arr << hash
    end
    arr
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    temp = doc.css("div.vitals-container div.social-icon-container a")
    hash = {}
    temp.each do |element|
        hash[:twitter] = element['href'] if element['href'].include?("twitter")
        hash[:linkedin] = element['href'] if element['href'].include?("linkedin")
        hash[:github] = element['href'] if element['href'].include?("github")
        hash[:blog] = element['href'] if !(element['href'].include?("twitter") || element['href'].include?("linkedin") || element['href'].include?("github"))
        hash[:profile_quote] = doc.css("div.profile-quote").text
        hash[:bio] = doc.css("div.bio-content.content-holder div.description-holder").text.strip
    end
    hash
  end
end
