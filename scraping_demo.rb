require 'open-uri'
require 'nokogiri'

html_file = open("https://www.blueapron.com/cookbook?query=apples")
html_doc = Nokogiri::HTML(html_file)

array = []
html_doc.search('.recipe-thumb').each do |element|
  array << {
    header: element.search('h3').first.text,
    desc: element.search('h6').first.text,
    recipe_link: element.search('a').first['href'],
    image_link: element.search('img').first['src'],
  }
end

p array