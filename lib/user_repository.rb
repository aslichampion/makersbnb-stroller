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

    def sign_in(email, submitted_password)
        
        #Unable at this point to get Bcrypt to match sucessfully, continue with plain text passwords.

        user = find_by_email(email)
    
        return nil if user.nil?

        if submitted_password == user.password
          return "yay"
        else
          return "nope"
        end
    end
    
    def find_by_email(email)
        sql = 'SELECT id, email, password, sms FROM users WHERE email = $1;'
        result_set = DatabaseConnection.exec_params(sql, [email])
    
        user = User.new
        user.id = result_set[0]['id'].to_i
        user.email = result_set[0]['email']
        user.password = result_set[0]['password']
        user.sms = result_set[0]['sms']
    
        return user
    end



end
