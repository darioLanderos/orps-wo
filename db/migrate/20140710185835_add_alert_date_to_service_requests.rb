class AddAlertDateToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :alert_date, :date
  end
end
