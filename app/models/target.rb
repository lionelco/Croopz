class Target < ActiveRecord::Base

  attr_accessible :description, :name
    belongs_to :company
    belongs_to :user
    has_many :defects, dependent: :destroy
    has_many   :occurrences, dependent: :destroy
    has_many   :suggestions, dependent: :destroy
  #accepts_nested_attributes_for :defects

    #validates :user_id, presence: true
    #validates :company_id, presence: true


end
