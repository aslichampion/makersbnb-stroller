require_relative 'space'

class SpaceRepository
    def all
        spaces = []

        sql = 'SELECT id, name FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])
        
        result_set.each do |record|
            space = Space.new
            space.id = record['id']
            space.name = record['name']
            spaces << space
        end
        return spaces
    end
end
