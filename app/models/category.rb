class Category < ApplicationRecord
    has_many :article_categories
    # has_many :articles, through: :article_categories
    has_many :articles, :through => :article_categories
    validates :name, presence: true, length: { minimum: 1 }
    validates :priority, presence: true
    scope :by_priority, -> { order(priority: :asc) }
end
