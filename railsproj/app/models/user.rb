class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :group
  has_one :status
  after_create :create_status
  geocoded_by :address
  after_initialize :default_address
  after_validation :geocode
  has_attached_file :photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  def default_address
  	self.address ||= 'Berkeley, CA'
  end
end
