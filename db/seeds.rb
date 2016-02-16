# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

30.times do
  Wiki.create!(
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph
  )
end
puts "Seed finished"
puts "#{Wiki.count} wikis created"
