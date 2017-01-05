class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
  validates :name, uniqueness: true
  # validates :password, presence: true
  # validates :happiness, presence: true
  # validates :nausea, presence: true
  # validates :height, presence: true 
  # validates :tickets, presence: true
  has_secure_password

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
