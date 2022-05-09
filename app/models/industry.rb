class Industry < ApplicationRecord
    has_and_belongs_to_many :sectors 
    validates :name, presence: true
    validates :email, uniqueness: true

    before_create:add_registration_number

    private
    def add_registration_number
        registration_number = (SecureRandom.random_number * 1000000).ceil
        while Industry.where(registration_number: registration_number).length!=0
            registration_number = (SecureRandom.random_number * 1000000).ceil
        end
       self.registration_number = registration_number
    end
end
