class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :body, length:{minimum:10}
end
