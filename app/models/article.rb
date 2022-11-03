class Article < ApplicationRecord
  validates :title, length: { minimum: 5 }
  validates :url, url: true
end
