require_relative 'space'

class SpaceRepository
    def all
        spaces = []

        sql = 'SELECT id, name FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            space = Space.new
            space.id = record['id'].to_i
            space.name = record['name']
            spaces << space
        end
        return spaces
    end

    def create(space)

        sql = 'INSERT INTO spaces (name) VALUES ($1);'
        result_set = DatabaseConnection.exec_params(sql, [space.name])
        
        return space

    end

end
