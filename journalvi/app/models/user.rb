class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :entries, dependent: :destroy
    has_many :prompts, through: :entries
end 
