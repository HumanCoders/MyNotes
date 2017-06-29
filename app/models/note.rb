class Note < ApplicationRecord
  def self.search(keywords)
    where('lower(title) like :keywords OR lower(content) like :keywords', keywords: "%#{keywords.downcase}%")
  end
end