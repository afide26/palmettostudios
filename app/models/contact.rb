class Contact < ActiveRecord::Base
	validates :name, length:{minimum: 4}
	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, length: {minimum: 7}, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_format_of :phone, with: /\A[0-9]*\Z/, message: ' - Only numbers allowed, no symbols or letters please!'
end
