class MuseumPass < ActiveRecord::Base
    has_many :reservations

    def reserve(name:, email:)
        Reservation.create(
            name: name,
            email: email,
            museum_pass_id: self.id
        )
    end
end