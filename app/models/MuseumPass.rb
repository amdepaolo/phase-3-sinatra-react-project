class MuseumPass < ActiveRecord::Base
    has_many :reservations

    def reserve(name:, email:, check_out:)
        Reservation.create(
            name: name,
            email: email,
            check_out: check_out,
            check_in: check_out.next_day(2),
            museum_pass_id: self.id
        )
    end
end