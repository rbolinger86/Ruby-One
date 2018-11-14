require 'faker'
(1..40).each do |i|
  Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: Faker::Date.between(100.years.ago, 15.years.ago))
end
