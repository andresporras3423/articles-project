module ArticlesHelper
    def most_voted_article
        sql = "select a.id, count(v.article_id) 
               from articles as a 
               inner join votes as v 
               on a.id = v.article_id
               group by a.id 
               order by count(v.article_id) desc"
        hash_id=ActiveRecord::Base.connection.execute(sql)
        Article.all.find(hash_id[0]['id'])
    end

    def recent_article_by_category(category_id)
        Category.find(category_id).articles.max_by{|ar| ar.created_at}
    end
end
