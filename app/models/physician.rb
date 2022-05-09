class Physician < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true,uniqueness: true

    before_create:add_uniq_id

    private
    def add_uniq_id
        unique = SecureRandom.uuid 
        while Physician.where(unique_id: unique).length!=0
            unique = SecureRandom.uuid 
        end
       self.unique_id = unique
    end
end
