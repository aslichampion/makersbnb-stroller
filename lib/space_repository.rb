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

end
