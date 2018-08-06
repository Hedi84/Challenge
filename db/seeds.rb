# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "deleting everything first!"


Product.destroy_all
Category.destroy_all




puts 'Creating categories'
  category = Category.new(name: "Large")
  category.save!
  category_2 = Category.new(name: "Extra Large")
  category_2.save!
  category_3 = Category.new(name: "Medium")
  category_3.save!
  category_4 = Category.new(name: "Small")
  category_4.save!
  category_5 = Category.create(name: "Extra Small")
  category_5.save!

puts 'Creating 30 fake products...'
30.times do
  product = Product.new(
    title:    Faker::Company.name,
    description: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
    creation_date:  Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )
  product.save!

  puts "adding product to category"
    ids = []
    categories = Category.all
    categories.each do |category|
      ids << category.id
    end
    id = ids.sample


  match = Match.new(product_id: product.id, category_id: id)
  match.save!
end







puts 'Finished!'
