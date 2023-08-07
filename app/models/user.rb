class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

<<<<<<< HEAD
  has_many :prototypes
=======
>>>>>>> 054ce1582a744c09f4fec172999db371f87a47e7
  has_many :comments
end
