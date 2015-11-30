# Index = list of all entries in database table
# Show =

rails new cr-tutorial
# create new rails application

# cd into the folder of project

rails g model User first_name: string last_name:string
# creating new User

rake db migrate

User.create first_name: 'Michelle', last_name: 'Chan'
User.all

rails g controller User

User.create first_name: 'Henry', last_name: 'Yo'

rails g migration AddCommentToUsers comment: string

rake db:migrate

User.first.update comment: "I am cool"

exit

# in routes.rb
Rails,applcation.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  # if you want to create a new user

  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
end

# in users_controller.rb
class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find params[:id]
    # returns url that gets passed
  end

  def new
    @user = User.new
  end

  def create
    # rediect_to :users
    # # not render --> redirect_to

    user_params = params[:user]
    User.create user_params
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
    # grab user hash, only take key value paits of first and last name
  end
end

# index.html.rb
<h1>These are your users</h1>
<% @users.each do |u| %>
  <p><%= u.first_name %> <%= u.last_name %></p>
<% end %>

new.html.erb
<h1>New user signup</h1>

<%= form_for @user do |f| %>
  <%= f.text_field :first_name %>
  <%= f.text_field :last_name %>
  <%= f.submit %>
<% end %>

show.html.erb
<h1>Detailed view of user</h1>
<p><%= @user.first_name %></p>
<p><%= @user.last_name %></p>
<p><%= @user.comment %></p>
