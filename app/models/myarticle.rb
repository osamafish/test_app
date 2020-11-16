class Myarticle < ApplicationRecord
    validates :title, presence: true, length: {minimum:6} 
    validates :description, presence: true, length: {minimum:6} 

    
    belongs_to :myuser

    #197-198 Many to many association 
    has_many :myarticle_categories
    has_many :categories, through: :myarticle_categories

end
