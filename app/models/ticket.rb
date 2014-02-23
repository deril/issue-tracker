class Ticket < ActiveRecord::Base
  self.primary_key = "id"

  belongs_to :customer
  belongs_to :department
  belongs_to :status
  belongs_to :manager
  has_many :replies

  accepts_nested_attributes_for :customer

  before_create :create_uniq_id
  before_save { self.status_id ||= 1 }

  scope :no_assigned, -> { where(manager_id: nil) }
  scope :opened, -> { where.not(status_id: [4,5]) }
  scope :holded, -> { where(status_id: 3) }
  scope :closed, -> { where(manager_id: [4,5]) }

  def create_uniq_id
    begin
      self.id = "#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}"
    end while self.class.exists?(id: id)
  end
end
