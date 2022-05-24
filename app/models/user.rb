class User < ApplicationRecord
  has_many :foods, foreign_key: 'user_id', class_name: 'Food'
  has_many :recipes, foreign_key: 'user_id', class_name: 'Recipe'
end
