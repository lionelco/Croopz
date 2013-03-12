class Defect < ActiveRecord::Base

  attr_accessible :description, :impact, :name, :target_id
  belongs_to :user
  belongs_to :company
  belongs_to :target#, :foreign_key => :target_id
  has_many :occurrences, dependent: :destroy
  has_many   :suggestions, dependent: :destroy
  
  #validates :target_id, presence: true
  #validates :user_id, presence: true
 

end
