class Parent < ApplicationRecord
  before_validation :set_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def set_password
    password = SecureRandom.urlsafe_base64(6)
    self.password = password
    self.generated_password = password
  end
end
