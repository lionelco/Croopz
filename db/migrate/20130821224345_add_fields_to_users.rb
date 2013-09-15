class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => true
    add_column :users, :company_id, :integer
  end
end
