# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

# user = User.create(name: 'Kevin', email: 'kevin@example.com', password: 'password', address: '2620 Regent St. Berkeley, CA 94704')
# user2 = User.create(name: 'Bob', email: 'bob@example.com', password: 'password', address: 'Soda Hall Berkeley, CA')

# status = user.status.create(description: 'Im kevin')
# status2 = user2.status.create(description: 'Im bob')

User.create(name: 'Kevin', email: 'kevin@example.com', password: 'password', address: '2620 Regent St. Berkeley, CA 94704').create_status(description: 'Im kevin')
User.create(name: 'Bob', email: 'bob@example.com', password: 'password', address: 'Soda Hall Berkeley, CA').create_status(description: 'Im bob')

Group.create(name: 'First Group', description: 'First group of homies')
Group.create(name: 'Second Group', description: 'Second group of homies')