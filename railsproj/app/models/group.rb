class Group < ActiveRecord::Base
  has_many :users
  #def group_name
  #	"#{name}"
  #end
end
