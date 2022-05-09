class Patient < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :physicians, through: :appointments, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true,uniqueness: true
end
