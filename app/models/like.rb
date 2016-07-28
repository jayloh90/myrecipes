class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  
  validates_uniqueness_of :chef, scope: :recipe #chef can like each recipe once!
  #validates_uniqueness_of :chef (means the chef can only like 1 recipe ever!!)
end