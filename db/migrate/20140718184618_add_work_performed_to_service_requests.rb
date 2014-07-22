class AddWorkPerformedToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :work_performed, :text
  end
end
