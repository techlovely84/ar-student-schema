require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  validates :email, :format => { :with => /\A.+@.+\..{2,}\z/, :message => 'Invalid email format.' }, :uniqueness => true
  validates :age, :exclusion => { :in => (0..5).to_a}
  validates :phone, :format => { :with => /(\d{3}).*(\d{3}).*(\d{4})/, :message => 'Invalid phone number format.' }

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end

