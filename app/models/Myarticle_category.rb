class MyarticleCategory < ApplicationRecord

    #197-198 Many to many association 
    belongs_to :myarticle
    belongs_to :category
  end 