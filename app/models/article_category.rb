class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
  validates :category_id, uniqueness: {scope: :article_id}
end
