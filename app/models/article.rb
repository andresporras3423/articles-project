class Article < ApplicationRecord
    # include Rails.application.routes.url_helpers
    # before_save :save_url
    belongs_to :user
    has_one_attached :image
    has_many :votes
    has_many :voters, :through => :votes, source: :user
    has_many :article_categories
    has_many :categories, :through => :article_categories
    validates :title, presence: true, length: { minimum: 1 }
    validates :text, presence: true, length: { minimum: 151 }

    def total_votes
        votes.length
    end

    # def save_url
    #     self.picture = rails_blob_url(self.image, only_path: true)
    # end
end

