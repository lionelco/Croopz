class Company < ActiveRecord::Base
    attr_accessible :description, :name, :created_by
  has_many :users, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many   :defects, dependent: :destroy
  has_many   :occurrences, dependent: :destroy
  has_many   :suggestions, dependent: :destroy

end
