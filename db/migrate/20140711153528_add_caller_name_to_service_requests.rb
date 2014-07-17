class AddCallerNameToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :caller_name, :string
  end
end
