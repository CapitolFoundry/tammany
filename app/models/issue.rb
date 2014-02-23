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
  after_create :send_confirm_sms
  
  accepts_nested_attributes_for :issue_updates
  
  def name
    "#{constituent.lname}-#{id}"
  end
 
  private
  
  def send_confirm_email
    IssueMailer.issue_create(self.constituent.email, self.id, self.description).deliver
  end
  
  def send_confirm_sms
    unless Rails.env == "development"
    from_number = "+17188784925"
    to_number = "+13143244262"
    issue_id = self.id
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
    @client.account.sms.messages.create(
      :body => "Your representative has received your issue. It is ID# #{issue_id}.",
      :to => to_number,
      :from => from_number)
    end
  end

end
