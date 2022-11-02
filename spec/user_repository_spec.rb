require 'user'
require 'user_repository'


def reset_users_table
    seed_sql = File.read('spec/seeds/users_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
end

describe UserRepository do
    
    before(:each) do 
        reset_users_table
    end
    
    it 'returns all users' do
        repo = UserRepository.new
        users = repo.all
        expect(users.length).to eq(5)
    end

    it 'adds a new user' do
        repo = UserRepository.new
        new_user = User.new
        new_user.email = "new@new.com"
        new_user.password = "newpassword"
        new_user.sms = "00000000000"
        repo.create(new_user)
        users = repo.all
        expect(users.length).to eq(6)
    end

end