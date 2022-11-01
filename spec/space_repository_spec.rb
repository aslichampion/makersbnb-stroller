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

end  

