class AddMoreDetailToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :contact_email, :string
  end
end
