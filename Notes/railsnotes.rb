routes.#!/usr/bin/env ruby -wKU
syntax --> get 'url', to: 'controller#function'
ex --> get '/home', to: 'pages#home'
       root 'pages#home'

localhost:3000/home

rails g controller Pages

pages_controller.rb
  def home
  end
end


view -> pages > new file
home.html.erb
<h1><%= @number %></h1>


get '/home/:id', to: 'pages#home'

class PagesController < ApplicationController
  def home
    @number = params[:id]
    puts @number
    render 'pages/homee'
  end
end

routes.rb
Rails.application.routes.draw do
  get '/home/:id', to: 'pages#home'
  get 'lions', to: 'pages#lions', as: 'cats'
end

homee.html.erb
<% if (@number % 2) == 0 %>
  <h1><%= @number %></h1>
  <% link_to "Lion", lions_path(@profile) %>
<% end %>


model = all the information you  needed
this allows controllers to work with the model

creating models
rails g model model_name column_name:column_type
ex:
rails g model User name:string age:integer

migrations = changes to your database
can add/remove/rename columns AND create/delete tables
ex: rails g migration migration_name

update your database
rake db:migration_name
NEVER CHANGE MIGRATED MIGRATIONS

types of migrations
add column --> add_column :users, :nickname, :string
remove column --> remove_column :users, :nickname
renaming columns --> rename_column :users, :name, :nickname

model vs migration

querying our database
Model.find id
Model.find_by attribute: something
Model.where attribute :something
Model.first/last
Model.all

CRUD = create, read (show), update (edit), destroy

creating our user
rails c
user = User.new
user.name = "Charles"
user.save!
OR
user = User.create name: "hello", age: 5


u = User.new
u.name = "Michelle"
u.email = "a@b.com"
u.age = 21
u
User.all
u.save

l = User.new name: "Charles", email: "c@d.com"

creating migrations
rails g migration AddPhoneNumberToUsers phone_number:string
--> boom
class AddPhoneNumberToUsers < ActiveRecord::Migration
  def changes
    add_column :users, :phone_number, :string
    remove column :users, :age
  end
end

rake db:migrate
rails c
Users.new --> new column shows up

Schema --> net delta of changes
