class Reply < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :manager
  before_save do
    if self.manager
      self.ticket.status_id = 2
    else
      self.ticket.status_id = 1
    end
  end
end
