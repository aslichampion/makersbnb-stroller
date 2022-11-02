require 'space'
require 'space_repository'


def reset_spaces_table
    seed_sql = File.read('spec/space_seeds.sql')
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
        new_space.description = "Pretty"
        new_space.photo_url = "https://images.unsplash.com/photo-1505635552518-3448ff116af3"
        new_space.price_per_night = "1000"
        repo.create(new_space)
        spaces = repo.all
        expect(spaces.length).to eq(6)
        expect(spaces.last.name).to eq("Island")
        expect(spaces.last.description).to eq("Pretty")
        expect(spaces.last.photo_url).to eq("https://images.unsplash.com/photo-1505635552518-3448ff116af3")
        expect(spaces.last.price_per_night).to eq("1000")
        
    end

end  

