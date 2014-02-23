class IssueMailer < ActionMailer::Base
  default from: "your-rep@nyc.gov"
  
  def issue_create(constituent, issue_id, description)
    @constituent = constituent
    @issue_id = issue_id
    @description = description
    mail(to: @constituent, subject: "Thanks for submitting your issue")
  end
end
