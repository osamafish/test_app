class Myarticle < ApplicationRecord
    validates :title, presence: true, length: {minimum:6} 
    validates :description, presence: true, length: {minimum:6} 
    
end
