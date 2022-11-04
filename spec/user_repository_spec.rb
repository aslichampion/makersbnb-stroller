require 'user'
require 'user_repository'


def reset_users_table
    seed_sql = File.read('spec/seeds/users.sql')
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

    it 'encrypts passwords' do
        repo = UserRepository.new
        new_user = User.new
        new_user.password = BCrypt::Password.create("password") 
        my_password = BCrypt::Password.new(new_user.password)
        expect(my_password).to eq("password")
    end

    it 'finds a user by email' do
        repo = UserRepository.new
        user = repo.find_by_email("test@test.com")
        expect(user.id).to eq(1)
    end

    it 'matches a password to the plain password in the database' do
        repo = UserRepository.new
        result = repo.sign_in("test@test.com", "password")
        expect(result).to eq("yay")
    end

end

# my_password = BCrypt::Password.create("my password")
# #=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"

# my_password.version              #=> "2a"
# my_password.cost                 #=> 12
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false

# my_password = BCrypt::Password.new("$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey")
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false


# # encrypted_password = BCrypt::Password.create(new_user.password)