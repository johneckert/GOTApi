require 'json'
require 'net/http'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#pgs 1-43
page_num = 1
while page_num < 44
  res = Net::HTTP.get_response(URI("https://www.anapioficeandfire.com/api/characters?page=" + page_num.to_s + "&pageSize=50"))
  page = JSON.parse(res.body)
  page.each do |char|
    #create new character instance
    dead = char["died"].length > 0 ? true : false
    c = Character.find_or_create_by(name: char["name"], gender: char["gender"], culture: char["culture"], dead: dead)
  end
  page_num += 1
end
