class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, length: {minimum: 10}
	has_attached_file :image, styles: { large:"700X700", medium: "350x350>", thumb: "250X250" }, default_url: "/images/:style/missing.jpg",
				      :storage => :dropbox,
				      :dropbox_credentials => Rails.root.join("config/dropbox.yml")
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
									   
end
