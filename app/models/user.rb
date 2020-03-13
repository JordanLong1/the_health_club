class User < ActiveRecord::Base
    has_many :workouts
    has_secure_password
    validates :email, :username, :password_digest, presence: true 
end
