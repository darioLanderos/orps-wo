class CreateProperties < ActiveRecord::Migration
  def change    
    create_table :properties do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
