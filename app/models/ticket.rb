class Ticket < ActiveRecord::Base
  self.primary_key = "id"

  belongs_to :customer
  belongs_to :department
  belongs_to :status

  accepts_nested_attributes_for :customer

  before_create :create_uniq_id
  before_save { self.status_id ||= 1 }

  def create_uniq_id
    begin
      self.id = "#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}"
    end while self.class.exists?(id: id)
  end
end
