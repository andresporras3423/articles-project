module ArticlesHelper
  def most_voted_article
    Article.all.includes(:votes).max_by { |a| a.votes.length }
  end

  def recent_articles_by_category
    categories = Category.order(:priority)
    article_by_category = []
    categories.includes(:articles).each { |c| article_by_category.push([c, c.articles.max_by(&:created_at)]) }
    sol = []
    article_by_category.each do |ac|
      next if ac[1].nil?

      ac_hash = { 'name' => ac[0].name,
                  'category_id' => ac[0].id,
                  'priority' => ac[0].priority,
                  'id' => ac[1].id,
                  'title' => ac[1].title,
                  'text' => ac[1].text,
                  'picture' => ac[1].picture }
      sol.push(
        ac_hash
      )
    end
    sol
  end
end
