class Ticket < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to :customer
  belongs_to :department
  belongs_to :status
  belongs_to :manager
  has_many :replies

  accepts_nested_attributes_for :customer

  before_create :create_uniq_id
  after_save :update_status

  scope :no_assigned, -> { where(manager_id: nil) }
  scope :opened, -> { where.not(status_id: [Status::CANCELLED, Status::COMPLETED]) }
  scope :held, -> { where(status_id: Status::ON_HOLD) }
  scope :closed, -> { where(status_id: [Status::CANCELLED, Status::COMPLETED]) }

  def create_uniq_id
    begin
      self.id = "#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}-#{rand(100..999)}-#{('a'..'z').to_a.shuffle[0,3].join}"
    end while self.class.exists?(id: id)
  end

  private
    def update_status
      self.status_id ||= 1
      CustomerMailer.status_email(self.status, self).deliver
    end
end
