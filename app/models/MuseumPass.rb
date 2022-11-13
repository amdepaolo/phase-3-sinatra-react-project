class MuseumPass < ActiveRecord::Base
    has_many :reservations

    def reserve(name:, email:, check_out:) 
        Reservation.create(
            name: name,
            email: email,
            check_out: Date.parse(check_out),
            check_in: Date.parse(check_out).next_day(2),
            museum_pass_id: self.id
        )
    end

    def reservations_by_date
        self.reservations.order(:check_out)
    end
end