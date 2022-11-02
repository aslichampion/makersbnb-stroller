require_relative 'booking'

class BookingRepository
    def all
        bookings = []

        sql = 'SELECT id, space_id, renter_id, start_date, number_of_nights FROM bookings;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            booking = Booking.new
            booking.id = record['id'].to_i
            booking.space_id = record['space_id']
            booking.renter_id = record['renter_id']
            booking.start_date = record['start_date']
            booking.number_of_nights = record['number_of_nights']

            bookings << booking
        end
        return bookings
    end

end