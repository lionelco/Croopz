class AddCompanyIdToDefect < ActiveRecord::Migration
  def change
    add_column :defects, :company_id, :integer
  end
end
