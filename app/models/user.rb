class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: { receptionist: 'receptionist', doctor: 'doctor' }

  validates :role, presence: true
end
