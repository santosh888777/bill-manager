class AddDefaultVallues < ActiveRecord::Migration
  def change
    change_column :event_details, :paid_amount, :float, default: 0.00
    change_column :events, :total_amount, :float, default: 0.00
    change_column :event_details, :is_present, :boolean, default: false

    add_index :events, :event_type_id
    add_index :event_details, :user_id
    add_index :event_details, :event_id
  end
end
