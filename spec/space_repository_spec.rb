require 'space'
require 'space_repository'


def reset_spaces_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
end

describe SpaceRepository do
    
    before(:each) do 
        reset_spaces_table
    end
    
    it 'returns all spaces' do
        repo = SpaceRepository.new
        spaces = repo.all
        expect(spaces.length).to eq(5)
    end

    it 'creates a new space in the database' do
        repo = SpaceRepository.new
        new_space = Space.new
        new_space.name = "Island"
        repo.create(new_space)
        spaces = repo.all
        expect(spaces.length).to eq(6)
        expect(spaces.last.name).to eq("Island")
    end

end  

