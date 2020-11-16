class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    
    #197-198 Many to many association
    has_many :myarticle_categories
    has_many :myarticles, through: :myarticle_categories 

end 