class ServiceRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :facility
  belongs_to :category
  
  #attr_accessible :address, :title, :description, :work_performed, :status, :warning_date, :alert_date, :call_back_phone, :caller_name, :category_id
  validates_presence_of :address, :title, :description, :status, :warning_date, :alert_date, :category_id
  
  def self.search_by_address(search_term, page_number, per_page_num, order_criteria)
    if search_term.blank?
      paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    else
      where("address LIKE ?", "%"+search_term+"%").paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    end
  end
  
  def self.search_by_status(search_term, page_number, per_page_num, order_criteria)
    if search_term.blank?
      paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    else
      where("status = ?", search_term).paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    end
    
  end
  
  def self.search_by_category(search_term, page_number, per_page_num, order_criteria)
    if search_term.blank?
      paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    else
      where("category_id = ?", search_term).paginate(per_page: per_page_num, page: page_number).order(order_criteria)
    end
  end
end
