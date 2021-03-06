class Note < ApplicationRecord
  paginates_per 3
  belongs_to :user
  validates :title, presence: true

  def self.search(keywords)
    where('lower(title) like :keywords OR lower(content) like :keywords', keywords: "%#{keywords.downcase}%")
  end
end