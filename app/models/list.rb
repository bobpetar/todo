class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :description, presence: true
end
