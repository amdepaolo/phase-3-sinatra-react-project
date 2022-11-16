class Reservation < ActiveRecord::Base
    belongs_to :museum_pass
    default_scope {order(:check_out)}
end