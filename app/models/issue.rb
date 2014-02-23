class Issue < ActiveRecord::Base
  belongs_to :priority_level
  belongs_to :agency
  belongs_to :status
  belongs_to :caseworker
  belongs_to :constituent
  
  has_many :issues

  attr_accessible :date, :description, :location, :priority_level, :agency, :status, :caseworker, :constituent

  after_create :send_confirm_email
 
  private
  
  def send_confirm_email
    IssueMailer.issue_create(self.constituent.email, self.description).deliver
  end

end
