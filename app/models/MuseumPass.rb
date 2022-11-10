class MuseumPass < ActiveRecord::Base
    has_many :reservations
end