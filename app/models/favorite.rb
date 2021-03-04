class Favorite < ActiveRecord::Base

    belongs_to :user
    belongs_to :movie
    validates :movie_id, presence: true
    validates :user_id, presence: true
    

    


end
