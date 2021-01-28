class AddIsHiddenToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :is_hidden, :boolean, default: true
  end
end
