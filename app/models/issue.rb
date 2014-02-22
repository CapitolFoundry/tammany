class Issue < ActiveRecord::Base
  belongs_to :priority_level
  belongs_to :agency
  belongs_to :status
  belongs_to :caseworker
  
  has_many :issues
  
  attr_accessible :date, :description, :location, :priority_level, :agency, :status, :caseworker
end
