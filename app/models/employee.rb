class Employee < ApplicationRecord
    belongs_to :admin
    validates :name,:age,:phone_no,:address,presence: true
    validates :email, format: { with: Devise.email_regexp }
    validates :phone_no, format: { with: /\A\d{10}\z/,message: "only allows 10 munbers" }
    validate :age_verify
    def age_verify
        if age < 18
          errors.add(:age, "can't be lessthan 18") 
        end
    end
end
