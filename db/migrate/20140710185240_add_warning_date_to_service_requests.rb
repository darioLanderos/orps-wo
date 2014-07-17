class AddWarningDateToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :warning_date, :date
  end
end
