class User < ApplicationRecord
    # has_secure_password
    # validates :first_name,:user_name,:last_name,:email,:password, presence: true
    # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i #, message ='format not allowed'
    #  validates :email, confirmation: true
    has_secure_password
    has_one :user
    validates :first_name, presence: true, length: { minimum: 3 }
    validates :email, presence: true
    validates :password, length: { in: 5..10 }
end
