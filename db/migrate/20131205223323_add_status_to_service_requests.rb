class AddStatusToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :status, :integer
  end
end
