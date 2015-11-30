lecture 4 --> live coding

rails new cr-tutorial
rails g model User first_name:string last_name:string
rake db:migrate
rails c
User.create first_name: 'Michelle', last_name: 'Chan'
User.all --> now one user
show that information on the page
exit

routes.rb
get '/users', to: 'users#index'

rails g controller Users

app -> controllers > users_controller
class UsersController < ApplicationController
  def index
  end
end

create new view
index.html.erb
<h1> These are your users </h1>

localhost:3000/users
loaded page! :D

class UsersController < ApplicationController
  def index
    @user = User.all
  end
end

<h1> These are your users </h1>
<% @users.each do |u| %>
  <p?<%= u.first_name %> <%= u.last_name %></p>
<% end %>

localhost:3000/users
now shows a name! booom

rails c
User.create first_name: 'Chris', last_name: 'Gervang'

now localhost shows 2 names

User.first

routes.rb
Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
end

  class UsersController < ApplicationController
    def index
      @user = User.all
    end

    def new
      @user = User.new
    end
  end


views folder -> users
new.html.erb
<h1> New user signup </h1>

localhost:3000/users/new
Boom!

<h1> New user signup </h1>
<%= form_for @user do |f| %>
  <%= f.text_field :first_name %>
  <%= f.text_field :last_name %>
  <% f.submit %>
<% end %>

error when hit submit

routes.rb
Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
end

class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params = params[:user]
    User.create user_params
    // should work
  end
end

localhost:3000/users/new
submit name..
error :(
strong params?

class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    // user_params = params[:user]
    User.create user_params
    redirect_to :users
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end

localhost:3000/users/new
BAM - works


rails g migration AddCommentToUsers comment:string
created migration file :)

rake db:migrate

routes.rb
Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to 'users#show'
end

class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @users = User.find params[:id]
    // returns me the id that gets passed in the url thing
  end

  def new
    @user = User.new
  end

  def create
    // user_params = params[:user]
    User.create user_params
    redirect_to :users
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end

new view
show.html.erb
<h1>Detailed View of User</h1>
<p><%= @user.first_name %></p>
<p><%= @user.last_name %></p>
<p><%= @user.comment %></p>

localhost:3000/users/2

User.first.update comment: "I am cool"
exit
