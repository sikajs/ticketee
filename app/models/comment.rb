class Comment < ActiveRecord::Base
  after_create :set_ticket_state

  belongs_to :ticket
  belongs_to :user
  belongs_to :state

  validates :text, :presence => true

  # make comment model can a call to project like ticket.project
  delegate :project, :to => :ticket

  private
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
end