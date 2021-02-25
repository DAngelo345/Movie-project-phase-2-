class Movie < ActiveRecord::Base


    has_many :favorites
    has_many :users, through: :favorites
    validates :title, presence: true, uniqueness: true
    validates :genre, presence: true
    validates :length, presence: true
    validates :director, presence: true
    
  
end
