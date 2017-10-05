# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create one admin user
User.create!(email: 'twitter_admin@alphacamp.com', password: '12345678', tag_name: 'mighty_admin', role: 'admin')

10.times do
  user = User.create!(email: Faker::Internet.unique.email,
                      password: '12345678',
                      tag_name: Faker::DrWho.unique.specie.gsub(/\s+/, '')
                     )
  puts "#{user.email} is being created!"

  5.times do |i|
    user.tweets.create!( description: Faker::Lorem.sentence,
                         user_id: user.id
                       )
    puts "tweet#{i+1} is being created!"
  end
end
