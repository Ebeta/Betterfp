class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :entity
  has_many :patients

	def add_entity(current_user)
		if current_user
			# for establishments / teams
			self.entity = current_user.entity
			self.save
		else
			self.entity = Entity.create(title: "Individual")
		end
	end

	def patients
		entity.patients
	end

end
