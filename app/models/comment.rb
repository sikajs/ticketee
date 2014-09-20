class Comment < ActiveRecord::Base
  before_create :set_previous_state
  after_create :set_ticket_state
  after_create :associate_tags_with_ticket

  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"
  has_and_belongs_to_many :tags

  attr_accessor :tag_names

  validates :text, :presence => true

  # make comment model can a call to project like ticket.project
  delegate :project, :to => :ticket

  private
    def set_previous_state
      self.previous_state = ticket.state
    end

    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end

    def associate_tags_with_ticket
      if tag_names
        tags = tag_names.split(" ").map do |name|
          Tag.find_or_create_by(name: name)
        end
        self.ticket.tags += tags
        self.ticket.save
      end
    end
end
