class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :collaborators
has_many :wikis, through: :collaborators


  def admin?
   role == "admin"
  end

  def premium?
    role == "admin" || role == "premium"
  end

end
