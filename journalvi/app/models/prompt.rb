class Prompt < ApplicationRecord
  belongs_to :entry
  has_many :scores, dependent: :destroy
end
