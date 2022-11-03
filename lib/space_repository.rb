require_relative 'space'

class SpaceRepository
    def all
        spaces = []

        sql = 'SELECT id, name, description, photo_url, price_per_night FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            space = Space.new
            space.id = record['id'].to_i
            space.name = record['name']
            space.description = record['description']
            space.photo_url = record['photo_url']
            space.price_per_night = record['price_per_night']

            spaces << space
        end
        return spaces
    end

    def create(space)

        sql = 'INSERT INTO spaces (name, description, photo_url, price_per_night) VALUES ($1, $2, $3, $4);'
        result_set = DatabaseConnection.exec_params(sql, [space.name, space.description, space.photo_url, space.price_per_night])

        return space

    end

    def find(start_date,number_of_nights)
        spaces = []

        sql = 'SELECT bookings.id, bookings.space_id, bookings.renter_id, bookings.start_date, bookings.number_of_nights, spaces.id AS space_id, spaces.name, spaces.photo_url, spaces.description, spaces.price_per_night FROM bookings JOIN spaces ON spaces.id = bookings.space_id;'
        result_set = DatabaseConnection.exec_params(sql, [])

        first_night = Date.parse(start_date)
        last_night = first_night + number_of_nights - 1
        user_dates = (first_night..last_night).to_a

        space_availability = Hash.new([])

        result_set.each do |record|

            first_night = Date.parse(record ['start_date'])
            last_night = first_night + record['number_of_nights'].to_i - 1
            booking_dates = (first_night..last_night).to_a

            space_availability[record['space_id']] += user_dates & booking_dates
        end
        sql = 'SELECT id, name, description, photo_url, price_per_night FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
          if space_availability[record['id']] == []
                space = Space.new
                space.id = record['id'].to_i
                space.name = record['name']
                space.description = record['description']
                space.photo_url = record['photo_url']
                space.price_per_night = record['price_per_night']

                spaces << space
            end
        end
        return spaces
    end
end
