class Constituent < ActiveRecord::Base
  attr_accessible :address, :cell, :email, :fname, :landline, :lname
  
  has_many :issues
end
