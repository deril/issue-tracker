class Reply < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :manager
end
