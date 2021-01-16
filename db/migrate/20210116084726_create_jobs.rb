class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :store_name
      t.string :area
      t.boolean :pay
      t.integer :contact_phone
      t.text :description
      t.boolean :lunch
      t.string :practice_type

      t.timestamps
    end
  end
end
