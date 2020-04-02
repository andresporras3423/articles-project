module ArticlesHelper
  def most_voted_article
    Article.all.includes(:votes).max_by { |a| a.votes.length }
    # sql = "select a.id, count(v.article_id)
    #        from articles as a
    #        inner join votes as v
    #        on a.id = v.article_id
    #        group by a.id
    #        order by count(v.article_id) desc"
    # hash_id=ActiveRecord::Base.connection.execute(sql)
    # Article.all.find(hash_id[0]['id'])
  end

  def recent_article_by_category(category_id)
    Category.find(category_id).articles.max_by(&:created_at)
  end

  def recent_articles_by_category
    sql = "select 'articles'.*, max_articles.name, max_articles.category_id from articles
        inner join
        (select max(a.created_at)
        , a.id as 'id', c.name as 'name', c.id as 'category_id', c.priority as 'priority'
        from articles a
        inner join article_categories ac
        on a.id = ac.article_id
        inner join categories c
        on ac.category_id = c.id
        group by (c.id)) as max_articles
        on articles.id = max_articles.id
        order by priority"
    ActiveRecord::Base.connection.execute(sql)
  end
end
