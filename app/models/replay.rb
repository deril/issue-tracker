class Replay < ActiveRecord::Base
  belongs_to :tickets
  belongs_to :managers
end
