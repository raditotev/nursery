class Admin < ApplicationRecord
  before_validation :set_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :recoverable,
              :rememberable, :trackable, :validatable

  validates_presence_of :username

  private

  def set_password
    password = SecureRandom.urlsafe_base64(6)
    self.password = password
    self.generated_password = password
  end
end
