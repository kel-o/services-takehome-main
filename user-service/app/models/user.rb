class User < ApplicationRecord
    has_many :meetings
    has_one :subscription
end
