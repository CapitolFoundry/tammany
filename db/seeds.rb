# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Housing Santiation Transportation).each do |agency|
  Agency.create(name: agency)
end

%w(Open Closed Deferred).each do |status|
  Status.create(name: status)
end

%w(High Medium Low).each do |level| #keep in order from high to low so they can be ordered by id
  PriorityLevel.create(name: level)
end