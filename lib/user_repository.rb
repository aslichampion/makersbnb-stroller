require_relative 'user'

class UserRepository
    def all
        users = []
        sql = "SELECT id, email, password, sms FROM users;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            user = User.new
            user.id = record['id'].to_i
            user.email = record['email']
            user.password = record['password']
            user.sms = record['sms']
            users << user
        end
        return users
    end

    def create(user)

        sql = 'INSERT INTO users (email, password, sms) VALUES ($1, $2, $3);'
        result_set = DatabaseConnection.exec_params(sql, [user.email, user.password, user.sms])

        return user

    end
end
