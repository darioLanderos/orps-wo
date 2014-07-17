class AddCallBackPhoneToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :call_back_phone, :string
  end
end
