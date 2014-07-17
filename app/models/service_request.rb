class ServiceRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :facility
  belongs_to :category
  
  attr_accessible :address, :title, :description, :status, :warning_date, :alert_date, :call_back_phone, :caller_name, :category_id
  validates_presence_of :address, :title, :description, :status, :warning_date, :alert_date, :category_id
end
