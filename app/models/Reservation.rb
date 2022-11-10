class Reservation < ActiveRecord::Base
    belongs_to :museum_pass
end