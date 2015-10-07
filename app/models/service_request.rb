class ServiceRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :facility
  belongs_to :category
  
  attr_accessible :address, :title, :description, :work_performed, :status, :warning_date, :alert_date, :call_back_phone, :caller_name, :category_id
  validates_presence_of :address, :title, :description, :status, :warning_date, :alert_date, :category_id
  
  def self.search(search_term, page_number, per_page_num, order_criteria)
    paginate :per_page =>per_page_num, :page => page_number,
              :conditions => ["address LIKE ?", "%#{search_term}%"], :order => order_criteria
  end
end
