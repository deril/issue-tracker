class Customer < ActiveRecord::Base
  has_one :ticket
end
