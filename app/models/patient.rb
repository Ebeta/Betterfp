class Patient < ActiveRecord::Base
	has_many :patient_medications
	has_many :medications, through: :patient_medications
  	belongs_to :entity
    belongs_to :user

    validates :name, presence:true
    validates :age, numericality: {greater_than_or_equal_to: 0}
    # validates :phone_number, numericality: true, length: {minimum: 10}
    # validates :contact_number, numericality: true, length: {minimum: 10}

    accepts_nested_attributes_for :patient_medications

end
