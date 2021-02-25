class User < ActiveRecord::Base #500+

    
    has_many :favorites
    has_many :moveis, through: :favorites
    has_secure_password #password, password=, authentication, password_confrimation
    validates :password, presence: true, length: {in: 5..50}, confirmation: true 
    validates :username, uniqueness: true, length: {in: 5..30}, exclusion: {in: ["admin", "superadmin", "user"]}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}

end
