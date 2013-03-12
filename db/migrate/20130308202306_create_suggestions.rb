class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :number
      t.text :description
      t.integer :defect_id
      t.integer :target_id
      t.integer :company_id

      t.timestamps
    end
  end
end
