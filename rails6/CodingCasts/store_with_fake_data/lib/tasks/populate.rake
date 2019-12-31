namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    
    #[Category, Product].each(&:delete_all)
    
    Category.populate 5 do |category|
      category.name = Populator.words(1..3).titleize
      Product.populate 10..25 do |product|
        product.category_id = category.id
        product.name = Populator.words(1..5).titleize
        product.description = Populator.sentences(2..10)
        product.price = [23, 89, 90, 38, 49, 300, 358, 3000, 987]
        product.released_at = 2.years.ago..Time.now
        product.created_at = 2.years.ago..Time.now
      end
    end

    #Person.populate 100 do |person|
      #person.name    = Faker::Name.name
      #person.company = Faker::Company.name
      #person.email   = Faker::Internet.email
      #person.phone   = Faker::PhoneNumber.phone_number
      #person.street  = Faker::Address.street_address
      #person.city    = Faker::Address.city
      #person.state   = Faker::Address.us_state_abbr
      #person.zip     = Faker::Address.zip_code
    #end
  end
end