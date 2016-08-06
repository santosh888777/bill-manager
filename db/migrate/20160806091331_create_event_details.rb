class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :is_present
      t.float :paid_amount

      t.timestamps null: false
    end
  end
end
