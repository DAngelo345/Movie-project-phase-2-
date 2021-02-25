class Favorite < ActiveRecord::Base

    belongs_to :user
    belongs_to :movie
    validates :movie_id, presence: true, uniqueness: true
    validates :user_id, presence: true, uniqueness: true
    validates :rating, presence: true

    


end
