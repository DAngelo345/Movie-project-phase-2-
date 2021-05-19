class Movie < ActiveRecord::Base

    belongs_to :owner, class_name: "User"
    has_many :favorites
    has_many :users, through: :favorites
    validates :title, presence: true, uniqueness: true
    validates :genre, presence: true
    validates :length, presence: true
    validates :director, presence: true
    validates :plot, presence: true
    
    
  
end
