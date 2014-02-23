# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
departments = %w(Housing Santiation Transportation) 

departments.each do |agency|
  Agency.create(name: agency)
end

statuses = %w(Open Closed Deferred)
statuses.each do |status|
  Status.create(name: status)
end

priorities = %w(High Medium Low)
priorities.each do |level| #keep in order from high to low so they can be ordered by id
  PriorityLevel.create(name: level)
end

test_user = Caseworker.create(
  name: 'Test User',
  title: "Caseworker",
  email: "test@tammany.gov",
  password: "12345678"
)

5.times do 
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  
  Caseworker.create(
    name: "#{fname} #{lname}",
    title: Faker::Name.title,
    email: "#{fname}.#{lname}@tammany.gov",
    password: "12345678"
  )
end

10.times do |i|
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  
  constituent = Constituent.create(
    fname: fname,
    lname: lname,
    address: Faker::Address.street_address,
    email: "#{fname}.#{lname}@test_data.com",
    cell: Faker::PhoneNumber.cell_phone,
    landline: Faker::PhoneNumber.phone_number
  )
  
  Issue.create(
    date: Date.today - (10+i),
    description: Faker::Lorem.paragraph,
    location: Faker::Address.street_address,
    agency: Agency.all.shuffle.first,
    status: Status.all.shuffle.first,
    priority_level: PriorityLevel.all.shuffle.first,
    caseworker: test_user,
    constituent: constituent
  )
end





















