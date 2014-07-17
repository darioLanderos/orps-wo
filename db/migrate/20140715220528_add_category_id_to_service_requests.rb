class AddCategoryIdToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :category_id, :int
    add_index :service_requests, :category_id
  end
end
