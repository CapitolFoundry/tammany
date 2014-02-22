class IssueUpdates < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :note, :issue
end
