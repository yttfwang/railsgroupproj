rails g model User name:string
rails g model Quit text:text
rake db:migrate // to create them
in schema --> they show up now
gem annotate

now we want to create authentication
use devise from github
bundle install
rails generate devise:install
rails generate devise User
user.rb --> now has devise row in file
devise added attributes such as email, encrypted password, etc.

make migration
bin/rake g migration AddUserIdToQuits
want to add a user id to quits
in migration
  add_column :quits, :user_id, :integer
  add_index :user_id, :quits
mi // shortcut for migration?
in quit.rb -->
  belongs_to :user
  validates :text, presence: true
  validates :user_id, presence: true
in user.rb -->

to test out that everything works --> go to console
rails c
a.text = "I quit shit"

terminal --> reload!

a.save
u = User.first
u.destroy

u.name = 'Michelle'
u.email = 'michellechan.me@berkeley.edu'
u.quits --> get an array that contains the 'quits'
