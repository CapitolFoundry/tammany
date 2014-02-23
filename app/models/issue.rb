class Issue < ActiveRecord::Base
  belongs_to :priority_level
  belongs_to :agency
  belongs_to :status
  belongs_to :caseworker
  belongs_to :constituent
  
  has_many :issue_updates

  attr_accessible :date, :description, :location, :priority_level, :agency, :status, :caseworker, :constituent,
    :priority_level_id, :agency_id, :status_id, :caseworker_id, :constituent_id, :issue_updates_attributes, :issue_update

  after_create :send_confirm_email
  
  accepts_nested_attributes_for :issue_updates
 
  private
  
  def send_confirm_email
    IssueMailer.issue_create(self.constituent.email, self.id, self.description).deliver
  end

end
