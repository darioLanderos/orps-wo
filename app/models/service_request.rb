class ServiceRequest < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address, :description, :title, :status
  validates_presence_of :title
end
