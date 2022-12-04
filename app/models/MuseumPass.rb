class MuseumPass < ActiveRecord::Base
    has_many :reservations

    def no_conflicts?(check_out:, check_in: Date.parse(check_out).next_day(2).to_s, id: 0)
        range = Date.parse(check_out)..Date.parse(check_in)
        unless self.reservations.where(check_out: range).where.not(id: id) == []
            return false
        else
            unless self.reservations.where(check_in: range).where.not(id: id) == []
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