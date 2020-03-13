class Workout < ActiveRecord::Base
    belongs_to :user
    validates :name, :muscle_group, :duration, :calories_burned, presence: true
end
