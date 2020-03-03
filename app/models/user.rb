class User < ActiveRecord::Base
    has_many :workouts
    has_secure_password
end
