class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :category_id
      t.text :description
      t.integer :refund_value
      t.boolean :approved, default: :false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
