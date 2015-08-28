class Publisher < ActiveRecord::Base
  #validations
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false


  #relationships
  has_many :books ,through: :publications

end
