class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department
  has_many :events
  has_many :articles
  has_many :frequent_questions
  ROLES = %i[sys_admin admin user external]
end
