class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, length: {minimum: 10}
	has_attached_file :image, styles: { large:"700X700", medium: "300x300>", thumb: "100X100" }, default_url: "/images/:style/missing.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
