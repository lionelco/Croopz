class DropUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
  	create_table :users do|t|      
    t.string :name    
    t.references :company_id   
    t.timestamps 
  end
      add_index :users,:company_id  
  end
end
