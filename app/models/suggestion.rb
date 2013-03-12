class Suggestion < ActiveRecord::Base
  attr_accessible :company_id, :defect_id, :description, :number, :target_id
  belongs_to :company
  belongs_to :defect
  belongs_to :user
end
