class Comment < ApplicationRecord
<<<<<<< HEAD
  validates :content, presence: true 

  belongs_to :user
  belongs_to :prototype
=======
  belongs_to :user
  belongs_to :prototype

  validates :content, presence: true
>>>>>>> 054ce1582a744c09f4fec172999db371f87a47e7
end
