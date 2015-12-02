class Status < ActiveRecord::Base
  belongs_to :user
  after_initialize :init
  def init
  	self.description ||= 'Just relaxing~'
  end
  
end
