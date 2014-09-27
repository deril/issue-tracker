class Status < ActiveRecord::Base
  has_many :tickets
  WAIT_FOR_STAFF = Status.find_by_name('Waiting for Staff Response').id
  ON_HOLD = Status.find_by_name('On Hold').id
  CANCELLED = Status.find_by_name('Cancelled').id
  COMPLETED = Status.find_by_name('Completed').id
end
