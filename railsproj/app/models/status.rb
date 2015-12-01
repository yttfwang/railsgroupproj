class Status < ActiveRecord::Base
  belongs_to :user

  def init
  	self.description ||= " "
  end
  
end
