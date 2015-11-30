# Terminal
rails g model name:string email:string age:interger

rake db:migate
rails c

u = User.new
# creating new user
u.name = "Howard"
u.email = "a@b.com"
u.age = 5

User.all
u.save
# returns a true(success) or false (failure) value
User.all
# now this user exists - stored in this prevent vc file

if id = nil {didn't update right}
if id does exist {we're updating person}

u.name = "Warren"
u.save
# in order to update with new user

l = User.new name: "Charles", email: "c@d.com", age: nil, created_at: nil, updated_at

! or bang = if it fails to save, throw an errow

a = User.created name: "Erica", email: "yin@y.com", age: nil, created_at:
# creates something and then saves it
User.count

User.find(1)
User.find_by email
User.find_by name
User.where = gives one person - changes return value

rails g migration AddPhoneNumberToUsers phone_number: string
# invoke active record = indicates it worked

rake db:migrate
# to run these changes

rails c
User.new

schema.rb
# table columns

gems
gem 'sqlite3'
# as database for Active Record
gem 'sass-rails'
# use SCSS for stylesheets
gem 'uglifier'
# as compressor for JS assets
gem 'coffee-rails'
# for .coffee assets and views

Class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column: users, :phone_number, :string
    remove_column
  end
end
