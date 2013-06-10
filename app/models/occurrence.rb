class Occurrence < ActiveRecord::Base
  attr_accessible :company_id, :defect_id, :description, :number, :target_id, :user_id, :created_at
  belongs_to :company
  belongs_to :defect
  belongs_to :user
  
  validates :defect_id, presence: true
end

