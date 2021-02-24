class Entry < ApplicationRecord
  belongs_to :user
  has_many :prompts
  has_many :scores, through: :prompts
end
