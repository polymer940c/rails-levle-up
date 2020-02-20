class Post < ApplicationRecord
  validates :subject, :body, presence: true
end
