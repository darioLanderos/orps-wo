class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :service_requests
end
