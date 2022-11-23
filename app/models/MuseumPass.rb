class MuseumPass < ActiveRecord::Base
    has_many :reservations

    def no_conflicts?(check_out:, check_in: Date.parse(check_out).next_day(2).to_s  )
        range = Date.parse(check_out)..Date.parse(check_in)
        unless self.reservations.find_by(check_out: range) == nil
            return false
        else
            unless self.reservations.find_by(check_in: range) == nil
                return false
            else true
            end
        end
    end

    def reserve(name:, email:, check_out:)
        Reservation.create(
            name: name,
            email: email,
            check_out: Date.parse(check_out),
            check_in: Date.parse(check_out).next_day(2),
            museum_pass_id: self.id
        )
    end

end