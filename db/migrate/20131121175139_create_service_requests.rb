class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :address
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
