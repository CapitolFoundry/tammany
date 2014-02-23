class Issue < ActiveRecord::Base
  belongs_to :priority_level
  belongs_to :agency
  belongs_to :status
  belongs_to :caseworker
  
  has_many :issues
  
  after_create :send_confirm_email
  
  def send_confirm_email
    IssueMailer.issue_create(self.constituent.email, self.description).deliver
  end
  
  attr_accessible :date, :description, :location, :priority_level, :agency, :status, :caseworker
end
