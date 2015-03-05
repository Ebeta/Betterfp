class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :entity

  def add_entity(current_user)
  	if current_user
  		# for establishments / teams
  		self.entity = current_user.entity
  		self.save
  	end
  end

end
