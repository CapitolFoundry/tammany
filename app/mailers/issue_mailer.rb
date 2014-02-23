class IssueMailer < ActionMailer::Base
  default from: "your-rep@nyc.gov"
  
  def issue_create(constituent, description)
    @constituent = constituent
    @description = description
    mail(to: @constituent, subject: "Thanks for submitting your issue")
  end
end
