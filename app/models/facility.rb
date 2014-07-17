class Facility < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name
  
  has_many :service_requests
end
