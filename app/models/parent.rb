class Parent < ApplicationRecord
  before_validation :set_password
  after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable

  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  private

  def set_password
    password = SecureRandom.urlsafe_base64(6)
    self.password = password
    self.generated_password = password
  end

  def send_email
    AdminMailer.send_parent_password(self).deliver
  end
end
