class Deck < ActiveRecord::Base
  has_many :cards
  validates :title, uniqueness: true 
end

