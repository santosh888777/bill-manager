class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :event_type_id
      t.string :name
      t.text :description
      t.date :event_date
      t.string :location
      t.float :total_amount

      t.timestamps null: false
    end
  end
end
